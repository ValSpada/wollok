import actividades.*
import discusion.*
import argumentos.*

class Filosofo {
  var nombre = ""
  var honorificos = #{}
  var nivelIluminacion
  var actividades = []
  var property diasVividos // PROPERTY SOLO PARA TESTEAR
  var anios
  
  /** PUNTO 1 **/
  method presentarse() = (honorificos.join() + " ") + nombre
  
  /** PUNTO 2 **/
  method estaEnLoCorrecto() = nivelIluminacion > 1000
  
  /** PUNTO 3 **/
  method vivirUnDia() {
    self.realizarActividades()
    self.aumentarDia()
  }
  
  method realizarActividades() {
    actividades.forEach({ actividad => actividad.realizarse(self) })
  }
  
  method aumentarDia() {
    diasVividos += 1
    self.seCumpleAnio()
  }
  
  method seCumpleAnio() {
    if (diasVividos == 365) {
      anios += 1
      self.resetearDias()
      self.aumentarIluminacion(10)
      self.cumpleSesenta()
    }
  }
  
  method resetearDias() {
    diasVividos = 0
  }
  
  method aumentarIluminacion(cantidad) {
    nivelIluminacion += cantidad
  }
  
  method cumpleSesenta() {
    if (anios == 60) self.aniadirHonorifico("el sabio")
  }
  
  method disminuirIluminacion(cantidad) {
    nivelIluminacion -= cantidad
  }
  
  method aniadirHonorifico(unHonorifico) {
    honorificos.add(unHonorifico)
  }
  
  method nivelIluminacion() = nivelIluminacion
  
  method rejuvenecer(unosDias) {
    diasVividos -= unosDias
  }
} /** PUNTO 6 **/

class FilosofoContemporaneo inherits Filosofo {
  override method presentarse() = "hola"
  
  override method nivelIluminacion() {
    if (actividades.contains(admirarPaisaje)) {
      return nivelIluminacion * 5
    }
    
    return nivelIluminacion
    
  }
}