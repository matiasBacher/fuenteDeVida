<?php
namespace modelo;

use DateInterval;
use DateTime;
use Doctrine\ORM\Mapping as ORM;


use Exception;
use modelo\Producto;
require_once($_SERVER['DOCUMENT_ROOT']."/bootstrap.php");


#[ORM\Entity]
#[ORM\Table(name: "lotes")]

class Lote implements \JsonSerializable{
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: "AUTO")]
    #[ORM\Column(name:"ID_LOTE", type: "integer")]
    private ?int $id = null;

    #[ORM\ManyToOne(targetEntity: Producto::class, inversedBy: "lotes")]
    #[ORM\JoinColumn(name: 'ID_PRODUCTO', referencedColumnName:'ID_PRODUCTO', nullable:false)]
    private Producto $producto;

    #[ORM\Column(name:"FECHAVENCIMEINTO_LOTE", type:"date")]
    private DateTime $vencimiento;

    #[ORM\Column(name:"fechaIngreso", type:"date", options:["default"=> "CURRENT_TIMESTAMO"])]
    private DateTime $ingreso;

    #[ORM\Column(name: "CANTIDAD_LOTE", type:"integer")]
    private int $cantidad;


    #[ORM\ManyToOne(targetEntity: EstadoVencimiento::class)]
    #[ORM\JoinColumn(name:"idEstadoVencimiento", referencedColumnName:"id", nullable:false)]
    private EstadoVencimiento $estadoVencimiento;

    #[ORM\ManyToOne(targetEntity: Proveedor::class)]
    #[ORM\JoinColumn(name:"ID_PROVEEDOR", referencedColumnName:"ID_PROVEEDOR", nullable:false)]
    private Proveedor $proveedor;

    static int $diasVencimiento=10; 

    public function __construct(
                                Producto $producto, 
                                DateTime $vencimiento, 
                                int $cantidad=1,
                                ?DateTime $ingreso=null,
                                ?Proveedor $proveedor=null,
                                ){
                                global $entityManager;
                                $this->producto=$producto;
                                $this->vencimiento=$vencimiento;
                                $this->cantidad=$cantidad;
                                $this->ingreso=$ingreso??new DateTime();
                                $this->proveedor=$proveedor??$entityManager->find(Proveedor::class, 0);
                                $this->comprobarVencimiento();





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
        throw new Exception("Ponga una cantidad positiva.");
    }
}
public function restarCantidad($cantidad){
    if($cantidad<$this->cantidad){
        $this->cantidad-=$cantidad;
    }
    else{
        throw new Exception("No se puede restar por debajo de cero.");
    }
}


    /**
     * Get the value of estado
     */ 
    // public function getEstado()
    // {
    //     return $this->estadoInventario;
    // }

    /**
     * Set the value of estado
     *
     * @return  self
     */ 
    // public function setEstado($estado)
    // {
    //     $this->estadoInventario = $estado;

    //     return $this;
    // }
    // private function buscarEstadoinv(string $estado){

    //     global $entityManager;
    //     $estadoInvetario =$entityManager=$entityManager->getRepository(EstadoInventarioLote::class)
    //     ->findOneBy(["nombre"=>$estado]);

    //     $this->setEstado($estadoInvetario);
    // }
    // public function setSinStock(){
    //     $this->buscarEstadoinv("sin Stock");
    // }
    // public function setPocoStock(){
    //     $this->buscarEstadoinv("poco Stock");
    // }
    // public function setConStock(){
    //     $this->buscarEstadoinv("con Stock");
    // }
    public function definirEstadoVencimiento(string $estado){
        global $entityManager;
        $estadoVencimiento = $entityManager->getRepository(EstadoVencimiento::class)
        ->findOneBy(["nombre"=>$estado]);
        if($estadoVencimiento)$this->setEstadoVencimiento($estadoVencimiento);
        else $this->setEstadoVencimiento(new EstadoVencimiento($estado));

        



    }
    public function setVencimientoLargo(){
        $this->definirEstadoVencimiento("Vencimiento largo.");
    }
    public function setPorVencer(){
        $this->definirEstadoVencimiento("Por vencer.");
    }
    public function setVencido(){
        
        $this->definirEstadoVencimiento("Vencido.");
       
    }
    public function comprobarVencimiento(){
        $hoy = new DateTime();
        $diferencia= $this->getVencimiento()->diff($hoy);
        if($diferencia->d>self::$diasVencimiento){
            $this->setVencimientoLargo();
        }
        elseif($diferencia->d>0){
            $this->setPorVencer();
        }
        else{
            $this->setVencido();
        }
    }
    /**
     * Get the value of proveedor
     */ 
    public function getProveedor()
    {
        return $this->proveedor;
    }

    /**
     * Set the value of proveedor
     *
     * @return  self
     */ 
    public function setProveedor($proveedor)
    {
        $this->proveedor = $proveedor;

        return $this;
    }
    /**
     * Get the value of estadoVencimiento
     */ 
    public function getEstadoVencimiento()
    {
        return $this->estadoVencimiento;
    }

    /**
     * Set the value of estadoVencimiento
     *
     * @return  self
     */ 
    public function setEstadoVencimiento($estadoVencimiento)
    {
        $this->estadoVencimiento = $estadoVencimiento;

        return $this;
    }

    public function jsonSerialize(){
        return[
            "id"=>$this->getId(),
            "cantidad"=>$this->getCantidad(),
            "vencimiento"=>$this->getVencimiento()->format("Y-m-d"),
            "ingreso"=>$this->getIngreso()->format("Y-m-d"),
            "producto"=>$this->getProducto()->getDatosBasicos(),
                            
            "proveedor"=>$this->getProveedor(),
            "estadoVencimiento"=>$this->getEstadoVencimiento(),
            
        ];
    }

}


