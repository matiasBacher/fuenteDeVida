<?php

use modelo\Proveedor as Proveedor;
use modelo\Domicilio as Domicilio;
use modelo\Localidad;

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
    $domicilio = null;
    $localidad = null;

    if (!isset($this->objeto->domicilio)) {
      try {
        $domicilio = $entityManager->find(Domicilio::class, 0);
        if (is_null($domicilio)) {
          throw new Exception("domicilio 0 no encontrado");
        }
      } catch (Exception $e) {
        $mensaje = "errorDom0";
        $error = $e->getMessage();
        return ["mensaje" => $mensaje, "error" => $error];
      }
    } else if (!isset($this->objeto->domicilio->localidad))
      try {
        $localidad = $entityManager->find(Localidad::class, 0);
        if (is_null($localidad)) {
          throw new Exception("localidad 0 no encontrado");
        }
      } catch (Exception $e) {
        $mensaje = "errorLoc0";
        $error = $e->getMessage();
        return ["mensaje" => $mensaje, "error" => $error];
      }
    else {
      try {
        $localidad = $entityManager->find(
          Localidad::class,
          $this->objeto->localidad->id
        );
      } catch (Exception $e) {
      }
    }

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
    global $entityManager;
    $mensaje = "";
    $error = "";

    $mod = $this->objeto;
    $proveedor = $entityManager->find(Proveedor::class, $this->objeto->id);

    // razon social md
    try {
      if (isset($mod->razonSocial)) $proveedor->setRazonSocial($mod->razonSocial);
    } catch (Exception $e) {
      $mensaje = "errorModRazSoc";
      $error = $e->getMessage();

      return ["mensaje" => $mensaje, "error" => $error];
    }

    // cuuil mod
    try {
      if (isset($mod->cuil)) $proveedor->setCuil($mod->cuil);
    } catch (Exception $e) {
      $mensaje = "errorModCuil";
      $error = $e->getMessage();

      return ["mensaje" => $mensaje, "error" => $error];
    }

    // tel mod
    try {
      if (isset($mod->telefono)) $proveedor->setTelefono($mod->telefono);
    } catch (Exception $e) {
      $mensaje = "errorModTel";
      $error = $e->getMessage();

      return ["mensaje" => $mensaje, "error" => $error];
    }

    // correo mod
    try {
      if (isset($mod->correo)) $proveedor->setCorreo($mod->correo);
    } catch (Exception $e) {
      $mensaje = "errorModCorreo";
      $error = $e->getMessage();

      return ["mensaje" => $mensaje, "error" => $error];
    }

    // mod direccion
    try {
      if (isset($mod->telefono)) $proveedor->setTelefono($mod->telefono);
    } catch (Exception $e) {
      $mensaje = "errorModTel";
      $error = $e->getMessage();

      return ["mensaje" => $mensaje, "error" => $error];
    }
  }
}
