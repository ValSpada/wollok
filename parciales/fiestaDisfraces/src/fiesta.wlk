import personas.*

class Fiesta {
    var property asistentes = #{} // PROPERTY PARA TESTEAR 


    /** PUNTO 2 **/
    
    method esUnBodrio() = asistentes.all{ asistente => asistente.estaDisconformeConSuDisfraz() }

    /** PUNTO 3 **/

    method mejorDisfraz() = asistentes.map{ asistente => asistente.disfraz() }.max{ disfraz => disfraz.puntaje() }

    /** PUNTO 4 **/

    method puedenIntercambiarDisfraz(unaPersona, otraPersona) = self.estanEnLaFiesta(unaPersona, otraPersona) && self.algunoEstaDisconforme(unaPersona, otraPersona) && self.cambiandoTrajesMejoran(unaPersona, otraPersona)

    method estanEnLaFiesta(unaPersona, otraPersona) = self.estaEnLaFiesta(unaPersona) && self.estaEnLaFiesta(otraPersona)

    method estaEnLaFiesta(unaPersona) = asistentes.contains(unaPersona)

    method algunoEstaDisconforme(unaPersona, otraPersona) = unaPersona.estaDisconformeConSuDisfraz() || otraPersona.estaDisconformeConSuDisfraz()

    method cambiandoTrajesMejoran(unaPersona, otraPersona) = unaPersona.estaConformeConSuDisfraz(otraPersona.disfraz()) && otraPersona.estaConformeConSuDisfraz(unaPersona.disfraz())

    /** PUNTO 5 **/

    method agregarAsistente(unaPersona) {
        if (unaPersona.tieneDisfraz() && not asistentes.contains(unaPersona)){
            asistentes.add(unaPersona)
        }
    }

    /** PUNTO 6 **/

    method fiestaInolvidable() = asistentes.all{ asistente => asistente.esSexy() && asistente.estaConformeConSuDisfraz(asistente.disfraz()) }
}