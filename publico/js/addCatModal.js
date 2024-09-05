import { cargarCategorias, actualizarCategoria, eliminarCategoria, insertarcategorias} from "./sincCat.js";

// Obtener los elementos del DOM
var modalCat = document.getElementById("AgregarCategoria");
var openModalCat = document.getElementById("openModalCat");
var closeModalCat = document.getElementById("closeModalCategoria");
var addBtn = document.getElementById("addBtn");
var newCategory = document.getElementById("newCategory");
var categoriesList = document.getElementById("categoriesList");

let categoriaEnMemoria;




function dibujarCategorias(){
        categoriesList.innerHTML="";
 


    for(let i=0; i<categoriaEnMemoria.length; i++){
        let nombre=categoriaEnMemoria[i].nombre;
        let id=categoriaEnMemoria[i].id
        
        let categoryItem = document.createElement("div");
        categoryItem.className = "category-item";

        let label = document.createElement("div")
        label.className = "label-categoria";
        label.innerHTML=
        `${nombre}`;
        categoryItem.appendChild(label)

        let modifyBtn= document.createElement("button");
        modifyBtn.className = 'button button-modify'
        modifyBtn.innerHTML = '🖊'

        modifyBtn.addEventListener("click", ()=>{
            inputPreguntaMensaje.fire({title:"cual es el nuevo nombre de la categoría?"})
            .then(async (r)=>{
                if (r.isConfirmed){
                   let m=await actualizarCategoria(id, r.value)
                   categoriaEnMemoria=await cargarCategorias()
                   dibujarCategorias()
                   if(m==-1){
                    errorMensaje.fire({text:`La categoría ${r.value} ya existe`})
                    return;
                }
                if(m==0){
                    errorMensaje.fire({text:`No se pudo actualizar la categoria ${nombre}`})         
                    return;
                }
                if(m==1){
                    okMensaje.fire({text:`La Categoria "${nombre}" fue actualizada por ${r.value}`})
                    return;
                    }}
                
            })
        })



        categoryItem.appendChild(modifyBtn)


        
        let deleteBtn = document.createElement("button");
        deleteBtn.className='button button-remove' 
        deleteBtn.innerHTML='&times'

      

        deleteBtn.addEventListener("click",async()=>  {
            preguntaMensaje.fire({
                title: "Deseas eliminar la categoría: " +nombre.trim()+ "?"
            }).then(async (result) => {
                if (result.isConfirmed) { 
                    let m=await eliminarCategoria(id,nombre)
                    if(m==-1){
                        errorMensaje.fire({text:`No se pudieron actualizar los productos con categoria ${nombre}`})
                    }
                    else if(m==0){
                        errorMensaje.fire({text:`No se pudo eliminar ${nombre}`})         
                    }
                    else if(m==1){
                        categoriaEnMemoria=await cargarCategorias();
                        dibujarCategorias();
                        okMensaje.fire({text:`La Categoria "${nombre}" fue eliminada`})
                        }
            

                }
            }
        )

        });
        categoryItem.appendChild(deleteBtn)
        // Agregar el nuevo elemento a la lista
        categoriesList.appendChild(categoryItem);
    }
}










// Abrir la ventana flotante cuando se hace clic en el botón
openModalCat.onclick = async function() {
    modalCat.style.display = "flex";
    categoriaEnMemoria=await cargarCategorias() 
    dibujarCategorias()
}

closeModalCat.onclick = function() {
    modalCat.style.display = "none";
}


// formar tablas de categorías
addBtn.onclick = function () {
    let nombreCategoria = newCategory.value.trim()
    preguntaMensaje.fire({
        title: "Deseas agregar la categoría: " +nombreCategoria+ "?",

    }).then(async (result) => {
        if (result.isConfirmed) {
            let m = await insertarcategorias(nombreCategoria)
            categoriaEnMemoria= await cargarCategorias()
            dibujarCategorias();
    // Verificar si la categoría ya existe
    if (m == -1) {
        errorMensaje.fire({text:"Esta categoría ya existe."})  
    }

    else if (m == 0) {
        errorMensaje.fire({text:"error al cargar los datos en la base de datos"})        
    }
    else if (m == 1) {
        okMensaje.fire({text:`La categoria "${nombreCategoria}" fue cargada correctamente`})
        // Limpiar el campo de entrada
        newCategory.value = "";
    }

        }
    })

}





