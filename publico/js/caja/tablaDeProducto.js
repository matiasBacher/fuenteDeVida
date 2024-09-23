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
    <td><button class="button">agregar</button></td>
`;
    padre.appendChild(fila)
});

}