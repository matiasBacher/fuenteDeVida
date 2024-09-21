<?php
use modelo\categorias;
require_once($_SERVER['DOCUMENT_ROOT'].'/app/BD/buscarCategorias.php');
require_once($_SERVER['DOCUMENT_ROOT'].'/app/modelo/categorias.php');
class ControladorCategorias{
    static function agregarCategorias($nombre){
        $x = new categoriasBD(new categorias(-1, $nombre));
            return $x->insertar();
        }
    static function eliminarCategoria($id){
        $x = new categoriasBD(new categorias($id,""));
        return $x->eliminarCategorias();
    }
    static function buscarTodasLasCategorias(){
        $x = new categoriasBD(new categorias(-1,""));
        $x->buscarTodasCategorias();
        return $x->getCategoriaEncontrada();
    }
    static function actualizarCategoria($id, $nombre){
        $x = new categoriasBD(new categorias($id, $nombre));
        return $x->actualizarCategoria();
    }

}