async function devolverBusquedaProducto (busqueda, filtros, orden){
    const f = new FormData();
    let productos;
    f.append("busqueda", busqueda);
    f.append("filtros", JSON.stringify(filtros))
    
    
    try {
        const response = await fetch('../../app/controlador/controladorProductos.php', {
            method: 'POST',
            body: f
        });
        
        if (response.ok) {
            productos = await response.json();
        } else {
            throw new Error('Error al obtener la respuesta del servidor');
        }
    } catch (error) {
        console.error('Error:', error);
        // Manejar el error según sea necesario
    }

    return crearTabla(productos, orden, filtros);
   }

   function convertirCheckboxesAObjeto() {
    // Seleccionar todos los hijos input[type=checkbox] dentro del elemento con id 'filter-box'
    const checkboxes = Array.from(document.querySelectorAll('#filter-box input[type="checkbox"]'));
    const checkboxArray = [];

    checkboxesFiltrado = checkboxes.filter(x=>x.checked);
    checkboxesFiltrado.forEach(x=>{
        checkboxArray.push(x.id)
    })
    return checkboxArray;
}
function crearTabla(jsonProduto, orden, filtro) {
    let jsonProdutoFiltrado = jsonProduto.filter(x => {
        for (let i = 0; i < filtro.length; i++) {
            if (!x.propiedades[filtro[i]]) {
                return false;
            }
        }
        return true;
    }
    )


    jsonProdutoFiltrado.sort((a, b) => {
        if (a[orden] < b[orden]) {
            return -1;
        }
        else if (a[orden] > b[orden]) {
            return 1
        } else {
            return 0;
        }
    })
    




    let filas = "";

    jsonProdutoFiltrado.forEach(x => {
        let htmlPropiedades =
            ((x.propiedades.esiuretico) ? `<span class="badge  text-bg-primary me-1">Diuretico</span>` : "") +
            ((x.propiedades.sinSodio) ? `<span class="badge  text-bg-danger me-1">sin sodio</span>` : "") +
            ((x.propiedades.esNatural) ? `<span class="badge  text-bg-success me-1">es natural</span>` : "") +
            ((x.propiedades.sinTacc) ? `<span class="badge text-bg-warning me-1">sin Tacc</span>` : "") +
            ((x.propiedades.aptoDiabetico) ? `<span class="badge  text-bg-info me-1">apto diabetico</span>` : "");

        let html =

            `<tr>
            <td>${x.codigo}</td>
            <td>${x.nombre}</td>
            <td>${x.categoria}</td>
            <td>${x.descripcion}</td>
            <td> $${x.precio}</td>
            <td class=>${htmlPropiedades}</td>
            <td><button class="button-modify">Modificar</button></td>
        </tr>\n`;

        filas += html;

    })
    document.querySelector("#tabla tbody").innerHTML = filas;
}

const ordenElemento = document.querySelector("#orden")

const buscarElemento = document.querySelector("#buscarProducto");

const checkboxes = Array.from(document.querySelectorAll('#filter-box input[type="checkbox"]'))


function eventoBuscar (){
    let orden = ordenElemento.value;
    devolverBusquedaProducto(buscarElemento.value, convertirCheckboxesAObjeto(),  orden)
}
buscarElemento.addEventListener('keyup',eventoBuscar)
ordenElemento.addEventListener("change", eventoBuscar)

checkboxes.forEach(x=>{
    x.addEventListener("change",eventoBuscar)
})
