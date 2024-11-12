import persona.*

class Recuerdo{
    const descripcion
    const fecha = new Date() 
    const emocionDominante

    /** VIVIR **/
    method asentarse(unaPersona) {
        emocionDominante.efectos(self, unaPersona)
    }

    method esDificilExplicar() {
        var palabras = descripcion.split(" ")
        return palabras.size() > 10
    }

    /** DESCANSAR **/
    method emocionDominante() = emocionDominante

    method contieneLaPalabra(unaPalabra) = descripcion.contains(unaPalabra)

    method fecha() = fecha
}