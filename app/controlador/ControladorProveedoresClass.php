<?php

use modelo\Proveedor as Proveedor;

require_once($_SERVER['DOCUMENT_ROOT'] . "/bootstrap.php");

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

  public function hacer()
  {
    $this->resultados = call_user_func([$this, $this->accion]);
  }

  public function getResultados()
  {
    return $this->resultados;
  }

  public function alta()
  {
    global $entityManager;
    $mensaje = "";
    $error = "";

    $proveedor = new Proveedor($this->objeto->razonSocial, $this->objeto->telefono, $this->objeto->correo, $this->objeto->cuil);

    try {
      $entityManager->persist($proveedor);
      $entityManager->flush();
    } catch (Exception $e) {
      $mensaje = "no se pudo cargar el proveedor";
      $error = $e->getMessage();
    }
  }
}
