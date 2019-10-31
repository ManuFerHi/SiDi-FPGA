////////////////////////////////////////////////////////////////////////////////
//
//
//
//  MENU for MIST board
//  (C) 2016 Sorgelig
//
//
//
////////////////////////////////////////////////////////////////////////////////

module MENU
(
   input         CLOCK_27,   // Input clock 27 MHz

   output  [5:0] VGA_R,
   output  [5:0] VGA_G,
   output  [5:0] VGA_B,
   output        VGA_HS,
   output        VGA_VS,

   output        LED,

   input         SPI_SCK,
   output        SPI_DO,
   input         SPI_DI,
   input         SPI_SS3,
   input         CONF_DATA0,

   output [12:0] SDRAM_A,
   inout  [15:0] SDRAM_DQ,
   output        SDRAM_DQML,
   output        SDRAM_DQMH,
   output        SDRAM_nWE,
   output        SDRAM_nCAS,
   output        SDRAM_nRAS,
   output        SDRAM_nCS,
   output  [1:0] SDRAM_BA,
   output        SDRAM_CLK,
   output        SDRAM_CKE
);

wire clk_x2, clk_pix, clk_ram, locked;
pll pll
(
	.inclk0(CLOCK_27),
	.c0(clk_ram),
	.c1(SDRAM_CLK),
	.c2(clk_x2),
	.c3(clk_pix),
	.locked(locked)
);

//______________________________________________________________________________
//
// MIST ARM I/O
//
wire		   scandoubler_disable;
wire		   ypbpr;

user_io #(.STRLEN(6)) user_io
(
	.conf_str("MENU;;"),
	
	.SPI_SCK(SPI_SCK),
	.CONF_DATA0(CONF_DATA0),
	.SPI_DO(SPI_DO),
	.SPI_DI(SPI_DI),
	.scandoubler_disable(scandoubler_disable),
	.ypbpr(ypbpr)
);

assign LED = 1;

sram ram
(
	.*,
	.init(~locked),
	.clk(clk_ram),
	.wtbt(3),
	.dout(),
	.din(0),
	.rd(0),
	.ready()
);

reg        we;
reg [24:0] addr = 0;

always @(posedge clk_ram) begin
	integer   init = 5000000;
	reg [4:0] cnt = 9;
	
	if(init) init <= init - 1;
	else begin
		cnt <= cnt + 1'b1;
		we <= &cnt;
		if(cnt == 8) addr <= addr + 1'd1;
	end
end

//______________________________________________________________________________
//
// Video 
//

reg  [9:0] hc;
reg  [8:0] vc;
reg  [9:0] vvc;

reg [22:0] rnd_reg;
wire [5:0] rnd_c = {rnd_reg[0],rnd_reg[1],rnd_reg[2],rnd_reg[2],rnd_reg[2],rnd_reg[2]};

wire [22:0] rnd;
lfsr random(rnd);

always @(negedge clk_pix) begin
	if(hc == 639) begin
		hc <= 0;
		if(vc == 311) begin 
			vc <= 0;
			vvc <= vvc + 9'd6;
		end else begin
			vc <= vc + 1'd1;
		end
	end else begin
		hc <= hc + 1'd1;
	end
	
	rnd_reg <= rnd;
end

reg  HBlank;
reg  HSync;
reg  VBlank;
reg  VSync;
wire viden  = !HBlank && !VBlank;

always @(posedge clk_pix) begin
	if (hc == 310) HBlank <= 1;
		else if (hc == 420) HBlank <= 0;

	if (hc == 336) HSync <= 1;
		else if (hc == 368) HSync <= 0;

	if(vc == 308) VSync <= 1;
		else if (vc == 0) VSync <= 0;

	if(vc == 306) VBlank <= 1;
		else if (vc == 2) VBlank <= 0;
end

reg  [7:0] cos_out;
wire [5:0] cos_g = cos_out[7:3]+6'd32;
cos cos(vvc + {vc, 2'b00}, cos_out);

wire [5:0] comp_v = (cos_g >= rnd_c) ? cos_g - rnd_c : 6'd0;
wire [5:0] R_in = !viden ? 6'd0 : comp_v;
wire [5:0] G_in = !viden ? 6'd0 : comp_v;
wire [5:0] B_in = !viden ? 6'd0 : comp_v;

wire [5:0] R_out, G_out, B_out;

osd osd
(
	.*,
	.OSD_X_OFFSET(10),
	.OSD_Y_OFFSET(0),
	.OSD_COLOR(4)
);

wire hs_out, vs_out;
wire [5:0] r_out, g_out, b_out;

scandoubler scandoubler
(
	.*,
	.scanlines(2'b00),
	.hs_in(HSync),
	.vs_in(VSync),
	.r_in(R_out),
	.g_in(G_out),
	.b_in(B_out)
);

video_mixer video_mixer
(
	.*,
	.ypbpr_full(1),

	.r_i({R_out, R_out[5:4]}),
	.g_i({G_out, G_out[5:4]}),
	.b_i({B_out, B_out[5:4]}),
	.hsync_i(HSync),
	.vsync_i(VSync),

	.r_p({r_out, r_out[5:4]}),
	.g_p({g_out, g_out[5:4]}),
	.b_p({b_out, b_out[5:4]}),
	.hsync_p(hs_out),
	.vsync_p(vs_out)
);

endmodule
