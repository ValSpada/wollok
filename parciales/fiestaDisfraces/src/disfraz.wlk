import personas.*

class Disfraz {
  var caracteristicas = #{}
  var persona
  var dias
  var personaje = null
  var nombre
  var nivelGracia = 0

  method puntaje() = caracteristicas.sum({ caracteristica => caracteristica.puntos(self) })

  method persona() = persona
  method dias() = dias
  method personaje() = personaje
  method nombre() = nombre
  method nivelGracia() = nivelGracia
}

object gracioso {
  method puntos(unDisfraz) = if (unDisfraz.persona().edad() > 50) 3 * unDisfraz.nivelGracia() else unDisfraz.nivelGracia()
}

object tobaras {
    method puntos(unDisfraz) = if (unDisfraz.dias() >= 2) 5 else 3
}

object careta {
    method puntos(unDisfraz) = unDisfraz.personaje().valor() 
}

object sexy {
    method puntos(unDisfraz) = if (unDisfraz.persona().esSexy()) 15 else 2
}

class Personaje {
    const valor = 0

    method valor() = valor
}