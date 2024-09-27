object juliana {

  var celular = samsungS21
  var gastoTotal = 0
  var servicio = personal

  method llamarA(unaPersona, duracion) {
    unaPersona.atender(duracion)
    celular.perderBateria(duracion)
    servicio.cobrar(duracion)
    self.gastoTotal(servicio.valorACobrar())
  }

  method atender(duracion) {
    celular.perderBateria(duracion)
    servicio.cobrar(duracion)
    self.gastoTotal(servicio.valorACobrar())
  }

  method ponerACargarCelular() {
    celular.cargar()
  }

  method tieneCelularApagado() {
    return celular.estaApagado()
  }

  method gastoTotal(gastos) {
    gastoTotal = gastoTotal + gastos
  }

}

object catalina {

  var celular = iphone
  var gastoTotal = 0
  var servicio = movistar

  method llamarA(unaPersona, duracion) {
    unaPersona.atender(duracion)
    celular.perderBateria(duracion)
    servicio.cobrar(duracion)
    self.gastoTotal(servicio.valorACobrar())
  }

  method atender(duracion) {
    celular.perderBateria(duracion)
    servicio.cobrar(duracion)
    self.gastoTotal(servicio.valorACobrar())
  }

  method ponerACargarCelular() {
    celular.cargar()
  }

  method tieneCelularApagado() {
    return celular.estaApagado()
  }

  method gastoTotal(gastos) {
    gastoTotal = gastos
  }

}

object samsungS21 {

  var bateria = 5

  method perderBateria(_duracionLlamada) {

    if (bateria != 0) {
      bateria = bateria - 0.25
    } else {
      bateria = 0
    }

  }

  method estaApagado() {
    return bateria == 0
  }

  method cargar() {
    bateria = 5
  }

}

object iphone {

  var bateria = 5

  method perderBateria(duracionLlamada) {

    if (bateria > 0) {
      bateria = bateria - (duracionLlamada * 0.1)
    } else if (bateria <= 0 ) {
      bateria = 0
    }

  }

  method estaApagado() {
    return bateria == 0
  }

  method cargar() {
    bateria = 5
  }

}

object movistar {

  var valorACobrar = 0

  method cobrar(duracion) {
    valorACobrar = 60 * duracion
  }

  method valorACobrar() = valorACobrar

}

object claro {

  var valorACobrar = 0

  method cobrar(duracion) {
    valorACobrar = 50 * duracion * 1.21
  }

  method valorACobrar() = valorACobrar

}

object personal {

  var valorACobrar = 0

  method cobrar(duracion) {
    
    if (duracion <= 10) {
      valorACobrar = 70
    } else {
      valorACobrar = 70 + 40 * duracion
    }

  }

  method valorACobrar() = valorACobrar

}