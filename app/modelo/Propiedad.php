<?php
    namespace modelo;
    use Doctrine\ORM\Mapping as ORM;
    use Doctrine\Common\Collections\ArrayCollection;
    use Doctrine\Common\Collections\Collection;

    #[ORM\Entity()]
    #[ORM\Table(name: "propiedades")]
    class Propiedad{
        #[ORM\Id]
        #[ORM\GeneratedValue()]
        #[ORM\Column(name:"ID_PROPIEDADES", type:"integer")]
        private int $id;

        #[ORM\Column(name: "NOMBRE_PROPIEDADES", type:" type: 'string', length: 250,")]
        private string $nombre;

        public function __construct($nombre){
            $this->nombre=$nombre;
        }

        public function getNombre(){
            return $this->nombre;
        }
        public function getId(){
            return $this->id;
        }
        public function setNombre(string $nombre){
            $this->nombre=$nombre;
        }

    }