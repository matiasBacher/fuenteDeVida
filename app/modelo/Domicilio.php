<?php

namespace modelo;

require_once($_SERVER["DOCUMENT_ROOT"] . "/bootStrap.php");


use Doctrine\ORM\Mapping as ORM;

use modelo\Localidad as Localidad;




#[ORM\Entity]
#[ORM\Table(name: "domicilios")]
class Domicilio implements \JsonSerializable
{

  #[ORM\Id]
  #[ORM\Column(name: "ID_DOMICILIO", type: "integer")]
  #[ORM\GeneratedValue(strategy: "AUTO")]
  private ?int $id = null;



  #[ORM\Column(name: 'DIRECCION_DOMICILIO', type: 'string', length: 250, nullable: false)]
  private ?string $direccion = null;

  #[ORM\ManyToOne(targetEntity: Localidad::class)]
  #[ORM\JoinColumn(name: 'ID_LOCALIDAD', referencedColumnName: 'ID', nullable: false)]
  private ?Localidad $localidad = null;

  public function __construct(Localidad $localidad = null, ?string $direccion = null)
  {
    $this->localidad = $localidad ?? $entityManager->find(Localidad::class, 0);
    $this->direccion = $direccion;
  }

  public function jsonSerialize()
  {
    return [
      "localidad" => $this->localidad,
      "direccion" => $this->direccion,
      "id" => $this->id,
    ];
  }
}
