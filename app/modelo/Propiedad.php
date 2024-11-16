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

        #[ORM\Column(name: "NOMBRE_PROPIEDADES", type:"string", length: 250)]
        private string $nombre;

        #[ORM\Column(name: "descripcion", type:"string", length: 250  )]
        private ?string $descripcion=null;

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


        /**
         * Get the value of descripcion
         */ 
        public function getDescripcion()
        {
                return $this->descripcion;
        }

        /**
         * Set the value of descripcion
         *
         * @return  self
         */ 
        public function setDescripcion($descripcion)
        {
                $this->descripcion = $descripcion;

                return $this;
        }
    }