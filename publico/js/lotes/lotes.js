
import{contenedorCuadroProductoLotes} from "../componente/contenedorCuadroProductoLotes.js"
import { abrirModal } from "../modulo/mensajesYCargas.js"
import { consultaLote } from "../modulo/sincLote.js"



const contenedor= document.querySelector("contenedor-cuadro-productos-lotes")


 const elementoFltro={
 busqueda: document.querySelector("#buscador"),
 ordenProductos: document.querySelector("#selectFiltroProductos"),

 ordenLotes: document.querySelector("#selectFiltroLotes"),
 ingMin: document.querySelector("#ingreso-desde"),
 ingMax: document.querySelector("#ingreso-hasta"),
 venMin: document.querySelector("#vencimiento-desde"),
 venMax: document.querySelector("#vencimiento-hasta")
 }

 const modalAgregModif = document.querySelector("#modalAgregMod")

const elementoModAgreg = {
    proveedor: document.querySelector("#proveedor"),
    cantidad: document.querySelector("#cantidad"),
    vencimiento: document.querySelector("#vencimiento"),
    ingreso: document.querySelector('#ingreso'),
    id: document.querySelector("codigo-lote"),
    producto:{
            codigo:document.querySelector("#codigoProductoModAgr > .contProd"),
            nombre:document.querySelector("#nombreProductoModAgr > .contProd"),
            }
}
function annadirProductoModal(producto){
    Object.keys(elementoModAgreg.producto).forEach(k=>{
        elementoFltro.producto[k].textContent= producto[k]

    })
}
 function retonarValue(objeto){
    let objetoRetorno ={}
    Object.keys(objeto).forEach((k,i)=>{
        objetoRetorno[k] =objeto[k].value
    })
    return objetoRetorno
 }
 const eventoBusqueda= (evento)=>{
    let e= new CustomEvent("buscarLotesProductos",
        {detail:{
            objeto:retonarValue(elementoFltro),
            },
            bubbles:true,
        }
    )
    let emisor = evento.target
    emisor.dispatchEvent(e)


}

 Object.keys(elementoFltro).forEach(x=>{
    if(x=="buscador"){
        elementoFltro[x].addEventListener("keyup", eventoBusqueda)
    }
    else{
        elementoFltro[x].addEventListener("change", eventoBusqueda)
    }
 })




var contador


document.addEventListener("buscarLotesProductos", (e)=>{
    
    if(contador){
        clearTimeout(contador)
    }
    contador=setTimeout(async ()=>{
        let respuesta = await consultaLote(e.detail.objeto)
        contenedor.productos=respuesta.resultadoBusqueda

    },1000)
})

let modoModificar = false
document.addEventListener("annadirLote",(e)=>{
    let producto = e.detail.producto
    annadirProductoModal(producto)
    abrirModal(modalAgregModif)

})



