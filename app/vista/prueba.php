<?php 
require_once($_SERVER['DOCUMENT_ROOT']."/bootstrap.php");
require_once($_SERVER['DOCUMENT_ROOT']."/app/controlador/ControladorLoteClass.php");
$obj= new stdClass;
$obj->producto=new stdClass;
$obj->producto->codigo=1;

$obj->vencimiento=("2024-10-30");
$obj->ingreso=null;

$obj->proveedor= new stdClass;
$obj->proveedor->id=1;

$obj->cantidad=1;


$x=new ControladorLoteClass("alta",$obj);
$x->hacer();