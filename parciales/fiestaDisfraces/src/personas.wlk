import disfraz.*
import personalidad.*
import opinionDisfraz.*

class Persona{
    var edad
    const personalidad
    var disfraz = null
    var opinionDisfraz

    method edad() = edad

    method esSexy() = personalidad.esSexy(self)

    method disfraz() = disfraz

    method estaConformeConSuDisfraz(unDisfraz) = unDisfraz.puntaje() > 10 && opinionDisfraz.condicion(unDisfraz) 

    method estaDisconformeConSuDisfraz() = not self.estaConformeConSuDisfraz(self.disfraz())

    method disfraz(unDisfraz) {
        disfraz = unDisfraz
    }

    method tieneDisfraz() = disfraz != null
}

