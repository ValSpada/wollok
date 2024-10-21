import vikingo

class Expedicion {
  var vikingos = []
  
  method subirAUnVikingo(unVikingo) {
    self.esProductivo(unVikingo)
    self.esJarlYNoTieneArmas(unVikingo)
    
    vikingos.add(unVikingo)
  }
  
  method esProductivo(unVikingo) {
    if (!unVikingo.esProductivo()) {
      throw new Exception(message = "El vikingo no es productivo")
    }
  }
  
  method esJarlYNoTieneArmas(unVikingo) {
    if (unVikingo.esDeCasta(jarl) && (!unVikingo.tieneArmas())) {
      throw new Exception(message = "El vikingo es un Jarl con armas")
    }
  }
}