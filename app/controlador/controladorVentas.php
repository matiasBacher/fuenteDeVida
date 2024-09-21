<?php
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

            $detallesventa[]=new DetalleVenta( $detalle->cantidad, $detalle->id) ;
        }

        $venta= new Venta($_POST["metodo"], $detallesventa);
        try{
            $entityManager->persist($venta);
        }
        catch(Exception $e) {
            return json_encode([
                "mensaje"=>-2
            ]);    
        }
        try{
            $entityManager->flush();
        }
        catch(Exception $e){
            return json_encode(
                [
                    "mensaje"=>-1
                ]
                );
        } 
            return json_encode([
                "mensaje"=>1
            ]);
        }
    }

