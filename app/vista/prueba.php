<?php 
use modelo\Venta;
use modelo\DetalleVenta;
require_once($_SERVER['DOCUMENT_ROOT']."/bootstrap.php");
require_once($_SERVER['DOCUMENT_ROOT']."/app/modelo/Venta.php");
require_once($_SERVER['DOCUMENT_ROOT']."/app/modelo/DetalleVenta.php");




$x = $entityManager->find(modelo\Venta::class,3);
$entityManager->remove($x);
$entityManager->flush();