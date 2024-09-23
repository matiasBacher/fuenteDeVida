<?php 
namespace modelo;
use modelo\DetalleVenta;
use modelo\MedioPago;

require_once($_SERVER["DOCUMENT_ROOT"]."/vendor/autoload.php");
use Doctrine\ORM\Mapping as ORM;





use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;




#[ORM\Entity]
#[ORM\Table(name: "ventas")]
class Venta implements \JsonSerializable
{
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: "AUTO")]
    #[ORM\Column(name: "ID_VENTA", type: "integer")]
    private ?int $id = null;

    #[ORM\Column(name: "NUMEROFACTURAVENTAS", type: "integer", nullable: true)]
    private ?int $numeroFactura = null;

    #[ORM\Column(name: "FECHA_VENTA", type: "date", options: ["default" => "CURRENT_TIMESTAMP"])]
    private \DateTime $fecha;

    #[ORM\Column(name: "HORA_VENTA", type: "time", options: ["default" => "CURRENT_TIMESTAMP"])]
    private \DateTime $hora;
    #[ORM\ManyToOne(targetEntity: MedioPago::class)]
    #[ORM\JoinColumn(name: 'mediopago_id', referencedColumnName: 'id', nullable: false)]
    private MedioPago $medioPago;

    #[ORM\Column(name: "ERROR_VENTA", type: "boolean")]
    private bool $errorVenta;

    #[ORM\Column(name: "motivoCorreccion", type: "string", length: 250, nullable: true)]
    private ?string $motivoCorreccion = null;

    #[ORM\ManyToOne(targetEntity: self::class, fetch:"EAGER")]
    #[ORM\JoinColumn(name: "ventaAnterior", referencedColumnName: "ID_VENTA", nullable: true, onDelete: "SET NULL")]
    private ?self $ventaAnterior = null;

    #[ORM\OneToMany(mappedBy: "venta", targetEntity: DetalleVenta::class, cascade: ["persist", "remove"], fetch: "EAGER")]
    private Collection $detalles;

    // Constructor
    public function __construct(?string $metodoPago=null, ?array $detalles = null, 
    ?\DateTime $fecha=null, ?\DateTime $hora=null, bool $errorVenta=false,  )
    {
        $this->fecha = $fecha?? new \DateTime();  // Inicializa con la fecha actual
        $this->hora = $hora?? new \DateTime();   // Inicializa con la hora actual
        $this->errorVenta = $errorVenta;
        $this->metodoPago = $metodoPago??'Efectivo';
        $this->detalles = new ArrayCollection();  // Inicializa la colección de detalles

        // Si se pasan detalles en el constructor, los añadimos a la colección
        if ($detalles) {
            foreach ($detalles as $detalle) {
                $this->addDetalle($detalle);
            }
        }
    }

    // Métodos para manejar la relación con DetalleDeVenta

    public function addDetalle(DetalleVenta $detalle): self
    {
        if (!$this->detalles->contains($detalle)) {
            $this->detalles->add($detalle);
            $detalle->setVenta($this);
        }
        return $this;
    }

    public function removeDetalle(DetalleVenta $detalle): self
    {
        if ($this->detalles->contains($detalle)) {
            $this->detalles->removeElement($detalle);
            if ($detalle->getVenta() === $this) {
                $detalle->setVenta(null);
            }
        }
        return $this;
    }
    public function jsonSerialize(){
        return [
            "id"=> $this->getId(),
            "detalles"=> $this->getDetalles(),
            "fecha"=> $this->getFecha(),
            "hora"=> $this->getHora(),
            "tieneCorrecciones"=>$this->tieneCorreccion(),
            "motivoCorreccion"=>$this->getMotivoCorreccion(),
            "metodoPago"=>$this->getMetodoPago(),
            "total"=>$this->getTotal(),
        ];
    } 
    public function getDetalles(): Collection
    {
        return $this->detalles;
    }

    // Otros getters y setters...

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNumeroFactura(): ?int
    {
        return $this->numeroFactura;
    }

    public function setNumeroFactura(?int $numeroFactura): self
    {
        $this->numeroFactura = $numeroFactura;
        return $this;
    }

    public function getFecha(): \DateTime
    {
        return $this->fecha;
    }

    public function setFecha(\DateTime $fecha): self
    {
        $this->fecha = $fecha;
        return $this;
    }

    public function getHora(): \DateTime
    {
        return $this->hora;
    }

    public function setHora(\DateTime $hora): self
    {
        $this->hora = $hora;
        return $this;
    }

    public function getMetodoPago(): string
    {
        return $this->metodoPago;
    }

    public function setMetodoPago(string $metodoPago): self
    {
        $this->metodoPago = $metodoPago;
        return $this;
    }

    public function getErrorVenta(): bool
    {
        return $this->errorVenta;
    }

    public function setErrorVenta(bool $errorVenta): self
    {
        $this->errorVenta = $errorVenta;
        return $this;
    }

    public function getMotivoCorreccion(): ?string
    {
        return $this->motivoCorreccion;
    }

    public function setMotivoCorreccion(?string $motivoCorreccion): self
    {
        $this->motivoCorreccion = $motivoCorreccion;
        return $this;
    }

    public function getVentaAnterior(): ?self
    {
        return $this->ventaAnterior;
    }

    public function setVentaAnterior(?self $ventaAnterior): self
    {
        $this->ventaAnterior = $ventaAnterior;
        return $this;
    }
    public function tieneCorreccion(){
        return $this->ventaAnterior===null;
    }
    public function getTotal(){
        $total = 0;
        foreach($this->detalles->getIterator() as $detalle){
            $total+=$detalle->getPrecio();
        }
        return $total; 
    }
}
