<?php 
use modelo\categorias;
require_once($_SERVER['DOCUMENT_ROOT']."\app\config\conectioBd.php");
require_once($_SERVER['DOCUMENT_ROOT']."/app/modelo/categorias.php");
  class categoriasBD {

    private $conn;
    private categorias $buscar;
    private $categoriaEncontrada=[];

    public function __construct(categorias $buscar) {
        $this->buscar = $buscar;
        $this->conn = new mysqli(conectioBD::getServer(),conectioBD::getUser(),conectioBD::getPsw(),conectioBD::getBd());
    }
    public function insertar(){
        $sql=
        "INSERT INTO categorias(NOMBRE_CATEGORIA) VALUE('{$this->buscar->getNom()}')";
        if($this->comprobarNoRepetido())
            return $this->conn->query($sql)?1:0;
        else{
            return -1;
        }


    }
    public function buscarTodasCategorias(){

        $sql= 
        "SELECT c.ID_CATEGORIA as id, c.NOMBRE_CATEGORIA AS nombre
        FROM categorias c
        WHERE c.ID_CATEGORIA>1";
        $resultados = $this->conn->query($sql);
        $this->categoriaEncontrada=[];
        if($resultados->num_rows > 0){
            while($fila = $resultados->fetch_assoc()){
                $filaObjeto=new categorias($fila["id"],$fila["nombre"]) ;
                $this->categoriaEncontrada[]=$filaObjeto;
            }

        }
    }
    public function getCategoriaEncontrada(){
        return $this->categoriaEncontrada;
    }

    public function buscarPorId(){
        $sql="SELECT ID_CATEGORIA as id, NOMBRE_CATEGORIA AS categoria
        FROM categorias 
        WHERE ID_CATEGORIA='{$this->buscar->getId()}'";
        $resultado = $this->conn->query($sql);
        if($resultado->num_rows > 0){
            $r= $resultado->fetch_assoc();
            $this->categoriaEncontrada[]=new categorias($r["id"],$r['nombre']);
           }
           else{
               return;
           }
    }
    public function actualizarProductos(){
        $sql= 
        "UPDATE productos p
        SET p.ID_CATEGORIA = 1
        WHERE p.ID_CATEGORIA='{$this->buscar->getId()}'";

        $resultado = $this->conn->query($sql);
        return false!=$resultado;
    }
    public function comprobarNoRepetido(){
        $this->buscarPorNombre();
        return count($this->categoriaEncontrada)<1;
    }
    public function buscarPorNombre(){

        $sql="SELECT ID_CATEGORIA as id, NOMBRE_CATEGORIA AS nombre
        FROM categorias 
        WHERE NOMBRE_CATEGORIA='{$this->buscar->getNom()}'";
        $resultado = $this->conn->query($sql);
        if($resultado->num_rows > 0){
        $r= $resultado->fetch_assoc();
        $this->categoriaEncontrada[]=new categorias($r["id"],$r['nombre']);
        }
        else{
            return;
        }
    }
    public function eliminarCategorias(){
        $sql=
        "DELETE FROM categorias 
        WHERE ID_CATEGORIA={$this->buscar->getId()}";
        if($this->actualizarProductos()){
            $resultado = $this->conn->query($sql);
            return false!=$resultado?1:0;
        }
        else {
            return -1;
        }
    
    }
    public function actualizarCategoria(){

        $sql=
        "UPDATE categorias
        SET NOMBRE_CATEGORIA = '{$this->buscar->getNom()}'
        WHERE ID_CATEGORIA = {$this->buscar->getId()}";

        if($this->comprobarNoRepetido())
            return $this->conn->query($sql)?1:0;
        else{
            return -1;
        }

    }




}
?>