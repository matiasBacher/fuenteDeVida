import { filaLoteCaja } from "./filaLoteCaja.js";
import { tablaLotes } from "../componente/tablaLotes.js";

export class tablaFilaLotesCaja extends tablaLotes{

    _tipoFilaLote(){
        return "fila-lote-caja"
    }
}

customElements.define('tabla-lotes-caja', tablaFilaLotesCaja, {extends:"table"})