import { filaLote } from "../componente/filaLote.js";
export class filaLoteCaja extends filaLote {
    _controladorEvento(){
        const eventos={
            click:
                [
                    {selector:".agregar-carrito",
                    evento:"agregarCarrito"},
                    ]
        }
        return eventos
    }
    
    _botones(){
        return /*html*/
        `<button class="agregar-carrito">Agregar al carrito</button>`
    }

}
customElements.define('fila-lote-caja', filaLoteCaja, {extends:"tr"})