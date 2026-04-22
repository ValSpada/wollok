import tipoPanelista.*
import tematicas.*
import emisiones.*

class Panelista {
  const tipoPanelista
  var gracia
  var puntosEstrella
  
  method darUnRemateGracioso(unaTematica) {
    tipoPanelista.acumularPuntosEstrellaRemate(self, unaTematica)
  }
  
  method postRemate() {
    tipoPanelista.efectoPostRemate(self)
  }
  
  method aumentarPuntosEstrella(unosPuntos) {
    puntosEstrella += unosPuntos
  }
  
  method gracia() = gracia
  
  method opinar(unaTematica) {
    self.aumentarPuntosEstrella(tipoPanelista.opinar(self, unaTematica))
  }
  
  method puntosEstrella() = puntosEstrella
  
  method abordar(unaTematica) {
    self.opinar(unaTematica)
    self.darUnRemateGracioso(unaTematica)
    self.postRemate()
  }
  
  method esTipo(unTipo) = tipoPanelista == unTipo
}