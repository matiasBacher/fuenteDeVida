
export class Carrito extends HTMLElement{
    constructor(){
        super()
        this._detalles={}
        this._totalVenta=0
        this.addEventListener("click", (e)=>{
            let emisor = e.target
            if (emisor.matches(".quitarLote")){
                let producto = emisor.parentElement.parentElement.dataset.codigo
                let lote = emisor.parentElement.parentElement.dataset.id
                this.quitarDetalle(producto,lote)
                return
            }
            if(emisor.matches(".quitarProducto")){
                let producto = emisor.parentElement.parentElement.dataset.codigo
                this.quitarProducto(producto)
                return
            }

        })
        this.addEventListener("change", (e)=>{
            let emisor = e.target
            if(emisor.matches(".input-cantidad-lote-detalles")){
                let lote = emisor.parentElement.parentElement.dataset.id
                let producto = emisor.parentElement.parentElement.dataset.codigo
                this.setCantidadLote(lote, producto, emisor.value, true)
            }

        })

    }
    agregarDetalles(lote){
     let codigoProducto = lote.producto.codigo??null
     if(codigoProducto===null){
        console.error("producto si codigo")
        return

     }

     if( this._detalles[codigoProducto] ){
        if(this._detalles[codigoProducto].lotes.some(l=>l.id==lote.id)){
            return
        }
        

     }
     else{
        this._detalles[codigoProducto]=lote.producto
        this._detalles[codigoProducto].lotes=[]
     }
    let loteSalida=lote
    loteSalida.cantidad=0
    loteSalida.total=lote.producto.precio
    this._detalles[codigoProducto].lotes.push(loteSalida)
    this.setCantidadLote(lote.id, codigoProducto, 1)
    this.render()

     }
    quitarProducto(codigoProducto){
            delete this._detalles[codigoProducto]            
            this._calcularTotalVenta
            this.render()


    }

     quitarDetalle(codigoProducto, idlote){
        if(codigoProducto===null){
            console.error("producto si codigo")
            return

        }
        if(idLote===null){
            console.error("lote sin id")
            return

        }
        const lotes= this._detalles[codigoProducto].lotes
        let index = lotes.findIndex((i)=>i.id==lote.id)
        lotes.splice(index,1)
        if(lotes.length==0){
            delete this._detalles[codigoProducto]
            this._calcularTotalVenta
            this.render()
        }
        else{
            this._calcularCantidaProducto(this._detalles[codigoProducto])
            this._calcularTotalProducto(codigoProducto)
            this._calcularTotalVenta()
            this.render()}
    }
    setCantidadLote(idlote,codigoProducto, cantidad, render=false){
        let producto=this._detalles[codigoProducto]
        let lotes = producto.lotes
        let index = lotes.findIndex(i=>i.id==idlote)
        let lote = lotes[index]
        lote.cantidad=cantidad
        this._calcularTotalLote(lote)
        this._calcularCantidaProducto(producto)
        this._calcularTotalProducto(producto)
        this._calcularTotalVenta()
        if(render) this.renderCalculos(idlote,codigoProducto)
    }
    _calcularCantidaProducto(producto){
        let cantidad=0
        producto.lotes.forEach(l=>{
            cantidad+=l.cantidad
        })
        producto.cantidad=cantidad
    }
    _calcularTotalLote(lote){
        lote.total=lote.producto.precio*lote.cantidad
        this._calcularTotalProducto(producto)
        


    }
    _calcularTotalProducto(producto){
        producto.total=producto.cantidad*producto.precio
        
    }
    _calcularTotalVenta(){
        let suma=0
        Object.keys(this._detalles).forEach(k=>{
            suma+=this._detalles[k].total
        })
        this._totalVenta=suma
    }
     

    
    getDetallesSuelto(){
        const detalleSuelto=[]
        
        Object.keys(this._detalles).forEach((x)=>{
            detalleSuelto.push(...this._detalles[x].lotes)
        })
        return detalleSuelto
    }
    renderCalculos(idLote, codigoProducto){
        const filaLote=this.querySelector(`.fila-lotes-carrito tr[data-id=${idLote}`)
        const producto = this._detalles
        const lotes = producto.lotes
        let index = lotes.findIndex(l=>l.id==idLote)
        const lote = lotes[index]

        let inputNumber=filaLote.querySelector(".input-cantidad-lote-detalles")
        inputNumber.value = lote.cantidad

        const filaProducto=this.querySelector(`.fila-producto-carrito[data-codigo="${codigoProducto}"]`)
        const cantidadProducto=filaProducto.querySelector("cantidad-fila-producto-carrito")
        const precioProducto=filaProducto.querySelector("precio-fila-producto-carrito")
        const totalProducto=filaProducto.querySelector("total-fila-producto-carrito")

        cantidadProducto.textContent=producto.cantidad
        precioProducto.textContent=producto.precio
        totalProducto.textContent=producto.total





    }
    render(){ 
        let htmlProductos=""

        Object.keys(this._detalles).forEach(d=>{
            let producto = this._detalles[d]
            let htmlLotes=""
            producto.lotes.forEach((lote)=>{
                htmlLotes+= /*html*/
                `<tr data-id="${lote.id}" data-producto="${producto.codigo}">
                    <td>${lote.id}</td>
                    <td>${lote.ingreso}</td>
                    <td>${lote.vencimiento}</td>
                    <td><input class="input-cantidad-lote-detalles" type='number' value="${lote.cantidad}" ></td>
                    <td><button class="button button-remove quitarLote">quitar</td>
                    `
            })
            htmlProductos+=/*html*/
            `<tr class="fila-producto-carrito" data-codigo="${producto.codigo}">
                <td>${producto.codigo}</td>
                <td>${producto.nombre}</td>
                <td class="cantidad-fila-producto-carrito">${producto.cantidad}</td>
                <td class="precio-fila-producto-carrito">${producto.precio}</td>
                <td class="total-fila-producto-carrito">${producto.total}</td>
                <td>
                    <button class="button button-remove quitarProducto">Quitar Producto</button>
                </td>
            </tr>
            <tr class="fila-lotes-carrito">
                <table colspan="5"class="tabla-lotes-carrito">
                    <thead>
                        <tr>
                            <th>Codigo<th>
                            <th>Ingreso<th>
                            <th>Vencimiento<th>
                            <th>Cantidad<th>
                            <th>Acciones<th>
                        </tr>
                    </thead>
                    <tbody>
                        ${htmlLotes}
                    </tbody>
                </table>
            </tr>`
        })
    this.innerHTML=htmlProductos
    }

}

customElements.define("carrito", Carrito)