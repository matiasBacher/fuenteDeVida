<?php
use modelo\Producto;
require_once($_SERVER['DOCUMENT_ROOT']."/bootstrap.php");
require_once($_SERVER['DOCUMENT_ROOT']."/app/modelo/Venta.php");
require_once($_SERVER['DOCUMENT_ROOT']."/app/modelo/DetalleVenta.php");

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use modelo\DetalleVenta;
use modelo\Venta;
if(isset ($_POST["accion"])){
    if($_POST["accion"]=="altaVenta"){

        $detalleVentaJson = json_decode($_POST["detalleVenta"]);
        $detallesventa = []; 
        foreach($detalleVentaJson as $detalle){

            $detallesventa[]=new DetalleVenta(
            $detalle->cantidad, 
            $entityManager->find(Producto::class, $detalle->id)) ;
        }

        $venta= new Venta($_POST["metodo"], $detallesventa);
        try{
            $entityManager->persist($venta);
        }
        catch(Exception $e) {
            echo json_encode([
                "mensaje"=>-2
            ]); 
            exit();

        }
        try{
            $entityManager->flush();
        }
        catch(Exception $e){
            echo json_encode(
                [
                    "mensaje"=>-1
                ]
                );
                exit();
        } 
            echo json_encode([
                "mensaje"=>1
            ]);
            exit();
        }
    }
    if($_POST["accion"]=="registrarModificacionVenta"){
        $ventaAnterior=$entityManager->find(Venta::class,$_POST["idVentaModificar"]);
        $ventaAnterior->setErrorVenta(true);         

        $detalleVentaJson = json_decode($_POST["detalleVenta"]);
        $detallesventa = []; 
        foreach($detalleVentaJson as $detalle){

            $detallesventa[]=new DetalleVenta( 
                $detalle->cantidad,
                $entityManager->find(Producto::class, $detalle->id)) ;
        }

        $venta= new Venta($_POST["metodo"], $detallesventa);
        $venta->setVentaAnterior($ventaAnterior);
        $venta->setMotivoCorreccion($_POST["motivoCorreccionVenta"]);
        try{

            $entityManager->persist($venta);
            $entityManager->persist($ventaAnterior);

        }
        catch(Exception $e) {
            echo json_encode([
                "mensaje"=>-2
            ]);
            exit();
        }
        try{
            $entityManager->flush();
        }
        catch(Exception $e){
            echo json_encode(
                [
                    "mensaje"=>-1
                ]
                );
                exit();
        } 
            echo json_encode([
                "mensaje"=>1
            ]);
            exit();
        }
    if($_POST["accion"]=="consultarVentas"){
        $ventas=$entityManager->getRepository(Venta::class)->findBy([
            "errorVenta"=>false,
        ]);
        echo json_encode($ventas);
        exit();

    }
    if($_POST["accion"]=="consultarVentasCorregidas"){
        $ultimaVenta=$entityManager->find(Venta::class, $_POST["ultimo"]);
        $ventasAnteriores = [];
        $puntero=$ultimaVenta;
        while($puntero!==null){
            $ventasAnteriores[]=$puntero;
            $puntero=$puntero->getVentaAnterior();

        }
        echo json_encode($ventasAnteriores);
        exit();
    }
