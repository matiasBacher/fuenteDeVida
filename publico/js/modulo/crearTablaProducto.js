
import { abrirModalModificarProducto } from "../producto/modificarProductoModal";
export{crearTabla}
function crearTabla(memoria,padre,contador) {

    contador.innerHTML= memoria.length;




    // Inicializamos la variable filas como un array vacío
    let filas = [];

    // Verificamos si productosEnMemoria está vacío
    if (memoria.length === 0) {
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
        memoria.forEach(function (x) {
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
            descripcion.textContent = x.descripcion==0?"":x.descripcion;
            fila.appendChild(descripcion);

            // Creamos y asignamos la celda de las propiedades del producto
            let propiedades = document.createElement('td');
            if (x.propiedades.esDiuretico) {
                let span = document.createElement('span');
                span.className = 'badge badgeAzul';
                span.textContent = 'Diuretico';
                propiedades.appendChild(span);
            }
            if (x.propiedades.sinSodio) {
                let span = document.createElement('span');
                span.className = 'badge badgeRojo';
                span.textContent = 'Bajo Sodio';
                propiedades.appendChild(span);
            }
            if (x.propiedades.esNatural) {
                let span = document.createElement('span');
                span.className = 'badge badgeVerde';
                span.textContent = 'Es Natural';
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
                span.textContent = 'Apto Diabetico';
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
                abrirModalModificarProducto(x)
                

            })
            acciones.appendChild(buttonModify);

            let buttonRemove = document.createElement('button');
            buttonRemove.className = 'button button-remove';
            buttonRemove.textContent = '✖';
            buttonRemove.addEventListener("click", () => {
                preguntaMensaje.fire({
                    title: "Deseas eliminar el producto: " + x.nombre + "?",
                }).then((result) => {
                    if (result.isConfirmed) { borrarProducto(x.codigo, x.nombre) }
                }
                )})
                acciones.appendChild(buttonRemove);

                fila.appendChild(acciones);

                // Añadimos la fila creada al array filas
                filas.push(fila);
            })};


            // Seleccionamos la tabla en el DOM donde se mostrarán los productos
            let tabla = document.querySelector("#product-table");
            tabla.innerHTML = ''; // Limpiamos el contenido existente de la tabla

            // Añadimos cada fila generada a la tabla
            filas.forEach(function (fila) {
                padre.appendChild(fila);
            });

        
    }