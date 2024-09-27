export{tablaDeProducto}

function tablaDeProducto(productos, padre){
    padre.innerHTML=""

    productos.forEach(producto => {
    let fila = document.createElement("tr")
    fila.innerHTML = `  
    <td>${producto.codigo}</td>
    <td>${producto.nombre}</td>
    <td>${producto.categoria}</td>
    <td>${producto.precio}</td>
    <td><button class="button">Agregar</button></td>
`;
    fila.querySelector(".button").objeto=producto;

    padre.appendChild(fila)
});

}