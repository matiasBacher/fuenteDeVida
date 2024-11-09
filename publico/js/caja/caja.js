import { abrirModal, cerrarModal } from "../modulo/mensajesYCargas.js";
import { tablaDeProducto } from "./tablaDeProducto.js";
import { altaVenta } from "../modulo/sincVenta.js";
import { okMensaje, errorMensaje } from "../modulo/mensajesYCargas.js";
import { imprimirVenta } from "../modulo/imprimirVenta.js";
import { contenedorCuadroProductoLotesCaja } from "./contenedorCuadroProductoLotesCaja.js";
import { Carrito } from "./carrito.js";
import { agregar, eventoBuscar } from "./eventoCompartido.js";
import { tablaResumen } from "./tablaResumen.js";


const buscador = document.querySelector ("#buscador");

const productoLotes = document.querySelector ("#product-table");

const DomRegistrar = document.querySelector("#cobrar")

const resumenVenta = document.querySelector("#resumenVenta")

const cancelar = document.querySelector("#cancelar")

let totales = Array.from(document.querySelectorAll("#resumen-total , #totalCarrito"))

const listaCarrito =document.querySelector("#listaCarrito")

const DOMTablaResumen=document.querySelector("#resumen-compra")

const selectMedioPago = document.querySelector("#orden")

const resumenMetodoPago=document.querySelector("#resumen-metodo-pago")

const botonRegistrarVenta=document.querySelector("#registrar")

const botonImprimir = document.querySelector("#imprimir-registrar")
resumenMetodoPago.textContent=(JSON.parse(selectMedioPago.value))[1]
let carrito = new Carrito(listaCarrito, ponerTotales)




function ponerTotales(){
    totales.forEach(elemento=>elemento.textContent=carrito.getTotalVenta())
}

botonImprimir.addEventListener("click", async ()=>{
    
        let recepcion = await altaVenta(JSON.parse(selectMedioPago.value)[0], carrito.getDetallesSuelto)
        let mensaje = recepcion.mensaje
        let venta = recepcion.venta
        cerrarModal(resumenVenta)
        carrito.vaciarCarrito()
        productoLotes.lotes=[]
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
    if(carrito.getCantidad()){
        abrirModal(resumenVenta); 
        tablaResumen(DOMTablaResumen, carrito.getProductosArray())
    }
    else{
        errorMensaje.fire({text:"Por favor ponga por lo menos un producto en el carrito."})
    }
    })

cancelar.addEventListener("click", ()=>{
    cerrarModal(resumenVenta)
})


eventoBuscar(productoLotes,  buscador)

    
    agregar(carrito, ponerTotales)



    //registrar venta
    botonRegistrarVenta.addEventListener("click", async ()=>{
       let mensaje = await altaVenta(JSON.parse(selectMedioPago.value)[0], carrito.getDetallesSuelto())
       console.log(mensaje)
       cerrarModal(resumenVenta)
        carrito.vaciarCarrito()
        productoLotes.productos=[]

      
       
       if(mensaje.mensaje==1){
            okMensaje.fire({text:"Venta registrada."})
       }
       else{
        errorMensaje.fire({text:"Venta no registrada."})
       }

    }
    )


