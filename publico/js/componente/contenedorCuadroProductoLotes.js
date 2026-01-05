import { cuadroProductoLotes } from "./cuadroProductoLotes.js";

export class contenedorCuadroProductoLotes extends HTMLElement{
    _productos
    constructor(){
        super()
        this._productos=[]

        

    }
    set productos(valor){
        this._productos=valor
        if(this._productos.length<=0){
            this.vacio=true
        }
        else{
            this.vacio=false
        }
    }
    get productos(){
        return this._productos
    }
    static get observedAttributes(){
        return ["vacio"]
        
    }
    get vacio(){
        return this.getAttribute("vacio")=="true"
    }
    set vacio(valor){
        this.setAttribute("vacio", String(Boolean(valor)))
    }
    vacioReal(){
        return (this.vacio && this.productos.length<=0)
    }


    attributeChangedCallback(nombreAtributo, valorViejo, valorNuevo){
        this.render()
    }
    _opcionesPorDefecto(){
        return{
            cuadros: "cuadro-producto-lotes" 
        }
    }
    _definirOpciones(){
        return{

        }
    }

    render(){
        let propiedades={...this._opcionesPorDefecto(), ...this._definirOpciones()}
        if(this.vacio){
            this.innerHTML=/*html*/
            `<div>
                No se encontraron productos.
            </div>`
        }
        else{
            this.innerHTML=""
            let div=document.createElement("div")

            this.productos.forEach((x)=>{
                let cuadroProducto=document.createElement(propiedades.cuadros)
                cuadroProducto.producto=x
                div.appendChild(cuadroProducto)
            }) 
            this.appendChild(div)
        }
        }

    }
customElements.define("contenedor-cuadro-productos-lotes", contenedorCuadroProductoLotes)