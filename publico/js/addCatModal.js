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
        if(bandera=2){
            dibujarSelect();
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
            alert(`No se pudieron actualizar los productos con categoria ${nodo.value}`)
            return;
        }
        if(respuesta.mensaje==0){
            alert(`No se pudo eliminar $`)
            return;
        }
        if(respuesta.mensaje==1){
            cargarCategorias();
            dibujarCategorias();
            alert(`La Categoria ${nodo.value} fue eliminada`);
            return;
            }


}
async function insertarcategorias(nombre) {
    if (nombre === "") {
        alert("Por favor, ingrese un nombre de categoría.");
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
        alert("Esta categoría ya existe.");
        return;
    }

    if (mensaje == 0) {
        alert("error al cargar los datos en la base de datos")
        return
    }
    if (respuesta.mensaje == 1) {
        cargarCategorias();
        dibujarCategorias();
        alert(`la categoria ${nombre} fue cargada correctamente`)
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
addBtn.onclick = function() {
    insertarcategorias(newCategory.value.trim())

    }





