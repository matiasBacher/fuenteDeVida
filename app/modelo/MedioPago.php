<?php 
namespace modelo;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: 'mediopago')]
class MedioPago
{
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: 'AUTO')]
    #[ORM\Column(type: 'integer',  name:"id")]
    private ?int $id = null;

    #[ORM\Column(type: 'string', length: 250, name:"nombre")]
    private string $nombre;

    // Getters and Setters

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombre(): string
    {
        return $this->nombre;
    }

    public function setNombre(string $nombre): self
    {
        $this->nombre = $nombre;
        return $this;
    }
}