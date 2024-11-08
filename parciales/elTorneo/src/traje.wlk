import guerrero.*

class Traje {
  var desgaste = 0
  
  method recibirAtaque(unGuerrero, unPotencialOfensivo) {
    self.aplicarDesgaste(unGuerrero)
    self.aplicarEfectosCombate(unGuerrero, unPotencialOfensivo)
  }
  
  method aplicarDesgaste(unGuerrero) {
    self.aumentarDesgaste()
    self.verificarIntegridadTraje(unGuerrero)
  }
  
  method aumentarDesgaste() {
    desgaste += 5
  }
  
  method verificarIntegridadTraje(unGuerrero) {
    if (desgaste == 100) unGuerrero.perderTraje()
  }
  
  method aplicarEfectosCombate(unGuerrero, unPotencialOfensivo)
  
  method desgaste() = desgaste
}

class TrajeComun inherits Traje {
  var porcentajeProteccion
  
  override method aplicarEfectosCombate(unGuerrero, unPotencialOfensivo) {
    unGuerrero.perderEnergiaPorcentualmente(0.1 - porcentajeProteccion, unPotencialOfensivo)
    unGuerrero.aumentarExperiencia(1)
  }
}

class TrajeEntrenamiento inherits Traje {
  const porcentajeXp = 2
  
  override method aplicarEfectosCombate(unGuerrero, unPotencialOfensivo) {
    unGuerrero.perderEnergiaPorcentualmente(0.1, unPotencialOfensivo)
    unGuerrero.aumentarExperiencia(1 * porcentajeXp)
  }
}

object trajeBase inherits Traje {
  override method recibirAtaque(unGuerrero, unPotencialOfensivo) {
    self.aplicarEfectosCombate(unGuerrero, unPotencialOfensivo)
  }
  
  override method aplicarEfectosCombate(unGuerrero, unPotencialOfensivo) {
    unGuerrero.perderEnergiaPorcentualmente(0.1, unPotencialOfensivo)
    unGuerrero.aumentarExperiencia(1)
  }
}

/** PUNTO 4 **/

class TrajeModularizado inherits Traje() {
  var piezas = []
  
  override method aplicarEfectosCombate(unGuerrero, unPotencialOfensivo) {
    unGuerrero.perderEnergiaPorcentualmente(0.1 - self.reduccionDanio(), unPotencialOfensivo)
    unGuerrero.aumentarExperiencia(1 * self.aumentoXp())
  }

  method reduccionDanio() = piezas.sum{ pieza => pieza.porcentajeResistencia() }

  method aumentoXp() {
    var piezasDesgastadas = piezas.filter{ pieza => pieza.estaGastada() }
    return piezasDesgastadas.size() * 1 / piezas.size()
  }

  override method aumentarDesgaste() {
    piezas.forEach{ pieza => pieza.aplicarDesgaste() }
  }

  override method verificarIntegridadTraje(unGuerrero) {
    if (piezas.all{ pieza => pieza.estaDesgastada() }) unGuerrero.perderTraje()
  }
}

class Pieza {
  var porcentajeResistencia
  var desgaste = 0
  var valorDesgaste

  method porcentajeResistencia() = porcentajeResistencia

  method aplicarDesgaste() {
    desgaste += valorDesgaste
  }

  method estaDesgastada() = desgaste >= 20
}