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
    #[ORM\GeneratedValue]
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
    
    private Collection $conjuntoPropiedades;

    

    

     // Constructor
    public function __construct(int $codigo, string $nombre="", 
    int $precioDeVenta=0, string $categoria="", 
    string $descripcion="", Propiedades $propiedades= null, string $fechaCreacion="") {

        $this->codigo = $codigo;
        $this->nombre = $nombre;
        $this->precioDeVenta = $precioDeVenta;
        $this->categoria = $categoria;
        $this->propiedades = $propiedades ?? new Propiedades();
        $this->descripcion = $descripcion;
        $this->fechaCreacion =new \DateTime($fechaCreacion ?: 'now');

        

    }
    public function jsonSerialize(){
        return [
            "codigo"=> $this->codigo,
            "nombre"=> $this->nombre,
            "precio"=> $this->precioDeVenta,
            "categoria"=> $this->categoria,
            "propiedades"=> $this->propiedades??$this->conjuntoPropiedades,
            "descripcion"=> $this->descripcion,
            'fechaCreacion' => $this->fechaCreacion->format('Y-m-d H:i:s'),        ];
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
    public function getDescripcion(){
        return $this->descripcion;
    }
    public function getFechaCreacion(){
        return $this->fechaCreacion->format('d-m-Y');
    }
}