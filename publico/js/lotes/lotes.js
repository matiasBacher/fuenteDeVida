
import{contenedorCuadroProductoLotes} from "../componente/contenedorCuadroProductoLotes.js"
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

