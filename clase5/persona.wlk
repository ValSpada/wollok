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
  
  method donarA(unaPersona, cantidadADonar) {
    // FAIL FAST -> Fallar rapido
    if (puedeDonar(otraPersona, cantidadADonar)) {
      celulas -= cantidadADonar
      unaPersona.aumentarCelulas(cantidadADonar)
    } else {
      throw new DomainException(message = "Lo vas a matar pelotudo") // Excepción -> Flujos en el dominio que no van por el camino deseado
    }
  }

  method aumentarCelulas(cantidad) {
    cantidadCelulas += cantidad
  }

  method puedeDonar(otraPersona, cantidadADonar) = self.tieneSuficienteCelulasParaDonar(cantidadADonar) and self.esCompatibleCon(otraPersona)

  method tieneSuficienteCelulasParaDonar(cantidadADonar) = cantidadADonar > 500 and cantidadADonar <= celulas * 0.25

  method esCompatibleCon(otraPersona) = true

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

class GrupoSanguineo {
  var gruposSanguineosCompatibles = []
  
  method esCompatible(grupo) = gruposSanguineosCompatibles.contains(grupo)
}