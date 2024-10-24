<script type="module" src=".\publico\js\componente\filaLote.js"></script>
<script type="module" src=".\publico\js\componente\tablaLotes.js"></script>
<table>
    <tr is="fila-lote"></tr>
</table>
<script type="module" >
    import {consultaLote} from "./publico/js/modulo/sincLote.js"
    const respuesta= await consultaLote()
    let lote=respuesta.resultadoBusqueda[0].lote[0]
    console.log(lote)
    const tr=document.querySelector("tr")
    tr.definirLote(lote)
    console.log(tr)
    console.log(lote)
    let lotes=respuesta.resultadoBusqueda[0].lote
    const tablaLotes=document.createElement("table",{is:"tabla-lotes"})
    tablaLotes.lotes=lotes
    document.querySelector("body").appendChild(tablaLotes)
</script>