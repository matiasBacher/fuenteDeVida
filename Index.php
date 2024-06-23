<?php
session_start();
           if (!isset($_SESSION["sitio"])) {$_SESSION["sitio"]="producto";}
           ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Productos</title>
  
    <link rel="stylesheet" type="text/css" href="<?="publico/css/".$_SESSION["sitio"].".css"?>">
</head>
<body>
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
           <?php 
           

           require_once($_SERVER['DOCUMENT_ROOT']."/app/vista/".$_SESSION["sitio"].".php");
           
?>
           
    </div>
      
</body>
</html>
<?php 
