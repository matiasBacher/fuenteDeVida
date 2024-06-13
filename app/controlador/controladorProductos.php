<?php
require_once($_SERVER['DOCUMENT_ROOT']."\app\modelo\productos.php");
require_once($_SERVER['DOCUMENT_ROOT']."\app\modelo\propiedades.php");
require_once($_SERVER['DOCUMENT_ROOT']."\app\BD\buscadorProductos.php");
final class controladorProductos 
{
    private static $prodoductosEncontrados = [];
    public static function buscarProductos($busqueda)  {
        $x= new buscadorProductos($busqueda) ;
        $x->buscar();
        self::$prodoductosEncontrados=$x->getProductosEncontrados();
    }

    public static function devolverJson() {
        $x=self::$prodoductosEncontrados;
        return json_encode($x);
    }
    



}

if(isset ($_POST["busqueda"])) {
    controladorProductos::buscarProductos($_POST["busqueda"]);
    echo controladorProductos::devolverJson();
}
