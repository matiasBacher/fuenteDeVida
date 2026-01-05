import { tablaLotes } from "./tablaLotes.js";

export class cuadroProductoLotes extends HTMLElement{
    constructor(){
        super()
        this._producto=this._productoGenerico()
        this._tablaLotes=null
        this.addEventListener("click",(evento)=>{
            let elemento=evento.target
            if(elemento.matches(".boton-producto-lote")){
                this.dispararEvento()
            }
        })
    }
        
        
    connectedCallback(){
        this.render
    }
    _productoGenerico(){
        return {
            nombre:"generico",
            codigo:0,
            lote:[]
        }
    }
    dispararEvento(){
        const evento= new CustomEvent("annadirLote",{
            detail:{
                producto: this.producto
            },
            bubbles:true,
            composed:true
        })
        this.dispatchEvent(evento)
    }
    set producto(valor){
        this._producto={...this._producto,...valor}
        this._tablaLotes=document.createElement("table",{is:"tabla-lotes"})
        this.render()
    }

    get producto(){
        return this._producto
    }
    getTablaLote(){
        return this._tablaLotes

    }
    _opcionesPorDefecto(){
        return {
            nombre:true,
            codigo:true,
            botones: true,
            tabla:"tabla-lotes"
        }
    }
    _partesRender(valor){
        let r
        switch(valor){
            case "nombre":
                r= /*html*/
                    `<div class="nombre-producto-lote">                    
                        <span class="etiqueta-nombre-producto-lote">Nombre: </span>
                        <span class="texto-nombre-producto-lote">
                            ${this.producto.nombre}
                        </span>
                    </div>`
                break
            case "codigo":
                r= /*html*/
                    `<div class="codigo-producto-lote">
                        <span class="etiqueta-codigo-producto-lote">Codigo: </span>
                        <span class="texto-codigo-producto-lote">
                            ${this.producto.codigo.toString().padStart(8,"0")}
                        </span>
                    </div>`
                break
            case "botones":
                r= /*html*/
                `<div class="contenedorBotones-producto-lote">
                    <button class="button boton-producto-lote">Agregar</button>
                </div>`
                break
        }
        return r
    }
    _definirOpciones(){
    return {}
    }
    render(){
        const opciones={...this._opcionesPorDefecto(), ...this._definirOpciones()}
        this.innerHTML=/*html*/
        `<div class="contenedor-lotes">
            <div class="cabezera-producto-lote">
                <div class="cabezera-producto-lote-texto">
                    ${opciones.nombre?this._partesRender("nombre"):``}
                    ${opciones.codigo?this._partesRender("codigo"):``}
                    
                </div>
                ${opciones.botones?this._partesRender("botones"):``}
            </div>

            <div class="contenedor-tabla-producto-lote">
                <table is="${opciones.tabla}">
            </div>
            
        </div>
        `

            const tablaLotes=this.querySelector("table")
            tablaLotes.lotes=this.producto.lote
            
                
    }
}
customElements.define("cuadro-producto-lotes", cuadroProductoLotes)