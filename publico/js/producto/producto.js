import { crearTabla } from "../modulo/crearTablaProducto.js";
import { productosEnMemoria, productosEnMemoriaSinFiltrar, setProductosEnMemoria, setProductosEnMemoriaSinFiltrar } from "./variablesGlobales.js";
import { devolverBusquedaProducto } from "../modulo/sincProducto.js";
export{hacerTabla}
import {mostrarCarga, ocualtarCarga } from "../modulo/mensajesYCargas.js";
import { abrirNuevoTab } from "../main.js";


const npro = document.querySelector("#nProducto")



   function convertirCheckboxesAObjeto() {
    // Seleccionar todos los hijos input[type=checkbox] dentro del elemento con id 'filter-box'
    const checkboxes = Array.from(document.querySelectorAll('#filter-box input[type="checkbox"]'));
    const checkboxArray = [];

    let checkboxesFiltrado = checkboxes.filter(x=>x.checked);
    checkboxesFiltrado.forEach(x=>{
        checkboxArray.push(x.id)
    })
    return checkboxArray;
}

function filtrar( filtro, memoria){
    
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
    return productosFiltrados
}
        const orden = document.getElementById("orden").value;
function ordenar( orden, memoria){
    let x=memoria
    x.sort((a, b) => {
        if (a[orden] < b[orden]) {
            return -1;
        }
        else if (a[orden] > b[orden]) {
            return 1
        } else {
            return 0;
        }
    })
    return x
}







const tabla = document.getElementById('product-table')

const ordenElemento = document.querySelector("#orden")

const buscarElemento = document.querySelector("#buscarProducto");

const checkboxes = Array.from(document.querySelectorAll('#filter-box input[type="checkbox"]'))



async function hacerTabla (b=true, busca=buscarElemento.value ){
    if(b){
        setProductosEnMemoriaSinFiltrar(await devolverBusquedaProducto(busca))
    }
    let orden = ordenElemento.value;
    setProductosEnMemoria(productosEnMemoriaSinFiltrar)
    setProductosEnMemoria(filtrar(convertirCheckboxesAObjeto(),productosEnMemoria))
    setProductosEnMemoria(ordenar(orden,productosEnMemoria))

    crearTabla(productosEnMemoria, tabla)
}
buscarElemento.addEventListener('keyup',()=>hacerTabla())
ordenElemento.addEventListener("change", ()=>hacerTabla(false))

checkboxes.forEach(x=>{
    x.addEventListener("change",()=>hacerTabla(false))
})


const abrirpdf = document.querySelector("#openPDF")

abrirpdf.addEventListener("click",()=>{abrirNuevoTab("app/vista/pdf/productoPDF.php")})


const buscarTodo = document.querySelector("#allProduct")
buscarTodo.addEventListener("click", ()=> {
    hacerTabla(undefined, "")
})