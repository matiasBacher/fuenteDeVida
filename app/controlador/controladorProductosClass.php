<?php 
require_once($_SERVER['DOCUMENT_ROOT']."\app\modelo\Producto.php");
require_once($_SERVER['DOCUMENT_ROOT']."\app\modelo\propiedades.php");
require_once($_SERVER['DOCUMENT_ROOT']."\app\BD\buscadorProductos.php");
require_once($_SERVER['DOCUMENT_ROOT']."\app\BD\insertarProducto.php");
use modelo\Producto;
use modelo\Propiedades;
final class controladorProductos 
{
    private static $prodoductosEncontrados = [];
    private static Producto $productoAGrabar;
    public static function buscarProductos($busqueda)  {
        $x= new buscadorProductos($busqueda) ;
        $x->buscar();
        self::$prodoductosEncontrados=$x->getProductosEncontrados();
    }

    public static function devolverJson() {
        $x=self::$prodoductosEncontrados;
        return json_encode($x);
    }

    public static function fabricarPropiedades($array ):Propiedades {


        $x=new Propiedades(
            isset($array["esDiuretico"]),
            isset($array["sinSodio"]),
            isset($array["esNatural"]),
            isset($array["sinTacc"]),
            isset($array["aptoDiabetico"]),
        );
        return $x;


    }
    public static function setProductoAGrabar($array):void {
        self::$productoAGrabar = 
        new Producto((int)$array["codigo"],$array["nombre"],
        (int)$array["precio"], $array["categoria"],
        isset($array["descripcion"])?$array["descripcion"]:"",
        self::fabricarPropiedades($array) );



    }

    public static function insertarProducto(){
        $x= new insertarProducto(self::$productoAGrabar);
        return $x->grabarProducto(); 
    }
    public static function borrarProducto($codigo){
        $x=new Producto($codigo);
        $y=new insertarProducto($x);
        return $y->borrarProducto();

}
}