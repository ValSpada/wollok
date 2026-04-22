import tematicas.*
import panelistas.*
import tipoPanelista.*

class Emision {
  var tematicas = #{}
  var panelistas = #{}
  var seEmitio = false
  
  method sePuedeEmitir() = self.tieneSuficientesPanelistas() && self.suficientesTematicasInteresantes()
  
  method tieneSuficientesPanelistas() = panelistas.size() >= 2
  
  method suficientesTematicasInteresantes() {
    var tematicasInteresantes = tematicas.filter({ tematica => tematica.esInteresante() })
    return tematicasInteresantes.size() >= (tematicas.size() / 2)
  }
  
  method emitirse() {
    tematicas.forEach({ tematica => tematica.serAbordada(panelistas) })
    self.seEmitio(true)
  }
  
  method seEmitio(unValor) {
    seEmitio = unValor
  }
  
  method panelistaEstrella() {
    if (seEmitio) {
      panelistas.max({ panelista => panelista.puntosEstrella() })
    } else {
      throw new DomainException(message = " El programa no se emitió ")
    }
  }
}