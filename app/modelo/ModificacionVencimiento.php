<?php
namespace modelo;

require_once($_SERVER['DOCUMENT_ROOT']."/bootstrap.php");

use Doctrine\ORM\Mapping as ORM;


#[ORM\Entity]
#[ORM\Table(name:"modificacion_vencimiento")]
class ModificacionVencimiento{
    #[ORM\Id]
    #[ORM\GeneratedValue()]
    #[ORM\Column(name: "id", type: "integer")]
    private int $id;

    #[ORM\Column(name:"fecha", type:"datetime")]
    private \DateTime $fecha;

    public function __construct(){
        $this->fecha=new \DateTime();
    }

    function getFecha(){
        return $this->fecha;
    }

}