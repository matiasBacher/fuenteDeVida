import { abrirModal } from "../modulo/mensajesYCargas"

let ventaCargada 


const modalVentaModificar= document.querySelector("#modalModificarVenta")
DOMVentas.addEventListener("click", (e)=>{
    let receptor=e.target
    if(receptor.matches(".button-modify")){
        let elementoVenta = receptor.parentElement.parentElement
        abrirModal(modalVentaModificar)
        ventaCargada=elementoVenta.venta

    }
})