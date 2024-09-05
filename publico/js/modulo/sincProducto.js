export {grabarProductos, modificarProducto}
async function grabarProductos(form){
    mostrarCarga()

    const f = new FormData(form);
    let respuesta;
    f.append("accion", "insertar")

    try {
        const response = await fetch('../../app/controlador/controladorProductos.php',
            {
                method: 'POST',
                body: f
            }
        );

        if (response.ok) {
            ocualtarCarga()
            respuesta = await response.json();
        } else {
            throw new Error('Error al obtener la respuesta del servidor')
            ocualtarCarga()

        }
    } catch (error) {
        ocualtarCarga()

        console.error('Error:', error);
        // Manejar el error según sea necesario
    }
    ocualtarCarga()
    return respuesta.mensaje

}

async function modificarProducto(formulario, codigo){ //busca las categorias en la BD
    mostrarCarga()

    const f = new FormData(formulario);
    let categorias;
    f.append("accion", "actualizar");
    f.append("codigo", codigo)

    try {
        const response = await fetch('../../app/controlador/controladorProductos.php',
            {method:'POST',
            body: f}
        );

        if(response.ok){
            respuesta = await response.json();
            ocualtarCarga()
        } else {
            ocualtarCarga()
            throw new Error('Error al obtener la respuesta del servidor')
        }
        } catch (error) {
            ocualtarCarga
            console.error('Error:', error);
            // Manejar el error según sea necesario
        }
        ocualtarCarga()
        return respuesta
    }