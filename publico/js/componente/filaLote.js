export class filaLote extends HTMLTableRowElement{
    constructor(){
        super()
        this.lote=this.devolverLoteGenerico()
        this.estadoVencimiento=this.lote.estadoVencimiento
        this._annadirEvento()
    }
    _controladorEvento(){
        const eventos={
            click:[
                {selector:".button-remove",
                evento: "borrarLote",},
            
                {selector:".button-modify",
                evento: "modificarLote",},
            ]
                
            
        }
        return eventos

    }
    _annadirEvento(){
        const eventos = this._controladorEvento()
        Object.keys(eventos).forEach(k=>{
                this.addEventListener(k, (e)=>{
                    let elemento=e.target
                    eventos[k].some((q)=>{
                        if(elemento.matches(q.selector)){
                            this._dispararEvento(q.evento)
                            return true
                        }
                    })

                })
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
        this.estadoVencimiento=this.lote.estadoVencimiento.nombre

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
            inventario:0
        }
    }
    static get observedAttributes() {
        return ["estadoVencimiento"]
    }
    _botones(){
        const r= /*html*/
            `<button class="button button-modify">🖊</button>
            <button class="button button-remove">Eliminar</button>`
        return r
    }

    render(){
            
        let lote=this.lote
          this.innerHTML= /*html*/
          
            `<td>${lote.id}</td>
            <td>${lote.proveedor.razonSocial}</td>
            <td>${lote.ingreso}</td>
            <td>${lote.vencimiento}</td>
            <td>${lote.inventario}</td>
            <td>
                ${this._botones()}
            </td>`

    }
}
customElements.define('fila-lote', filaLote, {extends:"tr"})