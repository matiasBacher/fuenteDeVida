// Obtener los elementos del DOM
var modalCat = document.getElementById("AgregarCategoria");
var openModalCat = document.getElementById("openModalCat");
var closeModalCat = document.getElementById("closeModalCategoria");
var addBtn = document.getElementById("addBtn");
var newCategory = document.getElementById("newCategory");
var categoriesList = document.getElementById("categoriesList");

let categoriaEnMemoria;
async function cargarCategorias(bandera =1){ //busca las categorias en la BD
    const f = new FormData();
    let categorias;
    f.append("accion", "buscarTodo");

    try {
        const response = await fetch('../../app/controlador/controladorCategorias.php',
            {method:'POST',
            body: f}
        );

        if(response.ok){
            categorias = await response.json();
        } else {
            throw new Error('Error al obtener la respuesta del servidor')
        }
        } catch (error) {
            console.error('Error:', error);
            // Manejar el error según sea necesario
        }
        categoriaEnMemoria = categorias;
        if(bandera==1){
            dibujarCategorias();
        }
        if(bandera==2){
            dibujarSelect();
        }
        if(bandera==3){
            abrirModal(modalModifPro)
            MdibujarSelect()
            cargarInput(productoSeleccionado, elemModifProd)
        }
}



function dibujarCategorias(){
    while (categoriesList.firstChild){
        categoriesList.removeChild(categoriesList.firstChild);
      };


    for(let i=0; i<categoriaEnMemoria.length; i++){
        let categoryItem = document.createElement("div");
        categoryItem.className = "category-item";
        categoryItem.innerHTML = 
        `${categoriaEnMemoria[i].nombre} 
        <button id="btd-${categoriaEnMemoria[i].id}" 
        value="${categoriaEnMemoria[i].nombre}"
        class="deleteBtn">&times;</button>`;

        // Agregar el nuevo elemento a la lista
        categoriesList.appendChild(categoryItem);

        let deleteBtn = categoryItem.querySelector(".deleteBtn");
        deleteBtn.addEventListener("click",eliminarCategoria);
    }
}
async function eliminarCategoria(e){
    let nodo = e.target
    let id = nodo.id.slice(4);
    let respuesta;
    f= new FormData();
    f.append("accion", "eliminar")
    f.append("id", id);

    try {
        const response =  await fetch('../../app/controlador/controladorCategorias.php',
            {method:'POST',
            body: f}
        );

        if(response.ok){
            respuesta = await response.json();
        } else {
            throw new Error('Error al obtener la respuesta del servidor')
        }
        } catch (error) {
            console.error('Error:', error);
            // Manejar el error según sea necesario
        }
        if(respuesta.mensaje==-1){
            Swal.fire({confirmButtonText:"Volver",text:`No se pudieron actualizar los productos con categoria ${nodo.value}`, background:"#d6dfee",icon: "error", showConfirmButton: false,})
            return;
        }
        if(respuesta.mensaje==0){
            Swal.fire({confirmButtonText:"Volver",text:`No se pudo eliminar $`, background:"#d6dfee",icon: "error", showConfirmButton: false,})         
            return;
        }
        if(respuesta.mensaje==1){
            cargarCategorias();
            dibujarCategorias();
            Swal.fire({customclass: {confirmButton:"custombutton"},text:`La Categoria "${nodo.value}" fue eliminada`,icon: "success",background:"#d6dfee"})
            return;
            }


}
async function insertarcategorias(nombre) {
    if (nombre === "") {
        Swal.fire({confirmButtonText:"Volver",text:"Por favor, ingrese un nombre de categoría.", background:"#d6dfee", showConfirmButton: false,}) 
        return;
    }
    const f = new FormData();
    let respuesta;
    f.append("accion", "insertar")
    f.append("nombre", nombre)

    try {
        const response = await fetch('../../app/controlador/controladorCategorias.php',
            {
                method: 'POST',
                body: f
            }
        );

        if (response.ok) {
            respuesta = await response.json();
        } else {
            throw new Error('Error al obtener la respuesta del servidor')
        }
    } catch (error) {
        console.error('Error:', error);
        // Manejar el error según sea necesario
    }
    let mensaje=respuesta.mensaje;
    // Verificar si la categoría ya existe
    if (mensaje == -1) {
        Swal.fire({confirmButtonText:"Volver",text:"Esta categoría ya existe.", background:"#d6dfee",icon: "error", showConfirmButton: false,})  
        return;
    }

    if (mensaje == 0) {
        Swal.fire({confirmButtonText:"Volver",text:"error al cargar los datos en la base de datos", background:"#d6dfee",icon: "error", showConfirmButton: false,})        
        return
    }
    if (respuesta.mensaje == 1) {
        cargarCategorias();
        dibujarCategorias();
        Swal.fire({customclass: {confirmButton:"custombutton"},text:`La categoria "${nombre}" fue cargada correctamente`,icon: "success",background:"#d6dfee"})
        // Limpiar el campo de entrada
        newCategory.value = "";
        return
    }






}

// Abrir la ventana flotante cuando se hace clic en el botón
openModalCat.onclick = function() {
    modalCat.style.display = "flex";
   cargarCategorias(); 
}

closeModalCat.onclick = function() {
    modalCat.style.display = "none";
}


// formar tablas de categorías
addBtn.onclick = function () {
    Swal.fire({
        title: "Deseas eliminar la categoría: " +newCategory.value.trim()+ "?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Aceptar",
        cancelButtonText: "Cancelar",
    }).then((result) => {
        if (result.isConfirmed) {
            insertarcategorias(newCategory.value.trim())
        }
    })

}





