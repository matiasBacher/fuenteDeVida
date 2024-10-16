<?php


require_once($_SERVER['DOCUMENT_ROOT']."/bootstrap.php");
require_once($_SERVER['DOCUMENT_ROOT']."/app/modelo/Lote.php");

use modelo\Lote;
use modelo\Proveedor;
use DateTime;
use modelo\Producto;

class ControladorLoteClass{
    private string $accion;
    private stdClass $objeto;
    function __construct(string $accion, stdClass $objeto){
        $this->accion=$accion;
        $this->objeto=$objeto;
    }

    public function hacer(){
        call_user_func([$this, $this->accion]);
    }

    public function ComprobarSiLoteRepetido():bool{
        global $entityManager;
        $idProducto = $this->objeto->producto->codigo;
        $idProveedor = $this->objeto->proveedor->id;
        $fechaIngreso = new DateTime($this->objeto->fechaIngreso??"now");
        $fechaVencimiento= new DateTime($this->objeto->fechaVencimiento);

        $objetoEncontrado=$entityManager->getRepository(Lote::class)
                            ->findOneBy(
                                ["producto"=>$idProducto,
                                "proveedor"=>$idProveedor,
                                "ingreso"=>$fechaIngreso,
                                "vencimiento"=>$fechaVencimiento]);
        if($objetoEncontrado) return true;
        else return false;
    }

    private function alta(){
        $mensaje = "";

        if($this->ComprobarSiLoteRepetido()) $mensaje="loteRepetido";
        else{
            global $entityManager;
            $producto = $entityManager->find(Producto::class, $this->objeto->producto->codigo);
            $proveedor =$entityManager->find(Proveedor::class, $this->objeto->proveedor->id);
            $fechaIngreso = new DateTime($this->objeto->fechaIngreso??"now");
            $fechaVencimiento= new DateTime($this->objeto->fechaVencimiento);
            $cantidad= $this->objeto->cantidad;

            $lote = new Lote($producto,$fechaVencimiento,$cantidad,$fechaIngreso, $proveedor);
            $entityManager->persist($lote);
            $entityManager->flush();



        }



        

        




    }
}