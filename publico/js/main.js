
export{abrirNuevoTab}
const botonCerrarSeccion = document.getElementById("logOutCont")
botonCerrarSeccion.addEventListener("click", ()=>{
    preguntaMensaje.fire({title:"Quiere cerrar la seccion?"})
    .then(e=>{
        if(e.isConfirmed){window.location.assign("/logout.php")}
    })
    })

    function abrirNuevoTab(url) {
        // Abrir nuevo tab
        var win = window.open(url, '_blank');
        // Cambiar el foco al nuevo tab (punto opcional)
        win.focus();
      }


 