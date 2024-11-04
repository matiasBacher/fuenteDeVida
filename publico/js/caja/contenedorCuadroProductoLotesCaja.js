import { contenedorCuadroProductoLotes } from "../componente/contenedorCuadroProductoLotes.js";
import { cuadroProductoLotesCaja } from "./cuadroProductoLotesCaja.js";

export class contenedorCuadroProductoLotesCaja extends contenedorCuadroProductoLotes {
    _definirOpciones(){
        return {
            cuadros:"cuaro-producto-lotes-caja"
        }
    }
}
