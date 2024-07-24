<?php
session_start();
           if (!isset($_SESSION["sitio"])) {$_SESSION["sitio"]="producto";}
           ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Productos</title>
    <link rel="icon" type="image/x-icon" href="/publico/img/favicon.png">
    <link rel="stylesheet" href="/publico/css/sweetalert2.min.css">
    <link rel="stylesheet" type="text/css" href="<?="publico/css/".$_SESSION["sitio"].".css"?>">
    
</head>
<body >
    <div class="wrapper">
        <div class="menu">            
             <a class="top" href="#">Proveedores</a>
             <a class="top" href="#">Inventario</a>
             <a class="top" href="#">Productos</a>
             <a class="top" href="#">Pedidos</a>
             <a class="top" href="#">Ventas</a>
             <a class="top" href="#">Caja</a>
             <a class="top" href="#">Devoluciones</a>
             <a class="top" href="#">Cliente</a>            
        </div>

        <div class="container">
            <script src="publico/js/sweetalert2.all.min.js"></script>
            <script src="/publico/js/main.js"></script>
           <?php 
           
            
           require_once($_SERVER['DOCUMENT_ROOT']."/app/vista/".$_SESSION["sitio"].".php");
           
?>
           
    </div>

    <div id="cont-espera"> <span class="loader"> </span> </div>
      
</body>
</html>
<?php 
