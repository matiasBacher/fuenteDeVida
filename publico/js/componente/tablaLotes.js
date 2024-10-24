import { filaLote } from "./filaLote.js";

export class tablaLotes extends HTMLTableElement{
    constructor(){
        super()
        this._lotes=[]
        this._comprobarVacio()
    }
    connectedCallback(){
        this.render()
    }
    get lotes(){
        return this._lotes
    }
    set lotes(valor){
        this._lotes.length=0
        this._lotes.push(...valor)
        this._comprobarVacio()
        this.render()
        
    }
    static get observedAttributes(){
        return ["vacio"]
    }

    get vacio(){
        return this.getAttribute("vacio")=="true"
    }

    set vacio(v){
        this.setAttribute("vacio",v?"true":"false")
    }

    _comprobarVacio(){
        if(this._lotes.length<=0){
            this.setAttribute("vacio", "true")
    }
        else{
            this.setAttribute("vacio", "false")
        }
    }

    render(){
        const tHead=this.createTHead()
        tHead.innerHTML=/*html*/
        `<tr>
            <th>codigo</th>
            <th>Proveedor</th>
            <th>fecha ingreso</th>
            <th>vencimiento</th>
            <th>cantidad</th>
            <th>Acciones</th>
        </tr>`

        let tBody = this.querySelector("tbody");
        if (!tBody) {
            tBody = this.createTBody();
        }
        tBody.innerHTML=""
        if(this.vacio){
            tBody.innerHTML=/*html*/
            `<tr>
                <td collspan="6">No hay lotes</td>
            </tr>`


        }
        else{
            this.lotes.forEach(element => {
                let tr=document.createElement("tr",{is:"fila-lote"})
                tr.definirLote(element)
                tBody.appendChild(tr)
                
            });
        }

    }
    
}

customElements.define('tabla-lotes', tablaLotes, {extends:"table"})
