<?php


require_once($_SERVER['DOCUMENT_ROOT']."/bootstrap.php");
require_once($_SERVER['DOCUMENT_ROOT']."/app/modelo/Lote.php");

use modelo\Lote;
use modelo\Proveedor;
use modelo\Producto;

class ControladorLoteClass{
    private string $accion;
    private stdClass $objeto;

    private array $resultado;
    function __construct(string $accion, stdClass $objeto){
        $this->accion=$accion;
        $this->objeto=$objeto;
    }

    public function hacer(){
      $this->resultado=call_user_func([$this, $this->accion]);
    }
    public function getResultados(){
        return $this->resultado;
    }

    public function ComprobarSiLoteRepetido():bool{
        global $entityManager;
        $idProducto = $this->objeto->producto->codigo;
        $idProveedor = $this->objeto->proveedor->id;
        $fechaIngreso = new DateTime($this->objeto->ingreso??"now");
        $fechaVencimiento= new DateTime($this->objeto->vencimiento);

        $objetoEncontrado=$entityManager->getRepository(Lote::class)
                            ->findOneBy(
                                ["producto"=>$idProducto,
                                "proveedor"=>$idProveedor,
                                "ingreso"=>$fechaIngreso,
                                "vencimiento"=>$fechaVencimiento]);
        if($objetoEncontrado) return true;
        else return false;
    }

    private function alta(){
        $mensaje = "";

        if($this->ComprobarSiLoteRepetido()) $mensaje="loteRepetido";
        else{
            global $entityManager;
            $error="";
            $producto = $entityManager->find(Producto::class, $this->objeto->producto->codigo);
            $proveedor =$entityManager->find(Proveedor::class, $this->objeto->proveedor->id);
            $fechaIngreso = new DateTime($this->objeto->ingreso??"now");
            $fechaVencimiento= new DateTime($this->objeto->vencimiento);
            $cantidad= $this->objeto->cantidad;

            $lote = new Lote($producto,$fechaVencimiento,$cantidad,$fechaIngreso, $proveedor);
            try{
                $entityManager->persist($lote);
                $entityManager->flush();
                $mensaje="altaExito";
            }
            catch (Exception $e){
                $mensaje="errorAlta";
                $error=$e->getMessage();
            }
            return[
                "mensaje"=>$mensaje,
                "error"=>$error,
            ];
        }
        }

            private function consulta(){
                global $entityManager;
                $filtro = is_array($this->objeto->filtros)?
                    $this->objeto->filtros:
                    get_object_vars($this->objeto->filtros);


                $busqueda=$filtro['busqueda'];



                $ordenProducto=$this->objeto->orden->ordenProductos ;
                $ordenLotes=$this->objeto->orden->ordenLotes;

                $mensaje="";
                $productos=$entityManager->getRepository(Producto::class)
                ->createQueryBuilder("p")
                ->innerJoin(Lote::class, "l")
                ->where(is_numeric($busqueda)?
                "p.codigo = :busqueda":"p.nombre like :busqueda")

                ->andWhere("l.vencimiento <= :venMax")
                ->andWhere("l.vencimiento >= :venMin")

                ->andWhere("l.ingreso <= :ingMax")
                ->andWhere("l.ingreso >= :ingMin")
                
                ->orderBy("p.$ordenProducto","asc")
                ->addOrderBy("l.$ordenLotes")

                ->setParameters($filtro
                    )

                ->getQuery()
                ->getResult();

                if(count($productos)<=0){
                    $mensaje="busquedaNoExitosa";
                }
                else{
                    $mensaje="busquedaExitosa";
                }


                return [
                    "mensaje"=>$mensaje,
                    "resultadoBusqueda"=>$productos
                ];


                
            }

            public function modificar(){
                global $entityManager;

                $mensaje="";
                $error="";

                if($this->ComprobarSiLoteRepetido()){
                    $mensaje="loteRepetido";
                }
                else{

                    $id=$this->objeto->id;

                    $lote= $entityManager->find(Lote::class, $id);

                    $producto = $entityManager->find(Producto::class, $this->objeto->producto->codigo);
                    $proveedor =$entityManager->find(Proveedor::class, $this->objeto->proveedor->id);
                    $fechaIngreso = new DateTime($this->objeto->ingreso??"now");
                    $fechaVencimiento= new DateTime($this->objeto->vencimiento);
                    $cantidad= $this->objeto->cantidad;

                    $lote->setProducto($producto);
                    $lote->setCantidad($cantidad);
                    $lote->setProveedor($proveedor);
                    $lote->setVencimiento($fechaVencimiento);
                    $lote->setCantidad($cantidad);

                    try{
                        $entityManager->persist($lote);
                        $entityManager->flush();
                        $mensaje="altaModificacion";
                    }
                    catch (Exception $e){
                        $mensaje="errorModificacion";
                        $error=$e->getMessage();
                    }
                    return[
                        "mensaje"=>$mensaje,
                        "error"=>$error,
                    ];


                }

            }


            public function borrar(){
                global $entityManager;
                $retorno=[
                    "mensaje"=>"",
                    "error"=>""
                ];

                try {
                    $lote = $entityManager->find(Lote::class, $this->objeto->codigo);
                    if($lote==null){
                        $retorno["mensaje"]="errorLoteNulo";
                        return $retorno;
                    }
                }
                catch(Exception $e){ 

                    $retorno["mensaje"]="errorBusqueda";
                    $retorno["error" ]=$e->getMessage();
                    return $retorno;

                 }
                 try{
                    $entityManager->remove($lote);
                 }
                 catch(Exception $e){

                    $retorno["mensaje"]="errorBorrado";
                    $retorno["error" ]=$e->getMessage();
                    return $retorno;
                 }
                 $retorno['mensaje']="exitoBorrado";
                 return $retorno;




            }

            




    }
