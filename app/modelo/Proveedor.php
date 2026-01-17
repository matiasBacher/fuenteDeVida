<?php

namespace modelo;

use Gedmo\SoftDeleteable\Traits\SoftDeleteable;
use Gedmo\Mapping\Annotation as Gedmo;

use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: "proveedores")]
#[Gedmo\SoftDeleteable(fieldName: 'deletedAt', timeAware: false)]
class Proveedor implements \JsonSerializable
{
  use SoftDeleteable;

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


  #[ORM\Column(name: "CUIL_PROVEEDOR", type: "integer", nullable: true)]
  private ?int $cuil = null;

  #[ORM\ManyToOne(targetEntity: Domicilio::class)]
  #[ORM\JoinColumn(name: "ID_DOMICILIO", referencedColumnName: "ID_DOMICILIO", nullable: true)]
  private ?Domicilio $domicilio = null;



  public function __construct(string $razonSocial, ?int $telefono = null, ?string $correo = null, ?int $cuil = null, ?Domicilio $domicilio = null)
  {
    global $entityManager;
    $this->razonSocial = $razonSocial;
    $this->telefono = $telefono;
    $this->correo = $correo;
    $this->cuil = $cuil;

    $this->domicilio = $domicilio;
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

  public function setCuil(int $cuil): void
  {
    $this->cuil = $cuil;
  }
  public function getCuil(): ?int
  {
    return $this->cuil;
  }
  public function setTelefono(int $telefono): void
  {
    $this->telefono = $telefono;
  }
  public function getTelefono(): ?int
  {
    return $this->telefono;
  }
  public function setCorreo(int $correo): void
  {
    $this->correo = $correo;
  }
  public function getCorreo(): ?string
  {
    return $this->correo;
  }

  // Implementación de JsonSerializable
  public function jsonSerialize(): array
  {
    return [
      'id' => $this->id,
      // 'domicilioId' => $this->domicilioId,
      'cuil' => $this->cuil,
      'razonSocial' => $this->razonSocial,
      'telefono' => $this->telefono,
      'correo' => $this->correo,
      // 'domicilio' => $this->domicilio ? $this->domicilio->jsonSerialize() : null, // Llamada recursiva si el domicilio también implementa JsonSerializable
    ];
  }
}
