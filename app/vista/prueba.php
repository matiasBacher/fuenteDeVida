<?php 
require_once($_SERVER['DOCUMENT_ROOT']."/bootstrap.php");
require_once($_SERVER['DOCUMENT_ROOT']."/app/controlador/ControladorLoteClass.php");
$obj= new stdClass;
$obj->filtros=["venMax"=> new DateTime("2024-10-30"),
                "venMin" => new DateTime(),
                "ingMax" => new DateTime(),
                "ingMin" => new DateTime("2024-10-1"),
                "busqueda" => "1",
];
$obj->orden=json_decode(json_encode([
                "ordeProductos" => "codigo",
                "ordenLotes" => "id",
]));

$x=new ControladorLoteClass("consulta",$obj);
$x->hacer();
echo json_encode($x->getResultados());