export {abrirModal, cerrarModal, mostrarCarga, ocualtarCarga, advertenciaMensaje, errorMensaje, okMensaje, preguntaMensaje, inputPreguntaMensaje}
function abrirModal(modal){

    modal.style.display="flex"
}

function cerrarModal(modal) {
    modal.style.display="none"
}
function mostrarCarga(){
    let loader = document.querySelector("#cont-espera")
    loader.style.display="block"
}

function ocualtarCarga(){
    let loader = document.querySelector("#cont-espera")
    loader.style.display="none"

}
const base = Swal.mixin({background:"#d6dfee"})

const advertenciaMensaje = base.mixin({confirmButtonText:"Volver"})
const errorMensaje = advertenciaMensaje.mixin({icon: "error"})
const okMensaje = base.mixin({icon: "success"})
const preguntaMensaje= Swal.mixin({
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Aceptar",
    cancelButtonText: "Cancelar",})

const inputPreguntaMensaje = preguntaMensaje.mixin({
    icon: "question",
    input: 'text',
})
//const advertenciaMensaje = Swal.mixin({confirmButtonText:"Volver", background:"#d6dfee", showConfirmButton: false,})
