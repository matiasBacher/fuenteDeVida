import { abrirModal, cerrarModal } from "../modulo/mensajesYCargas.js";
import { tablaDeProducto } from "./tablaDeProducto.js";
import { tablaCarrito, tablaResumen } from "./carrito.js";
import { altaVenta } from "../modulo/sincVenta.js";
import { okMensaje, errorMensaje } from "../modulo/mensajesYCargas.js";
import { quitar, selectorCantidad, eventoBuscar, agregar } from "./metodosCompartidos.js";

let productoMemoria = [];
let productoCarrito = [];

const buscador = document.querySelector ("#buscador");

const tablaProducto = document.querySelector ("#product-table");

const DomRegistrar = document.querySelector("#cobrar")

const resumenVenta = document.querySelector("#resumenVenta")

const cancelar = document.querySelector("#cancelar")

let totales = Array.from(document.querySelectorAll("#resumen-total , #totalCarrito"))

const carrito =document.querySelector("#listaCarrito")

const DOMTablaResumen=document.querySelector("#resumen-compra")

const selectMedioPago = document.querySelector("#orden")

const resumenMetodoPago=document.querySelector("#resumen-metodo-pago")

const botonRegistrarVenta=document.querySelector("#registrar")

resumenMetodoPago.textContent=(JSON.parse(selectMedioPago.value))[1]

selectMedioPago.addEventListener('change', ()=>{

resumenMetodoPago.textContent=(JSON.parse(selectMedioPago.value))[1]
})


function ponerTotales(){
    let sumaTotales=0
    productoCarrito.forEach(elemento => sumaTotales+=elemento.total)

    totales.forEach(elemento=>elemento.textContent=sumaTotales)
}



DomRegistrar.addEventListener("click", ()=>{
    abrirModal(resumenVenta); 
    tablaResumen(DOMTablaResumen,productoCarrito)
    })

cancelar.addEventListener("click", ()=>{
    cerrarModal(resumenVenta)
})


eventoBuscar(productoMemoria, tablaProducto, buscador)

    
    //evento boton agregar
    agregar(ponerTotales, productoCarrito, carrito, tablaProducto)

    // evento selector Cantidad
        selectorCantidad(carrito, ponerTotales)

// evento boton quitar

quitar(carrito, productoCarrito, ponerTotales)

    //registrar venta
    botonRegistrarVenta.addEventListener("click", async ()=>{
       let mensaje = await altaVenta(JSON.parse(selectMedioPago.value)[0], productoCarrito)
       console.log(mensaje)
       cerrarModal(resumenVenta)
       productoCarrito=[]
       productoMemoria=[]
       tablaCarrito(carrito, productoCarrito)
       tablaDeProducto(productoMemoria, tablaProducto)
       ponerTotales()
       if(mensaje==1){
            okMensaje.fire({text:"Venta registrada"})
       }
       else{
        errorMensaje.fire({text:"Venta no registrada"})
       }

    }
    )


/* document.addEventListener('DOMContentLoaded', () => {
    let carrito = [];
    const carritoLista = document.getElementById('carrito-lista');
    const totalGeneral = document.getElementById('total-general');
    const metodoPago = document.getElementById('metodo-pago');
    const modalResumen = document.getElementById('modal-resumen');
    const resumenCompra = document.getElementById('resumen-compra');
    const resumenTotal = document.getElementById('resumen-total');
    const resumenMetodoPago = document.getElementById('resumen-metodo-pago');

    // Evento para agregar productos al carrito
    document.querySelectorAll('.agregar-carrito').forEach(boton => {
        boton.addEventListener('click', () => {
            const codigo = boton.getAttribute('data-codigo');
            const nombre = boton.getAttribute('data-nombre');
            const categoria = boton.getAttribute('data-categoria');
            const cantidad = boton.getAttribute('data-cantidad');
            const precio = boton.getAttribute('data-precio');

            agregarProductoAlCarrito(codigo, nombre, categoria, cantidad, precio);
        });
    });

    function agregarProductoAlCarrito(codigo, nombre, categoria, cantidad, precio) {
        const productoExistente = carrito.find(prod => prod.codigo === codigo);
        if (productoExistente) {
            productoExistente.cantidad++;
        } else {
            carrito.push({ codigo, nombre, categoria, cantidad, precio, cantidad: 1 });
        }
        actualizarCarrito();
    }

    function actualizarCarrito() {
        carritoLista.innerHTML = '';
        let total = 0;
        carrito.forEach((producto, index) => {
            const subtotal = producto.cantidad * producto.precio;
            total += subtotal;

            const row = `<tr>
                <td>${producto.codigo}</td>
                <td>${producto.nombre}</td>
                <td>${producto.categoria}</td>
                <td>${producto.cantidad}</td>
                <td><input type="number" min="1" value="${producto.cantidad}" data-index="${index}" class="cantidad-input"></td>
                <td>${subtotal.toFixed(2)}</td>
                <td><button class="quitar-producto" data-index="${index}">X</button></td>
            </tr>`;
            carritoLista.insertAdjacentHTML('beforeend', row);
        });
        totalGeneral.textContent = total.toFixed(2);
    }

    // Quitar producto del carrito
    carritoLista.addEventListener('click', (e) => {
        if (e.target.classList.contains('quitar-producto')) {
            const index = e.target.getAttribute('data-index');
            if (confirm('¿Estás seguro que quieres quitar este producto?')) {
                carrito.splice(index, 1);
                actualizarCarrito();
            }
        }
    });

    // Abrir modal de resumen de compra
    document.getElementById('cobrar').addEventListener('click', () => {
        modalResumen.style.display = 'block';
        resumenCompra.innerHTML = '';
        let total = 0;

        carrito.forEach(producto => {
            const subtotal = producto.cantidad * producto.precio;
            total += subtotal;

            const row = `<tr>
                <td>${producto.nombre}</td>
                <td>${producto.cantidad}</td>
                <td>${producto.precio}</td>
                <td>${subtotal.toFixed(2)}</td>
            </tr>`;
            resumenCompra.insertAdjacentHTML('beforeend', row);
        });

        resumenTotal.textContent = total.toFixed(2);
        resumenMetodoPago.textContent = metodoPago.value;
    });

    // Cerrar modal
    document.getElementById('cancelar').addEventListener('click', () => {
        modalResumen.style.display = 'none';
    });

    // Actualizar cantidad de productos en el carrito
    carritoLista.addEventListener('change', (e) => {
        if (e.target.classList.contains('cantidad-input')) {
            const index = e.target.getAttribute('data-index');
            carrito[index].cantidad = parseInt(e.target.value);
            actualizarCarrito();
        }
    });
});
 */