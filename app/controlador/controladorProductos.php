<?php
require_once($_SERVER['DOCUMENT_ROOT']."\app\modelo\productos.php");
require_once($_SERVER['DOCUMENT_ROOT']."\app\modelo\propiedades.php");
require_once($_SERVER['DOCUMENT_ROOT']."\app\BD\buscadorProductos.php");
require_once($_SERVER['DOCUMENT_ROOT']."\app\BD\insertarProducto.php");
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

#selector opciones segun el valor de accion
if(isset ($_POST["accion"])){
    if($_POST["accion"]=="busqueda") {
        controladorProductos::buscarProductos($_POST["busqueda"]);
        echo controladorProductos::devolverJson();
    }


    if($_POST["accion"]=="insertar") {
        controladorProductos::setProductoAGrabar($_POST);
        $mensaje=controladorProductos::insertarProducto();
        $repuesta=json_encode(["mensaje"=>$mensaje]);
        echo $repuesta;

    }
    if($_POST["accion"]== "borrar") {
        $codigo=$_POST["codigo"];
        $mensaje=controladorProductos::borrarProducto($codigo);
        $repuesta=["mensaje"=>$mensaje];
        echo json_encode($repuesta);
    }
    if($_POST["accion"]== "actualizar") {
        $codigo=$_POST["codigo"];
        $mensajeBorrado=controladorProductos::borrarProducto($codigo);
       if($mensajeBorrado==1) {
            controladorProductos::setProductoAGrabar($_POST);
            $mensajeGrabado=controladorProductos::insertarProducto();
       }
       $repuesta=json_encode(
        ["mensajeBorrado"=>$mensajeBorrado, 
        "mensajeGrabado"=>isset($mensajeGrabado)
        ?$mensajeGrabado:-3]);
        echo $repuesta;
    }
}
