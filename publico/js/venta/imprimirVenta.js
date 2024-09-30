import { imprimirVenta } from "../modulo/imprimirVenta.js";
import { DOMVentas } from "./venta.js";
export{eventoImprimir}
function eventoImprimir() {
DOMVentas.addEventListener("click", (e)=>{
    let receptor=e.target
    console.log(receptor)
    if(receptor.matches(".button-imprimir")){
        let venta = receptor.parentElement.parentElement.venta
        imprimirVenta(venta)


    }
})
}
