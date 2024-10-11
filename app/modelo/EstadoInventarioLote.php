<?php 
namespace modelo;

require_once($_SERVER["DOCUMENT_ROOT"]."/vendor/autoload.php");
use Doctrine\ORM\Mapping as ORM;


use modelo\Producto;
require_once($_SERVER['DOCUMENT_ROOT']."/bootstrap.php");


#[ORM\Entity]
#[ORM\Table(name:"estadoinventariolote")]
class EstadoInventarioLote implements \JsonSerializable{
    #[ORM\id]
    #[ORM\Column()]
    #[ORM\Column(name:"id", type: "integer")]
    private int $id;

    #[ORM\Column(name:"nombre")]
    private string $nombre;

    public function jsonSerialize(){
        return[
            "id"=>$this->id,
            "nombre"=>$this->nombre
        ];
    }


}