
function soy_empleado(valor) {
    alert ("Entre")
    if (valor == "Administrador"){
        document.getElementById("select_sucursal").style.visibility = "hidden"
    }else{
        document.getElementById("select_sucursal").style.visibility = "visible"
    }
}