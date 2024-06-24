//**********
//******** */
//ELEMENTOS
//**********
//******** */

//categorias
////////////////////
var modalCat = document.getElementById("AgregarCategoria");
var openModalCat = document.getElementById("openModalCat");
var closeModalCat = document.getElementById("closeModalCategoria");
var addBtn = document.getElementById("addBtn");
var newCategory = document.getElementById("newCategory");
var categoriesList = document.getElementById("categoriesList");
//agregar producto 
////////////////////
var modalProduct = document.getElementById("aProducto");
var openModalProducto = document.getElementById("openModalProduct");
var closeModalProduct = document.getElementById("closeModalAddProduct");

const nombreProducto = document.getElementById('nombreProducto');
const nombreProductoError = document.getElementById('nombreProductoError');

const categoria = document.getElementById('categoria');
const categoriaError = document.getElementById('categoriaError');

const codigo = document.getElementById('codigo');
const codigoError = document.getElementById('codigoError');

const precio = document.getElementById('precio');
const precioError = document.getElementById('precioError');

const formularioGrabar = document.getElementById("productoForm")

//producto
////////////////////
const ordenElemento = document.querySelector("#orden")

const buscarElemento = document.querySelector("#buscarProducto");

const checkboxes = Array.from(document.querySelectorAll('#filter-box input[type="checkbox"]'))

let tablaProductos = document.querySelector("#product-table");

//**********
//******** */
//VARIABLES
//**********
//******** */

//productos
////////////////////
let productosEnMemoria;
let productosEnMemoriaSinFiltrar;

//categorias
////////////////////
let categoriaEnMemoria;

//agregar producto
////////////////////
let isValid = true;


/********
//********** */
//EVENTO
//**********
//******** */

//agregar producto
////////////////////

// Abrir la ventana flotante de agregar producto 
// cuando se hace clic en el botón
openModalProducto.onclick = function() {
    modalProduct.style.display = "flex";
    cargarCategorias(2)
}

// Cerrar la ventana flotante de agregar producto
// cuando se hace clic en la "x"
closeModalProduct.onclick = function() {
    modalProduct.style.display = "none";
}


// Validación del nombre del producto 
nombreProducto.addEventListener("blur", validarNombre)

    // Validación de la categoría
categoria.addEventListener("blur", validarCategoria)

    // Validación del código
codigo.addEventListener("blur", validarCodigo);
aplicarSoloNumerico([ codigo ]);

    // Validación del precio
aplicarSoloNumerico([ precio ])
precio.addEventListener("blur", validarPrecio)

