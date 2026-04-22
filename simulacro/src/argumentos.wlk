import discusion.*
import filosofo.*

class Argumento {
  var naturalezas = []
  var descripcion = ""
  
  method esEnriquecedor() = naturalezas.all({ naturaleza => naturaleza.esEnriquecedora(descripcion) })
}

object estoica {
   method esEnriquecedora(descripcion) = true
}

object moralista {
  method esEnriquecedora(descripcion) = descripcion.split(" ") >= 10
}

object esceptica {
    method esEnriquecedora(descripcion) = descripcion.endsWith("?")
}

object cinica {
    method esEnriquecedora(descripcion) = 0.randomUpTo(100) > 30
}