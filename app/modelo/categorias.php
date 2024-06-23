<?php 
class Categoria implements JsonSerializable {
    private $id;
    private $nombre;
function __construct($id, $nombre) {
    $this->id = $id;
    $this->nombre = $nombre;
}

    public function jsonSerialize(){
        return [
            "id"=> $this->id,
            "nombre"=> $this->nombre,
        ];
    }
    function getId() {
        return $this->id;
    }
    function getNom() {
        return $this->nombre;
}
}