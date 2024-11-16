import { contenedorCuadroProductoLotes } from "../componente/contenedorCuadroProductoLotes.js";
import { cuadroProductoLotesCaja } from "./cuadroProductoLotesCaja.js";

export class contenedorCuadroProductoLotesCaja extends contenedorCuadroProductoLotes {
    _definirOpciones(){
        return {
            cuadros:"cuadro-producto-lotes-caja"
        }
    }
}
customElements.define("contenedor-cuadro-productos-lotes-caja", contenedorCuadroProductoLotesCaja)