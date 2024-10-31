import { abrirModal, cerrarModal } from "../modulo/mensajesYCargas.js";
import { tablaDeProducto } from "./tablaDeProducto.js";
import { tablaCarrito, tablaResumen } from "./carrito.js";
import { altaVenta } from "../modulo/sincVenta.js";
import { okMensaje, errorMensaje } from "../modulo/mensajesYCargas.js";
import { quitar, selectorCantidad, eventoBuscar, agregar } from "./metodosCompartidos.js";
import { imprimirVenta } from "../modulo/imprimirVenta.js";

let productoMemoria = [];
let productoCarrito = [];

const buscador = document.querySelector ("#buscador");

const tablaProducto = document.querySelector ("#product-table");

const DomRegistrar = document.querySelector("#cobrar")

const resumenVenta = document.querySelector("#resumenVenta")

const cancelar = document.querySelector("#cancelar")

let totales = Array.from(document.querySelectorAll("#resumen-total , #totalCarrito"))

const carrito =document.querySelector("#listaCarrito")

const DOMTablaResumen=document.querySelector("#resumen-compra")

const selectMedioPago = document.querySelector("#orden")

const resumenMetodoPago=document.querySelector("#resumen-metodo-pago")

const botonRegistrarVenta=document.querySelector("#registrar")

const botonImprimir = document.querySelector("#imprimir-registrar")
resumenMetodoPago.textContent=(JSON.parse(selectMedioPago.value))[1]


function ponerTotales(){
    let sumaTotales=0
    productoCarrito.forEach(elemento => sumaTotales+=elemento.total)

    totales.forEach(elemento=>elemento.textContent=sumaTotales)
}

botonImprimir.addEventListener("click", async ()=>{
    
        let recepcion = await altaVenta(JSON.parse(selectMedioPago.value)[0], productoCarrito)
        let mensaje = recepcion.mensaje
        let venta = recepcion.venta
        cerrarModal(resumenVenta)
        productoCarrito.length=0
        productoMemoria.length=0
        tablaCarrito(carrito, productoCarrito)
        tablaDeProducto(productoMemoria, tablaProducto)
        ponerTotales()
        if(mensaje==1){
             okMensaje.fire({text:"Venta registrada."})
        }
        else{
         errorMensaje.fire({text:"Venta no registrada."})
        }
        imprimirVenta(venta)
})


//metodo pago en resumen de venta 
selectMedioPago.addEventListener('change', ()=>{


resumenMetodoPago.textContent=(JSON.parse(selectMedioPago.value))[1]
})
//abrir modal resumen venta
DomRegistrar.addEventListener("click", ()=>{
    if(productoCarrito.length>=1){
        abrirModal(resumenVenta); 
        tablaResumen(DOMTablaResumen,productoCarrito)
    }
    else{
        errorMensaje.fire({text:"Por favor ponga por lo menos un producto en el carrito."})
    }
    })

cancelar.addEventListener("click", ()=>{
    cerrarModal(resumenVenta)
})


eventoBuscar(productoMemoria, tablaProducto, buscador)

    
    //evento boton agregar
    agregar(ponerTotales, productoCarrito, carrito, tablaProducto)

    // evento selector Cantidad
        selectorCantidad(carrito, ponerTotales)

// evento boton quitar

quitar(carrito, productoCarrito, ponerTotales)

    //registrar venta
    botonRegistrarVenta.addEventListener("click", async ()=>{
       let mensaje = await altaVenta(JSON.parse(selectMedioPago.value)[0], productoCarrito)
       console.log(mensaje)
       cerrarModal(resumenVenta)
       productoCarrito.length=0
       productoMemoria.length=0
       tablaCarrito(carrito, productoCarrito)
       tablaDeProducto(productoMemoria, tablaProducto)
       ponerTotales()
       if(mensaje.mensaje==1){
            okMensaje.fire({text:"Venta registrada."})
       }
       else{
        errorMensaje.fire({text:"Venta no registrada."})
       }

    }
    )


