import personas.*

object caprichoso {
    method condicion(unDisfraz) = unDisfraz.nombre().size() % 2 == 0
}

object pretencioso {
    method condicion(unDisfraz) = unDisfraz.dias() < 30
}

class Numerologo {
    var numero

    method condicion(unDisfraz) = unDisfraz.puntaje() == numero
}