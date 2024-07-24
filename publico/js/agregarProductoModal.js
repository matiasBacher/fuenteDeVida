var modalProduct = document.getElementById("aProducto");
var openModalProducto = document.getElementById("openModalProduct");
var closeModalProduct = document.getElementById("closeModalAddProduct");

// Abrir la ventana flotante cuando se hace clic en el botón
openModalProducto.onclick = function() {
    abrirModal(modalProduct)
    cargarCategorias(2)
}

// Cerrar la ventana flotante cuando se hace clic en la "x"
closeModalProduct.onclick = function() {
    cerrarModal(modalProduct)
}

elemAgreProd={
    codigo: document.getElementById('codigo'),
    precio: document.getElementById('precio'),
    nombre: document.getElementById('nombreProducto'),
    descripcion: document.getElementById('descripcionProducto'),
    categoria:  document.getElementById('categoria'),
    propiedades: Array.from(document.querySelectorAll('#caracteristicas input[type="checkbox"]'))
}
elemAgreProdErr={
    codigo: document.getElementById('codigoError'),
    precio: document.getElementById('precioError'),
    nombre: document.getElementById('nombreProductoError'),
    categoria:  document.getElementById('categoriaError'),
}
let isValid=[false]

function validarVacio(opcion, elementoObjeto, errorObjeto, mensajr,  corregir=false, valido=[false] ){
    let codigoArreglado=corregir?elementoObjeto[opcion].value.trim()
    :elementoObjeto[opcion].value;
    if (codigoArreglado === '') {
        elementoObjeto[opcion].classList.add('invalid');
        errorObjeto[opcion].innerText=mensajr
        errorObjeto[opcion].style.display = 'block';
        valido[0]=false   }
 else {
    elementoObjeto[opcion].classList.remove('invalid');
    errorObjeto[opcion].style.display = 'none';
    valido[0]=true
 }


}



function aplicarSoloNumerico(input) {

            input.value = input.value.replace(/[^0-9]/g, '');

    
}
function ajustarValor(input) {
    let inputValue = input.value;

    // Limitar el tamaño a 8 caracteres y rellenar con ceros a la izquierda si es necesario
    if (inputValue.length > 8) {
        inputValue = inputValue.substring(0, 8);
    } else {
        inputValue = inputValue.padEnd(8, '0');
    }

    // Actualizamos el valor del input sin mover el cursor al final
    const start = input.selectionStart;
    const end = input.selectionEnd;
    input.value = inputValue;
    input.setSelectionRange(start, end);
}

    
elemAgreProd["nombre"].addEventListener("blur", validarNombre);
    function validarNombre() {


        validarVacio('nombre', elemAgreProd, elemAgreProdErr, "complete el nombre", true, isValid)
    }

    // Validación de la categoría
    elemAgreProd["categoria"].addEventListener("blur", validarCategoria)
    function validarCategoria() {
        validarVacio('categoria', elemAgreProd, elemAgreProdErr, "elija una categoría",false, isValid)
    }

        
    

    // Validación del código
    elemAgreProd["codigo"].addEventListener("blur", validarCodigo);

   elemAgreProd["codigo"].addEventListener("input", function(event) {
    let input = event.target;
    aplicarSoloNumerico(input)
    ajustarValor(input)
   }
)
    function validarCodigo() {
        validarVacio('codigo', elemAgreProd, elemAgreProdErr, "complete el codigo", true, isValid)
    }
    



     elemAgreProd["precio"].addEventListener("input", function(event){
        let input = event.target
        aplicarSoloNumerico(target)
     })
    precio.addEventListener("blur", validarPrecio)
    function validarPrecio() {
        validarVacio('precio', elemAgreProd, elemAgreProdErr, "complete el precio",false, isValid)
    }
    

    function validarTodo(funciones) {
        
            funciones.forEach(x=>{
                x()
            })
        
    }
    function dibujarSelect(){
        hacerSelect(elemAgreProd.categoria)
    }
    function hacerSelect(categoria){

        while (categoria.firstChild){
            categoria.removeChild(categoria.firstChild);
          };
          let primerOption=document.createElement("option")
          primerOption.textContent="Selecione una opcion";
          primerOption.value=""
          categoria.appendChild(primerOption);
        for(let i=0; i<categoriaEnMemoria.length; i++){
            const option = document.createElement("option")
            option.value=categoriaEnMemoria[i].nombre
            option.textContent=categoriaEnMemoria[i].nombre

            categoria.appendChild(option)
        }
    }
const formularioGrabar = document.getElementById("productoForm")

async function grabarProductos(){
    mostrarCarga()

    const f = new FormData(formularioGrabar);
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
    if(respuesta.mensaje==1){
        okMensaje.fire({text:"EL PRODUCTO FUE AGREGADO"})
        cargarInput("", elemAgreProd)
    }
    else if(respuesta.mensaje==0){
        errorMensaje.fire({text:"Codigo del producto repetido"})
    }
    else{
        Swal.fire({text:"Codigo del producto repetido"})
    }

}
function cargarInput(carga, elementos){
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
            x.checked=carga.propiedades[x.name]
        })
        }
    }

document.getElementById('modalAgregProdEnviar').addEventListener('click', ()=>{
    validarTodo([validarCategoria,validarCodigo,validarNombre,validarPrecio])
    if(isValid[0]){
        grabarProductos()
    }
})


