<?php
require_once($_SERVER['DOCUMENT_ROOT']."\bootstrap.php");
$pagina = "";

session_start();
           if (!isset($_SESSION["usuario"])) {
            $pagina="login";}
            elseif (!isset($_GET["p"])) {
            $pagina="producto";
            }
            else{
                $pagina = $_GET["p"];
            }
           ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Productos</title>
    <link rel="icon" type="image/x-icon" href="/publico/img/favicon.png">
    <link rel="stylesheet" href="/publico/css/sweetalert2.min.css">
    <link rel="stylesheet" href="/publico/css/main.css">

    <link rel="stylesheet" type="text/css" href="<?="publico/css/".$pagina.".css"?>">
    
</head>
<body >
<?php 
    if($pagina!="login"){?>
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
                <a id="logOutCont" class="top" href="#">
                    <?php include("publico/img/iconos/box-arrow-left.svg")?>
                    <span>cerrar</span>
                </a>
            </div>

            <div class="container">
                <script src="publico/js/sweetalert2.all.min.js"></script>
                <script type="module" src="/publico/js/main.js"></script>
                <?php 
                    require_once($_SERVER['DOCUMENT_ROOT']."/app/vista/".$pagina.".php");
                ?>
        </div>

    <?php }
    else{
        require_once($_SERVER['DOCUMENT_ROOT']."/app/vista/".$pagina.".php");
    }
    ?>

    <div id="cont-espera"> <span class="loader"> </span> </div>
      
</body>
</html>
<?php 
