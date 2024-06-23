<?php
require_once($_SERVER['DOCUMENT_ROOT']."\app\modelo\productos.php");
require_once($_SERVER['DOCUMENT_ROOT']."\app\modelo\propiedades.php");
require_once($_SERVER['DOCUMENT_ROOT']."\app\config\conectioBd.php");
final class buscadorProductos 
{
    private $productosEncontrados = [];

    private $busqueda;

    private $propiedadesBuscar;

    private $conn;


   

    private const mapaPropiedades = [
        1=> "sinTack",
        2=> "Diurectico",
        3=> "AptoDiabetico",
        4=> "bajoSodio",
        5=> "naturales",
    ];

        public function __construct($busqueda,  Propiedades $propiedades = null)
        {
            $this->busqueda = $busqueda;
            

            $this->conn = new mysqli(conectioBD::getServer(),conectioBD::getUser(),conectioBD::getPsw(),conectioBD::getBd());

            if ($propiedades !== null) {
                $this->propiedadesBuscar = $propiedades;
            }
            else{
                $this->propiedadesBuscar = new Propiedades();
            }

        }

        public function getErrorConn() :bool
        {
            if ($this->conn->connect_error) {
                return false;
            }
            return true;
        }

        public function buscar() :bool{
            if($this->getErrorConn()){

                $sqlProductos = 
                    "SELECT `productos`.`ID_PRODUCTO` as id, `productos`.`NOMBRE_PRODUCTO` as nombre,
                     `productos`.`PRECIODEVENTA_PRODUCTO` as precio, 
                     `categorias`.`NOMBRE_CATEGORIA` as categoria, `productos`.`descripcion_producto` as descripcion
                    FROM `productos` 
                        LEFT JOIN `categorias` ON `productos`.`ID_CATEGORIA` = `categorias`.`ID_CATEGORIA`
                    WHERE (`productos`.`ID_PRODUCTO` LIKE '".$this->busqueda."%' OR `productos`.`NOMBRE_PRODUCTO` LIKE '%".$this->busqueda."%');"
                    ;


                $resultadoProductos=$this->conn->query($sqlProductos);
                if($resultadoProductos->num_rows > 0){
                    while($rowProductos = $resultadoProductos->fetch_object()){
                        $sqlpropiedades = 
                        "SELECT propiedades_productos.ID_PROPIEDADES as id, propiedades.NOMBRE_PROPIEDADES as nombre
                        FROM propiedades_productos LEFT JOIN propiedades 
                        ON propiedades_productos.ID_PROPIEDADES = propiedades.ID_PROPIEDADES 
                        WHERE ID_PRODUCTO = ".$rowProductos->id.
                        ";";

                        $resultadosPropiedades=$this->conn->query($sqlpropiedades);
                        $propiedades = new Propiedades();
                        if($resultadosPropiedades->num_rows > 0){
                            while($rowPropiedades = $resultadosPropiedades->fetch_object()){
                                if ($rowPropiedades->nombre == 'aptoDiabetico') {
                                    $propiedades->setAptoDiabetico(true);
                                } elseif ($rowPropiedades->nombre == 'esDiuretico') {
                                    $propiedades->setAptoDiabetico(true);
                                } elseif ($rowPropiedades->nombre == 'sinSodio') {
                                    $propiedades->setSinSodio(true);
                                } elseif ($rowPropiedades->nombre == 'esNatural') {
                                    $propiedades->setEsNatural(true);
                                } elseif ($rowPropiedades->nombre == 'sinTacc') {
                                    $propiedades->setSinTacc(true);
                                }
                            }

                        }


                        $this->productosEncontrados[]=new Producto((int)$rowProductos->id, 
                                                                $rowProductos->nombre,
                                                                (int)$rowProductos->precio,
                                                                $rowProductos->categoria,
                                                                $rowProductos->descripcion==null?""
                                                                :$rowProductos->descripcion,
                                                                $propiedades) ;
                    }

                    return true;
                            
                        

                }
                else{
                    return false;
                }
            }
            else{
                return false;
            }
            }

            public function getProductosEncontrados(){
                return $this->productosEncontrados;
            }
            public function close(){
                $this->conn->close();
            }

            

            function __destruct(){
                
                    $this->close();
            }
                
        
}
