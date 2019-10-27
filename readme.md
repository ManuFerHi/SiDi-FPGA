<!DOCTYPE html>
<html>
<!-- Plantilla de sitio de tres columnas en HTML5 -->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="author" content="JMSR">
  <meta name="description" content="Plantilla para documento HTML 5">
  <meta name="keywords" content="HTML, CSS">
  
  <title>Plantilla para documento HTML 5</title>
  
  <link rel="icon" type="image/png" href="favicon.ico">
  <link rel="stylesheet" type="text/css" href="base.css">
  <style>
    *
    {
      margin: 0;
      padding: 0;
    }
    #espacioSuperior
    {
      background-color: #E6E6E6;
    }
    #contenedorPagina
    {
      margin: 0 auto;
      border: 1px solid #9900CC;
      height: 85%;
    }
    
    #encabezado
    {
      height: 50px;
      background-color: #FF3300;
    }
    #aLaIzquierda
    {
      width: 20%;
      height: 500px;
      float: left;
      background-color: #0066FF;
    }
    #contenidoPrincipal
    {
      width: 60%;
      float: left;
      background-color: #FFFFFF;
    }
    #aLaDerecha
    {
      width: 20%;
      height: 500px;
      float: right;
      background-color: #006600;
    }
    #piePagina
    {
      clear: both;
      height: 25px;
      background-color: #CC6699;
    }
  </style>
</head>
<body>
  <div id="espacioSuperior">
    <h1>Plantilla para documento HTML 5</h1>
  </div>
  <div id="contenedorPagina">
    <header id="encabezado">
      <p>#encabezado</p>
    </header>
    <aside id="aLaIzquierda">
      <p>#aLaIzquierda</p>
    </aside>
    <section id="contenidoPrincipal">
      <p>#contenidoPrincipal</p>
    </section>
    <aside id="aLaDerecha">
      <p>#aLaDerecha</p>
    </aside>
    <footer id="piePagina">
      <p>#piePagina</p>
    </footer>
  </div>
</body>
</html>
