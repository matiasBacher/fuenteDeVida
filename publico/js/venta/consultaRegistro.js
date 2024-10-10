import { abrirModal, cerrarModal, errorMensaje, okMensaje } from "../modulo/mensajesYCargas.js"
import { consultarVentasCorregidas } from "../modulo/sincVenta.js"
import { tablaVentas } from "./tablaVenta.js"

const registrosVentas = []
const modalConsultaVenta =  document.getElementById("modalConsultarModVentas")
const cerrarModalConsultaVenta=document.getElementById("closeModalConsultarVenta")
const contenedor =document.getElementById("contenedorConsulVenta")

cerrarModalConsultaVenta.addEventListener("click",()=>cerrarModal(modalConsultaVenta))



const DOMVentas = document.querySelector("#ventas")


DOMVentas.addEventListener("click",async (e)=>{
    let receptor=e.target
    if(receptor.matches(".button-consultar")){
        contenedor.innerHTML=""

        let venta= receptor.parentElement.parentElement.venta
        abrirModal(modalConsultaVenta)
        registrosVentas.length=0

        registrosVentas.push(...await consultarVentasCorregidas(venta.idVerdadero))
        contenedor.appendChild(tablaVentas(registrosVentas, 
            {razonModificacion:true, identificador:true, tieneID:false, modificar:false, consultar:false}))



    }
})