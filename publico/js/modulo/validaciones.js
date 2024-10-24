export{ajustarValor, validarVacio, aplicarSoloNumerico}
function ajustarValor(input) {
    let inputValue = input.value;

    // Limitar el tamaño a 8 caracteres y rellenar con ceros a la izquierda si es necesario
    if (inputValue.length > 8) {
        inputValue = inputValue.substring(0, 8);
    } else {
        inputValue = inputValue.padEnd(8, '0');
    }

    // Actualizamos el valor del input sin mover el cursor al final
    const start = input.selectionStart;
    const end = input.selectionEnd;
    input.value = inputValue;
    input.setSelectionRange(start, end);
}
function validarVacio(opcion, elementoObjeto, errorObjeto, mensajr,  corregir=false, valido=[false] ){
    let codigoArreglado=corregir?elementoObjeto[opcion].value.trim()
    :elementoObjeto[opcion].value;
    if (codigoArreglado === '') {
        elementoObjeto[opcion].classList.add('invalid');
        errorObjeto[opcion].innerText=mensajr
        errorObjeto[opcion].style.display = 'block';
        valido[opcion]=false   }
 else {
    elementoObjeto[opcion].classList.remove('invalid');
    errorObjeto[opcion].style.display = 'none';
    valido[opcion]=true
 }



}



function aplicarSoloNumerico(input) {

            input.value = input.value.replace(/[^0-9]/g, '');

    
}




