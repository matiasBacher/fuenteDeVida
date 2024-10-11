<?php
namespace modelo;

use Doctrine\ORM\Mapping as ORM;


use Exception;
use modelo\Producto;
require_once($_SERVER['DOCUMENT_ROOT']."/bootstrap.php");


#[ORM\Entity]
#[ORM\Table(name: "lotes")]

class Lote implements \JsonSerializable{
    #[ORM\id]
    #[ORM\GeneratedValue(strategy: "AUTO")]
    #[ORM\Column(name:"ID_LOTE", type: "integer")]
    private int $id;

    #[ORM\ManyToOne(targetEntity: Producto::class)]
    #[ORM\JoinColumn(name: 'ID_PRODUCTO', referencedColumnName:'ID_PRODUCTO', nullable:false)]
    private Producto $producto;

    #[ORM\Column(name:"FECHAVENCIMEINTO_LOTE", type:"date")]
    private \DateTime $vencimiento;

    #[ORM\Column(name:"fechaIngreso", type:"date", options:["default"=> "CURRENT_TIMESTAMO"])]
    private \DateTime $ingreso;

    #[ORM\Column(name: "CANTIDAD_LOTE", type:"integer")]
    private int $cantidad;

    #[ORM\ManyToOne(targetEntity: EstadoInventarioLote::class)]
    #[ORM\JoinColumn(name:"idEstadoInventario", referencedColumnName:"id", nullable:false)]
    private EstadoInventarioLote $estadoInventario;

    #[ORM\ManyToOne(targetEntity: Proveedor::class)]
    #[ORM\JoinColumn(name:"ID_PROVEEDOR", referencedColumnName:"ID_PROVEEDOR", nullable:false)]
    private Proveedor $proveedor;

    public function __construct(
                                Producto $producto, 
                                \DateTime $vencimiento, 
                                int $cantidad=1,
                                ?\DateTime $ingreso=null,
                                ?Proveedor $proveedor=null,
                                ?EstadoInventarioLote $estadoInventario=null,
                                ){
                                global $entityManager;
                                $this->producto=$producto;
                                $this->vencimiento=$vencimiento;
                                $this->cantidad=$cantidad;
                                $this->ingreso=$ingreso??new \DateTime();
                                $this->proveedor=$proveedor??$entityManager->find(Proveedor::class, 0);
                                $this->estadoInventario=$estadoInventario??$entityManager->find(EstadoInventarioLote::class,0);





                                }
                                
    function getId():int{
        return $this->id;
    }
    function getProducto():Producto{
        return $this->producto;
    }
    function setProducto(Producto $producto){
        $this->producto=$producto;
    }
                                
    

    /**
     * Get the value of vencimiento
     */ 
    public function getVencimiento()
    {
        return $this->vencimiento;
    }

    /**
     * Set the value of vencimiento
     *
     * @return  self
     */ 
    public function setVencimiento($vencimiento)
    {
        $this->vencimiento = $vencimiento;

        return $this;
    }

    /**
     * Get the value of ingreso
     */ 
    public function getIngreso()
    {
        return $this->ingreso;
    }

    /**
     * Set the value of ingreso
     *
     * @return  self
     */ 
    public function setIngreso($ingreso)
    {
        $this->ingreso = $ingreso;

        return $this;
    }

    /**
     * Get the value of cantidad
     */ 
    public function getCantidad()
    {
        return $this->cantidad;
    }

    /**
     * Set the value of cantidad
     *
     * @return  self
     */ 
    public function setCantidad($cantidad)
    {
        $this->cantidad = $cantidad;

        return $this;
    }

public function addCantidad(int $cantidad){
    if($cantidad>=0){
    $this->cantidad+=$cantidad;}
    else{
        throw new Exception("ponga una cantidad positiva");
    }
}
public function restarCantidad($cantidad){
    if($cantidad<$this->cantidad){
        $this->cantidad-=$cantidad;
    }
    else{
        throw new Exception("no se puede restar por debajo de cero");
    }
}


    /**
     * Get the value of estado
     */ 
    public function getEstado()
    {
        return $this->estadoInventario;
    }

    /**
     * Set the value of estado
     *
     * @return  self
     */ 
    public function setEstado($estado)
    {
        $this->estadoInventario = $estado;

        return $this;
    }
    private function buscarEstadoinv(string $estado){

        global $entityManager;
        $estado=$entityManager=$entityManager->getRepository(EstadoInventarioLote::class)
        ->findOneBy(["nombre"=>$estado]);

        $this->setEstado($estado);
    }
    public function setSinStock(){
        $this->buscarEstadoinv("sin Stock");
    }
    public function setPocoStock(){
        $this->buscarEstadoinv("poco Stock");
    }


}
