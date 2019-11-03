// A simple OSD implementation. Can be hooked up between a cores
// VGA output and the physical VGA pins

module osd (
	// OSDs pixel clock, should be synchronous to cores pixel clock to
	// avoid jitter.
	input 		 clk_pix,
	input        scandoubler_disable,

	input  [9:0] OSD_X_OFFSET,
	input  [9:0] OSD_Y_OFFSET,
	input  [2:0] OSD_COLOR,

	// SPI interface
	input        SPI_SCK,
	input        SPI_SS3,
	input        SPI_DI,

	// VGA signals coming from core
	input  [5:0] R_in,
	input  [5:0] G_in,
	input  [5:0] B_in,
	input        HSync,
	input        VSync,
	
	// VGA signals going to video connector
	output [5:0] R_out,
	output [5:0] G_out,
	output [5:0] B_out
);

localparam OSD_WIDTH  = 10'd256;
localparam OSD_HEIGHT = 10'd128;


// *********************************************************************************
// spi client
// *********************************************************************************

// this core supports only the display related OSD commands
// of the minimig
reg  [7:0] sbuf;
reg  [7:0] cmd;
reg  [4:0] cnt;
reg [10:0] bcnt;
reg        osd_enable;
(* ramstyle = "no_rw_check" *) reg  [7:0] osd_buffer [2047:0];  // the OSD buffer itself

// the OSD has its own SPI interface to the io controller
always@(posedge SPI_SCK, posedge SPI_SS3) begin
  if(SPI_SS3 == 1'b1) begin
      cnt <= 5'd0;
      bcnt <= 11'd0;
  end else begin
    sbuf <= { sbuf[6:0], SPI_DI};

    // 0:7 is command, rest payload
    if(cnt < 15)
      cnt <= cnt + 4'd1;
    else
      cnt <= 4'd8;

      if(cnt == 7) begin
       cmd <= {sbuf[6:0], SPI_DI};
      
      // lower three command bits are line address
      bcnt <= { sbuf[1:0], SPI_DI, 8'h00};

      // command 0x40: OSDCMDENABLE, OSDCMDDISABLE
      if(sbuf[6:3] == 4'b0100)
        osd_enable <= SPI_DI;
    end

    // command 0x20: OSDCMDWRITE
    if((cmd[7:3] == 5'b00100) && (cnt == 15)) begin
      osd_buffer[bcnt] <= {sbuf[6:0], SPI_DI};
      bcnt <= bcnt + 11'd1;
    end
  end
end

// *********************************************************************************
// video timing and sync polarity anaylsis
// *********************************************************************************

// horizontal counter
reg [9:0] h_cnt;
reg hsD, hsD2;
reg [9:0] hs_low, hs_high;
wire hs_pol = hs_high < hs_low;
wire [9:0] dsp_width = hs_pol?hs_low:hs_high;

// vertical counter
reg [9:0] v_cnt;
reg vsD, vsD2;
reg [9:0] vs_low, vs_high;
wire vs_pol = vs_high < vs_low;
wire [9:0] dsp_height = vs_pol?vs_low:vs_high;

always @(posedge clk_pix) begin
	// bring hsync into local clock domain
	hsD <= HSync;
	hsD2 <= hsD;

	// falling edge of HSync
	if(!hsD && hsD2) begin	
		h_cnt <= 10'd0;
		hs_high <= h_cnt;
	end

	// rising edge of HSync
	else if(hsD && !hsD2) begin	
		h_cnt <= 10'd0;
		hs_low <= h_cnt;

		v_cnt <= v_cnt + 10'd1;
	end 
	
	else
		h_cnt <= h_cnt + 10'd1;

	vsD <= VSync;
	vsD2 <= vsD;

	// falling edge of VSync
	if(!vsD && vsD2) begin	
		v_cnt <= 10'd0;
		vs_high <= v_cnt;
	end

	// rising edge of VSync
	else if(vsD && !vsD2) begin	
		v_cnt <= 10'd0;
		vs_low <= v_cnt;
	end 
end

// area in which OSD is being displayed
wire [9:0] h_osd_start = ((dsp_width - OSD_WIDTH)>> 1) + OSD_X_OFFSET;
wire [9:0] h_osd_end   = h_osd_start + OSD_WIDTH;
wire [9:0] v_osd_start = ((dsp_height- OSD_HEIGHT)>> 1) + OSD_Y_OFFSET;
wire [9:0] v_osd_end   = v_osd_start + OSD_HEIGHT;
wire [9:0] osd_hcnt    = h_cnt - h_osd_start + 1'd1;  // one pixel offset for osd_byte register
wire [9:0] osd_vcnt    = v_cnt - v_osd_start;

wire osd_de = osd_enable && 
              (HSync != hs_pol) && (h_cnt >= h_osd_start) && (h_cnt < h_osd_end) &&
              (VSync != vs_pol) && (v_cnt >= v_osd_start) && (v_cnt < v_osd_end);

reg  [7:0] osd_byte; 
always @(posedge clk_pix) osd_byte <= osd_buffer[{osd_vcnt[6:4], osd_hcnt[7:0]}];

wire osd_pixel = osd_byte[osd_vcnt[3:1]];

assign R_out = !osd_de ? R_in : {osd_pixel, osd_pixel, OSD_COLOR[2], R_in[5:3]};
assign G_out = !osd_de ? G_in : {osd_pixel, osd_pixel, OSD_COLOR[1], G_in[5:3]};
assign B_out = !osd_de ? B_in : {osd_pixel, osd_pixel, OSD_COLOR[0], B_in[5:3]};

endmodule
