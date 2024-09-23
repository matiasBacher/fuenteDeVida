import { categoriaEnMemoria } from "./variablesGlobales.js";
import{ validarVacio, aplicarSoloNumerico} from "../modulo/validaciones.js"
import {dibujarSelectCategorias} from "../modulo/dibujarSelectCategorias.js"
import { modificarProducto } from "../modulo/sincProducto.js";
import { cargarInputProducto } from "../modulo/cargarInput.js";
import { abrirModal,cerrarModal } from "../modulo/mensajesYCargas.js";
export {abrirModalModificarProducto}

async function abrirModalModificarProducto(producto){
    abrirModal(modalModifPro)
    dibujarSelectCategorias(elemModifProd.categoria, categoriaEnMemoria);
    cargarInputProducto(producto, elemModifProd)

}

let isValidModif=[false]
const modalModifPro = document.getElementById('mProducto');
const closeModifPro = document.getElementById('McloseModalAddProduct');



let elemModifProd={
    codigo: document.getElementById('Mcodigo'),
    precio: document.getElementById('Mprecio'),
    nombre: document.getElementById('MnombreProducto'),
    descripcion: document.getElementById('MdescripcionProducto'),
    categoria:  document.getElementById('Mcategoria'),
    propiedades: Array.from(document.querySelectorAll('#Mcaracteristicas input[type="checkbox"]'))
}
let elemModifProdErr={
    codigo: document.getElementById('McodigoError'),
    precio: document.getElementById('MprecioError'),
    nombre: document.getElementById('MnombreProductoError'),
    categoria:  document.getElementById('McategoriaError'),
}
let modifElemAValid=[ elemModifProd.precio, elemModifProd.nombre, elemModifProd.categoria]

let arrayFunc = []
modifElemAValid.forEach(x=>{
    let nombre=x.name
    let corregir=x.name=="nombre"
    let f= ()=>{
        validarVacio(nombre, elemModifProd, elemModifProdErr, 
        "Por favor complete el campo", corregir, isValidModif)}
    x.addEventListener("blur", f)
    arrayFunc.push(f)
})
aplicarSoloNumerico(elemModifProd.precio);

closeModifPro.addEventListener("click", ()=>{
    cerrarModal(modalModifPro)
})
const MproductForm= document.getElementById("MproductoForm")
const enviarModif = document.getElementById("MmodalAgregProdEnviar")
 enviarModif.addEventListener('click',  async ()=>{
    validarTodo(arrayFunc)
    if(isValidModif[0]){
        let m = await modificarProducto()
 
 
        if(m.mensajeBorrado<0){
            errorMensaje.fire({text:"No se pudo Borrar el producto"})            
            return;
        }
        if(m.mensajeGrabado<1){
            errorMensaje.fire({text:"falla a grabar los productos"})
            return
        }
        if(m.mensajeGrabado==1){
            okMensaje.fire({text:"El producto se actualizo con exito"})
            cerrarModal(modalModifPro)
            eventoBuscar()
       }
    }})
   

        





