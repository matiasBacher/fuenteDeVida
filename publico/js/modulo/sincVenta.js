
import { mostrarCarga, ocualtarCarga, errorMensaje } from "./mensajesYCargas.js";
export{consultarVentas, altaVenta, consultarVentasCorregidas, registrarModVenta}
async function consultarVentas(filtro){
const f = new FormData();
f.append("accion", "consultarVentas" )
f.append("filtro", JSON.stringify(filtro))
let mensaje;
let ventas;
mostrarCarga()

try{
    const r = await fetch("../../../app/controlador/controladorVentas.php",{
        body: f,
        method:"POST"
    })
    if(r.ok){
        ocualtarCarga();
        ventas= await r.json();
        return ventas
    }
    else{
        ocualtarCarga();
        errorMensaje.fire({Text:"Error al colsultar las ventas."});
    }
}
    catch(e){
        ocualtarCarga();
        alert(e);
    }
    return
}

async function altaVenta(metodoPago, detalleVenta ){
    let mensaje;
    const f = new FormData();
    f.append("accion", "altaVenta")
    f.append("metodo", metodoPago)
    f.append("detalleVenta", JSON.stringify(detalleVenta));

    mostrarCarga();
    try{
        const r= await fetch("../../../app/controlador/controladorVentas.php", {
            body:f,
            method:"POST"
        })

        if(r.ok){
            ocualtarCarga();
            mensaje= await r.json();
            return mensaje;
        }
        else{
            ocualtarCarga()
            mensaje.mensaje= -3;
            return mensaje;
        }
    }
    catch{
            ocualtarCarga()
            mensaje.mensaje= -3;
            return mensaje;
    }
}


async function registrarModVenta(idVentaMod, metodoPagoNew, detalleVentaNew, RazonMod ){
    let mensaje;
    const f = new FormData();
    f.append("accion", "registrarModificacionVenta")
    f.append("metodo", metodoPagoNew)
    f.append("detalleVenta", JSON.stringify(detalleVentaNew));
    f.append("idVentaModificar",idVentaMod)
    f.append("motivoCorreccionVenta",RazonMod)

    mostrarCarga();
    try{
        const r= await fetch("../../../app/controlador/controladorVentas.php", {
            body:f,
            method:"POST"
        })

        if(r.ok){
            ocualtarCarga();
            mensaje= await r.json()
            return mensaje;
        }
        else{
            ocualtarCarga()
            mensaje= -3;
            return mensaje;
        }
    }
    catch{
            ocualtarCarga()
            mensaje= -3;
            return mensaje;
    }
}

async function consultarVentasCorregidas(idVentaConsultar){
    const f = new FormData();
    f.append("accion", "consultarVentasCorregidas" )
    f.append("ultimo", idVentaConsultar )
    let mensaje;
    let ventas;
    mostrarCarga()
    
    try{
        const r = await fetch("../../../app/controlador/controladorVentas.php",{
            body: f,
            method:"POST"
        })
        if(r.ok){
            ocualtarCarga();
            ventas= await r.json();
        }
        else{
            ocualtarCarga();
            errorMensaje.fire({tit:"Error al colsultar las ventas."});
        }
    }
        catch{
            ocualtarCarga();
            errorMensaje.fire({Text:"Error al colsultar las ventas."});
        }
        return ventas;
    }