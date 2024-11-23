<?php

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Criteria;
use FontLib\TrueType\Collection;
use modelo\ModificacionVencimiento;



require_once($_SERVER['DOCUMENT_ROOT']."/bootstrap.php");
require_once($_SERVER['DOCUMENT_ROOT']."/app/modelo/Lote.php");

use modelo\Lote as Lote;
use modelo\Proveedor as Proveedor;
use modelo\Producto as Producto;

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

    static function actualizarVencimientoTodosLotes(){
        global $entityManager;
        $hoy= new DateTime();
        $ultimaFecha=$entityManager->getRepository(ModificacionVencimiento::class)->findOneBy([], ["fecha"=>"DESC"]);
        if($hoy->format("Y-m-d")>$ultimaFecha->getFecha()->format("Y-m-d")){
            $diasMargen=Lote::$diasVencimiento;
            $nuevaModificacion= new ModificacionVencimiento();
            $lotes=$entityManager->getRepository(Lote::class)->createQueryBuilder("l")
            ->where("l.vencimiento BETWEEN :fechaInicio AND :fechaFin")
            ->setParameters(
                [
                    "fechaFin"=>(clone ($hoy))->modify("+{$diasMargen} days"),
                    "fechaInicio"=>isset($ultimaFecha)
                                        ?(clone ($ultimaFecha->getFecha()))->modify("-{$diasMargen} days")
                                        :new DateTime("1970-01-02"),
                ]
            )
            ->getQuery()
            ->getResult();

            foreach($lotes as $lote){
                $lote->comprobarVencimiento();
                $entityManager->persist($lote);
            }
            try{
                $entityManager->persist($nuevaModificacion);
                $entityManager->flush();
            }
            catch(Exception $e){
                throw $e;
            }
        }
    }
    public function ComprobarSiLoteRepetido($modoModificar = false):bool{
        global $entityManager;
        $idProducto = $this->objeto->producto->codigo;
        $idProveedor = $this->objeto->proveedor->id;
        $fechaIngreso = new DateTime($this->objeto->ingreso??"now");
        $fechaVencimiento= new DateTime($this->objeto->vencimiento);

        $criterios = ["producto"=>$idProducto,
                    "proveedor"=>$idProveedor,
                    "ingreso"=>$fechaIngreso,
                    "vencimiento"=>$fechaVencimiento];

        if($modoModificar){
            $criterios["cantidad"]=$this->objeto->cantidad;
        }

        $objetoEncontrado=$entityManager->getRepository(Lote::class)
                            ->findOneBy($criterios
                                );
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
              

          


                $busqueda=$this->objeto->busqueda;
                $busqueda=is_numeric($busqueda)?$busqueda:"%{$busqueda}%";

                  $filtro = [
                            "busqueda"=>$busqueda,
                            "venMin"=>$this->objeto->venMin,
                            "ingMin"=>$this->objeto->ingMin,
                            "ingMax"=>$this->objeto->ingMax,

                ];
                if(isset($this->objeto->venMax)){
                    $filtro["venMax"]=$this->objeto->venMax;
                }



                $ordenProducto=$this->objeto->ordenProductos ;
                $ordenLotes=$this->objeto->ordenLotes;

                $mensaje="";
                $productos=$entityManager->getRepository(Producto::class)
                ->createQueryBuilder("p")
                ->where(is_numeric($busqueda)?"p.codigo = :n":"p.nombre LIKE :n")
                ->setParameter("n", $busqueda)
                ->getQuery()
                ->getResult();



                

                if(count($productos)<=0){
                    $mensaje="busquedaNoExitosa";
                }
                else{
                    $mensaje="busquedaExitosa";
                }

          

                      


                foreach($productos as $p){
                    
                    
                    $lotes = $p->getLotes()->filter(function($x) use ($filtro){
                        return (
                            ($x->getCantidad()>0)
                            and ($x->getVencimiento() >= new DateTime($filtro['venMin'])) 
                            and (isset($filtro["venMax"])
                                    ?($x->getVencimiento() <= new DateTime($filtro['venMax']))
                                    :true) 
                            and ($x->getIngreso() >= new DateTime($filtro['ingMin']))
                            and ($x->getIngreso() <= new DateTime($filtro['ingMax']))


                        );
                    }
                    );
                    $arrayOrd = $lotes->toArray();
                    usort($arrayOrd,function($a,$b) use ($ordenLotes){
                        
                        switch($ordenLotes){
                         
                            case "vencimiento":
                                $ComparadorA=$a->getVencimiento();
                                $ComparadorB=$b->getVencimiento();
                                break;
                            case "ingreso":
                                $ComparadorA=$a->getIngreso();
                                $ComparadorB=$b->getIngreso();
                                break;
                            default:
                                $ComparadorA=$a->getId();
                                $ComparadorB=$b->getId();
                                break;
                            }
                            return $ComparadorA==$ComparadorB?0
                                :($ComparadorA>$ComparadorB?1:-1);
                        }
                    );

                    $p->setLotes(new ArrayCollection($arrayOrd));
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

                if($this->ComprobarSiLoteRepetido(true)){
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
                        $mensaje="modificacionExito";
                    }
                    catch (Exception $e){
                        $mensaje="errorModificacion";
                        $error=$e->getMessage();
                    }
                


                }
                return[
                    "mensaje"=>$mensaje,
                    "error"=>$error,
                ];

            }


            public function borrar(){
                global $entityManager;
                $retorno=[
                    "mensaje"=>"",
                    "error"=>""
                ];

                try {
                    $lote = $entityManager->find(Lote::class, $this->objeto->id);
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
                    $entityManager->flush();
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
