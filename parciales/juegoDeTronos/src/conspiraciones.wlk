import personajes.*

// No haré el punto del builder ya que no lo vimos
class Conspiracion {
  var personaObjetivo
  var personajesComplotados = #{}
  
  method agregarPersonajeComplotado(personaje) {
    personajesComplotados.add(personaje)
  }
  
  method cantidadTraidores() {
    var traidores = personaObjetivo.aliados().intersection(personajesComplotados)
    return traidores.size()
  }
  
  method ejecutar() {
    personajesComplotados.forEach({ personaje => personaje.ejecutarConspiracion(personaObjetivo) })
  }
  
  method seCumplioObjetivo() = not personaObjetivo.esPeligroso()
}