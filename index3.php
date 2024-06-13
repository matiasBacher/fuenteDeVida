<?php 
require_once("app\BD\buscadorProductos.php");

$b= new buscadorProductos(1,"");
$b->buscar();
echo "hola";