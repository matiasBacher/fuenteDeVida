<?php
require_once($_SERVER['DOCUMENT_ROOT']."\bootstrap.php");
require_once($_SERVER['DOCUMENT_ROOT']."\app\controlador\ControladorLoteClass.php");
$pagina = "";

#en futuro hacer la variable dinamica por medio del tipo usuario
$paginaDisponible=[
                    "producto"=>"Productos",
                    "caja"=>"Caja",
                    "venta"=>"Ventas",
                    "lotes"=>"Inventario",
                    "proveedor"=>"Proveedor",
                    "informes"=>"Informes"
];


session_start();
           if (!isset($_SESSION["usuario"])) {
            $pagina="login";}
            elseif (!isset($_GET["p"])) {
            $pagina=array_keys($paginaDisponible)[0];
            }
            else{
                $pagina = $_GET["p"];
            }
            if($pagina!="login"){
                ControladorLoteClass::actualizarVencimientoTodosLotes();
                
            }

           ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de <?=$paginaDisponible[$pagina]?></title>
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
                <?php 
                foreach($paginaDisponible as $key=>$value):?>
                    <a class="top <?=$pagina==$key?" menuSeleccionado":""?>" 
                    href="index.php?p=<?=$key?>"><?=$value?></a>
                <?php endforeach?>
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
