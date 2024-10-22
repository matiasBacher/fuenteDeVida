export{cargarInputProducto}
function cargarInputProducto(carga, elementos){
    if(carga==""){
        elementos.codigo.value=""
        elementos.precio.value=""
        elementos.nombre.value=""
        elementos.descripcion.value=""
        elementos.categoria.value=""
        elementos.propiedades.forEach(x => {
            x.checked=false
            
        })
    }
        else{

        elementos.codigo.value=carga.codigo.toString().padStart(8, '0')
        elementos.precio.value=carga.precio
        elementos.nombre.value=carga.nombre 
        elementos.descripcion.value=carga.descripcion
        elementos.categoria.value=carga.categoria=="ninguno"?"":carga.categoria
        elementos.propiedades.forEach(x=>{
            x.checked=carga.propiedades.includes(x.value)
        })
        }
    }