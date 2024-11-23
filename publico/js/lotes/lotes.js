
import{contenedorCuadroProductoLotes} from "../componente/contenedorCuadroProductoLotes.js"
import { abrirModal, cerrarModal, errorMensaje, okMensaje, preguntaMensaje } from "../modulo/mensajesYCargas.js"
import { altaLote, borrarLote, consultaLote, modificarLote } from "../modulo/sincLote.js"
import {validarVacio} from "../modulo/validaciones.js"



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
let elementoValidar = []
let validador={}
let errorObjeto={}
let manejador=["proveedor", "cantidad", "vencimiento", "ingreso"]
manejador.forEach(k=>{
    elementoValidar.push(elementoModAgreg[k])
    validador[k]=false
    errorObjeto[k]=document.querySelector(`#error-${k}`)

    })
elementoValidar.forEach((x)=>{
    x.addEventListener("blur", ()=>{
        validarVacio(x.id, elementoModAgreg, errorObjeto, "Campo no completado", false, validador )
    })
})

//añade informacion del producto al modal
function annadirProductoModal(producto){
    Object.keys(elementoModAgreg.producto).forEach(k=>{
        elementoModAgreg.producto[k].textContent= producto[k]

    })
}
//añade informacion del lote al modal
function annadirLoteModal(lote, vaciar=false){
    Object.keys(elementoModAgreg).forEach(k=>{
        if(k=="proveedor"){
            elementoModAgreg[k].value=lote.proveedor?lote.proveedor.id:""
        }
        else if(k=="producto"){
            annadirProductoModal(lote.producto)
        }
        else if(k=="cantidad"){
            elementoModAgreg[k].value=lote.inventario
        }
        else{
            elementoModAgreg[k].value=lote[k]??""
        }
    })
}
 
 //retorna valores de objeto con filtros
 function retonarValue(objeto){
    let objetoRetorno ={}
    Object.keys(objeto).forEach((k,i)=>{
        if(objeto[k].value) objetoRetorno[k] =objeto[k].value
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

    elementoValidar.forEach((x)=>{
        let blur= new Event("blur")
        x.dispatchEvent(blur)
    })
    if(Object.keys(validador).every(x=>{return validador[x]})){
        const objeto=retonarValue(elementoModAgreg)//Se saca valores de objeto con elementos del formulario modal
        objeto.producto={}
        objeto.producto.codigo=elementoModAgreg.producto.codigo.textContent //texto de un div
        objeto.producto.nombre=elementoModAgreg.producto.nombre.textContent

        let idProveedor=objeto.proveedor
        objeto.proveedor={}
        objeto.proveedor.id=idProveedor//Se crea un objeto del Con la información del Input
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




}

//añado eventos a los elementos filtros
 Object.keys(elementoFltro).forEach(x=>{
    if(x=="busqueda"){
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
    annadirLoteModal({producto:producto})
    cambiarModoModalLote(false)
    abrirModal(modalAgregModif)

})
//abrir modal modificar lote
document.addEventListener("modificarLote", async (e)=>{
    let lote = e.detail.lote
    annadirLoteModal(lote)
    cambiarModoModalLote(true)
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
        errorMensaje.fire({text:"El lote ya existe"})
        break
    case "errorAlta":
        errorMensaje.fire({text:"Error al grabar el lote"})
        console.log(respuesta.error)
        break
    case "altaExito":
        okMensaje.fire({text:"Lote guardado con el éxito"})
        annadirLoteModal({})
        let input= new Event("keyup")
        elementoFltro.busqueda.dispatchEvent(input)

        break
}
 
})
//modificar lote lote
document.addEventListener("modalModificarLote", async(e)=>{
    let respuesta = await modificarLote(e.detail.lote)
switch(respuesta.mensaje){
    case "loteRepetido":
        errorMensaje.fire({text:"Cambie los datos"})
        break
    case "errorAlta":
        errorMensaje.fire({text:"Error al modificar lote "})
        console.log(respuesta.error)
        break
    case "modificacionExito":
        okMensaje.fire({text:"Lote modificado con el éxito"})
        cerrarModal(modalAgregModif)
        let keyup= new Event("keyup")
        elementoFltro.busqueda.dispatchEvent(keyup)
    
        break
}
 
})

//borrar lote
document.addEventListener("borrarLote",(e)=>{
    preguntaMensaje.fire({
        title:`Desea eliminar el lote con codigo: ${e.detail.lote.id}`
    }).then(async (result) => {
        if (result.isConfirmed) { 
          let respuesta = await borrarLote(e.detail.lote)
          switch(respuesta.mensaje){
           case "exitoBorrado":
            okMensaje.fire({text: `El lote numero: ${e.detail.lote.id} fue borrado con exitosamente`})
            break
        case "errorLoteNulo":
            okMensaje.fire({text: `No existe el lote número: ${e.detail.lote.id}`})
            break
        case "errorBorrado":
            okMensaje.fire({text:`Error al borrar el lote`})
            console.log(respuesta.error)

          }

        }
    })

})

