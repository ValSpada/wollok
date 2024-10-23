import vikingo.*
import objetivos.*

class Expedicion {
  var vikingos = []
  var objetivosInvolucrados = []
  
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
    if (unVikingo.esDeCasta(jarl) && unVikingo.tieneArmas()) {
      throw new Exception(message = "El vikingo es un Jarl con armas")
    }
  }
  
  /*********************************************************************/
  method valeLaPena() = objetivosInvolucrados.all({ objetivo => objetivo.valeLaPena(vikingos.size()) })
  
  method invadirTierras() = objetivosInvolucrados.forEach({ objetivo => objetivo.serInvadido(vikingos.size(), self) })

  method contabilizarVidas() = vikingos.forEach { vikingo => vikingo.cobrarUnaVida() }

  method repartirBotin(unBotin) = vikingos.forEach { vikingo => vikingo.recibirBotin(unBotin / vikingos.size()) }
}