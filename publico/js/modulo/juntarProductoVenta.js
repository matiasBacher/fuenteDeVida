export function juntarProductoVenta(venta){
    let nuevoDetalles=[]

    venta.detalles.forEach(detalle => {
        let index
        if(
            !(nuevoDetalles.some((n)=>{
                if(n.producto.codigo==detalle.producto.codigo){
                    index=n
                    return true
                }
                else return false
            })
            )
        ){
            nuevoDetalles.push(detalle)
        }
        else{
            index.cantidad+=detalle.cantidad
        }
        
    });
    return nuevoDetalles
}