import panelistas.*
import tematicas.*
import emisiones.*

class TipoPanelista {
  method acumularPuntosEstrellaRemate(unPanelista, unaTematica)
  
  method efectoPostRemate(unPanelista) {
    
    // PARA LA MAYORIA, NO HACE NADA
  }
  
  method opinar(unPanelista, unaTematica) = unaTematica.puntosOpinoin(self, unPanelista)
}

object celebridad inherits TipoPanelista {
  override method acumularPuntosEstrellaRemate(unPanelista, _unaTematica) {
    unPanelista.aumentarPuntosEstrella(3)
  }
}

object colorado inherits TipoPanelista {
  override method acumularPuntosEstrellaRemate(unPanelista, _unaTematica) {
    unPanelista.aumentarPuntosEstrella(self.calcularPuntos(unPanelista))
  }
  
  override method efectoPostRemate(unPanelista) {
    unPanelista.aumentarPuntosEstrella(1)
  }
  
  method calcularPuntos(unPanelista) = unPanelista.gracia() / 5
}

object coloradoConPeluca inherits TipoPanelista {
  override method acumularPuntosEstrellaRemate(unPanelista, _unaTematica) {
    unPanelista.aumentarPuntosEstrella(colorado.calcularPuntos(unPanelista) + 1)
  }
  
  override method efectoPostRemate(unPanelista) {
    colorado.efectoPostRemate(unPanelista)
  }
}

object viejo inherits TipoPanelista {
  override method acumularPuntosEstrellaRemate(unPanelista, unaTematica) {
    unPanelista.aumentarPuntosEstrella(unaTematica.cantidadPalabrasTitulo())
  }
}

object deportivo inherits TipoPanelista {
  override method acumularPuntosEstrellaRemate(unPanelista, _unaTematica) {
    
    // NO HACE NADA
  }
}