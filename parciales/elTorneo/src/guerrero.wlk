import traje.*
import superSaiyan.*

class Guerrero {
  var potencialOfensivo
  const potencialOfensivoOriginal
  var energia
  const energiaOriginal
  var experiencia
  var traje
  var raza
  var transformacion = transformacionBase
  
  /** PUNTO 1 **/
  method atacar(unGuerrero) {
    unGuerrero.serAtacado(self.potencialOfensivo())
  }
  
  method serAtacado(unPotencialOfensivo) {
    //self.perderEnergiaPorcentualmente(0.1, unPotencialOfensivo)
    //self.aumentarExperiencia(1)
    traje.recibirAtaque(self, unPotencialOfensivo, transformacion)
    self.verificarTransformacion()
  }
  
  method volverEstadoBase() {
    self.transformacion(transformacionBase)
  }
  
  method perderEnergiaPorcentualmente(unPorcentaje, unPotencialOfensivo) {
    energia -= unPorcentaje * unPotencialOfensivo
  }
  
  method aumentarExperiencia(puntosXp) {
    experiencia += puntosXp
  }
  
  method comerSemillaErmitanio() {
    self.energia(energiaOriginal)
    transformacion.semillaIngerida(self)
  }
  
  method perderTraje() {
    traje = trajeBase
  }
  
  method transformarseEnSuperSaiyan(unaTransformacion) {
    if (self.esDeRaza(saiyan)) {
      self.transformacion(unaTransformacion)
      self.aumentarPotencialOfensivoPorcentual(potencialOfensivo, 0.5)
    }
  }
  
  method aumentarPotencialOfensivoPorcentual(unPotencial, unPorcentaje) {
    potencialOfensivo += unPotencial * unPorcentaje
  }
  
  method verificarTransformacion() {
    if (transformacion != transformacionBase) transformacion.verificarEstado(self)
  }
  
  method esDeRaza(unaRaza) = unaRaza == self.raza()
  
  method energia() = energia
  
  method experiencia() = experiencia
  
  method traje() = traje
  
  method potencialOfensivo() = potencialOfensivo
  
  method potencialOfensivoOriginal() = potencialOfensivoOriginal
  
  method raza() = raza
  
  method energiaOriginal() = energiaOriginal
  
  method transformacion(unaTransformacion) {
    transformacion = unaTransformacion
  }
  
  method energia(unaEnergia) {
    energia = unaEnergia
  }
  
  // Solo para testear
  method traje(unTraje) {
    traje = unTraje
  }
}

object saiyan {
  // NO HACE NADA
}

object humano {
  // NO HACE NADA
}

object namekiano {
  // NO HACE NADA
}

object demonioFrio {
  // NO HACE NADA
}