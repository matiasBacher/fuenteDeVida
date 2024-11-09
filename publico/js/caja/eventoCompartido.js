import {devolverBusquedaProducto} from "../modulo/sincProducto.js"
import { errorMensaje, okMensaje } from "../modulo/mensajesYCargas.js"
export function agregar(carrito, ponerTotales){
    document.addEventListener("agregarCarrito", (e)=>{
        let lote = e.detail.lote

        let mensaje=carrito.agregarDetalles(lote)
        ponerTotales()
        if(mensaje=="loteRepetido"){
            errorMensaje.fire({text:"Ya agrego este lote"})

        }

    })
}
export function eventoBuscar(productoLotes, buscador){
    buscador.addEventListener('keyup', async () => {
        productoLotes.productos = await devolverBusquedaProducto(buscador.value)
        
    })
    }    