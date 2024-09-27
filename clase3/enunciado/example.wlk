/*
REQUISITOS

* Vender entradas: ¿De quien es la responsabilidad de vender una entrada para una funcion?

*/

class funcion {
  
  var predio
  var asientos = []

  method venderEntrada(persona) {
    predio.asignarAsiento(persona)
  }

}

class estadio {
  
}

class teatro {
  
}

class asiento {
  var persona = ""

  method estaOcupado() = persona != ""

  method asignar(otraPersona) {
    persona = otraPersona
  }
}