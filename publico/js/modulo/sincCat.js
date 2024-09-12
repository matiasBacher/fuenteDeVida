export{cargarCategorias, actualizarCategoria, eliminarCategoria, insertarcategorias}

async function cargarCategorias(){ //busca las categorias en la BD
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
        ocualtarCarga()
        return categorias;
    
}

async function actualizarCategoria(id,  nombreNuevo){
    mostrarCarga()
    let respuesta;
    let f=new FormData();
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
    ocualtarCarga
    return respuesta.mensaje
}

        async function eliminarCategoria(id, nombre){
            let respuesta;
            let f= new FormData();
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
                    ocualtarCarga()
                }
                } catch (e) {
                    errorMensaje.fire({text:`ERROR: ${e}`})
                    ocualtarCarga()
                    // Manejar el error según sea necesario
                }
                ocualtarCarga()
                return respuesta.mensaje
       
        
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
            ocualtarCarga()
            return respuesta.mensaje;
        }