<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Producto</title>
    <link rel="stylesheet" href="agregarproducto.css">
</head>
<body>
    <div class="form-container">
        <h1>Agregar Producto</h1>
        <form id="productoForm"   >
            <div class="form-group">
                <label for="nombreProducto" class="subtitulo" >Nombre del Producto: *</label>
                <input type="text" id="nombreProducto" name="nombreProducto">
                <span class="error" id="nombreProductoError">Espacio vacío</span>
            </div>
            <div class="form-group">
                <label for="categoria" class="subtitulo" >Categoría: *</label>
                <select id="categoria" name="categoria">
                    <option value="">Seleccione una categoría</option>
                    <option value="Alimentos">Alimentos</option>
                    <option value="Bebidas">Bebidas</option>
                    <option value="Cuidado Personal">Cuidado Personal</option>
                </select>
                <span class="error" id="categoriaError">Espacio vacío</span>
            </div>
            <div class="form-group">
                <label for="codigo" class="subtitulo">Código: *</label>
                <input type="text" id="codigo" name="codigo">
                <span class="error" id="codigoError">Espacio vacío</span>
            </div>
            <div class="form-group">
                <label class="subtitulo">Características:</label>
                <div id="caracteristicas">
                    <label class="switch">
                        <input type="checkbox" name="caracteristicas[]" value="Sin Tacc">
                        <span class="slider round"></span> Sin Tacc
                    </label>
                    <label class="switch">
                        <input type="checkbox" name="caracteristicas[]" value="Diuretico">
                        <span class="slider round"></span> Diurético
                    </label>
                    <label class="switch">
                        <input type="checkbox" name="caracteristicas[]" value="Apto Diabetico">
                        <span class="slider round"></span> Apto Diabético
                    </label>
                    <label class="switch">
                        <input type="checkbox" name="caracteristicas[]" value="Bajo Sodio">
                        <span class="slider round"></span> Bajo Sodio
                    </label>
                    <label class="switch">
                        <input type="checkbox" name="caracteristicas[]" value="Natural">
                        <span class="slider round"></span> Natural
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="descripcionProducto" class="subtitulo" >Descripción del Producto:</label>
                <textarea id="descripcionProducto" name="descripcionProducto"></textarea>
            </div>
            <div class="form-group">
                <label for="precio" class="subtitulo" >Precio: *</label>
                <div class="price-input">
                    <span>$</span>
                    <input type="text" id="precio" name="precio">
                </div>
                <span class="error" id="precioError">Espacio vacío</span>
            </div>
            <div class="form-group">
                <button id="">Agregar producto</button>
            </div>
        </form>
    </div>
    <script src="agregarproducto.js"></script>
</body>
</html>
