<?php
require_once($_SERVER['DOCUMENT_ROOT'].'/app/BD/buscarCategorias.php');
require_once($_SERVER['DOCUMENT_ROOT'].'/app/modelo/categorias.php');
class ControladorCategorias{
    static function agregarCategorias($nombre){
        $x = new categoriasBD(new Categoria(-1, $nombre));
            return $x->insertar();
        }
    static function eliminarCategoria($id){
        $x = new categoriasBD(new Categoria($id,""));
        return $x->eliminarCategorias();
    }
    static function buscarTodasLasCategorias(){
        $x = new categoriasBD(new Categoria(-1,""));
        $x->buscarTodasCategorias();
        return $x->getCategoriaEncontrada();
    }
}
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
}