<!-- crear una interfaz similar al prototipo caja 
 https://matias-bacher.atlassian.net/wiki/spaces/FDV/pages/16876149/Prototipo
para ver la pagina entrar a localhost/index.php?p=caja
  -->
  <?php
// Conectar a la base de datos
// $pdo = new PDO('mysql:host=localhost;dbname=tu_basedatos', 'usuario', 'contraseña');

// Obtener productos desde la base de datos
//$query = $pdo->query("SELECT * FROM productos");
//$productos = $query->fetchAll(PDO::FETCH_ASSOC);
?>
    <div class="container">
        <!-- Buscador de Productos -->
        <div class="search-bar">
            <input type="text" id="search" placeholder="Buscar producto...">
        </div>
        
        <!-- Lista de Productos -->
        <div class="product-list">
            <table>
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Producto</th>
                        <th>Categoría</th>
                        <th>Cantidad/Peso</th>
                        <th>Precio Unitario</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody id="productTable">                 
                </tbody>
            </table>
        </div>
        
        <!-- Carrito de Compras -->
        <div class="cart">
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
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody id="cartTable">
                </tbody>
            </table>
            <div class="total">
                <label>Total: $<span id="totalAmount">0.00</span></label>
            </div>
            
            <!-- Métodos de Pago y Botón Cobrar -->
            <div class="payment">
                <select id="paymentMethod">
                    <option value="efectivo">Efectivo</option>
                    <option value="tarjeta_debito">Tarjeta de Débito</option>
                    <option value="tarjeta_credito">Tarjeta de Crédito</option>
                    <option value="qr">QR</option>
                </select>
                <button id="cobrarBtn">Cobrar</button>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <h2>Resumen de Compra</h2>
            <table>
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Precio Unitario</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody id="modalTable">
                </tbody>
            </table>
            <div class="modal-footer">
                <label>Total: $<span id="modalTotal">0.00</span></label>
                <p id="paymentMethodText"></p>
                <p>¿Qué desea hacer?</p>
                <button id="registerBtn">Registrar</button>
                <button id="registerPrintBtn">Registrar e Imprimir</button>
                <button id="cancelBtn">Cancelar</button>
                <button id="closeModalBtn">Cerrar</button>
            </div>
        </div>
    </div>

    <script src="scripts.js"></script>
</html>
