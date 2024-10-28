
import{contenedorCuadroProductoLotes} from "../componente/contenedorCuadroProductoLotes.js"
import { abrirModal, cerrarModal, errorMensaje, okMensaje } from "../modulo/mensajesYCargas.js"
import { altaLote, consultaLote } from "../modulo/sincLote.js"



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
 const botonAgregarModificar= document.querySelector(".modal-footer").querySelector("button")
 const cerraModalAgregModif=document.querySelector("#closeModalConsultarVenta")

const elementoModAgreg = {
    proveedor: document.querySelector("#proveedor"),
    cantidad: document.querySelector("#cantidad"),
    vencimiento: document.querySelector("#vencimiento"),
    ingreso: document.querySelector('#ingreso'),
    id: document.querySelector("#codigo-lote"),
    producto:{
            codigo:document.querySelector("#codigoProductoModAgr > .contProd"),
            nombre:document.querySelector("#nombreProdutoModAgr > .contProd"),
            }
}
//añade informacion del producto al modal
function annadirProductoModal(producto){
    Object.keys(elementoModAgreg.producto).forEach(k=>{
        elementoModAgreg.producto[k].textContent= producto[k]

    })
}
 //retorna valores de objeto con filtros
 function retonarValue(objeto){
    let objetoRetorno ={}
    Object.keys(objeto).forEach((k,i)=>{
        objetoRetorno[k] =objeto[k].value??{}
    })
    return objetoRetorno
 }
 //fumcion para crear un evento para enviar informaciom de la busqueda
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
//funcion para modificar el modal segun si es para agregar lotes o modificarlo
let modoModificar= false
const cambiarModoModalLote=(valor=null)=>{
    if(valor!==null)modoModificar=valor
    
    const codigoLote=elementoModAgreg.id.parentElement
    if(modoModificar){
        codigoLote.classList.remove("oculto")
        botonAgregarModificar.textContent="modificar"
    }
    else{
        codigoLote.classList.add("oculto")
        botonAgregarModificar.textContent="agregar"
        
    }

    }
function eventoBotonAgregarModificar(e){
    const objeto=retonarValue(elementoModAgreg)
    objeto.producto.codigo=elementoModAgreg.producto.codigo.textContent
    objeto.producto.nombre=elementoModAgreg.producto.nombre.textContent

    let idProveedor=objeto.proveedor
    objeto.proveedor={}
    objeto.proveedor.id=idProveedor
    let evento;
    if(modoModificar){
        evento= new CustomEvent("modalModificarLote",{

            detail:{
                lote:objeto
            },
            bubbles:true
        })

    }
    else{
         evento= new CustomEvent("modalAnnadirLote",{
            detail:{
                lote:objeto
            },
            bubbles:true
        })
    }
    e.target.dispatchEvent(evento)




}

//añado eventos a los elementos filtros
 Object.keys(elementoFltro).forEach(x=>{
    if(x=="buscador"){
        elementoFltro[x].addEventListener("keyup", eventoBusqueda)
    }
    else{
        elementoFltro[x].addEventListener("change", eventoBusqueda)
    }
 })



// evento que dispara la busqueda de lotes
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

const loteAlta={

}
//abrir modal agregar lote
document.addEventListener("annadirLote",(e)=>{
    let producto = e.detail.producto
    annadirProductoModal(producto)
    cambiarModoModalLote(false)
    abrirModal(modalAgregModif)

})
//cerrar Modal
cerraModalAgregModif.addEventListener("click", ()=>cerrarModal(modalAgregModif))
botonAgregarModificar.addEventListener("click", eventoBotonAgregarModificar)

//agregar lote
document.addEventListener("modalAnnadirLote", async(e)=>{
    let respuesta = await altaLote(e.detail.lote)
switch(respuesta.mensaje){
    case "loteRepetido":
        errorMensaje.fire({Text:"El lote ya existe"})
        break
    case "errorAlta":
        errorMensaje.fire({Text:"Error al grabar el lote"})
        console.log(respuesta.error)
        break
    case "altaSxito":
        okMensaje.fire({Text:"Lote guardado con el éxito"})
        break
}
 
})


