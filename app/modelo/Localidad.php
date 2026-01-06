<?php

namespace modelo;

use Doctrine\ORM\Mapping as ORM;

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

  public function __construct(string $nombre)
  {
    $this->nombre = $nombre;
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
    ];
  }
}
