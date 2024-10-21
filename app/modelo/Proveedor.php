<?php

namespace modelo;

use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: "proveedores")]
class Proveedor implements \JsonSerializable{
    #[ORM\Id]
    #[ORM\Column(name: "ID_PROVEEDOR", type: "integer")]
    #[ORM\GeneratedValue(strategy: "NONE")]
    private int $id;

    #[ORM\Column(name: "razonSocial", type: "string", length: 250)]
    private string $razonSocial;

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
