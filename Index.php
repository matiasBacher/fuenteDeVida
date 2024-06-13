<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Productos</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
    rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="wrapper">
        <div class="menu">            
             <a class="top" href="#">Proveedores</a>
             <a class="top" href="#">Inventario</a>
             <a class="top" href="#">Productos</a>
             <a class="top" href="#">Pedidos</a>
             <a class="top" href="#">Ventas</a>
             <a class="top" href="#">Caja</a>
             <a class="top" href="#">Devoluciones</a>
             <a class="top" href="#">Cliente</a>            
        </div>

        <div class="container">
            <h1>Listado de Productos</h1>
            <div class="search-bar">
                <div class="dropdown">
                   

                    <select id="orden" class="form-select" aria-label="Default select example">
                    <option selected>Ordenar por</option>
                    <option value="precio">precio</option>
                    <option value="nombre">nombre</option>
                    <option value="categoria">categoria</option>
                    <option value="codigo">codigo</option>

                    </select>


                </div>
                <div>
                    <input id="buscarProducto" class="shearch" type="text" placeholder="Buscar...">
                </div>
            </div>
            <div class="filter-box" id="filter-box">
                <label><input type="checkbox" name="sinTacc" id="sinTacc"> Sin TACC</label>
                <label><input type="checkbox" name="esDiuretico" id="esDiuretico" > Diurético</label>
                <label><input type="checkbox" name="aptoDiabetico" id="aptoDiabetico"> Apto Diabético</label>
                <label><input type="checkbox" name="sinSodio" id="sinSodio" > Bajo Sodio</label>
                <label><input type="checkbox" name="esNatural" id="esNatural"> Naturales</label>
                <label><input type="checkbox" name="en_stock" id="en_stock"> En Stock</label>
            </div>
            <div id="tabla" class="product-list" >
                <table class="table table-striped table-sm">
                    <thead class="table-dark">
                        <tr>
                            <th>Código</th>
                            <th>Nombre del Producto</th>
                            <th>Categoría</th>
                            <th>Descripción</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">

                    </tbody>
                </table>
            </div>
            <div>
                <button class="button">Nuevo Producto</button>
                <button class="button">Nueva Categoría</button>
                <button class="button">Nuevo Atributo</button>
            </div>
        </div>
    </div>
        <script src="publico/js/buscar.js"></script>
</body>
</html>
<?php 
require_once("app/BD/insertarProducto.php");
$p= new Producto(89,"fideos", 900, 'condimentos',new Propiedades(true,false,true) );
$t = new insertarProducto($p);
$t->validarSiCodigoEstaDisponible() ;
$t->grabarProducto() ;
echo'hola';