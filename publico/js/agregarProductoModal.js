var modalProduct = document.getElementById("aProducto");
var openModalProducto = document.getElementById("openModalProduct");
var closeModalProduct = document.getElementById("closeModalAddProduct");

// Abrir la ventana flotante cuando se hace clic en el botón
openModalProducto.onclick = function() {
    modalProduct.style.display = "flex";
    cargarCategorias(2)
}

// Cerrar la ventana flotante cuando se hace clic en la "x"
closeModalProduct.onclick = function() {
    modalProduct.style.display = "none";
}


function aplicarSoloNumerico(inputs) {
    inputs.forEach(function(input) {
        input.addEventListener('input', function () {
            this.value = this.value.replace(/[^0-9]/g, '');
        });
    });
}

    let isValid = true;
    // Validación del nombre del producto
    const nombreProducto = document.getElementById('nombreProducto');
    const nombreProductoError = document.getElementById('nombreProductoError');

    nombreProducto.addEventListener("blur", validarNombre)
    function validarNombre() {


        if (nombreProducto.value.trim() === '') {
            nombreProducto.classList.add('invalid');
            nombreProducto.textContent="ponga el nombre"
            nombreProductoError.style.display = 'block';
            isValid = false;
        } else {
            nombreProducto.classList.remove('invalid');
            nombreProductoError.style.display = 'none';
        }
    }

    // Validación de la categoría
    const categoria = document.getElementById('categoria');
    const categoriaError = document.getElementById('categoriaError');
    categoria.addEventListener("blur", validarCategoria)
    function validarCategoria() {
        if (categoria.value === '') {
            categoria.classList.add('invalid');
            categoriaError.innerText="Elija una Categoria"
            categoriaError.style.display = 'block';
            isValid = false;
        } else {
            categoria.classList.remove('invalid');
            categoriaError.style.display = 'none';

        }
    }

    // Validación del código

    const codigo = document.getElementById('codigo');
    const codigoError = document.getElementById('codigoError');
    codigo.addEventListener("blur", validarCodigo);

   aplicarSoloNumerico([ codigo ]);
    function validarCodigo() {
       let codigoArreglado =codigo.value.trim();
        if (codigoArreglado === '') {
            codigo.classList.add('invalid');
            codigoError.innerText="Ponga un Codigo"
            codigoError.style.display = 'block';
            isValid = false
        } else {
            if(codigoArreglado.length<8){
            codigo.classList.add('invalid');
            codigoError.innerText="El codigo debe ser de más de 8 digitos"
            codigoError.style.display = 'block';
            isValid = false

            }
            else{
                codigo.classList.remove('invalid');
                codigoError.style.display = 'none';
            }
        }
    }


    // Validación del precio
    const precio = document.getElementById('precio');
    const precioError = document.getElementById('precioError');
    aplicarSoloNumerico([ precio ])
    precio.addEventListener("blur", validarPrecio)
    function validarPrecio() {
        if (precio.value.trim() === '' ) {
            precio.classList.add('invalid');
            precioError.innerText='Ponga un Precio'
            precioError.style.display = 'block';
        } else {
            precio.classList.remove('invalid');
            precioError.style.display = 'none';
        }
    }

    function validarTodo() {
        isValid=true
        validarCodigo();
        validarCategoria();
        validarCodigo();
        validarPrecio();
        validarNombre();

        if(isValid){
            grabarProductos()
        }
        
    }
    function dibujarSelect(){
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
            respuesta = await response.json();
        } else {
            throw new Error('Error al obtener la respuesta del servidor')
        }
    } catch (error) {
        console.error('Error:', error);
        // Manejar el error según sea necesario
    }
    if(respuesta.mensaje==1){
        alert("El producto fue grabado")
    }
    else if(respuesta.mensaje==0){
        alert("Codigo de producto repetido")
    }
    else{
        alert("Error al grabar el producto")
    }

}


document.getElementById('modalAgregProdEnviar').addEventListener('click', ()=>validarTodo());


