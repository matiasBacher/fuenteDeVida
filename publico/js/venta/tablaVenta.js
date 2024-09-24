export{tablaVentas}
function  tablaVentas(ventas){
    let contenedorVentas=document.createElement("div")
    contenedorVentas.classList.add("contenedorVentas")

    ventas.forEach(x=>contenedorVentas.appendChild(hacerCuadroVenta(x)))

    return contenedorVentas

}
function hacerCuadroVenta(venta){
    let cuadroVenta = document.createElement("div")
    cuadroVenta.classList.add("ventaCuadro")

    let contenedorEncabezadoVenta= document.createElement("div")
    contenedorEncabezadoVenta.classList.add("contenedorEncabezado")

    let numVenta = document.createElement("div")
    numVenta.classList.add("numVenta")
    numVenta.classList.add("encabezadoVenta")
    numVenta.innerText=venta.id

    let fecha = document.createElement("div")
    fecha.classList.add("fechaVenta")
    fecha.classList.add("encabezadoVenta")
    fecha.innerText=venta.fecha

    let medioPago = document.createElement("div")
    medioPago.classList.add("medioPagoVenta")
    medioPago.classList.add("encabezadoVenta")
    medioPago.innerText=venta.metodoPago

    contenedorEncabezadoVenta.appendChild(numVenta)
    contenedorEncabezadoVenta.appendChild(fecha)
    contenedorEncabezadoVenta.appendChild(medioPago)

    let contenedorTotal = document.createElement("div")
    contenedorTotal.classList.add("contenedorTotal")
    let textoTotal = document.createElement("p")
    textoTotal.innerText=venta.total
    contenedorTotal.appendChild(textoTotal)

    const contenedorBotones = document.createElement("div")
    contenedorBotones.classList.add("contedorBotones")

    const botonModificar = document.createElement("button")
    botonModificar.classList.add("button", "button-modify")
    // botonModificar.addEventListener("click", modificarVenta(venta))
    botonModificar.textContent="🖊"

    const botonConsultar = document.createElement("button")
    botonConsultar.classList.add("button")
    // botonConsultar.addEventListener("click", (venta))
    botonConsultar.textContent="consultar"

    contenedorBotones.appendChild(botonModificar)
    contenedorBotones.appendChild(botonConsultar)


    cuadroVenta.appendChild(contenedorEncabezadoVenta)

    cuadroVenta.appendChild(detalleVenta(venta.detalles))

    cuadroVenta.appendChild(contenedorTotal)

    cuadroVenta.appendChild(contenedorBotones)

    return cuadroVenta



}

function detalleVenta(detallesVenta){
    let tablaDetalle= document.createElement("table")
    
    let encabezado = document.createElement("thead")

    let DOMtrEncabezado= document.createElement("tr")
    DOMtrEncabezado.innerHTML=
                            `<th>Codigo</>`+
                            `<th>Producto</>`+
                            `<th>Cantidad</>`+
                            `<th>Precio Unitario</>`+
                            `<th>Total</>`
    encabezado.appendChild(DOMtrEncabezado)
    

    tablaDetalle.appendChild(encabezado)
    let cuerpo = document.createElement("tbody")
    detallesVenta.forEach(x=>{
       cuerpo.appendChild(detalleIndivididual(x)) 
    })
    tablaDetalle.appendChild(cuerpo)
    return tablaDetalle;


}
function detalleIndivididual(detalleVenta){
    let detalle = document.createElement("tr")

    detalle.innerHTML=
    `<td> ${detalleVenta.id}</>`+
    `<td> ${detalleVenta.producto.nombre}</>`+
    `<td> ${detalleVenta.cantidad}</>`+
    `<td> ${detalleVenta.precio}</>`+
    `<td> ${detalleVenta.cantidad*detalleVenta.precio}</>`

    return detalle
}

