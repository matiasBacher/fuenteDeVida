
            <h1>Listado de Productos</h1>
            <div class="search-bar">
                <input type="text" id="buscarProducto" placeholder="Buscar productos...">
                <select id="orden">
                    <option value="nombre">Ordenar por Nombre</option>
                    <option value="precio">Ordenar por Precio</option>
                    <option value="categoria">Ordenar por Categoría</option>
                    <option value="codigo">Ordenar por Código</option>
                </select>
            </div>

            <!-- ACA COMIENZA EL SWITCH -->
            <div id="filter-box" class="filter-box">
                

                    <div class="comSwitch">
                        <label class="switch">
                            <input type="checkbox" name="caracteristicas[]" id="sinTacc" value="Sin Tacc">
                            <span class="slider round"></span>
                        </label>

                        <div class="textSwitch">Sin Tacc</div>
                    </div>

                    <div class="comSwitch">
                        <label class="switch">
                            <input type="checkbox" name="caracteristicas[]" id="esDiuretico" value="Diuretico">
                            <span class="slider round"></span>
                        </label>

                        <div class="textSwitch">Diuretico</div>
                    </div>

                    <div class="comSwitch">
                        <label class="switch">
                            <input type="checkbox" name="caracteristicas[]" id="aptoDiabetico" value="Apto Diabético">
                            <span class="slider round"></span> 
                        </label>

                        <div class="textSwitch">Apto Diabético</div>
                    </div>

                    <div class="comSwitch">
                        <label class="switch">
                            <input type="checkbox" name="caracteristicas[]" id="sinSodio" value="Bajo Sodio">
                            <span class="slider round"></span> 
                        </label>

                        <div class="textSwitch">Bajo Sodio</div>
                    </div>

                 

                    <div class="comSwitch">
                        <label class="switch">
                            <input type="checkbox" name="caracteristicas[]" id="esNatural" value="Natural">
                            <span class="slider round"></span> 
                        </label>

                        <div class="textSwitch">Natural</div>
                    </div>

                    <!-- <div class="comSwitch">
                        <label class="switch">
                            <input type="checkbox" name="caracteristicas[]" value="En Stock">
                            <span class="slider round"></span> 
                        </label>

                        <div class="textSwitch">En Stock</div>
                    </div>
                 -->
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
            </div>
            <div class="buttons">
                <button class="button" id="openModalProduct">Agregar Producto</button>
                <button class="button" id="openModalCat">Agregar Categoría</button>
            </div>
            <?php require_once($_SERVER['DOCUMENT_ROOT'] .'/app/vista/addCatModal.php');
             require_once($_SERVER['DOCUMENT_ROOT'] .'/app/vista/agregarProductoModal.php');
             modalAgregModif(true);
             modalAgregModif(false);
            ?>
            <script src="publico/js/producto.js"></script>
            <script src="publico/js/addCatModal.js"></script>
            <script src="publico/js/agregarProductoModal.js"></script>
            <script src="publico/js/modificarProductoModal.js"></script>
            <script src="publico/js/sweetalert2.all.min.js"></script>
 

