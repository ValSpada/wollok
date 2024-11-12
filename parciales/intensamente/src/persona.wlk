import recuerdo.*
import emocion.*

class Persona {
  var nivelFelicidad = 1000
  var recuerdosDelDia = []
  var pensamientosCentrales = #{}
  var emocionActual
  var largoPlazo = []
  var edad
  
  /** VIVIR **/
  method vivirUnEvento(unEvento) {
    self.guardarRecuerdo(unEvento)
  }
  
  method guardarRecuerdo(unEvento) {
    var recuerdo = new Recuerdo(descripcion = unEvento.descripcion(), emocionDominante = emocionActual)
    recuerdosDelDia.add(recuerdo)
  }
  
  method asentarRecuerdo(unRecuerdo) {
    unRecuerdo.asentarse(self)
  }
  
  method almacenarPensamientoCentral(unRecuerdo) {
    pensamientosCentrales.add(unRecuerdo)
  }
  
  method disminuirNivelFelicidadPorcentaje(unPorcentaje) {
    self.disminuirNivelFelicidad(nivelFelicidad * unPorcentaje)
    self.verificarNivelFelicidad()
  }
  
  method disminuirNivelFelicidad(unaCantidad) {
    nivelFelicidad -= unaCantidad
  }
  
  method verificarNivelFelicidad() {
    if (nivelFelicidad < 1) {
      throw new DomainException(message = "Los niveles de felicidad de Riley son criticos")
    }
  }
  
  method nivelFelicidad() = nivelFelicidad
  
  method recuerdosRecientesDelDia() = recuerdosDelDia.take(5)
  
  method pensamientosCentrales() = pensamientosCentrales
  
  method pensamientosCentralesDificilesDeExplicar() = pensamientosCentrales.filter({ pensamiento => pensamiento.esDificilExplicar() })
  
  /** DESCANSAR **/
  method negarRecuerdo(unRecuerdo) {
    emocionActual.niega(unRecuerdo)
  }
  
  method dormir(unaPalabra) {
    self.asentarRecuerdos(recuerdosDelDia)
    self.asentarRecuerdosSelectivamente(unaPalabra)
    self.profundizacion()
    self.controlHormonal()
    self.restauracionCognitiva()
    self.liberarRecuerdosDelDia()
  }
  
  method asentarRecuerdos(unosRecuerdos) {
    unosRecuerdos.forEach({ recuerdo => self.asentarRecuerdo(recuerdo) })
  }
  
  method asentarRecuerdosSelectivamente(unaPalabra) {
    var recuerdosSeleccionados = self.filtrarRecuerdos({ recuerdo => recuerdo.contieneLaPalabra(unaPalabra) })
    self.asentarRecuerdos(recuerdosSeleccionados)
  }
  
  method profundizacion() {
    var recuerdosAprobados = self.filtrarRecuerdos({ recuerdo => self.noEsCentral(recuerdo) && (not self.negarRecuerdo(recuerdo)) })
    recuerdosDelDia.forEach({ recuerdo => self.enviarseALargoPlazo(recuerdo) })
  }
  
  method filtrarRecuerdos(unBloque) = recuerdosDelDia.filter(unBloque)
  
  method noEsCentral(unRecuerdo) = not pensamientosCentrales.contains(unRecuerdo)
  
  method enviarseALargoPlazo(unRecuerdo) {
    largoPlazo.add(unRecuerdo)
  }
  
  method controlHormonal() {
    if (self.pensamientoCentralEstaLargoPlazo() || self.losPensamientosDelDiaComapartenEmocion()) {
      self.disminuirNivelFelicidadPorcentaje(0.15)
      self.perderPensamientosCentralesAntiguos()
    }
  }
  
  method pensamientoCentralEstaLargoPlazo() = pensamientosCentrales.any({ pensamiento => largoPlazo.contains(pensamiento) })
  
  method losPensamientosDelDiaComapartenEmocion() = recuerdosDelDia.all({ pensamiento => pensamiento.emocionDominante() == emocionActual })
  
  method perderPensamientosCentralesAntiguos() {
    pensamientosCentrales.sortedBy({ pensamiento1, pensamiento2 => pensamiento1.fecha() > pensamiento2.fecha() })
    pensamientosCentrales = pensamientosCentrales.take(pensamientosCentrales.size() - 3)
  }
  
  method restauracionCognitiva() {
    self.aumentarNivelFelicidad(100)
    if (nivelFelicidad > 1000) {
      nivelFelicidad = 1000
    }
  }
  
  method aumentarNivelFelicidad(unaCantidad) {
    nivelFelicidad += unaCantidad
  }
  
  method liberarRecuerdosDelDia() {
    recuerdosDelDia.clear()
  }
  
  /** REMEMORAR **/
  method rememorar() {
    recuerdosDelDia.add(self.pensamientoLargoPlazoAleatorio())
  }
  
  method pensamientoLargoPlazoAleatorio() = largoPlazo.filter({ recuerdo => self.recuerdoAntiguo(recuerdo) }).anyOne()
  
  method recuerdoAntiguo(unRecuerdo) = edad > (new Date().year() - unRecuerdo.fecha().year())
  
  method recuerdoRepetido(unRecuerdo) = largoPlazo.count({ pensamiento => pensamiento == unRecuerdo })
  
  method dejaVu(unRecuerdo) = self.recuerdoRepetido(unRecuerdo) > 1
}