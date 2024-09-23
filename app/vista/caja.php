<body>

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
                    <th>Categoría</th>
                    <th>Cantidad/Peso</th>
                    <th>Cantidad</th>
                    <th>Total</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody id="listaCarrito"></tbody>
        </table>
        <label class="totalCarrito">Total: $<span id="totalCarrito">0.00</span></label>
    </div>

    <!-- Método de pago -->
    <div class="metodo-pago">
        <div class= "mdp"> <p> Medio de pago: </p></div>
            <select id="orden">       
                <option value="Efectivo">Efectivo</option>
                <option value="Tarjeta de Débito">Tarjeta de Débito</option>
                <option value="Tarjeta de Crédito">Tarjeta de Crédito</option>
                <option value="QR">QR</option>
            </select>
        <button class="cobrar">Cobrar</button>
    </div>
</div>

<!-- Modal para resumen de compra -->
 <div class="fondoModal">
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

<script type="module" src="publico/js/caja/caja.js"></script>
</body>
