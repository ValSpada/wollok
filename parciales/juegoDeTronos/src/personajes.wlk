import casas.*
import acompaniantes.*
import conspiraciones.*
import personalidades.*

class Personaje {
  var casa
  var conyuges = #{}
  var acompaniantes = #{}
  var estaVivo = true
  var personalidad
  
  method puedeCasarse(otraPersona) = casa.admiteCasamiento(self, otraPersona) && otraPersona.pedirAdmision(self)
  
  method pedirAdmision(otraPersona) = casa.admiteCasamiento(self, otraPersona)
  
  method noTieneConyuges() = conyuges.isEmpty()
  
  method patrimonio() = casa.patrimonioPorPersonaje()
  
  method casarse(otraPersona) {
    self.validarCasamiento(otraPersona)
    self.aniadirConyuge(otraPersona)
    otraPersona.aniadirConyuge(self)
  }
  
  method aniadirConyuge(otraPersona) {
    conyuges.add(otraPersona)
  }
  
  method validarCasamiento(otraPersona) {
    if (!self.puedeCasarse(otraPersona)) {
      throw new DomainException(message = "No se permite el casamiento")
    }
  }
  
  /************** PARTE B ***************/
  method estaSolo() = acompaniantes.isEmpty()
  
  method aliados() = (acompaniantes + conyuges) + casa.miembros()
  
  method esPeligroso() = estaVivo && ((self.aliadosConMasDeTantoOro(10000) || self.conyugesSonDeCasaRica()) || self.tieneAliadoPeligroso())
  
  method aliadosConMasDeTantoOro(cantidad) = self.aliados().sum({ aliado => aliado.patrimonio() }) > cantidad
  
  method conyugesSonDeCasaRica() = conyuges.all({ conyugue => conyugue.esDeCasaRica() })
  
  method esDeCasaRica() = casa.esRica()
  
  method tieneAliadoPeligroso() = self.aliados().any({ aliado => aliado.esPeligroso() })

  /************** PARTE C ***************/

  method estaVivo() = estaVivo

  method estaVivo(estado) {
    estaVivo = estado
  }

  method morir() {
    self.estaVivo(false)
  }

  method derrocharFortuna(porcentaje) {
    casa.perderDineroPorPorcentaje(porcentaje)
  }  

  method ejecutarConspiracion(objetivo){
    personalidad.accionParaLaCausa(objetivo)
  } 

}