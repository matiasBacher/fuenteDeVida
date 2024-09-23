<?php 
require_once($_SERVER['DOCUMENT_ROOT']."/app/modelo/Producto.php");
use modelo\Producto;
require_once($_SERVER["DOCUMENT_ROOT"]."/app/config/conectioBD.php");
final class insertarProducto
{
private Producto $producto;
private int $idCategoria;
private $arrayIdPropiedades;
private mysqli $conn;
private $exito = false;

public function __construct(Producto $producto){
    $this->producto = $producto;
    if(!$this->hacerConeccion()){
        echo'<script>alert("coneccion fallida")</script>';
    }
    if(!$producto->getCategoria()==0){
        $this->idCategoria=$this->buscarIDCategoria();
        }
    $this->arrayIdPropiedades=$this->buscarIDPropiedades();
        
        
        }

private function hacerConeccion():bool{
    try
    {
        $this->conn =  new mysqli(conectioBD::getServer(),conectioBD::getUser(),conectioBD::getPsw(),conectioBD::getBd()); 
        return true;
    }
    catch(exception $e){
        return false;
    }
}
function buscarIDCategoria():int{
    $sql = 
    "SELECT id_categoria as id
    FROM categorias
    WHERE nombre_categoria='{$this->producto->getCategoria()}'";

    $resultado = $this->conn->query($sql)->fetch_object();
    return $resultado->id;

}
function buscarIDPropiedades():Array{
    $arrayPropiedades = array_keys(json_decode(json_encode($this->producto->getPropiedades()),true),true);
    for ($i=0; $i<count($arrayPropiedades); $i++) {
        $arrayPropiedades[$i]= "'".$arrayPropiedades[$i]."'";
    }
    $stringPropiedades = implode(", ",$arrayPropiedades);
    $sql = 
    "SELECT id_propiedades as id
    FROM propiedades
    WHERE nombre_propiedades IN ({$stringPropiedades})";

    $arrayId = [];
    $resultado = $this->conn->query($sql);
    if ($resultado) {
        while ($fila = $resultado->fetch_object()) {
            $arrayId[] = $fila->id;
        }
    }
    
    return $arrayId;
}

function insertarPropiedades(){
    try{
    foreach ($this->arrayIdPropiedades as $i) {
        $sql ="INSERT INTO propiedades_productos(id_propiedades, id_producto) VALUES ('{$i}' ,'{$this->producto->getCodigo()}')";
        $this->conn->query($sql);
    }
    return true;
    }
    catch(exception $e){
        return false;
    }

}


function validarSiCodigoEstaDisponible(){
    try{
        if($this->conn->query("SELECT id_producto FROM productos WHERE id_producto='{$this->producto->getCodigo()}'")->num_rows<= 0){
            return true;
        }
        else{
            return false;
        }
    }
    catch(exception $e){
        echo $e->getMessage();
}
}

function grabarProducto(){
        if ($this->validarSiCodigoEstaDisponible()) {
            $sql =
                "INSERT INTO `productos`(`ID_PRODUCTO`,`NOMBRE_PRODUCTO`,`ID_CATEGORIA`,`PRECIODEVENTA_PRODUCTO`, `descripcion_producto`) 
                VALUES('{$this->producto->getCodigo()}','{$this->producto->getNombre()}',{$this->idCategoria},{$this->producto->getPrecioDeVenta()},'{$this->producto->getDescripcion()}')";
            if (!$this->conn->query($sql)) {
                return -1;
            }
            ;
            $this->insertarPropiedades();
            $this->exito = true;
            return 1;
        } else {
            return 0;
        }


    }
    public function eliminarRelaciones(){
        $sql="DELETE FROM propiedades_productos
        WHERE ID_PRODUCTO='{$this->producto->getCodigo()}' ";
        if( $this->conn->query($sql) ) {
            return true;
        }
        else {
            return false;
        }
    }
    public function borrarProducto(){
        $sql=
        "DELETE FROM productos
        WHERE ID_PRODUCTO='{$this->producto->getCodigo()}' ";
        if($this->eliminarRelaciones()) {
            if( $this->conn->query($sql) ) {
                return 1;
            }
            else { 
                return 0;
            }
        }
        else {
            return -1;  
        }

    }
}