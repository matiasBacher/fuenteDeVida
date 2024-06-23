document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('add-product').addEventListener('click', () => {
        alert('Agregar nuevo producto');
    });

    document.getElementById('add-category').addEventListener('click', () => {
        alert('Agregar nueva categoría');
    });

    const modifyButtons = document.querySelectorAll('.button-modify');
    modifyButtons.forEach(button => {
        button.addEventListener('click', () => {
            alert('Modificar producto');
        });
    });

    // Agregar más funcionalidades según sea necesario
});
