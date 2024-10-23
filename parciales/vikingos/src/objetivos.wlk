class Capital {
  var cantidadDefensores
  var factorDeRiqueza
  
  method valeLaPena(cantidadVikingos) = (self.cantidadBotin(cantidadVikingos) / 3) == cantidadVikingos
  
  method cantidadBotin(cantidadVikingos) = self.cantidadDefensoresDerrotados(cantidadVikingos) * factorDeRiqueza
  
  method serInvadido(cantidadVikingos, expedicion) {
    expedicion.contabilizarVidas()
    expedicion.repartirBotin(self.cantidadBotin(cantidadVikingos))
  }
  
  method cantidadDefensoresDerrotados(cantidadVikingos) = (cantidadDefensores - cantidadVikingos).min(cantidadVikingos)
}

class Aldea {
  var iglesias = []
  
  method valeLaPena(cantidadVikingos) = self.saciaLaSedSaqueos(15)
  
  method saciaLaSedSaqueos(unValor) = self.cantidadBotin() >= unValor
  
  method cantidadBotin() {
    const crucifijosPorIglesia = iglesias.map({ iglesia => iglesia.cantidadCrucifijos() })
    return crucifijosPorIglesia.sum()
  }
  
  method serInvadido(cantidadVikingos, expedicion) {
    expedicion.repartirBotin(self.cantidadBotin())
  }
}

class AldeaAmurallada inherits Aldea {
  var cantidadMinimaVikingos = 0
  
  override method valeLaPena(cantidadVikingos) = self.saciaLaSedSaqueos(15) && self.haySuficientesVikingos(cantidadVikingos)
  
  method haySuficientesVikingos(cantidadVikingos) = cantidadVikingos > cantidadMinimaVikingos
}

class Iglesia {
  var cantidadCrucifijos = 0
  
  method cantidadCrucifijos() = cantidadCrucifijos
}