import persona.*

class Emocion {
    /** VIVIR **/
    method efectos(unRecuerdo, unaPersona) {
        // NO HACE NADA
    }

    /** DESCANSAR **/
    method niega(unRecuerdo) = false
}

object alegre inherits Emocion() {
    /** VIVIR **/
    override method efectos(unRecuerdo, unaPersona) {
        if (unaPersona.nivelFelicidad() > 500) unaPersona.almacenarPensamientoCentral(unRecuerdo)
    }

    /** DESCANSAR **/
    override method niega(unRecuerdo) = unRecuerdo.emocionDominante() != self
}

object triste inherits Emocion() {
    /** VIVIR **/
    override method efectos(unRecuerdo, unaPersona) {
        unaPersona.almacenarPensamientoCentral(unRecuerdo)
        unaPersona.disminuirNivelFelicidadPorcentaje(0.1)
    }

    /** DESCANSAR **/
    override method niega(unRecuerdo) = unRecuerdo.emocionDominante() == alegre
}

const disgusto = new Emocion()
const furioso = new Emocion()
const temeroso = new Emocion()

/** REMEMORAR **/

class EmocionCompuesta {
    var emociones = #{}

    method niega(unRecuerdo) = emociones.all{ emocion => emocion.niega(unRecuerdo) }

    method esAlegre() = emociones.any{ emocion => emocion == alegre }

    method efectos(unRecuerdo, unaPersona) = emociones.forEach{ emocion => emocion.efectos(unRecuerdo, unaPersona) }
}