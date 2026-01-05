<?php

use modelo\Proveedor as Proveedor;

class ControladorProveedoresClass
{
  private string $accion;
  private stdClass $objeto;

  private array $resultados;

  function __construct(string $accion, stdClass $objeto)
  {
    $this->accion = $accion;
    $this->objeto = $objeto;
  }
  
  public function hacer(){
    $this->resultados=call_user_func([$this, $this->accion]);
  }

  public function getResultados(){
    return $this->resultados;
  }

  public function alta(){
    $mensaje="";
    $error="";

    $proveedor = new Proveedor()

    try{

    }
  
}


}

