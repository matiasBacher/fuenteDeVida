export {dibujarCategorias }
function dibujarCategorias(padre, memoria){
    padre.innerHTML="";



for(let i=0; i<memoria.length; i++){
    let nombre=memoria[i].nombre;
    let id=memoria[i].id
    
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
    padre.appendChild(categoryItem);
}
}