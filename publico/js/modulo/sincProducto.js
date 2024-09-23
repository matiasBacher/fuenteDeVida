export {grabarProductos, modificarProducto, borrarProducto, devolverBusquedaProducto}
import {mostrarCarga, ocualtarCarga  } from "./mensajesYCargas.js";
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

    async function borrarProducto(codigo, nombre){ 
        mostrarCarga()

       const f = new FormData();
       f.append("accion","borrar")
       f.append("codigo", codigo);
       let mensaje=-2;
       let nombreProducto=nombre
       
       
       try {
           const response = await fetch('../../app/controlador/controladorProductos.php', {
               method: 'POST',
               body: f
           });
           
           
           if (response.ok) {
               ocualtarCarga()
               let r= await response.json();
               mensaje = r.mensaje;

           } else {
               ocualtarCarga()

               throw new Error('Error al obtener la respuesta del servidor');
           }
       } catch (error) {
           ocualtarCarga()
           console.error('Error:', error);
           // Manejar el error según sea necesario
       }
       ocualtarCarga()
       return mensaje

   }

   async function devolverBusquedaProducto (busqueda){
    mostrarCarga()

    const f = new FormData();
    let productos;
    f.append("accion","busqueda")
    f.append("busqueda", busqueda);
    
    
    try {
        const response = await fetch('../../app/controlador/controladorProductos.php', {
            method: 'POST',
            body: f
        });
        
        if (response.ok) {
            ocualtarCarga()
            productos = await response.json();
        } else {
            ocualtarCarga()
            throw new Error('Error al obtener la respuesta del servidor');
        }
    } catch (error) {
        ocualtarCarga()
        console.error('Error:', error);
        // Manejar el error según sea necesario
    }
    return productos
   }