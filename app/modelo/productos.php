<?php

require_once($_SERVER['DOCUMENT_ROOT']."\app\modelo\propiedades.php");

class Producto implements JsonSerializable {
    private $codigo;
    private $nombre;
    private $precioDeVenta;
    private $categoria;

    private Propiedades $propiedades;


    

    

     // Constructor
     public function __construct(int $codigo, string $nombre, int $precioDeVenta, string $categoria, Propiedades $propiedades) {
        $this->codigo = $codigo;
        $this->nombre = $nombre;
        $this->precioDeVenta = $precioDeVenta;
        $this->categoria = $categoria;
        $this->propiedades = $propiedades;
        

    }
    public function jsonSerialize(){
        return [
            "codigo"=> $this->codigo,
            "nombre"=> $this->nombre,
            "precio"=> $this->precioDeVenta,
            "categoria"=> $this->categoria,
            "propiedades"=> $this->propiedades,
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
}