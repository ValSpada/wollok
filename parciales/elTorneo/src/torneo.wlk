import guerrero.*

// Este punto lo tomo como falopa

class Torneo {
  var modalidad
  var peleadores = []
  
  method elergirPeleadores(unaListaPeleadores) {
    modalidad.elegirPeleadores(peleadores, unaListaPeleadores)
  }
}

object surprise {
  method elegirPeleadores(unaColeccion, unaListaPeleadores) {
    16.times({ x => unaColeccion.add(unaListaPeleadores.anyOne()) })
  }
}

object funny {
  method elegirPeleadores(unaColeccion, unaListaPeleadores) = self.listaArmada(unaColeccion, unaListaPeleadores)
  
  method listaArmada(unaColeccion, unaListaPeleadores) {
    var peleadorMasPiezas = unaListaPeleadores.max({ peleador => peleador.cantidadPiezas() })
    unaColeccion.add(peleadorMasPiezas)
    if (unaColeccion.size() == 16) {
        return unaColeccion
    }
    self.listaArmada(unaColeccion, unaListaPeleadores.remove(peleadorMasPiezas))
  }
}

object surprise {
  method elegirPeleadores(unaColeccion, unaListaPeleadores) = self.listaArmada(unaColeccion, unaListaPeleadores)
  
  method listaArmada(unaColeccion, unaListaPeleadores) {
    var peleadorMasFuerte = unaListaPeleadores.max({ peleador => peleador.potencialOfensivo() })
    unaColeccion.add(peleadorMasFuerte)
    if (unaColeccion.size() == 16) {
        return unaColeccion
    }
    self.listaArmada(unaColeccion, unaListaPeleadores.remove(peleadorMasFuerte))
  }
}