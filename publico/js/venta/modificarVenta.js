import { quitar, selectorCantidad, eventoBuscar, agregar } from "../caja/metodosCompartidos.js";
import { tablaCarrito } from "../caja/carrito.js"
import { abrirModal, cerrarModal, errorMensaje, okMensaje } from "../modulo/mensajesYCargas.js"
import { registrarModVenta } from "../modulo/sincVenta.js";
import { recargarTabla } from "./venta.js";


let ventaCargada
let productoCarrito=[]
let productoMemoria=[]

const buscador = document.querySelector ("#buscador");

const tablaProducto = document.querySelector ("#product-table");

const total = document.querySelector("#totalCarrito")

const carrito =document.querySelector("#listaCarrito")

const selectMedioPago = document.querySelector("#orden")
const botonModificar = document.querySelector("#registrarModificacion")

const DOMVentas = document.querySelector("#ventas")
const botonCerrarModal= document.querySelector("#closeModalModificarVenta")

const textAreaMotivoModificacion = document.querySelector("#motivoCorreccion")
botonCerrarModal.addEventListener("click", ()=>{
    cerrarModal(modalVentaModificar)
})

const modalVentaModificar= document.querySelector("#modalModificarVenta")
DOMVentas.addEventListener("click", (e)=>{
    let receptor=e.target
    if(receptor.matches(".button-modify")){
        productoCarrito.length=0
        productoMemoria.length=0
        let elementoVenta = receptor.parentElement.parentElement
        abrirModal(modalVentaModificar)
        ventaCargada=elementoVenta.venta
        total.textContent=ventaCargada.total
        let detalles=ventaCargada.detalles
        detalles.forEach((detalle)=>{
            let producto=detalle.producto
            producto.cantidad=detalle.cantidad
            producto.total=detalle.precio
            productoCarrito.push(producto)
        })
        tablaCarrito(carrito,productoCarrito)
        carrito.innerHTML=""
        tablaCarrito(carrito,productoCarrito)
        selectMedioPago.value=ventaCargada.idMedioPago
    }
})




function ponerTotales(){
    let sumaTotales=0
    productoCarrito.forEach(elemento => sumaTotales+=elemento.total)
    total.textContent=sumaTotales
}

agregar(ponerTotales,productoCarrito,carrito,tablaProducto)

quitar(carrito,productoCarrito,ponerTotales)
selectorCantidad(carrito, ponerTotales)
eventoBuscar(productoMemoria,tablaProducto,buscador)

botonModificar.addEventListener("click", async ()=>{
    let mensaje= await registrarModVenta(ventaCargada.id, selectMedioPago.value, 
                                    productoCarrito, textAreaMotivoModificacion.value )
    mensaje=mensaje.mensaje
    productoCarrito.length=0
    productoMemoria.length=0

    if(mensaje==1){
        okMensaje.fire({text:"se modifico la venta con exito"})
        cerrarModal(modalVentaModificar)
        recargarTabla()

    }
    else{
        errorMensaje.fire({text:"no se pudo modificar la venta"})
        cerrarModal(modalVentaModificar)
        }

    })
    
