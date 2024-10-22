import { mostrarCarga, ocualtarCarga } from "./mensajesYCargas.js";

export async function altaLote(objeto){
    return await base("alta",objeto)
}

export async function borrarLote(objeto){
    return await base("borrar",objeto)
}

export async function modificarLote(objeto){

    return await base("modificar",objeto)
}

export async function consultaLote(objeto){
        let objetoAEnviar={
        orden:{
            ordenLotes:"id",
            ordenProductos:"codigo",
        },
        filtros:{
            busqueda:1,
            venMax:new Date().toISOString().split("T")[0],
            venMin: "1970-01-01",
            ingMax: new Date().toISOString().split("T")[0],
            ingMin: "1970-01-01",
        }, ...objeto

    }
    return await base("consulta",objetoAEnviar)
}

async function base(accion, objeto){
    const f = new FormData;
    mostrarCarga()
    f.append("accion", accion)
    f.append("objeto", JSON.stringify(objeto))
    let mensaje

    try{
        const respuesta = await fetch("../../app/controlador/ControladorLote.php",{
                method: 'POST',
                body: f
        })
        if(respuesta.ok){
            mensaje= respuesta.json();
            ocualtarCarga()

        }
        else{
            mensaje.mensaje="errorConnServer"
            ocualtarCarga()
        }
    }
    catch(error){
        console.error(error)
        ocualtarCarga;


        }
    return respuesta


}
