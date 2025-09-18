import Destinos.*
object paquete {
  var estaPago = false
  method precio(){
    return 50
  } 
  method estaPago(){
    return estaPago
  } 
  method pagarPaquete() {
    estaPago = true
  }
  method puedeSerEntregadoPor(unMensajero){
        return estaPago
  } 
}

object paquetito {
    method precio(){
        return 0
    } 
    method estaPago(){
        return true
    } 
    method puedeSerEntregadoPor(unMensajero){
        return true
  } 
}

object paquetonViajero {
    method precio(){
        return 100 
    } 
    method estaPago(){
        return true
    } 
    method puedeSerEntregadoPor(unMensajero){
        return unMensajero.entregarUnPaqueteEn(self, puenteBrooklyn) and unMensajero.entregarUnPaqueteEn(self, matrix)
  } 
}