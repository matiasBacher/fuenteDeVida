<?php 

use modelo\Proveedor;
include_once($_SERVER['DOCUMENT_ROOT']."/app/vista/componentes/swich.php");
require_once($_SERVER['DOCUMENT_ROOT']."/bootstrap.php");

$proveedores=$entityManager->getRepository(Proveedor::class)->findAll();

?>
<script type="module" src="publico/js/componente/contenedorCuadroProductoLotes.js"></script>
<h1>Filtrar Productos</h1>
    <div class="filter-product">
        <input type="text" placeholder="Buscar producto..." class="search-box" id="buscador">
        <select name="order-product" class="select-box" id="selectFiltroProductos">
            <option value="nombre">Ordenar por Nombre</option>
            <option value="precio">Ordenar por Precio</option>
            <option value="categoria">Ordenar por Categoría</option>
            <option value="codigo">Ordenar por Código</option>
        </select>
    </div>

    <!-- Filtro de lotes -->
     <div class="filtroDeLotes">
        <h1>Filtrar Lotes</h1>    
        <div class="filter-lotes">
            <select id="selectFiltroLotes" name="order-lotes" class="select-box" >
                <option value="id">Ordenar por Codigo</option>
                <option value="vencimiento">Ordenar por Fecha Vencimiento</option>
                <option value="codigo">Ordenar por Fecha Ingreso</option>
            </select>
        <?php swich("vencido","1","Vencidos" ) ?>
        </div>

        <!-- Ingreso y Vencimiento -->
        <div class="date-filters">

            <!-- Cuadro de Ingreso -->
            <div class="date-box">
                <h2>Ingreso</h2>
                <label for="ingreso-desde">Desde</label>
                <input type="date" id="ingreso-desde" name="ingreso-desde" 
                value="<?=date("Y-m-d", strtotime("-1 month"))?>"
                max="<?=date("Y-m-d", strtotime("-1 month"))?>">
                <label for="ingreso-hasta">Hasta</label>
                <input type="date" id="ingreso-hasta" name="ingreso-hasta" 
                value="<?=date("Y-m-d")?>" 
                max="<?=date("Y-m-d")?>">
            </div>

            <!-- Cuadro de Vencimiento -->
            <div class="date-box">
                <h2>Vencimiento</h2>
                <label for="vencimiento-desde">Desde</label>
                <input type="date" id="vencimiento-desde" name="vencimiento-desde">
                <label for="vencimiento-hasta">Hasta</label>
                <input type="date" id="vencimiento-hasta" name="vencimiento-hasta" >
            </div>
        </div>
    </div>


    <contenedor-cuadro-productos-lotes></contenedor-cuadro-productos-lotes>
    
<!-- Modal -->
<div class="fondoModal modal"  id="modalAgregMod">

    <div class="modal-content">
        <span class="close" id="closeModalConsultarVenta">&times;</span>

        
        <!-- Proveedor -->
        <div class="input-group">
            <label for="proveedor">Proveedor</label>
            <select id="proveedor">
                <?php 
                    foreach($proveedores as $proveedor):?>
                    <option value="<?=$proveedor->getId()?>">
                        <?=$proveedor->getRazonSocial()?>
                    </option>
                    <?php endforeach ;?>
            </select>
        </div>

        <!-- Cantidad -->
        <div class="input-group">
            <label for="cantidad">Cantidad</label>
            <input type="number" id="cantidad" min="1" value="1">
        </div>

        <!-- Vencimiento -->
        <div class="input-group">
            <label for="vencimiento">Vencimiento</label>
            <input type="date" id="vencimiento" name="vencimiento" format="Y-m-d">
        </div>

        <!-- Ingreso -->
        <div class="input-group">
            <label for="ingreso">Ingreso</label>
            <input type="date" id="ingreso" name="ingreso" format="Y-m-d">
        </div>


        <!-- Código del Lote -->
        <div class="input-group">
            <label for="codigo-lote">Código del Lote</label>
            <input type="text" id="codigo-lote" value="00000003" disabled>
        </div>

        <!-- producto -->
         <div class="input-group">
            <div id="codigoProductoModAgr">
                <span class="etiquetaProducto">Nombre Producto:</span>
                <span class="contProd"></span>
            </div>
            <div id="nombreProdutoModAgr">
                <span class="etiquetaProducto">Nombre Producto:</span>
                <span class="contProd"></span>
            </div>

        </div>

        <!-- Botones -->
        <div class="modal-footer">
            <button class="button">Agregar</button>
           
        </div>
    </div>
</div>

<script type="module" src="publico/js/lotes/lotes.js"></script>