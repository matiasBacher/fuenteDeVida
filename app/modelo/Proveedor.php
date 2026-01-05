<?php

namespace modelo;

use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: "proveedores")]
class Proveedor implements \JsonSerializable
{
  #[ORM\Id]
  #[ORM\Column(name: "ID_PROVEEDOR", type: "integer")]
  #[ORM\GeneratedValue(strategy: "NONE")]
  private int $id;

  #[ORM\Column(name: "razonSocial", type: "string", length: 250)]
  private string $razonSocial;

  #[ORM\Column(name: "TEL_PROVEEDOR", type: "integer", nullable: true)]
  private ?int $telefono = null;

  #[ORM\Column(name: "EMAIL_PROVEEDOR", type: "string", nullable: true, length: 250)]
  private ?string $correo = null;


  #[ORM\Column(name: "CUIL_PROVEEDORR", type: "integer", nullable: true)]
  private ?int $cuil = null;


  public function __construct(string $razonSocial, ?int $telefono = null, ?string $correo = null, ?int $cuil)
  {
    $this->razonSocial = $razonSocial;
    $this->telefono = $telefono;
    $this->correo = $correo;
    $this->cuil = $cuil;
  }

  // Getters and setters
  public function getId(): ?int
  {
    return $this->id;
  }

  public function getRazonSocial(): ?string
  {
    return $this->razonSocial;
  }

  public function setRazonSocial(string $razonSocial): self
  {
    $this->razonSocial = $razonSocial;
    return $this;
  }

  public function getCuil()
  {
    return $this->cuil;
  }
  public function getTelefono()
  {
    return $this->telefono;
  }
  public function getCorreo()
  {
    return $this->correo;
  }

  // Implementación de JsonSerializable
  public function jsonSerialize(): array
  {
    return [
      'id' => $this->id,
      // 'domicilioId' => $this->domicilioId,
      // 'cuil' => $this->cuil,
      'razonSocial' => $this->razonSocial,
      // 'telefono' => $this->telefono,
      // 'email' => $this->email,
      // 'domicilio' => $this->domicilio ? $this->domicilio->jsonSerialize() : null, // Llamada recursiva si el domicilio también implementa JsonSerializable
    ];
  }
}
