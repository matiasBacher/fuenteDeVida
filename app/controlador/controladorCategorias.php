<?php
require_once($_SERVER['DOCUMENT_ROOT']."/app/controlador/controladorCategoriaClass.php");
if(isset($_POST["accion"])){
    if($_POST["accion"]=="buscarTodo"){
        $categorias=ControladorCategorias::buscarTodasLasCategorias();
        echo json_encode($categorias);
    }
    if($_POST["accion"]== "insertar"){
        $nombre=$_POST["nombre"];
        $mensaje=ControladorCategorias::agregarCategorias($nombre);
        $repuesta=json_encode(["mensaje"=>$mensaje]);
        echo $repuesta;
    }
    if($_POST["accion"]== "eliminar"){
        $id=$_POST["id"];
        $mensaje=ControladorCategorias::eliminarCategoria($id);
        $repuesta=json_encode(["mensaje"=>$mensaje]);
        echo $repuesta;
    }
    if($_POST["accion"]== "actualizar"){
        $id=$_POST["id"];
        $nombre=$_POST["nombre"];

        $mensaje=ControladorCategorias::actualizarCategoria($id, $nombre);
        $repuesta=json_encode(["mensaje"=>$mensaje]);
        echo $repuesta;
    }
}