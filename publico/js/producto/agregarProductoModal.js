import { categoriaEnMemoria, grabarCategoria } from "./variablesGlobales.js";
import{ajustarValor, validarVacio, aplicarSoloNumerico} from "../modulo/validaciones.js"
import { cargarCategorias } from "../modulo/sincCat.js";
import {dibujarSelectCategorias} from "../modulo/dibujarSelectCategorias.js"
import { grabarProductos } from "../modulo/sincProducto.js";
import { cargarInputProducto } from "../modulo/cargarInput.js";
import { hacerTabla } from "./producto.js";
import { abrirModal,cerrarModal } from "../modulo/mensajesYCargas.js";
import { okMensaje, errorMensaje } from "../modulo/mensajesYCargas.js";

var modalProduct = document.getElementById("aProducto");
var openModalProducto = document.getElementById("openModalProduct");
var closeModalProduct = document.getElementById("closeModalAddProduct");

// Abrir la ventana flotante cuando se hace clic en el botón
async function recargarSelect(rapido=true){
    if(rapido){ grabarCategoria(await cargarCategorias())}
    dibujarSelectCategorias(elemAgreProd.categoria, categoriaEnMemoria)

}
openModalProducto.onclick = async function() {
    abrirModal(modalProduct)
    recargarSelect()
}

// Cerrar la ventana flotante cuando se hace clic en la "x"
closeModalProduct.onclick = function() {
    cerrarModal(modalProduct)
    hacerTabla()

}

let elemAgreProd={
    codigo: document.getElementById('codigo'),
    precio: document.getElementById('precio'),
    nombre: document.getElementById('nombreProducto'),
    descripcion: document.getElementById('descripcionProducto'),
    categoria:  document.getElementById('categoria'),
    propiedades: Array.from(document.querySelectorAll('#caracteristicas input[type="checkbox"]'))
}
let elemAgreProdErr={
    codigo: document.getElementById('codigoError'),
    precio: document.getElementById('precioError'),
    nombre: document.getElementById('nombreProductoError'),
    categoria:  document.getElementById('categoriaError'),
}
let isValid={nombre:false, categoria:false, codigo:false, precio:false}




    
elemAgreProd["nombre"].addEventListener("blur", validarNombre);
    function validarNombre() {


        validarVacio('nombre', elemAgreProd, elemAgreProdErr, "Complete el nombre.", true, isValid)
    }

    // Validación de la categoría
    elemAgreProd["categoria"].addEventListener("blur", validarCategoria)
    function validarCategoria() {
        validarVacio('categoria', elemAgreProd, elemAgreProdErr, "Elija una categoría.",false, isValid)
    }

        
    

    // Validación del código
    elemAgreProd["codigo"].addEventListener("blur", validarCodigo);

   elemAgreProd["codigo"].addEventListener("input", function(event) {
    let input = event.target;
    aplicarSoloNumerico(input)
    ajustarValor(input)
   }
)
    function validarCodigo() {
        validarVacio('codigo', elemAgreProd, elemAgreProdErr, "Complete el codigo.", true, isValid)
    }
    



     elemAgreProd["precio"].addEventListener("input", function(event){
        let input = event.target
        aplicarSoloNumerico(input)
     })
    precio.addEventListener("blur", validarPrecio)
    function validarPrecio() {
        validarVacio('precio', elemAgreProd, elemAgreProdErr, "Complete el precio.",false, isValid)
    }
    

    function validarTodo(funciones) {
        
            funciones.forEach(x=>{
                x()
            })
        
    }

const formularioGrabar = document.getElementById("productoForm")




document.getElementById('modalAgregProdEnviar').addEventListener('click', async ()=>{
    validarTodo([validarCategoria,validarCodigo,validarNombre,validarPrecio])
    if(Object.values(isValid).every(x=>x)){
       let m= await grabarProductos(formularioGrabar)
    if(m==1){
        okMensaje.fire({text:"EL PRODUCTO FUE AGREGADO."})
        cargarInputProducto("", elemAgreProd)
        return
    }
    else if(m==0){
        errorMensaje.fire({text:"Codigo del producto repetido."})
        return
    }
    else{
        Swal.fire({text:"Codigo del producto repetido."})
        return
    }
    }
})


