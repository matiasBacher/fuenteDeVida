<?php
namespace modelo;
include_once($_SERVER['DOCUMENT_ROOT']."/bootstrap.php");


use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name:"estadovencimiento")]
class EstadoVencimiento implements \JsonSerializable{
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy:"AUTO")]
    #[ORM\Column(name: "id", type:"integer")]
    private int $id;

    #[ORM\Column(name: "nombre", type: "string")]
    private string $nombre;
    function jsonSerialize(){
        return [
            "nombre"=>$this->nombre,
            "id"=>$this->id,
            ];
    }

    function __construct($nombre){
        $this->nombre=$nombre;
    }

    /**
     * Get the value of nombre
     */ 
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * Set the value of nombre
     *
     * @return  self
     */ 
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * Get the value of id
     */ 
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set the value of id
     *
     * @return  self
     */ 
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }
}