class Vikingo {
  var casta
  var oro = 0
  
  method esProductivo()
  
  method esDeCasta(unaCasta) = self.casta() == casta
  
  method casta() = casta

  method oro() = oro

  method casta(unaCasta){
    casta = unaCasta
  }

  method recibirBotin(unBotin) {
    oro += unBotin
  }

  method escalarSocialmente() {
    casta.escalarSocialmente(self)
  }

  method ascender(unaCasta) {
    self.casta(unaCasta)
  }
}

class Soldado inherits Vikingo {
  var vidasCobradas = 0
  var cantidadDeArmas = 0
  
  override method esProductivo() = self.cobroMasDeTantasVidas(20) && self.tieneArmas()
  
  method cobroMasDeTantasVidas(cantidad) = vidasCobradas > cantidad
  
  method tieneArmas() = cantidadDeArmas > 0

  method cobrarUnaVida() {
    vidasCobradas += 1
  }

  method recompensasPorAscender() {
    cantidadDeArmas += 10
  }
}

class Granjero inherits Vikingo {
  var cantidadHectareas = 0
  var cantidadHijos = 0
  
  override method esProductivo() = (cantidadHectareas / 2) >= cantidadHijos

  method cobrarUnaVida(){
    // NO HACE NADA
  }

  method recompensasPorAscender() {
    cantidadHijos += 2
    cantidadHectareas += 2
  }
}

object jarl {
  method escalarSocialmente(unVikingo) {
    unVikingo.ascender(karl)
    unVikingo.recompensasPorAscender()
  }
}

object karl {
  method escalarSocialmente(unVikingo) {
    unVikingo.ascender(thrall)
  }
}

object thrall {
  method escalarSocialmente(unVikingo) {
    // NO HACE NADA
  }
}