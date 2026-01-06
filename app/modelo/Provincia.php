<?php

namespace modelo;

require_once($_SERVER["DOCUMENT_ROOT"] . "/bootstrap.php");

use Doctrine\ORM\Mapping as ORM;

use JsonSerializable;

#[ORM\Entity]
#[ORM\Table(name: "provincias")]
class Provincia implements JsonSerializable
{
  #[ORM\Id]
  #[ORM\GeneratedValue(strategy: "AUTO")]
  #[ORM\Column(name: "ID_PROVINCIA", type: "integer")]
  private int $id;

  #[ORM\Column(name: "NOMBRE_PROVINCIA", type: "string")]
  private string $nombre;

  public function __construct(string $nombre)
  {
    $this->nombre = $nombre;
  }
  public function jsonSerialize(): array
  {
    return [
      "nombre" => $this->nombre,
    ];
  }

  public function getNombre(): string
  {
    return $this->nombre;
  }
  public function setNombre(string $nombre): void
  {
    $this->nombre = $nombre;
  }
}
