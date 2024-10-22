<script type="module" src=".\publico\js\componente\filaLote.js"></script>
<table>
    <tr is="fila-lote"></tr>
</table>
<script type="module" >
    import {consultaLote} from "./publico/js/modulo/sincLote.js"
    const lote= await consultaLote().resultadoBusqueda[0]
    const tr=document.querySelector("tr")
    tr.defirLote(lote)
    console.log(tr)
    console.log(lote)
</script>