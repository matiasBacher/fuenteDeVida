function eventosCompartidos(objeto){
    
// evento de buscar
buscador.addEventListener('keyup', async () => {
    productoMemoria = await devolverBusquedaProducto(buscador.value)
    // tablaDeProducto (productoMemoria,tablaProducto, productoCarrito, document.getElementById("listaCarrito"))
    
    tablaDeProducto (productoMemoria,tablaProducto)
})

    
    //evento boton agregar
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
    })

    // evento selector Cantidad
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


// evento boton quitar
    carrito.addEventListener("click",(e)=>{

        if(e.target.matches(".button-remove")){

            let botonQuitar= e.target
            let fila = botonQuitar.parentElement.parentElement

            productoCarrito=productoCarrito.filter(elemento=>elemento.codigo!=fila.objeto.codigo)

            tablaCarrito(carrito, productoCarrito)
             ponerTotales()
            
        }
    })
}