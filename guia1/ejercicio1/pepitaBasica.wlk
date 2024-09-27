object pepita {
  
  var energia = 100
  var lugarActual = caba

  method energia() = energia

  method volar(unosKilometros) {
    energia = energia - (unosKilometros + 10)
  }

  method comer(unosGramos) {
    energia = energia + 4 * unosGramos
  }

  method dondeEsta() = lugarActual

  method irAlLugar(unLugar) {
    self.volar(unLugar.kilometros())
    lugarActual = unLugar
  }

  method puedeIrAlLugar(unLugar) {
    return energia > (unLugar.kilometros() + 10)
  }

}

object caba {

  var kilometros = 0

  method kilometros() = kilometros

}

object buenosAires {

  var kilometros = 12

  method kilometros() = kilometros

}

object santaFe {

  var kilometros = 237

  method kilometros() = kilometros

}