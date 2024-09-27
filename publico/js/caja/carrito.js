export{tablaCarrito,  tablaResumen}
function tablaCarrito( padre, carritoMemoria){
        padre.innerHTML=""
        carritoMemoria.forEach(producto=>{
            let tr=document.createElement("tr")
            tr.objeto=producto
            tr.appendChild(hacerCelda(producto.codigo))
            tr.appendChild(hacerCelda(producto.nombre))
            tr.appendChild(hacerCelda(producto.precio))
            let bm=document.createElement("input")
            bm.type="number"
            bm.value=producto.cantidad
            bm.classList.add("selectorCantidad")
            tr.appendChild(hacerCelda(bm))

            let t=hacerCelda(producto.total)
            t.classList.add("totalProducto")

            
            tr.appendChild(t)

            let botonQuitar = document.createElement("button")
            botonQuitar.classList.add("button", "button-remove")
            botonQuitar.innerText="quitar"
            botonQuitar.objeto=producto
            
            tr.appendChild(hacerCelda(botonQuitar))
            padre.appendChild(tr)
        })
        
    }
function ponerTotal(destino, total){
    destino.innerText=`$ ${total}`
}
function hacerCelda(contenido){
    let r= document.createElement("td")
    if(contenido instanceof HTMLElement){
        r.appendChild(contenido)
    }
    else{
        r.innerText=contenido
    }
    return r
}
function tablaResumen(padre, productos){
    padre.innerHTML=""
    productos.forEach(producto=>{
        let tr=document.createElement("tr")

        tr.innerHTML=
        `<td>${producto.nombre}</td>`+
        `<td>${producto.cantidad}</td>`+
        `<td>${producto.precio}</td>`+
        `<td>${producto.total}</td>`

        padre.appendChild(tr)

    })
}