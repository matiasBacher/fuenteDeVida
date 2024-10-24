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
        this.dispararEvento(evento)
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
    render(){
        this.innerHTML=/*html*/
        `<div class="cabezera-producto-lote">
            <div class="codigo-producto-lote">
                <span class="etiqueta-codigo-producto-lote">Codigo: </span>
                <span class="texto-codigo-producto-lote">
                    ${this.producto.codigo.toString().padEnd(8,"0")}
                </span>
            <div class="nombre-producto-lote">
                <span class="etiqueta-nombre-producto-lote">Nombre: </span>
                <span class="texto-nombre-producto-lote">
                    ${this.producto.nombre}
                </span>
            </div>
            <div class="contenedorBotones-producto-lote">
                <button class="button boton-producto-lote">+</button>
            </div>
        </div>
        <div class="contenedor-tabla-producto-lote">
            <table is="tabla-lotes">
        </div>`

            const tablaLotes=this.querySelector("table")
            tablaLotes.lotes=this.producto.lote
            
                
    }
}