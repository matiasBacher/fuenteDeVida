
let isValidModif=[false]
const modalModifPro = document.getElementById('mProducto');
const closeModifPro = document.getElementById('McloseModalAddProduct');



elemModifProd={
    codigo: document.getElementById('Mcodigo'),
    precio: document.getElementById('Mprecio'),
    nombre: document.getElementById('MnombreProducto'),
    descripcion: document.getElementById('MdescripcionProducto'),
    categoria:  document.getElementById('Mcategoria'),
    propiedades: Array.from(document.querySelectorAll('#Mcaracteristicas input[type="checkbox"]'))
}
elemModifProdErr={
    codigo: document.getElementById('McodigoError'),
    precio: document.getElementById('MprecioError'),
    nombre: document.getElementById('MnombreProductoError'),
    categoria:  document.getElementById('McategoriaError'),
}
let modifElemAValid=[ elemModifProd.precio, elemModifProd.nombre, elemModifProd.categoria]

let arrayFunc = []
modifElemAValid.forEach(x=>{
    let nombre=x.name
    let corregir=x.name=="nombre"
    let f= ()=>{
        validarVacio(nombre, elemModifProd, elemModifProdErr, 
        "Por favor complete el campo", corregir, isValidModif)}
    x.addEventListener("blur", f)
    arrayFunc.push(f)
})

closeModifPro.addEventListener("click", ()=>{
    cerrarModal(modalModifPro)
})
const MproductForm= document.getElementById("MproductoForm")
const enviarModif = document.getElementById("MmodalAgregProdEnviar")
 enviarModif.addEventListener('click',  ()=>{
    validarTodo(arrayFunc)
    modificarProducto()
 })
 function MdibujarSelect(){
    hacerSelect(elemModifProd.categoria)
}
 async function modificarProducto(){ //busca las categorias en la BD
    const f = new FormData(MproductForm);
    let categorias;
    f.append("accion", "actualizar");
    f.append("codigo", productoSeleccionado.codigo)

    try {
        const response = await fetch('../../app/controlador/controladorProductos.php',
            {method:'POST',
            body: f}
        );

        if(response.ok){
            respuesta = await response.json();
        } else {
            throw new Error('Error al obtener la respuesta del servidor')
        }
        } catch (error) {
            console.error('Error:', error);
            // Manejar el error según sea necesario
        }
        if(respuesta.mensajeBorrado<0){
            Swal.fire({confirmButtonText:"Volver",text:"No se pudo Borrar el producto", background:"#d6dfee",icon: "error", showConfirmButton: false,})            
            return;
        }
        if(respuesta.mensajeGrabado<1){
            Swal.fire({confirmButtonText:"Volver",text:"falla a grabar los productos", background:"#d6dfee",icon: "error", showConfirmButton: false,})
            return
        }
        if(respuesta.mensajeGrabado==1){
            Swal.fire({customclass: {confirmButton:"custombutton"},text:"El producto se actualizo con exito",icon: "success",background:"#d6dfee"})
            cerrarModal(modalModifPro)
       }
   

        }





