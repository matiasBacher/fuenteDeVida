<?php 
namespace modelo;
require_once($_SERVER["DOCUMENT_ROOT"]."/vendor/autoload.php");
use Doctrine\ORM\Mapping as ORM;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

#[ORM\Table(name: "categorias")]
#[ORM\Entity]
class categorias implements \JsonSerializable {

    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: "IDENTITY")]
    #[ORM\Column(name: "ID_CATEGORIA", type: "integer")]
    private $id;

    #[ORM\Column(name: "NOMBRE_CATEGORIA", type: "string", length: 250)]
    private $nombre;

function __construct(?int $id = null, $nombre) {
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
    function setNombre(string $nombre){
        $this->nombre=$nombre;
    }
}