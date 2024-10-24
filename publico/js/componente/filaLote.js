export class filaLote extends HTMLTableRowElement{
    constructor(){
        super()
        this.lote=this.devolverLoteGenerico()
        this.estadoVencimiento=this.lote.estadoVencimiento
        this.addEventListener("click", (evento)=>{
            let elemento=evento.target
            if(elemento.matches(".button-remove")){
                this._dispararEvento("borrarLote")
            }
            if(elemento.matches(".button-modify")){
                this._dispararEvento("modificarLote")
            }
        })
    }
    _dispararEvento(nombre){
       const evento= new CustomEvent(nombre,{
            detail:{
                lote:this.lote
            },
            bubbles:true,
            composed:true
        })
        this.dispatchEvent(evento)
    }

    definirLote(lote){
        this.lote=lote
        this.estadoVencimiento=this.lote.estadoVencimiento

        this.render()
        

    }
    connectedCallback(){
        this.render()
    }
    get estadoVencimiento(){
        return this.getAttribute("estadoVencimiento")
    }
    set estadoVencimiento(valor){
        this.setAttribute("estadoVencimiento", valor)
    }
    attributeChangedCallback(nombreAtributo, valorViejo, valorNuevo){
        if(nombreAtributo=="estadoVencimiento"){
            if(valorNuevo=="porVercer" || valorNuevo=="vencido"){
                this.className=valorNuevo
            }
            else{
                this.className==""
            }
        
        }

    }
    devolverLoteGenerico(){
        const fechaHoy=new Date
        return {
            estadoVencimiento:"vencimientoLargo",
            id:0,
            proveedor:{nombre:"propio"},
            ingreso:"1970-01-01",
            vencimiento:`${fechaHoy.getFullYear()}-${fechaHoy.getMonth()}-${fechaHoy.getDay()}`,
            cantidad:0
        }
    }
    static get observedAttributes() {
        return ["estadoVencimiento"]
    }

    render(){
            
        let lote=this.lote
          this.innerHTML= /*html*/
          
            `<td>${lote.id}</td>
            <td>${lote.proveedor.razonSocial}</td>
            <td>${lote.ingreso}</td>
            <td>${lote.vencimiento}</td>
            <td>${lote.cantidad}</td>
            <td>
                <button class="button button-remove">Eliminar</button>
                <button class="button button-modify">Modificar</button>
            </td>`

    }
}
customElements.define('fila-lote', filaLote, {extends:"tr"})