class Micro {
  var cantidadMaximaDePasajerosSentados
  var cantidadMaximaDePasarejosParados
  var volumen
  var pasajerosSentados = []
  var pasajerosParados = []
  
  method puedeSubirUnaPersona(unaPersona) = self.hayLugarPara(unaPersona) && unaPersona.aceptaIrEnElMicro(self)
  
  method hayLugarPara(unaPersona) = (pasajerosSentados.size() >= cantidadMaximaDePasajerosSentados) || (pasajerosParados.size() >= cantidadMaximaDePasarejosParados)
  
  method subirsePasajero(unaPersona) {
    
  }
}

class Apurado {
  
}