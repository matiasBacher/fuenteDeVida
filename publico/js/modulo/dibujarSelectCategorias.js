export{dibujarSelectCategorias}

function dibujarSelectCategorias(padre, memoria){
padre.innerHTML=""
  let primerOption=document.createElement("option")
  primerOption.textContent="Selecione una opcion";
  primerOption.value=""
  padre.appendChild(primerOption);
for(let i=0; i<memoria.length; i++){
    const option = document.createElement("option")
    option.value=memoria[i].nombre
    option.textContent=memoria[i].nombre

    padre.appendChild(option)
}
}