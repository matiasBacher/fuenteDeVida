import { agregar, eventoBuscar } from "../caja/eventoCompartido.js";
import { Carrito } from "../caja/carrito.js";
import { abrirModal, cerrarModal, errorMensaje, okMensaje } from "../modulo/mensajesYCargas.js"
import { registrarModVenta } from "../modulo/sincVenta.js";
import { recargarTabla } from "./venta.js";
import { contenedorCuadroProductoLotesCaja } from "../caja/contenedorCuadroProductoLotesCaja.js";

let ventaCargada
let productoCarrito=[]
let productoMemoria=[]

const buscador = document.querySelector ("#buscador");

const productoLotes = document.querySelector ("#product-table");

const total = document.querySelector("#totalCarrito")

const listaCarrito =document.querySelector("#listaCarrito")

const selectMedioPago = document.querySelector("#orden")
const botonModificar = document.querySelector("#registrarModificacion")

const DOMVentas = document.querySelector("#ventas")
const botonCerrarModal= document.querySelector("#closeModalModificarVenta")


let carrito = new Carrito(listaCarrito, ponerTotales)


const textAreaMotivoModificacion = document.querySelector("#motivoCorreccion")


const modalVentaModificar= document.querySelector("#modalModificarVenta")

botonCerrarModal.addEventListener("click", ()=>{
    cerrarModal(modalVentaModificar)
})

DOMVentas.addEventListener("click", (e)=>{
    let receptor=e.target
    if(receptor.matches(".button-modify")){
        carrito.vaciarCarrito()
        productoLotes.lotes=[]       
        let elementoVenta = receptor.parentElement.parentElement
        textAreaMotivoModificacion.value=""
        abrirModal(modalVentaModificar)
        ventaCargada=elementoVenta.venta
        total.textContent=ventaCargada.total
        let detalles=ventaCargada.detalles
        detalles.forEach((detalle)=>{
           carrito.agregarDetallesMod(detalle)
        })
        selectMedioPago.value=ventaCargada.idMedioPago
    }
})




function ponerTotales(){
    total.textContent=carrito.getTotalVenta()
}

eventoBuscar(productoLotes,  buscador)

    
agregar(carrito, ponerTotales)


botonModificar.addEventListener("click", async ()=>{
    if(carrito.getCantidad()>=1){
        if(!textAreaMotivoModificacion.value.trim()==""){
            let mensaje= await registrarModVenta(ventaCargada.idVerdadero, selectMedioPago.value, 
                                            carrito.getDetallesSuelto(), textAreaMotivoModificacion.value )
            mensaje=mensaje.mensaje
            carrito.vaciarCarrito()
            productoLotes.lotes=[]

            if(mensaje==1){
                okMensaje.fire({text:"Se modifico la venta con exito."})
                cerrarModal(modalVentaModificar)
                recargarTabla()

            }
            else{
                errorMensaje.fire({text:"No se pudo modificar la venta."})
                cerrarModal(modalVentaModificar)
                }
        }
        else{
            errorMensaje.fire({text:"Por favor especifique el motivo de la modificación."})
        }
    }
    else{
    errorMensaje.fire({text:"Por favor ponga por lo menos un producto en el carrito."})
        
    }
    })
    
