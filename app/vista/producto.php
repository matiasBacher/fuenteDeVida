<?php require_once($_SERVER['DOCUMENT_ROOT']."/app/vista/componentes/swichPropiedades.php");?>
            <h1>Listado de Productos</h1>
            <div class="search-bar">
                <input type="text" id="buscarProducto" placeholder="Buscar productos...">
                <select id="orden">
                    <option value="nombre">Ordenar por Nombre</option>
                    <option value="precio">Ordenar por Precio</option>
                    <option value="categoria">Ordenar por Categoría</option>
                    <option value="codigo">Ordenar por Código</option>
                </select>
                <button class="button" id="allProduct">Buscar Todos</button>
            </div>

            <!-- ACA COMIENZA EL SWITCH -->
            <div id="filter-box" class="filter-box">
                

                   <?php swichPropiedad()?>

                 

            </div>      
            <!-- ACA TERMINA EL SWITCH -->


            <div class="product-list">
                <table>
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Nombre del Producto</th>
                            <th>Categoría</th>
                            <th>Descripción</th>
                            <th>Propiedades</th>
                            <th>Precio</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="product-table">
                        <!-- Aquí se pueden añadir filas con productos -->
                        <tr>
                            <td colspan="7">Escriba algo en buscador</td>
                         
                        </tr>
                    </tbody>
                </table>
                <div id="contenedorNPro"><span>Productos encontrados: </span><span id="nProducto">0</span>
            </div>
            <div class="buttons">
                <button class="button" id="openModalProduct">Agregar Producto</button>
                <button class="button" id="openModalCat">Agregar Categoría</button>
            </div>
            
            <div class="buttons"> <button class="button" id="openPDF"><?php include($_SERVER['DOCUMENT_ROOT'].'/publico/img/iconos/file-pdf.svg') ?> Descargar Listado de todos los productos</button> </div>

            <?php require_once($_SERVER['DOCUMENT_ROOT'] .'/app/vista/addCatModal.php');
             require_once($_SERVER['DOCUMENT_ROOT'] .'/app/vista/agregarProductoModal.php');
             modalAgregModif(true);
             modalAgregModif(false);
            ?>
            <script type="module" src="publico/js/producto/producto.js"></script>
            <script type="module" src="publico/js/producto/addCatModal.js"></script>
            <script type="module" src="publico/js/producto/agregarProductoModal.js"></script>
            <script type="module" src="publico/js/producto/modificarProductoModal.js"></script>
 

