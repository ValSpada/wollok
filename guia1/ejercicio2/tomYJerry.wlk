object tom {

  var energia = 100
  var velocidad = 5

  method energia() = energia

  method comerRaton(unRaton) {
    energia = energia + 12 + unRaton.peso()
  }

  method velocidadDeTom() {
    velocidad = 5 + energia / 10 
  }

  method correr(unaDistancia) {
    energia = energia - 0.5 * unaDistancia
  }

  method meConvieneComerRatonA(unRaton, unaDistancia) {
    return (12 + unRaton.peso()) > (0.5 * unaDistancia)
  }

}

object ratonA {

  var peso = 50

  method peso() = peso

}

object ratonB {
  
  var peso = 8

  method peso() = peso

}