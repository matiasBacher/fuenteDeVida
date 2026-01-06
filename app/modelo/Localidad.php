<?php

namespace modelo;

use Doctrine\ORM\Mapping as ORM;

use modelo\Provincia as Provincia;

#[ORM\Entity]
#[ORM\Table(name: "localidades")]

class Localidad implements \JsonSerializable
{

  #[ORM\Id]
  #[ORM\Column(name: "ID_LOCALIDAD", type: "integer")]
  #[ORM\GeneratedValue(strategy: "AUTO")]
  private ?int $id = null;

  #[ORM\Column(name: "NOMBRE_LOCALIDAD", type: "string", length: 250)]
  private string $nombre;

  #[ORM\ManyToOne(targetEntity: Provincia::class)]
  #[ORM\JoinColumn(name: "ID_PROVINCIA", referencedColumnName: "ID_PROVINCIA", nullable: false)]
  private Provincia $provincia;

  public function __construct(string $nombre, ?Provincia $provincia = null)
  {
    global $entityManager;
    $this->nombre = $nombre;
    $this->provincia = $provincia ?? $entityManager->find(Provincia::class, 0);
  }

  public function getNombre(): string
  {
    return $this->nombre;
  }

  public function jsonSerialize(): mixed
  {
    return [
      "nombre" => $this->nombre,
      "id" => $this->id,
      "provincia" => $this->provincia,
    ];
  }
}
