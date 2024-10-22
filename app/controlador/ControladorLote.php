
<?php

include_once ($_SERVER['DOCUMENT_ROOT']."/app/controlador/ControladorLoteClass.php");

$objeto=json_decode($_POST["objeto"],false);
$accion=$_POST["accion"];

$controlador= new ControladorLoteClass($accion, $objeto);
$controlador->hacer();
echo json_encode($controlador->getResultados());