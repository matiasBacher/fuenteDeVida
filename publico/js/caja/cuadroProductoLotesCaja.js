import { cuadroProductoLotes } from "../componente/cuadroProductoLotes.js";
import { tablaFilaLotesCaja } from "./tablaFilaLoteCaja.js";

export class cuadroProductoLotesCaja extends cuadroProductoLotes{

    _definirOpciones(){
        return {
            botones: false,
            tabla:"tabla-lotes-caja" 

        }
    }
}
customElements.define("cuadro-producto-lotes-caja", cuadroProductoLotesCaja)