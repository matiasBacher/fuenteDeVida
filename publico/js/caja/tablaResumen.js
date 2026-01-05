
export function tablaResumen(padre, productos){
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