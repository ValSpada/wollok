import frutas.*
import tareas.*
import roles.*

class Minion {
  var estamina = 0
  var tareasRealizadas = []
  var rol
  
  method comerUnaFruta(unaFruta) {
    var estaminaRecuperada = unaFruta.estamina()
    self.recuperarEstamina(estaminaRecuperada)
  }
  
  method recuperarEstamina(unaCantidad)
  
  method estamina() = estamina
  
  method experiencia() = self.cantidadTareasRealizadas() * self.sumatoriaDificultadesTareasRealizadas()
  
  method cantidadTareasRealizadas() = tareasRealizadas.size()
  
  method sumatoriaDificultadesTareasRealizadas() {
    var dificultadesDeLasTareas = tareasRealizadas.map({ tarea => tarea.dificultad(self) })
    return dificultadesDeLasTareas.sum()
  }
  
  method realizarTarea(unaTarea) {
    if (self.esDeRol(capataz)) unaTarea.realizarse(rol.designarTrabajador(self, unaTarea)) else unaTarea.realizarse(self)
  }
  
  method tareaRealizada(unaTarea) {
    self.agregarTareaRealizada(unaTarea)
    self.perderEstamina(unaTarea)
  }
  
  method agregarTareaRealizada(unaTarea) {
    tareasRealizadas.add(unaTarea)
  }
  
  method perderEstamina(unaTarea) {
    estamina -= unaTarea.estaminaQueGasta(self)
  }
  
  method tiene(herramientasNecesarias) {
    var herramientasQueTiene = rol.herramientas()
    return herramientasNecesarias.all({ herramienta => herramientasQueTiene.contains(herramienta) })
  }
  
  method rol() = rol
  
  method rol(nuevoRol) {
    rol = nuevoRol
  }
  
  method esDeRol(unRol) = unRol == rol.verificadorRol()
  
  method fuerza() = rol.calcularFuerza(estamina / 2, self)
  
  method fuerzaReal(fuerza)
  
  method cambiarRol(nuevoRol) {
    rol.hayCambio()
    self.rol(nuevoRol)
  }
}

class Biclope inherits Minion {
  override method recuperarEstamina(unaCantidad) {
    estamina = 10.min(estamina + unaCantidad)
  }
  
  method dificultadDefensa(unaDificultad) = unaDificultad
  
  override method fuerzaReal(fuerza) = fuerza
}

class Ciclope inherits Minion {
  override method recuperarEstamina(unaCantidad) {
    estamina += unaCantidad
  }
  
  method dificultadDefensa(unaDificultad) = unaDificultad * 2
  
  override method fuerzaReal(fuerza) = fuerza / 2
}