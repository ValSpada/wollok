class EnfermedadInfecciosa {
  var cantidadCelulasAmenazadas
  var clasificacion = "no agresiva"
  
  method efectoDeLaEnfermedad(unaPersona) {
    unaPersona.aumentarTemperatura(cantidadCelulasAmenazadas / 1000)
  }
  
  method duplicarCelulasAmenazadas() {
    cantidadCelulasAmenazadas = cantidadCelulasAmenazadas * 2
  }
  
  method verificarClasificacion(unaPersona) {
    if (cantidadCelulasAmenazadas > (unaPersona.celulas() * 0.1)) {
      clasificacion = "agresiva"
    } else {
      clasificacion = "no agresiva"
    }
  }
  
  method cantidadCelulasAmenazadas() = cantidadCelulasAmenazadas
}

class EnfermedadAutoinmune {
  var cantidadCelulasAmenazadas
  var clasificacion = "no agresiva"
  var cantidadEfectosProducidos = 0
  
  method efectoDeLaEnfermedad(unaPersona) {
    unaPersona.celulasDestruidas(cantidadCelulasAmenazadas)
    cantidadEfectosProducidos = cantidadEfectosProducidos + 1
  }
  
  method verificarClasificacion() {
    if (cantidadEfectosProducidos > 30) {
      clasificacion = "agresiva"
    } else {
      clasificacion = "no agresiva"
    }
  }
  
  method cantidadCelulasAmenazadas() = cantidadCelulasAmenazadas
}

class Persona {
  var temperatura = 36
  var celulas
  var enfermedades
  
  method aumentarTemperatura(aumento) {
    if (temperatura < 45) {
      temperatura = temperatura + aumento
    } else {
      temperatura = 45
    }
  }
  
  method celulasDestruidas(cantidadCelulas) {
    celulas = celulas - cantidadCelulas
  }
  
  method estaEnComa() = (temperatura == 45) || (celulas < 1000000)
  
  method contraerEnfermedad(unaEnfermedad) {
    enfermedades.add(unaEnfermedad)
  }

  method pasarElDía() {
    enfermedades.map
  }
  
  method enfermedades() = enfermedades
  
  method temperatura() = temperatura
  
  method celulas() = celulas
}

const malaria = new EnfermedadInfecciosa(cantidadCelulasAmenazadas = 500)

const otitis = new EnfermedadInfecciosa(cantidadCelulasAmenazadas = 100)

const lupus = new EnfermedadAutoinmune(cantidadCelulasAmenazadas = 1000)

const malariaPremiun = new EnfermedadInfecciosa(cantidadCelulasAmenazadas = 800)

const logan = new Persona(celulas = 3000000, enfermedades = [malaria, otitis, lupus])

const frank = new Persona(celulas = 3500000, enfermedades = [])