<?php
require_once($_SERVER['DOCUMENT_ROOT']."\app\controlador\controladorProductosClass.php");


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
        $codigo=intval($_POST["codigo"]);
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
