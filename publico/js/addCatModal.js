// Obtener los elementos del DOM
var modalCat = document.getElementById("AgregarCategoria");
var openModalCat = document.getElementById("openModalCat");
var closeModalCat = document.getElementById("closeModalCategoria");
var addBtn = document.getElementById("addBtn");
var newCategory = document.getElementById("newCategory");
var categoriesList = document.getElementById("categoriesList");

let categoriaEnMemoria;
async function cargarCategorias(bandera =1){ //busca las categorias en la BD
    mostrarCarga()
    const f = new FormData();
    let categorias;
    f.append("accion", "buscarTodo");

    try {
        const response = await fetch('../../app/controlador/controladorCategorias.php',
            {method:'POST',
            body: f}
        );

        if(response.ok){
            ocualtarCarga()
            categorias = await response.json();
        } else {
            ocualtarCarga()

            throw new Error('Error al obtener la respuesta del servidor')
        }
        } catch (error) {
            ocualtarCarga()

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
        categoriesList.innerHTML="";
 


    for(let i=0; i<categoriaEnMemoria.length; i++){
        let categoryItem = document.createElement("div");
        categoryItem.className = "category-item";

        let label = document.createElement("div")
        label.className = "label-categoria";
        label.innerHTML=
        `${categoriaEnMemoria[i].nombre}`;
        categoryItem.appendChild(label)

        let modifyBtn= document.createElement("button");
        modifyBtn.className = 'button button-modify'
        modifyBtn.innerHTML = '🖊'

        modifyBtn.addEventListener("click", ()=>{
            inputPreguntaMensaje.fire({title:"cual es el nuevo nombre de la categoría?"})
            .then(async (r)=>{
                if (r.isConfirmed){
                   await actualizarCategoria(categoriaEnMemoria[i].id, categoriaEnMemoria[i].nombre,r.value)
                   await cargarCategorias()
                }
            })
        })



        categoryItem.appendChild(modifyBtn)


        
        let deleteBtn = document.createElement("button");
        deleteBtn.className='button button-remove' 
        deleteBtn.innerHTML='&times'

      

        deleteBtn.addEventListener("click",()=>  {
            preguntaMensaje.fire({
                title: "Deseas eliminar la categoría: " +categoriaEnMemoria[i].nombre.trim()+ "?"
            }).then((result) => {
                if (result.isConfirmed) {
                    eliminarCategoria(categoriaEnMemoria[i].id,categoriaEnMemoria[i].nombre)
                }
            }
        )

        });
        categoryItem.appendChild(deleteBtn)
        // Agregar el nuevo elemento a la lista
        categoriesList.appendChild(categoryItem);
    }
}
async function actualizarCategoria(id, nombreViejo, nombreNuevo){
    mostrarCarga()
    let respuesta;
    f=new FormData();
    f.append("accion", "actualizar")
    f.append("id", id)
    f.append("nombre", nombreNuevo)

    try{
        const r = await fetch('../../app/controlador/controladorCategorias.php',
            {method:'POST',
            body: f});
            if(r.ok){
                respuesta = r.json()
            }
            else{
                ocualtarCarga
                errorMensaje.fire({text:"Error al obtener la respuesta del servidor"})
            }
    }
    catch(e){
        ocualtarCarga
        errorMensaje.fire({text:`ERROR: ${e}`})
    }
    if(respuesta.mensaje==-1){
        ocualtarCarga
        errorMensaje.fire({text:`La categoría ${nombreNuevo} ya existe`})
        return;
    }
    if(respuesta.mensaje==0){
        ocualtarCarga
        errorMensaje.fire({text:`No se pudo actualizar la categoria ${nombreViejo}`})         
        return;
    }
    if(respuesta.mensaje==1){
        ocualtarCarga
        cargarCategorias();
        okMensaje.fire({text:`La Categoria "${nombreViejo}" fue actualizada por ${nombreNuevo}`})
        return;
        }}
async function eliminarCategoria(id, nombre){
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
            errorMensaje.fire({text:"Error al obtener la respuesta del servidor"})
        }
        } catch (e) {
            errorMensaje.fire({text:`ERROR: ${e}`})
            // Manejar el error según sea necesario
        }
        if(respuesta.mensaje==-1){
            errorMensaje.fire({text:`No se pudieron actualizar los productos con categoria ${nombre}`})
            return;
        }
        if(respuesta.mensaje==0){
            errorMensaje.fire({text:`No se pudo eliminar ${nombre}`})         
            return;
        }
        if(respuesta.mensaje==1){
            cargarCategorias();
            dibujarCategorias();
            okMensaje.fire({text:`La Categoria "${nombre}" fue eliminada`})
            return;
            }


}
async function insertarcategorias(nombre) {
    mostrarCarga()
    if (nombre === "") {
        ocualtarCarga()
        advertenciaMensaje.fire({text:"Por favor, ingrese un nombre de categoría."}) 
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
            ocualtarCarga()
            respuesta = await response.json();
        } else {
            ocualtarCarga()
            throw new Error('Error al obtener la respuesta del servidor')
        }
    } catch (error) {
        ocualtarCarga()
        console.error('Error:', error);
        // Manejar el error según sea necesario
    }
    let mensaje=respuesta.mensaje;
    // Verificar si la categoría ya existe
    if (mensaje == -1) {
        errorMensaje.fire({text:"Esta categoría ya existe."})  
        return;
    }

    if (mensaje == 0) {
        errorMensaje.fire({text:"error al cargar los datos en la base de datos"})        
        return
    }
    if (respuesta.mensaje == 1) {
        cargarCategorias();
        dibujarCategorias();
        okMensaje.fire({text:`La categoria "${nombre}" fue cargada correctamente`})
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
    preguntaMensaje.fire({
        title: "Deseas agregar la categoría: " +newCategory.value.trim()+ "?",

    }).then((result) => {
        if (result.isConfirmed) {
            insertarcategorias(newCategory.value.trim())
        }
    })

}





