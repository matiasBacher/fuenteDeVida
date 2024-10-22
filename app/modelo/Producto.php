<?php
namespace modelo;

require_once($_SERVER['DOCUMENT_ROOT']."\app\modelo\Propiedades.php");


use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

use modelo\Propiedades;
#[ORM\Entity()]
#[ORM\Table(name: "productos")]
class Producto implements \JsonSerializable {
    #[ORM\Id]
    #[ORM\Column(name: 'ID_PRODUCTO', type: 'integer')]
    private int $codigo;
    #[ORM\Column(name: 'NOMBRE_PRODUCTO', type: 'string', length: 250, nullable: true)]
    private ?string $nombre = null;

    #[ORM\Column(name: 'PRECIODEVENTA_PRODUCTO', type: 'integer', nullable: true)]
    private ?int $precioDeVenta = null;

    #[ORM\Column(name: 'GANANCIA_PRODUCTO', type: 'integer', nullable: true)]
    private ?int $gananciaProducto = null;


    private $categoria;
    #[ORM\ManyToOne(targetEntity: categorias::class)]
    #[ORM\JoinColumn(name: "ID_CATEGORIA", referencedColumnName: "ID_CATEGORIA", nullable: true)]
    private ?categorias $cat=null;

    #[ORM\Column(name: 'descripcion_producto', type: 'string', length: 255, nullable: true)]
    private $descripcion;

    #[ORM\Column(name: 'FECHA_CREACION_PRODUCTO', type: 'datetime', options: ['default' => 'CURRENT_TIMESTAMP'])]
    private \DateTime $fechaCreacion;

    private Propiedades $propiedades;

    #[ORM\JoinTable(name: "propiedades_productos")] // Tabla intermedia
    #[ORM\JoinColumn(name: "ID_PRODUCTO", referencedColumnName: "ID_PRODUCTO")]
    #[ORM\InverseJoinColumn(name: "ID_PROPIEDADES", referencedColumnName: "ID_PROPIEDADES")]
    #[ORM\ManyToMany(targetEntity: Propiedad::class)]
    
    private ?Collection $conjuntoPropiedades=null;

    #[ORM\OneToMany(mappedBy: "producto",targetEntity: Lote::class, cascade: ["remove"], fetch:  "EAGER", )]
    private ?Collection $lotes=null;


    

     // Constructor
    public function __construct(int $codigo, string $nombre="", 
    int $precioDeVenta=0, categorias $categoria=null, 
    string $descripcion="",  string $fechaCreacion="",?Collection $propiedades=null) {

        $this->codigo = $codigo;
        $this->nombre = $nombre;
        $this->precioDeVenta = $precioDeVenta;
        $this->cat = $categoria;
        $this->descripcion = $descripcion;
        $this->fechaCreacion =new \DateTime($fechaCreacion ?? 'now');
        $this->conjuntoPropiedades=$propiedades?? new ArrayCollection;

        

    }
    public function jsonSerialize(): array{
        $datos=$this->getDatosBasicos();
        $datos["lote"]=$this->getLotes()!=null?$this->getLotes()->toArray():null;
        return $datos;
    }
    
    public function getDatosBasicos(){
                 
        return
                [ 
                            "codigo"=> $this->codigo,
                            "nombre"=> $this->nombre,
                            "precio"=> $this->precioDeVenta,
                            "categoria"=> $this->cat->getNom(),
                            "cat"=> $this->getCat(),
                            "propiedades"=> $this->propiedades??$this->conjuntoPropiedades->map(
                                        function($x){ return $x->getNombre();})->toArray(),
                            "descripcion"=> $this->descripcion,
                            'fechaCreacion' => $this->fechaCreacion->format('Y-m-d H:i:s'),        
                ];

    }
    // Métodos getter y setter
    public function getCodigo() {
        return $this->codigo;
    }

    public function setCodigo(int $codigo) {
        $this->codigo = $codigo;
    }

    public function getNombre() {
        return $this->nombre;
    }

    public function setNombre(string $nombre) {
        $this->nombre = $nombre;
    }

    public function getPrecioDeVenta() {
        return $this->precioDeVenta;
    }

    public function setPrecioDeVenta(int $precioDeVenta) {
        $this->precioDeVenta = $precioDeVenta;
    }

    public function getCategoria() {
        return $this->categoria;
    }

    public function setCategoria($categoria) {
        $this->categoria = $categoria;
    }
    public function getPropiedades() {
        return $this->propiedades;
    }

    public function setPropiedades(Propiedades $propiedades) {
        $this->propiedades = $propiedades;
    }
    public function setDescripcion($descripcion){ 
        $this->descripcion=$descripcion;
     }
    public function getDescripcion(){
        return $this->descripcion;
    }
    public function getFechaCreacion(){
        return $this->fechaCreacion->format('d-m-Y');
    }

    public function addPropiedad(Propiedad $propiedad){
        $this->conjuntoPropiedades->add($propiedad);
    }

    /**
     * Get the value of lotes
     */ 
    public function getLotes()
    {
        return $this->lotes;
    }

    /**
     * Set the value of lotes
     *
     * @return  self
     */ 
    public function setLotes($lotes)
    {
        $this->lotes = $lotes;

        return $this;
    }

    /**
     * Get the value of cat
     */ 
    public function getCat()
    {
        return $this->cat;
    }

    /**
     * Set the value of cat
     *
     * @return  self
     */ 
    public function setCat($cat)
    {
        $this->cat = $cat;

        return $this;
    }

    /**
     * Get the value of conjuntoPropiedades
     */ 
    public function getConjuntoPropiedades()
    {
        return $this->conjuntoPropiedades;
    }

    /**
     * Set the value of conjuntoPropiedades
     *
     * @return  self
     */ 
    public function setConjuntoPropiedades($conjuntoPropiedades)
    {
        $this->conjuntoPropiedades = $conjuntoPropiedades;

        return $this;
    }
}