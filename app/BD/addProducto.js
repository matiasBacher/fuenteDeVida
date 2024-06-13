document.getElementById('productoForm').addEventListener('submit', function(event) {
    let isValid = true;

    // Validación del nombre del producto
    const nombreProducto = document.getElementById('nombreProducto');
    const nombreProductoError = document.getElementById('nombreProductoError');
    if (nombreProducto.value.trim() === '') {
        nombreProducto.classList.add('invalid');
        nombreProductoError.style.display = 'block';
        isValid = false;
    } else {
        nombreProducto.classList.remove('invalid');
        nombreProductoError.style.display = 'none';
    }

    // Validación de la categoría
    const categoria = document.getElementById('categoria');
    const categoriaError = document.getElementById('categoriaError');
    if (categoria.value === '') {
        categoria.classList.add('invalid');
        categoriaError.style.display = 'block';
        isValid = false;
    } else {
        categoria.classList.remove('invalid');
        categoriaError.style.display = 'none';
    }

    // Validación del código
    const codigo = document.getElementById('codigo');
    const codigoError = document.getElementById('codigoError');
    if (codigo.value.trim() === '') {
        codigo.classList.add('invalid');
        codigoError.style.display = 'block';
        isValid = false;
    } else {
        codigo.classList.remove('invalid');
        codigoError.style.display = 'none';
    }

    // Validación del precio
    const precio = document.getElementById('precio');
    const precioError = document.getElementById('precioError');
    if (precio.value.trim() === '' || isNaN(precio.value)) {
        precio.classList.add('invalid');
        precioError.style.display = 'block';
        isValid = false;
    } else {
        precio.classList.remove('invalid');
        precioError.style.display = 'none';
    }

    if (!isValid) {
        event.preventDefault();
    }
});
