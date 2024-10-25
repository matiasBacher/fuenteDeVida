
import{contenedorCuadroProductoLotes} from "../componente/contenedorCuadroProductoLotes.js"
import { consultaLote } from "../modulo/sincLote.js"


const contenedor= document.querySelector("contenedor-cuadro-productos-lotes")
let respuesta= await consultaLote({busqueda: "c"})
contenedor.productos=respuesta.resultadoBusqueda
