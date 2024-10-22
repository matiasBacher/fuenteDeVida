<?php
use Doctrine\Common\Collections\ArrayCollection;
use modelo\categorias;
use modelo\Producto;
use modelo\Propiedad;
require_once($_SERVER['DOCUMENT_ROOT']."\app\controlador\controladorProductosClass.php");
require_once($_SERVER['DOCUMENT_ROOT']."\bootstrap.php");


#selector opciones segun el valor de accion
if(isset ($_POST["accion"])){
    if($_POST["accion"]=="busqueda") {
        $busqueda=$_POST["busqueda"];

        if($busqueda==""){
            $productos= $entityManager->getRepository(Producto::class)->findAll();
        }
        else{
                $productos = $entityManager->getRepository(Producto::class)
                ->createQueryBuilder("p")
                ->where(is_numeric($busqueda)?
                "p.codigo = :busqueda":"p.nombre like :busqueda")
                ->setParameter("busqueda", $busqueda )
                ->getQuery()
                ->getResult();
        }

        echo json_encode($productos);
    }


    if($_POST["accion"]=="insertar") {
        $mensaje="";
        $codigo=$_POST["codigo"];
        if($entityManager->find(Producto::class,$codigo)){
            $mensaje=0;
        }
        else{

            $nombre=$_POST["nombre"];
            $precio=$_POST["precio"];
            $categoria= $entityManager->getRepository(categorias::class)
            ->findOneBy(["nombre"=>$_POST["categoria"]]);

            $propiedades=$_POST["propiedades"];

            $descripcion=$_POST["descripcion"]??"";

            

            $producto=new Producto($codigo,$nombre,$precio,$categoria,$descripcion);
            foreach($propiedades as $p){
                $prop=$entityManager->getRepository(Propiedad::class)->findOneBy(["nombre"=>$p]);
                $producto->addPropiedad($prop);

            }
            try{
                $entityManager->persist($producto);
                $entityManager->flush();
                $mensaje=1;
            }
            catch(Exception $e){
                $mensaje=-1;
            }
        }

        $repuesta=json_encode(["mensaje"=>$mensaje]);
        echo $repuesta;

    }
    if($_POST["accion"]== "borrar") {
        $mensaje ="";
        $codigo=$_POST["codigo"];
       $producto= $entityManager->find(Producto::class, $codigo);
       try{
        $entityManager->remove($producto);
        $entityManager->flush();
        $mensaje=1;
       }
       catch(Exception $e){
        $mensaje=-1;
       }

        // $mensaje=controladorProductos::borrarProducto($codigo);
        $repuesta=["mensaje"=>$mensaje];
        echo json_encode($repuesta);
    }
    if($_POST["accion"]== "actualizar") {
        $mensajeBorrado="";
        $mensajeGrabado="";

        $codigo=intval($_POST["codigo"]);

        $producto=$entityManager->find(Producto::class, $codigo);

        $nombre=$_POST['nombre'];
        $precio=$_POST["precio"];
        $categoria= $entityManager->getRepository(categorias::class)
        ->findOneBy(["nombre"=>$_POST["categoria"]]);

        $propiedades=$_POST["propiedades"];

        $descripcion=$_POST["descripcion"]??"";

        

        $modeloPropiedades= new ArrayCollection();
        foreach($propiedades as $p){
            $prop=$entityManager->getRepository(Propiedad::class)->findOneBy(["nombre"=>$p]);
            $modeloPropiedades->add($prop);

        }
        $producto->setNombre($nombre);
        $producto->setPrecioDeVenta($precio);
        $producto->setCat($categoria);
        $producto->setDescripcion($descripcion);
        $producto->setConjuntoPropiedades($modeloPropiedades);

        try{
            $entityManager->persist($producto);
            $entityManager->flush($producto);
            $mensajeBorrado=1;
            $mensajeGrabado=1;

        }
        catch(Exception $e){
            $mensajeBorrado=-1;
            $mensajeGrabado=-1;
        }


    //     $mensajeBorrado=controladorProductos::borrarProducto($codigo);
    //    if($mensajeBorrado==1) {
    //         controladorProductos::setProductoAGrabar($_POST);
    //         $mensajeGrabado=controladorProductos::insertarProducto();
    //    }
       $repuesta=json_encode(
        ["mensajeBorrado"=>$mensajeBorrado, 
        "mensajeGrabado"=>isset($mensajeGrabado)
        ?$mensajeGrabado:-3]);
        echo $repuesta;
    }
}
