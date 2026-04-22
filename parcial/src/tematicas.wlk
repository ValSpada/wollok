import panelistas.*
import tipoPanelista.*
import emisiones.*

class Tematica {
  const titulo
  
  method esInteresante() = false
  
  method titulo() = titulo
  
  method serAbordada(unosPanelistas) {
    unosPanelistas.forEach({ panelista => panelista.abordar(self) })
  }
  
  method puntosOpinion(unTipo, unPanelista) = 1
}

class TematicaFilosofica inherits Tematica {
  override method esInteresante() = titulo.split(" ").size() > 20
}

class TematicaFarandula inherits Tematica {
  var involucrados = #{}
  
  override method esInteresante() = involucrados.size() >= 3
  
  override method puntosOpinion(unTipo, unPanelista) = if (involucrados.contains(unPanelista)) 5 else 1
}

class TematicaDeportiva inherits Tematica {
  override method esInteresante() = titulo.contains("Messi")
  
  override method puntosOpinion(unTipo, unPanelista) = if (unTipo == deportivo) 5 else 1
}

class TematicaEconomica inherits Tematica {
  
}

class TematicaMoral inherits Tematica {
  
}

class TematicaMixta inherits Tematica {
  var tematicas
  
  override method esInteresante() = tematicas.any({ tematica => tematica.esInteresante() })
  
  override method titulo() = tematicas.map({ tematica => tematica.titulo() }).join(" - ")
  
  override method puntosOpinion(unTipo, unPanelista) = tematicas.map({ tematica => tematica.puntosOpinion(unTipo, unPanelista) }).sum()
}