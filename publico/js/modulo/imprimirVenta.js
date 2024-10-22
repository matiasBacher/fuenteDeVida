import { tablaResumen } from "../caja/carrito.js"
export{imprimirVenta}
function imprimirVenta(venta){
    let productos=[]
    let detalles
    if(venta.id!==undefined){
        detalles=venta.detalles
    }
    else
    {
        detalles=venta
    }
/*     if(!Array.isArray(detalles)){
        detalles=Array.from(detalles)
    } */
    detalles.forEach(x=>{
        let detalle={}
        detalle.cantidad=x.cantidad
        detalle.codigo=x.producto.codigo
        detalle.nombre=x.producto.nombre
        detalle.precio=x.precio
        detalle.total=x.cantidad*x.precio

        productos.push(detalle)
    })
    let DOMTablaResumen=document.createElement("tbody")
    tablaResumen(DOMTablaResumen, productos)

    let html=
            `<htm>
                <head>
                    <title>Imprimir Venta</title>
                </head>
                <body>
                    <h1>Numero Ticket: ${venta.id!==undefined?venta.id:"Venta No Registrada."}</h1>
                    <table>
                        <thead>
                            <tr>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Precio Unitario</th>
                                <th>Total</th>                            
                        </tr>
                        <thead>
                        <tbody>
                            ${DOMTablaResumen.outerHTML}
                        </tbody>
                    </table>
                    <h1>Total: $${venta.total}<h1>
                </body>
            </html>`

            let ventana = window.open('', '', 'height=600,width=800');
            ventana.document.write(html)

            ventana.document.close();
            ventana.print();
    
}