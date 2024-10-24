
import{contenedorCuadroProductoLotes} from "../componente/contenedorCuadroProductoLotes.js"
import { consultaLote } from "../modulo/sincLote.js"


const contenedor= document.querySelector("contenedor-cuadro-productos-lotes")
let respuesta= await consultaLote({busqueda: 1})
contenedor.productos=respuesta.resultadoBusqueda
