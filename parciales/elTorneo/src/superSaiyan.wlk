import guerrero.*

object transformacionBase {
    const resistencia = 0

    method resistencia() = resistencia

    method semillaIngerida() {
        // NO HACE NADA
    }
}

class SuperSaiyan {
    const resistencia

    method resistencia() = resistencia

    method verificarEstado(unGuerrero) {
        if ( unGuerrero.energia() < unGuerrero.energiaOriginal() * 0.01) {
            unGuerrero.volverEstadoBase()
        }
    }

    method semillaIngerida(unGuerrero) {
        unGuerrero.aumentarPotencialOfensivoPorcentual(unGuerrero.potencialOfensivoOriginal(), 0.05)
    }
}

const superSaiyan  = new SuperSaiyan(resistencia = 0.05)
const superSaiyan2 = new SuperSaiyan(resistencia = 0.07)
const superSaiyan3 = new SuperSaiyan(resistencia = 0.15)