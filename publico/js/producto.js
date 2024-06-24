let productosEnMemoria;
let productosEnMemoriaSinFiltrar;
let productoSeleccionado


function abrirModal(modal){

    modal.style.display="flex"
}

function cerrarModal(modal) {
    modal.style.display="none"
}
async function devolverBusquedaProducto (busqueda){
    const f = new FormData();
    let productos;
    f.append("accion","busqueda")
    f.append("busqueda", busqueda);
    
    
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
    productosEnMemoriaSinFiltrar=productos
    productosEnMemoria=productos;    
    ordenar(false);
    filtrar(false);
    crearTabla();
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

function filtrar( bandera=true){
    orden = 
    productosEnMemoria=productosEnMemoriaSinFiltrar;
    let filtro = convertirCheckboxesAObjeto();
    let productosFiltrados = productosEnMemoria.filter(x => {
        for (let i = 0; i < filtro.length; i++) {
            if (!x.propiedades[filtro[i]]) {
                return false;
            }
        }
        return true;
    }
    )
    productosEnMemoria=productosFiltrados;
    if(bandera){crearTabla();}
}
function ordenar(bandera=true){

    productosEnMemoria.sort((a, b) => {
        const orden = document.getElementById("orden").value;
        if (a[orden] < b[orden]) {
            return -1;
        }
        else if (a[orden] > b[orden]) {
            return 1
        } else {
            return 0;
        }
    })
    if(bandera){crearTabla();}
}

async function borrarProducto(codigo, nombre){ 
                const f = new FormData();
                f.append("accion","borrar")
                f.append("codigo", codigo);
                let mensaje=-2;
                let nombreProducto=nombre
                
                
                try {
                    const response = await fetch('../../app/controlador/controladorProductos.php', {
                        method: 'POST',
                        body: f
                    });
                    
                    
                    if (response.ok) {
                        let r= await response.json();
                        mensaje = r.mensaje;

                    } else {
                        throw new Error('Error al obtener la respuesta del servidor');
                    }
                } catch (error) {
                    console.error('Error:', error);
                    // Manejar el error según sea necesario
                }

                if(mensaje==-2){
                    Swal.fire({confirmButtonText:"Volver",text:"Error desconocido", background:"#d6dfee",icon: "error", showConfirmButton: false,})                   
                    return;
                }
                if(mensaje==-1 || mensaje==0){
                    Swal.fire({confirmButtonText:"Volver",text:"No se pudo Borrar el producto: "+nombreProducto, background:"#d6dfee",icon: "error", showConfirmButton: false,})
                    return;
                }
                if(mensaje==1){
                    devolverBusquedaProducto(buscarElemento.value)
                    Swal.fire({customclass: {confirmButton:"custombutton"},text:"El producto: "+nombreProducto+" se ha borrado",icon: "success",background:"#d6dfee"})
                    return; 
                }
            }
        


function crearTabla() {






    // Inicializamos la variable filas como un array vacío
    let filas = [];

    // Verificamos si productosEnMemoria está vacío
    if (productosEnMemoria.length === 0) {
        // Si no hay productos, creamos una fila con un mensaje indicando que no se encontraron productos
        let fila = document.createElement('tr');
        let celda = document.createElement('td');
        celda.className = 'productoNoEncontrado';
        celda.colSpan = 7;
        celda.textContent = 'No se encontraron productos';
        fila.appendChild(celda);
        filas.push(fila);
    } else {
        // Si hay productos, iteramos sobre cada producto en productosEnMemoria
        productosEnMemoria.forEach(function (x) {
            // Creamos una nueva fila para cada producto
            let fila = document.createElement('tr');

            // Creamos y asignamos la celda del código del producto
            let codigo = document.createElement('td');
            codigo.textContent = x.codigo.toString().padStart(8, '0');
            fila.appendChild(codigo);

            // Creamos y asignamos la celda del nombre del producto
            let nombre = document.createElement('td');
            nombre.textContent = x.nombre;
            fila.appendChild(nombre);

            // Creamos y asignamos la celda de la categoría del producto
            let categoria = document.createElement('td');
            categoria.textContent = x.categoria;
            fila.appendChild(categoria);

            // Creamos y asignamos la celda de la descripción del producto
            let descripcion = document.createElement('td');
            descripcion.textContent = x.descripcion;
            fila.appendChild(descripcion);

            // Creamos y asignamos la celda de las propiedades del producto
            let propiedades = document.createElement('td');
            if (x.propiedades.esiuretico) {
                let span = document.createElement('span');
                span.className = 'badge badgeAzul';
                span.textContent = 'Diuretico';
                propiedades.appendChild(span);
            }
            if (x.propiedades.sinSodio) {
                let span = document.createElement('span');
                span.className = 'badge badgeRojo';
                span.textContent = 'Sin sodio';
                propiedades.appendChild(span);
            }
            if (x.propiedades.esNatural) {
                let span = document.createElement('span');
                span.className = 'badge badgeVerde';
                span.textContent = 'Es natural';
                propiedades.appendChild(span);
            }
            if (x.propiedades.sinTacc) {
                let span = document.createElement('span');
                span.className = 'badge badgeNaranja';
                span.textContent = 'Sin TACC';
                propiedades.appendChild(span);
            }
            if (x.propiedades.aptoDiabetico) {
                let span = document.createElement('span');
                span.className = 'badge badgeNegro';
                span.textContent = 'Apto diabetico';
                propiedades.appendChild(span);
            }
            fila.appendChild(propiedades);

            // Creamos y asignamos la celda del precio del producto
            let precio = document.createElement('td');
            precio.textContent = `$${x.precio}`;
            fila.appendChild(precio);

            // Creamos y asignamos las celdas de las acciones (modificar y eliminar)
            let acciones = document.createElement('td');
            let buttonModify = document.createElement('button');
            buttonModify.className = 'button button-modify';
            buttonModify.textContent = '🖊';
            buttonModify.addEventListener("click", () => {
                productoSeleccionado = x
                cargarCategorias(3)


            })
            acciones.appendChild(buttonModify);

            let buttonRemove = document.createElement('button');
            buttonRemove.className = 'button button-remove';
            buttonRemove.textContent = '✖';
            buttonRemove.addEventListener("click", () => {
                Swal.fire({
                    title: "Deseas eliminar el producto: " + x.nombre + "?",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Aceptar",
                    cancelButtonText: "Cancelar",
                }).then((result) => {
                    if (result.isConfirmed) { borrarProducto(x.codigo, x.nombre) }
                }
                )})
                acciones.appendChild(buttonRemove);

                fila.appendChild(acciones);

                // Añadimos la fila creada al array filas
                filas.push(fila);
            });


            // Seleccionamos la tabla en el DOM donde se mostrarán los productos
            let tabla = document.querySelector("#product-table");
            tabla.innerHTML = ''; // Limpiamos el contenido existente de la tabla

            // Añadimos cada fila generada a la tabla
            filas.forEach(function (fila) {
                tabla.appendChild(fila);
            });

        
    }}




const ordenElemento = document.querySelector("#orden")

const buscarElemento = document.querySelector("#buscarProducto");

const checkboxes = Array.from(document.querySelectorAll('#filter-box input[type="checkbox"]'))



function eventoBuscar (){
    let orden = ordenElemento.value;
    devolverBusquedaProducto(buscarElemento.value)
}
buscarElemento.addEventListener('keyup',eventoBuscar)
ordenElemento.addEventListener("change", ordenar)

checkboxes.forEach(x=>{
    x.addEventListener("change",filtrar)
})
