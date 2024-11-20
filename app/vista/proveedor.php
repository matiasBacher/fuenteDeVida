<body>
    <!-- Header -->
    <header>
        <div>
            <h3>Buscar Producto</h3>
            <input type="text" placeholder="Buscar producto...">
        </div>
        <div>
            <h3>Buscar Proveedor</h3>
            <input type="text" placeholder="Buscar proveedor...">
        </div>
        <div>
            <h3>Proveedor</h3>
            <label for="order-provider">Ordenar por:</label>
            <select id="order-provider">
                <option value="nombre">Nombre</option>
                <option value="localidad">Localidad</option>
            </select>
        </div>
    </header>

    <!-- Listado de Proveedores -->
    <section>
        <h2>Listado de Proveedores</h2>
        <div class="card">
            <div class="row">
                <div><strong>Denominación:</strong> Pepito SRL</div>
                <div><strong>CUIT:</strong> 20482419728</div>
            </div>
            <div class="row">
                <div><strong>Dirección:</strong> Calle Siempre Vivas</div>
                <div><strong>Provincia:</strong> Buenos Aires</div>
                <div><strong>Localidad:</strong> Pilar</div>
            </div>
            <div class="buttons">
                <button>Modificar</button>
                <button>Eliminar</button>
            </div>
        </div>

        <!-- Productos -->
        <h2>Productos</h2>
        <div>
            <label for="order-product">Ordenar por:</label>
            <select id="order-product">
                <option value="codigo">Código</option>
                <option value="nombre">Nombre</option>
                <option value="precio">Precio</option>
            </select>
            <button>Agregar producto</button>
            <button>Modificar precio por porcentaje</button>
            <button>Eliminar producto seleccionado</button>
        </div>
        <table>
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Categoría</th>
                    <th>Precio de Contado</th>
                    <th>Precio Cta. Cte.</th>
                    <th>Descripción</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>000000001</td>
                    <td>Castañas</td>
                    <td>Edulcorante</td>
                    <td>$1300</td>
                    <td>$1500</td>
                    <td>----------</td>
                    <td class="action-buttons">
                        <button>Modificar</button>
                        <button>Eliminar</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </section>
</body>