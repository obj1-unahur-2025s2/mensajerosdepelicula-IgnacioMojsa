import vehiculos.*
import Destinos.* 

object roberto {
    var vehiculo = ningunVehiculo
    method peso(){
        return 90 + vehiculo.peso()
    }
    method puedeLlamar(){
        return false
    }  
    method cambiarVehiculo(nuevoVehiculo) {
        vehiculo = nuevoVehiculo
    }
    method entregarUnPaqueteEn(unPaquete, unDestino){
        return unDestino.puedeAcceder(self) and unPaquete.estaPago()
    } 
}

object chuckNorris {
    method peso(){
        return 80
    } 
    method puedeLlamar(){
        return true
    }  
    method entregarUnPaqueteEn(unPaquete, unDestino){
        return unDestino.puedeAcceder(self) and unPaquete.estaPago()
    } 
}

object neo {
    var tieneCredito = false 
    method peso(){
        return 0
    } 
    method puedeLlamar(){
        return tieneCredito
    }  
    method cargarCredito() {
        tieneCredito = true
    }
    method entregarUnPaqueteEn(unPaquete, unDestino){
        return unDestino.puedeAcceder(self) and unPaquete.estaPago()
    } 
}

object empresaDeMensajeria {
    const mensajeros = [] 
    const paquetesEnviados = []
    const paquetesPendientes = []  
    method contratarMensajero(unMensajero) {
        mensajeros.add(unMensajero)
    }
    method despedirMensajero(unMensajero) {
        mensajeros.remove(unMensajero)
    }
    method despedirATodos(){
        mensajeros.clear()
    }
    method esMensajeriaGrande(){
        return mensajeros.size() > 2
    } 
    method primeroEsAptoParaEntregarEn(unPaquete, unLugar){
        return mensajeros.first().entregarUnPaqueteEn(unPaquete, unLugar)
    } 
    method pesoDelUltimoMensajero(){
        return mensajeros.last().peso()
    } 
    method algunMensajeroPuedeEntregarEn(unPaquete, unLugar){
        return mensajeros.any({m => m.entregarUnPaqueteEn(unPaquete, unLugar)})
    } 
    method mensajerosQuPuedenLlevarUnPaqueteA(unPaquete, unLugar){
        return mensajeros.filter({m => m.entregarUnPaqueteEn(unPaquete, unLugar)})
    } 
    method tieneSoprepeso(){
        return mensajeros.sum({m => m.peso()}) > 500
    } 
    method enviarPaqueteA(unPaquete, unDestino) {
        if(self.algunMensajeroPuedeEntregarEn(unPaquete, unDestino)){
            paquetesEnviados.add(unPaquete)
        }
        else{
            paquetesPendientes.add(unPaquete)
        }
    }
    method facturacionDeEmpresa(){
        return paquetesEnviados.fold(0, {p => p.precio()})
    } 
    method encontrarYEnviarPaquetePendienteMasCaroA(unLugar){
        self.enviarPaqueteA(self.paquetesPendienteMasCaro(), unLugar)
    }
    method paquetesPendienteMasCaro(){
        return paquetesPendientes.find(paquetesPendientes.max({p => p.precio()}))
    }
}