<?php
use  modelo\MedioPago;

$arrayMedioPagos = $entityManager->getRepository(entityName: MedioPago::class)->findAll();
?>
<div class="container">
    <!-- Buscador de productos -->
    <div class="search-bar">
        <form class="form" method="POST" action="">
            <input type="text" name="producto" id="buscador" placeholder="Buscar producto..." required>
            <button class="button" name="allProduct">Buscar</button>
        </form>
    </div>

    <!-- Mostrar productos encontrados -->
    <div class="product-list">
        <h2>Productos</h2>
        <table id="tablaDeCaja">
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Producto</th>
                    <th>Categoría</th>                    
                    <th>Precio Unitario</th>
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

    <!-- Carrito -->
     <div class="carrito-list">
        <h2>Carrito</h2>
        <table>
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Producto</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                    <th>Total</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody id="listaCarrito"></tbody>
        </table>
        <label class="totalCarrito">Total: $<span id="totalCarrito" class="total">0.00</span></label>
    </div>

    <!-- Método de pago -->
    <div class="metodo-pago">
        <div class= "mdp"> <p> Medio de pago: </p></div>
            <select id="orden">
            <?php foreach($arrayMedioPagos as $medioPago):?>       
                <option value='<?=
                "[{$medioPago->getId()},\"{$medioPago->getNombre()}\"]"
                ?>'>
                    <?=$medioPago->getNombre()?>
                </option>
            <?php endforeach;?>
            </select>
        <button id="<?=!isset($modicarActivado)?"cobrar":"registrarModificacion"?>" class="button">
            <?=!isset($modicarActivado)?"Cobrar":"registrar"?>
        </button>
    </div>
</div>
<?php
if(!isset($modicarActivado)):?>
<!-- Modal para resumen de compra -->
 <div class="fondoModal" id="resumenVenta">
    <div class="modal-content" id="modal-resumen">
        <div class="modal-list">
            <h2>Resumen de la Compra</h2>
            <table>
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Precio Unitario</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody id="resumen-compra"></tbody>
            </table>
            <div>
                <p>Total: $<span id="resumen-total"></span></p>
                <p> Medio de pago: <span id="resumen-metodo-pago"></span></p>
            </div>
            <div class="acciones">
                <button class= "button" id="registrar">Registrar</button>
                <button class= "button" id="registrar-imprimir">Registrar e Imprimir</button>
                <button class= "button" id="cancelar">Cancelar</button>
            </div>
        </div>
    </div>
</div>
<?php endif?>

<script type="module" src="publico/js/caja/caja.js"></script>
</body>
