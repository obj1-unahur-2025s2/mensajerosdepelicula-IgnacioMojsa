object camion {
    var cantidadAcoplados = 0
    method cambiarAcoplados(nuevaCantidad) {
        cantidadAcoplados = nuevaCantidad
    } 
    method peso(){
        return cantidadAcoplados * 500
    } 
}

object bicicleta {
    method peso(){
        return 5
    } 
}

object ningunVehiculo {
    method peso(){
        return 0
    } 
}