<?php
namespace modelo;
require_once($_SERVER["DOCUMENT_ROOT"]."/vendor/autoload.php");

use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: "detalledeventas")]
class DetalleVenta implements \JsonSerializable
{
    #[ORM\Id]
    #[ORM\GeneratedValue()]
    #[ORM\Column(name: "ID_DETALLe", type: "integer")]
    private int $id;
    #[ORM\Column(name: "ID_VENTA", type: "integer")]
    private int $idVenta;

    #[ORM\Column(name: "ID_LOTE", type: "integer")]
    private int $idLote;

    #[ORM\Column(name: "CANTIDAD_DETALLEVENTA", type: "integer", nullable: true)]
    private ?int $cantidad = null;

    #[ORM\ManyToOne(targetEntity: Venta::class, inversedBy: "detalles")]
    #[ORM\JoinColumn(name: "ID_VENTA", referencedColumnName: "ID_VENTA", nullable: false, onDelete: "CASCADE")]
    private ?Venta $venta = null;

    #[ORM\Column(name: "precioFecha", type:"integer", nullable:false, options:["unsigned" => true])]
    private int $precio; 

    #[ORM\ManyToOne(targetEntity: Lote::class)]
    #[ORM\JoinColumn(name: "ID_LOTE", referencedColumnName: "ID_LOTE")]
    private ?Lote $lote = null;

    // Getters y setters
    public function __construct(int $cantidad=1, Lote $lote){
        $this->cantidad=$cantidad;
        $this->lote=$lote;
        $this->precio=$this->getProducto()->getPrecioDeVenta();
    }
    public function jsonSerialize(){
        return[
            "id"=> $this->getID(),
            "precio"=> $this->getPrecio(),
            "cantidad"=> $this->getCantidad(),
            "producto"=> $this->getProducto()->getDatosBasicos(),
            "lote"=> $this->getLote()->datosBasicos()
        ];
    }
    public function getID(){
        return $this->id;
    }

    public function getIdVenta(): int
    {
        return $this->idVenta;
    }

    public function getIdLote(): int
    {
        return $this->idLote;
    }

    public function setIdLote(int $idLote): self
    {
        $this->idLote = $idLote;
        return $this;
    }

    public function getCantidad(): ?int
    {
        return $this->cantidad;
    }

    public function setCantidad(?int $cantidad): self
    {
        $this->cantidad = $cantidad;
        return $this;
    }

    public function getVenta(): ?Venta
    {
        return $this->venta;
    }

    public function setVenta(?Venta $venta): self
    {
        $this->venta = $venta;
        return $this;
    }

    public function getProducto(): ?Producto
    {
        return $this->lote->getProducto();
    }



public function getPrecio():int {
    return $this->precio;
}

    /**
     * Get the value of lote
     */ 
    public function getLote()
    {
        return $this->lote;
    }

    /**
     * Set the value of lote
     *
     * @return  self
     */ 
    public function setLote($lote)
    {
        $this->lote = $lote;

        return $this;
    }
}