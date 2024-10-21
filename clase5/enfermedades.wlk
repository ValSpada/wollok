import enfermedad.*

class EnfermedadInfecciosa inherits Enfermedad {
  override method afectar(unaPersona) {
    unaPersona.aumentarTemperatura(cantidadCelulasAmenazadas / 1000)
  }
  
  method duplicarCelulasAmenazadas() {
    cantidadCelulasAmenazadas *= 2
  }
  
  method esAgresiva(unaPersona) = cantidadCelulasAmenazadas > (unaPersona.celulas() * 0.1)
}

class EnfermedadAutoinmune inherits Enfermedad {
  var cantidadEfectosProducidos = 0
  
  override method afectar(unaPersona) {
    unaPersona.celulasDestruidas(cantidadCelulasAmenazadas)
    self.aumentarVecesQueAfecto()
  }
  
  method esAgresiva(_unaPersona) = cantidadEfectosProducidos > 30
  
  method aumentarVecesQueAfecto() {
    cantidadEfectosProducidos += 1
  }
}

object laMuerte inherits Enfermedad (cantidadCelulasAmenazadas = 0) {
  override method afectar(unaPersona) {
    unaPersona.bajarTodaTemperatura()
  }
  
  override method atenuarse(_cantidad) {
    
  }
  
  method esAgresiva(_unaPersona) = true
}

class EnfermedadAutoinmuneEINfecciosa inherits Enfermedad {
  
}