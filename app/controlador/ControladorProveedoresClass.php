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

  public function hacer(): void
  {
    $this->resultados = call_user_func([$this, $this->accion]);
  }

  public function getResultados(): array
  {
    return $this->resultados;
  }

  public function alta(): array
  {
    global $entityManager;
    $mensaje = "";
    $error = "";

    $proveedor = new Proveedor($this->objeto->razonSocial, $this->objeto->telefono, $this->objeto->correo, $this->objeto->cuil);

    try {
      $entityManager->persist($proveedor);
      $entityManager->flush();
      $mensaje = "altaExito";
    } catch (Exception $e) {
      $mensaje = "errorAlta";
      $error = $e->getMessage();
    }
    return [
      "mensaje" => $mensaje,
      "error" => $error,
    ];
  }
  public function borrar(): array
  {
    global $entityManager;
    $mensaje = "";
    $error = "";

    try {
      $proveedor = $entityManager->find(Proveedor::class, $this->objeto->id);
      if ($proveedor == null) {
        $mensaje = "errorProveedorNulo";
        return ["mensaje" => $mensaje, "error" => $error];
      }
    } catch (Exception $e) {
      $mensaje = "errorProveedorNoEncontrado";
      $error = $e->getMessage();

      return ["mensaje" => $mensaje, "error" => $error];
    }
    try {
      $entityManager->remove($proveedor);

      $mensaje = "exitoBorrado";
      return ["mensaje" => $mensaje, "error" => $error];
    } catch (Exception $e) {
      $mensaje = "errorBorrar";
      $error = $e->getMessage();

      return ["mensaje" => $mensaje, "error" => $error];
    }
  }
  public function modificar(): array
  {
    $mensaje = "";
    $error = "";
  }
}
