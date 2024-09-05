import { crearTabla } from "../modulo/crearTablaProducto";
let productosEnMemoria;
let productosEnMemoriaSinFiltrar;
let productoSeleccionado


const npro = document.querySelector("#nProducto")

async function devolverBusquedaProducto (busqueda){
    mostrarCarga()

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
            ocualtarCarga()
            productos = await response.json();
        } else {
            ocualtarCarga()
            throw new Error('Error al obtener la respuesta del servidor');
        }
    } catch (error) {
        ocualtarCarga()
        console.error('Error:', error);
        // Manejar el error según sea necesario
    }
    return productos
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

function filtrar( bandera=true, filtro, memoria, memoriaSinFiltro){
    memoria=memoriaSinFiltro;
    let productosFiltrados = memoria.filter(x => {
        for (let i = 0; i < filtro.length; i++) {
            if (x.propiedades[filtro[i]]) {
            }
            else{
                return false
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
                 mostrarCarga()

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
                        ocualtarCarga()
                        let r= await response.json();
                        mensaje = r.mensaje;

                    } else {
                        ocualtarCarga()

                        throw new Error('Error al obtener la respuesta del servidor');
                    }
                } catch (error) {
                    ocualtarCarga()
                    console.error('Error:', error);
                    // Manejar el error según sea necesario
                }

                if(mensaje==-2){
                    errorMensaje.fire({text:"Error desconocido"})                   
                    return;
                }
                if(mensaje==-1 || mensaje==0){
                    errorMensaje.fire({text:"No se pudo Borrar el producto: "+nombreProducto})
                    return;
                }
                if(mensaje==1){
                    devolverBusquedaProducto(buscarElemento.value)
                    okMensaje.fire({text:"El producto: "+nombreProducto+" se ha borrado"})
                    return; 
                }
            }
        







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


const abrirpdf = document.querySelector("#openPDF")

abrirpdf.addEventListener("click",()=>{abrirNuevoTab("app/vista/pdf/productoPDF.php")})


const buscarTodo = document.querySelector("#allProduct")
buscarTodo.addEventListener("click", ()=> {
    devolverBusquedaProducto("")
})