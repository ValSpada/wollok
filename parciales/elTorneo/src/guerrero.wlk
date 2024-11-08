import traje.*

class Guerrero {
    var potencialOfensivo
    var energia
    const energiaOriginal
    var experiencia
    var traje

    /** PUNTO 1 **/
    method atacar(unGuerrero) {
        unGuerrero.serAtacado(self.potencialOfensivo())
    }

    method serAtacado(unPotencialOfensivo) {
        //self.perderEnergiaPorcentualmente(0.1, unPotencialOfensivo)
        //self.aumentarExperiencia(1)
        traje.recibirAtaque(self, unPotencialOfensivo)
    }    

    method perderEnergiaPorcentualmente(unPorcentaje, unPotencialOfensivo) {
        energia -= unPorcentaje * unPotencialOfensivo
    }

    method aumentarExperiencia(puntosXp) {
        experiencia += puntosXp
    }

    method comerSemillaErmitanio() {
        energia = energiaOriginal
    }

    method perderTraje() {
        traje = trajeBase
    }

    method energia() = energia

    method experiencia() = experiencia

    method traje() = traje

    method potencialOfensivo() = potencialOfensivo

    // Solo para testear
    method traje(unTraje) {
        traje = unTraje
    }
}