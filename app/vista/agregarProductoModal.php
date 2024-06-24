<?php function modalAgregModif($modo){
    $letra=$modo?"":"M"?>
<div class="fondoModal" id="<?=$modo?"aProducto":"mProducto"?>">
        <div class="modal-content">        
            <div class="form-container" id="<?=$letra."contenedorAP"?>">  
                <span class="close" id="<?=$letra."closeModalAddProduct"?>">&times;</span>             
                <h1 class="titulo"><?=$modo?"Agregar Producto":"Modificar Producto"?></h1>

                <form id="<?=$letra."productoForm"?>" >
                        <div class="form-group">
                            <label for="<?=$letra."codigo"?>" class="subtitulo">Código: *</label>
                            <input type="text" id="<?=$letra."codigo"?>"  name="codigo" <?=$modo?"":"disabled"?>>
                            <span class="error" id="<?=$letra."codigoError"?>">Espacio vacío</span>
                        </div>

                        <div class="form-group">
                            <label for="nombreProducto" class="subtitulo" >Nombre del Producto: *</label>
                            <input type="text" id="<?=$letra."nombreProducto"?>" name="nombre">
                            <span class="error" id="<?=$letra."nombreProductoError"?>">Espacio vacío</span>
                        </div>
                        <div class="form-group">
                            <label for="categoria" class="subtitulo" >Categorias: *</label>
                            <select id="<?=$letra."categoria"?>" name="categoria">
                            </select>
                            <span class="error" id="<?=$letra."categoriaError"?>">Espacio vacío</span>
                        </div>
                        

                        <div class="form-group">
                            <label class="subtitulo">Propiedades:</label>

                            <!-- ACA COMIENZA EL SWITCH -->
                            <div id="<?=$letra."caracteristicas"?>">

                                <div class="comSwitch">
                                    <label class="switch">
                                        <input type="checkbox" name="sinTacc" value="1">
                                        <span class="slider round"></span>
                                    </label>

                                    <div class="textSwitch">Sin Tacc</div>
                                </div>

                                <div class="comSwitch">
                                    <label class="switch">
                                        <input type="checkbox" name="esDiuretico" value="1">
                                        <span class="slider round"></span>
                                    </label>

                                    <div class="textSwitch">Diuretico</div>
                                </div>

                                <div class="comSwitch">
                                    <label class="switch">
                                        <input type="checkbox" name="aptoDiabetico" value="1">
                                        <span class="slider round"></span> 
                                    </label>

                                    <div class="textSwitch">Apto Diabético</div>
                                </div>

                                <div class="comSwitch">
                                    <label class="switch">
                                        <input type="checkbox" name="sinSodio" value="1">
                                        <span class="slider round"></span> 
                                    </label>

                                    <div class="textSwitch">Bajo Sodio</div>
                                </div>


                                <div class="comSwitch">
                                    <label class="switch">
                                        <input type="checkbox" name="esNatural" value="1">
                                        <span class="slider round"></span> 
                                    </label>

                                    <div class="textSwitch">Natural</div>
                                </div>
                            </div>
                        </div>
                        <!-- ACA TERMINA EL SWITCH -->
                        <div class="form-group">
                            <label for="descripcionProducto" class="subtitulo" >Descripción del Producto:</label>
                            <textarea id="<?=$letra."descripcionProducto"?>" name="descripcion"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="precio" class="subtitulo" >Precio: *</label>
                            <div class="price-input">
                                <span>$</span>
                                <input type="text" id="<?=$letra."precio"?>" name="precio">
                            </div>
                            <span class="error" id="<?=$letra."precioError"?>">Espacio vacío</span>
                        </div>
                        <div class="form-group">
                            <button id="<?=$letra."modalAgregProdEnviar"?>" type="button" class="button"><?=$modo?"Agregar producto":"Modificar produto"?></button>
                        </div>
                </form>
            </div>
        </div>    
    </div> 
<?php } ?>