import personajes.*

class Casa {
  var miembros = #{}
  var patrimonio
  
  method admiteCasamiento(miembro, otraPersona)
  
  method esRica() = patrimonio > 1000

  method patrimonioPorPersonaje() = patrimonio / miembros.size()

  method miembros() = miembros

  method patrimonio() = patrimonio

  /**** HECHO PARA TESTEAR ****/
  method aniadirMiembro(unMiembro) {
    miembros.add(unMiembro)
  }

  method perderDineroPorPorcentaje(porcentaje) {
    patrimonio -= patrimonio * 0.1
  }
}

object lannister inherits Casa (patrimonio = 1000) {
  override method admiteCasamiento(unMiembro, _otraPersona) = unMiembro.noTieneConyuges()
}

object stark inherits Casa (patrimonio = 100) {
  override method admiteCasamiento(unMiembro, otraPersona) = not (miembros.contains(unMiembro) && miembros.contains(otraPersona))
}

object guardiaDeLaNoche inherits Casa (patrimonio = 10000) {
  override method admiteCasamiento(_unMiembro, _otraPersona) = false
}

const casas = [lannister, stark, guardiaDeLaNoche]