<?php
use modelo\Propiedad;
function swichPropiedad(){ 
    global $entityManager;
        include_once($_SERVER['DOCUMENT_ROOT']."/bootstrap.php");
        include_once($_SERVER['DOCUMENT_ROOT']."/app/vista/componentes/swich.php");
        
        $propiedades=$entityManager->getRepository(Propiedad::class)->findAll();

        foreach($propiedades as $p){
            swich("propiedades[]",$p->getNombre(), $p->getDescripcion());
        }
    }




