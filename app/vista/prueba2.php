<script type="module" src=".\publico\js\componente\filaLote.js"></script>
<script type="module" src=".\publico\js\componente\tablaLotes.js"></script>

<script type="module" >
    import {consultaLote} from "./publico/js/modulo/sincLote.js"
    const respuesta= await consultaLote({busqueda:"mani"})
    console.log(respuesta)

    let lotes=respuesta.resultadoBusqueda[0].lote
    const tablaLotes=document.createElement("table",{is:"tabla-lotes"})
    tablaLotes.lotes=lotes
    document.querySelector("body").appendChild(tablaLotes)
</script>