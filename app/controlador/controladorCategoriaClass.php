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
    static function actualizarCategoria($id, $nombre){
        $x = new categoriasBD(new Categoria($id, $nombre));
        return $x->actualizarCategoria();
    }

}