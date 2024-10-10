
export{tablaVentas}
function  tablaVentas(ventas,opciones){
    let op={identificador:false, tieneID:true, modificar:true, consultar:true, imprimir:true, razonModificacion:false}
    op={...op, ...opciones}
    let contenedorVentas=document.createElement("div")
    contenedorVentas.classList.add("contenedorVentas")

    ventas.forEach(x=>contenedorVentas.appendChild(hacerCuadroVenta(x,op)))

    return contenedorVentas

}
function hacerCuadroVenta(venta, opciones){
    let cuadroVenta = document.createElement("div")
    cuadroVenta.classList.add("ventaCuadro")
    cuadroVenta.venta=venta

    let contenedorEncabezadoVenta= document.createElement("div")
    contenedorEncabezadoVenta.classList.add("contenedorEncabezado")

    let numVenta = document.createElement("div")
    numVenta.classList.add("numVenta")
    numVenta.classList.add("encabezadoVenta")
    numVenta.innerHTML=`<b>Nº Venta:</b> ${venta.id}`

    let fecha = document.createElement("div")
    fecha.classList.add("fechaVenta")
    fecha.classList.add("encabezadoVenta")
    fecha.innerHTML=`<b>Fecha:</b> ${venta.fecha}`

    let medioPago = document.createElement("div")
    medioPago.classList.add("medioPagoVenta")
    medioPago.classList.add("encabezadoVenta")
    medioPago.innerHTML=`<b>Medio pago:</b> ${venta.metodoPago}`

    if(opciones.tieneID)contenedorEncabezadoVenta.appendChild(numVenta)
    contenedorEncabezadoVenta.appendChild(fecha)
    contenedorEncabezadoVenta.appendChild(medioPago)

    let contenedorTotal = document.createElement("div")
    contenedorTotal.classList.add("contenedorTotal")
    let textoTotal = document.createElement("p")
    textoTotal.innerHTML=`<b>Total:</b> $${venta.total}`
    contenedorTotal.appendChild(textoTotal)

    const contenedorBotones = document.createElement("div")
    contenedorBotones.classList.add("contedorBotones")

    const botonModificar = document.createElement("button")
    botonModificar.classList.add("button", "button-modify")
    // botonModificar.addEventListener("click", modificarVenta(venta))
    botonModificar.textContent="🖊"

    const botonConsultar = document.createElement("button")
    botonConsultar.classList.add("button", "button-consultar")
    // botonConsultar.addEventListener("click", (venta))
    botonConsultar.textContent="consultar"

    const botonImprimir = document.createElement("button")
    botonImprimir.classList.add("button", "button-imprimir")
    botonImprimir.textContent="Imprimir venta"
    

    if(opciones.modificar)contenedorBotones.appendChild(botonModificar)
    if(opciones.consultar)contenedorBotones.appendChild(botonConsultar)
    if(opciones.imprimir)contenedorBotones.appendChild(botonImprimir)

        if(opciones.identificador && (venta.esActual || venta.esOriginal)){
            let identificador=document.createElement("div")
            identificador.innerHTML=
            `<span class="identificadorVenta ${
                venta.esActual?"ventaActual":
                venta.esOriginal?"ventaOriginal":""}"
                >
                    ${  venta.esActual?"Ultima Modificación":venta.esOriginal?"Original":""
                    }</span>`
                cuadroVenta.appendChild(identificador)
        }

    if(opciones.razonModificacion && venta.motivoCorreccion!=null){
        let razonModificacion=document.createElement("div")
        razonModificacion.innerHTML=
        `<h3 class="tituloRazon">Razon Modificacion</html>
        <p class="cuerpoRazon">${venta.motivoCorreccion}` 
        cuadroVenta.appendChild(razonModificacion)
    }


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

