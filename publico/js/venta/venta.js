import{consultarVentas} from "../../../publico/js/modulo/sincVenta.js"
import { tablaVentas } from "./tablaVenta.js"
export{recargarTabla}
const rangoMinimo = document.getElementById("rangoMinimo")
const rangoMaximo = document.getElementById("rangoMaximo")

const fechaDesde= document.getElementById("fechaDesde")
const fechaHasta= document.getElementById("fechaHasta")

const mediosPago = Array.from(document.querySelectorAll(".switch>input"))


//mostrar valor de rango
function mostrarValorRango(rango){
    let mostrador= rango.parentElement.querySelector(".mostradorRango")
    mostrador.textContent = rango.value
    rango.addEventListener("input",()=>{

    mostrador.textContent = rango.value
    })
}
mostrarValorRango(rangoMinimo)
mostrarValorRango(rangoMaximo)


let filtros={
}
definirFiltros()
function definirFiltros(){

    const arr=mediosPago.filter((x)=>x.checked)
    const arrId=[]

    if (arr.length==0){
    mediosPago.forEach(x => arrId.push(x.value))
    }
    else{
    arr.forEach(x => arrId.push(x.value))
    }

    filtros = {
            minimo: rangoMinimo.value,
            maximo: rangoMaximo.value,
            inicio: fechaDesde.value,
            final: fechaHasta.value,

            mediosDePago: arrId
        };
}
let estaCorriendo = false
async function  recargarTabla(){
    if(estaCorriendo) return
    try{
    estaCorriendo=true
    definirFiltros()
    DOMVentas.innerHTML=""
    DOMVentas.appendChild(tablaVentas(await consultarVentas(filtros)))
    }
    catch(e){
        console.error("error",e)
    }
    finally{
        estaCorriendo=false
    }
}
const DOMVentas=document.getElementById("ventas")
let elementoFiltro=[rangoMaximo, rangoMinimo, fechaDesde, fechaHasta, ...mediosPago] 
elementoFiltro.forEach(x => {
    x.addEventListener("change", async ()=>{
        await recargarTabla()
        
    })
    
    
});
recargarTabla()
