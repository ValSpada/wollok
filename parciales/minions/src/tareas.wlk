import roles.*

class Tarea {
  method realizarse(unTrabajador) {
    self.comprobarCapacidadTrabajador(unTrabajador)
    unTrabajador.tareaRealizada(self)
  }
  
  method comprobarCapacidadTrabajador(unTrabajador) {
    if (!self.laPuedeRealizar(unTrabajador)) {
      throw new DomainException(message = "El trabajador no puede realizar la tarea")
    }
  }
  
  method laPuedeRealizar(unTrabajador)
  
  method dificultad(unTrabajador)
}

class ArreglarMaquina inherits Tarea {
  var maquina
  
  override method laPuedeRealizar(unTrabajador) = (unTrabajador.estamina() == maquina.complejidad()) and unTrabajador.tiene(maquina.herramientasNecesarias())
  
  override method dificultad(unTrabajador) = maquina.complejidad() * 2
  
  method estaminaQueGasta(unTrabajador) = maquina.complejidad()
}

class Maquina {
  var complejidad
  var herramientasNecesarias = []
  
  method complejidad() = complejidad
  
  method herramientasNecesarias() = herramientasNecesarias
}

class DefenderSector inherits Tarea {
  var gradoAmenaza = 0
  
  override method laPuedeRealizar(unTrabajador) = unTrabajador.esDeRol(mucama) and (unTrabajador.fuerza() >= gradoAmenaza)
  
  override method dificultad(unTrabajador) = unTrabajador.dificultadDefensa(gradoAmenaza)
  
  method estaminaQueGasta(unTrabajador) {
    if (! unTrabajador.esDeRol(soldado)) {
      return unTrabajador.estamina() / 2
    } else {
      return 0
    }
  }
}

class LimpiarSector inherits Tarea {
  const dificultad = 10
  var sector

  override method laPuedeRealizar(unTrabajador) = unTrabajador.estamina() >= sector.estaminaRequerida()
  
  override method dificultad(unTrabajador) = dificultad
  
  method estaminaQueGasta(unTrabajador) {
   if (! unTrabajador.esDeRol(mucama)) {
      return sector.estaminaRequerida()
    } else {
      return 0
    }
  }
}

class Sector {
    var tamanioSector

    method estaminaRequerida() {
        if ( tamanioSector == sectorGrande ){
            return 4
        } else {
            return 1
        }
    }
}

object sectorGrande {
    // NO HACE NADA
}

object sectorChico {
    // NO HACE NADA
}