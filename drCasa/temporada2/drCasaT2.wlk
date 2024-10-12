import enfermedad.*
import jefeDeDepartamento.*
import medico.*

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

class Persona {
  var temperatura = 36
  var celulas
  var enfermedades
  
  method aumentarTemperatura(aumento) {
    temperatura = 45.min(temperatura + aumento)
  }
  
  method bajarTodaTemperatura() {
    temperatura = 0
  }
  
  method celulasDestruidas(cantidadCelulas) {
    celulas -= cantidadCelulas
  }
  
  method estaEnComa() = (temperatura == 45) || (celulas < 1000000)
  
  method contraerEnfermedad(unaEnfermedad) {
    enfermedades.add(unaEnfermedad)
  }
  
  method vivirUnDia() {
    enfermedades.forEach({ enfermedad => enfermedad.afectar(self) })
  }
  
  method celulasAfectadasAgresivamente() {
    var enfermedadesAgresivas = enfermedades.filter({ enfermedad => enfermedad.esAgresiva(self) })
    return enfermedadesAgresivas.sum({ enfermedad => enfermedad.cantidadCelulasAmenazadas() })
  }
  
  method enfermedadQueMasAfecta() {
    enfermedades.sortBy({ enfermedad1, enfermedad2 => enfermedad1.cantidadCelulasAmenazadas() > enfermedad2.cantidadCelulasAmenazadas() })
    return enfermedades.first()
  }
  
  method recibirMedicamento(unaDosis) {
    self.aplicarDosis(unaDosis)
    self.removerCuradas()
  }
  
  method aplicarDosis(unaDosis) {
    enfermedades.forEach({ enfermedad => enfermedad.atenuarse(unaDosis * 15) })
  }
  
  method removerCuradas() {
    enfermedades.removeAllSuchThat({ enfermedad => enfermedad.estaCurada() })
  }
  
  method tiene(unaEnfermedad) = enfermedades.contains(unaEnfermedad)
  
  method enfermedades() = enfermedades
  
  method temperatura() = temperatura
  
  method celulas() = celulas
  
  method celulas(cantidad) {
    celulas = cantidad
  }
  
  method temperatura(valor) {
    temperatura = valor
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