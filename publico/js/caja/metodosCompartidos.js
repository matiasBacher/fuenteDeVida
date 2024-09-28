import { tablaDeProducto } from "./tablaDeProducto.js";
import { tablaCarrito} from "./carrito.js";
import{devolverBusquedaProducto}  from "../modulo/sincProducto.js"; 

export{quitar, selectorCantidad, eventoBuscar, agregar}

// evento de buscar
function eventoBuscar(productoMemoria, tablaProducto, buscador){
    buscador.addEventListener('keyup', async () => {
        productoMemoria = await devolverBusquedaProducto(buscador.value)
        // tablaDeProducto (productoMemoria,tablaProducto, productoCarrito, document.getElementById("listaCarrito"))
        
        tablaDeProducto (productoMemoria,tablaProducto)
    })
    }    
    
    //evento boton agregar
    function agregar(ponerTotales, productoCarrito, carrito, tablaProducto){
    tablaProducto.addEventListener("click", (e)=>{
        if(e.target.matches("button")){
            if(productoCarrito.some(p=>p.codigo==e.target.objeto.codigo))return
            else{
                let p = e.target.objeto
                p.cantidad=1
                p.total=e.target.objeto.precio
                productoCarrito.push(e.target.objeto)
                carrito.innerHTML=""
                tablaCarrito(carrito,productoCarrito)
                ponerTotales()
            }
        }
    })}
// evento boton quitar
// evento boton quitar
function quitar(carrito, productoCarrito, ponerTotales){
    carrito.addEventListener("click",(e)=>{

        if(e.target.matches(".button-remove")){

            let botonQuitar= e.target
            let fila = botonQuitar.parentElement.parentElement

            let index=productoCarrito.findIndex(elemento=>elemento.codigo==fila.objeto.codigo)
            productoCarrito.splice(index,1)


            tablaCarrito(carrito, productoCarrito)
             ponerTotales()
            
        }
    })
}
    function selectorCantidad(carrito, ponerTotales){
        carrito.addEventListener("change",(e)=>{
    
            if(e.target.matches(".selectorCantidad")){
                let fila = e.target.parentElement.parentElement
                let totalFila= fila.querySelector(".totalProducto")
                let objeto= fila.objeto
    
                objeto.cantidad=e.target.value
                objeto.total=objeto.precio*objeto.cantidad
                totalFila.textContent=objeto.total
    
                ponerTotales()
            }
                    
                })
            }