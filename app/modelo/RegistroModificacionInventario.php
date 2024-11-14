<?php
namespace modelo;

use DateTime;

require_once($_SERVER["DOCUMENT_ROOT"]."/bootstrap.php");

use Doctrine\ORM\Mapping as ORM;
use modelo\DetalleVenta;

#[ORM\Entity]
#[ORM\Table(name: "registro-modificacion-inventario")]
class RegistroModificacionInventario implements \JsonSerializable{
    private $motivos=[
        "venta",
        "modificacionVenta"
    ];

    #[ORM\Id]
    #[ORM\Column(type: "integer", name: "id", options: ["comment" => "Primary Key"])]
    #[ORM\GeneratedValue(strategy: "AUTO")]
    private int $id;

    #[ORM\Column(type: "datetime", name: "fecha", nullable: false, options: ["comment" => "Create Time", "default" => "CURRENT_TIMESTAMP"])]
    private ?\DateTime $fecha;

    #[ORM\Column(type: "integer", name: "motivo", nullable: true)]
    private ?int $motivo = null;

     #[ORM\Column(type: "integer", name: "cantidad" )]
    private int $cambio;

    #[ORM\ManyToOne(targetEntity:DetalleVenta::class)]
    #[ORM\JoinColumn(name: "id_detalle", referencedColumnName:"id", nullable:true)]    
    private ?DetalleVenta $detalleVenta = null;

    #[ORM\Column(type: "integer", name: "id_devolucion", nullable: true, options: ["unsigned" => true])]
    private ?int $idDevolucion = null;

    #[ORM\Column(name:"inv_mom", type: "integer", nullable: false )]
    private int $inventarioDelMomento;

    function __construct(
        int $cambio, 
        DetalleVenta $detalle,
        int $inventarioDelMomento,
        string $motivo="venta",

    ){
        $this->cambio=$cambio;
        $this->detalleVenta=$detalle;
        $this->inventarioDelMomento=$inventarioDelMomento;
        $this->fecha= new DateTime();
        $this->setMotivo($motivo);
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFecha(): ?DateTime
    {
        return $this->fecha;
    }

    public function setFecha(DateTime $fecha): self
    {
        $this->fecha = $fecha;
        return $this;
    }

    public function getMotivo(): ?string
    {
        return $this->motivos[$this->motivo] ;
    }

    public function setMotivo(string $motivo): self
    {
        $posicion=array_search($motivo, $this->motivos);
        if($posicion){
            $this->motivo = $posicion;
            return $this;
        }
        else{
            throw new \Exception("motivo no valido");
        }
    }

    public function getCambio(): int
    {
        return $this->cambio;
    }


    public function getDetalleVenta(): ?int
    {
        return $this->detalleVenta;
    }

    public function setDetalleVenta(DetalleVenta $detalleVenta): self
    {
        $this->detalleVenta = $detalleVenta;
        return $this;
    }

    public function getIdDevolucion(): ?int
    {
        return $this->idDevolucion;
    }

    public function setIdDevolucion(?int $idDevolucion): self
    {
        $this->idDevolucion = $idDevolucion;
        return $this;
    }
    public function jsonSerialize(){
        return [
            "id"=>$this->id,
            "detalleVenta"=>$this->detalleVenta,
            "cambio"=>$this->cambio,
            "inventarioMomento"=>$this->inventarioDelMomento,
            "fecha"=>$this->fecha

        ];
    }

    /**
     * Get the value of inventarioDelMomento
     */ 
    public function getInventarioDelMomento()
    {
        return $this->inventarioDelMomento;
    }

    /**
     * Set the value of inventarioDelMomento
     *
     * @return  self
     */ 
    public function setInventarioDelMomento($inventarioDelMomento)
    {
        $this->inventarioDelMomento = $inventarioDelMomento;

        return $this;
    }
}


