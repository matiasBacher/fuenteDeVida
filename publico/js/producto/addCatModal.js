import { categoriaEnMemoria, grabarCategoria } from "./variablesGlobales.js";
import { cargarCategorias, actualizarCategoria, eliminarCategoria, insertarcategorias} from "../modulo/sincCat.js";
import { dibujarCategorias } from "../modulo/dibujarCategorias.js";


// Obtener los elementos del DOM
var modalCat = document.getElementById("AgregarCategoria");
var openModalCat = document.getElementById("openModalCat");
var closeModalCat = document.getElementById("closeModalCategoria");
var addBtn = document.getElementById("addBtn");
var newCategory = document.getElementById("newCategory");
var categoriesList = document.getElementById("categoriesList");



async function  recargarCategorias(){
    grabarCategoria(await cargarCategorias()) 
    dibujarCategorias(categoriesList, categoriaEnMemoria)
}


// Abrir la ventana flotante cuando se hace clic en el botón
openModalCat.onclick = async function() {
    modalCat.style.display = "flex";
    recargarCategorias()
}

closeModalCat.onclick = function() {
    modalCat.style.display = "none";
}


// formar tablas de categorías
addBtn.onclick = function () {
    let nombreCategoria = newCategory.value.trim()
    preguntaMensaje.fire({
        title: "Deseas agregar la categoría: " +nombreCategoria+ "?",

    }).then(async (result) => {
        if (result.isConfirmed) {
            let m = await insertarcategorias(nombreCategoria)
            recargarCategorias()
    // Verificar si la categoría ya existe
    if (m == -1) {
        errorMensaje.fire({text:"Esta categoría ya existe."})  
    }

    else if (m == 0) {
        errorMensaje.fire({text:"error al cargar los datos en la base de datos"})        
    }
    else if (m == 1) {
        okMensaje.fire({text:`La categoria "${nombreCategoria}" fue cargada correctamente`})
        // Limpiar el campo de entrada
        newCategory.value = "";
    }

        }
    })

}





