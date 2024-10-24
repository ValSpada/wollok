class Rol{
    const verificadorRol

    method verificadorRol() = verificadorRol

    method herramientas() = []

    method calcularFuerza(fuerza, unTrabajador) = unTrabajador.fuerzaReal(fuerza) 

    method hayCambio(){
        // EN GENERAL, NO HACE NADA
    }
}

class Soldado inherits Rol(verificadorRol = soldado) {
  var practica = 0
  
  method usarArma(){
    self.ganarPractica()
  }

  method ganarPractica(){
    practica += 1
  }

  override method calcularFuerza(fuerza, unTrabajador) = unTrabajador.fuerzaReal(fuerza + practica) 

  override method hayCambio(){
    practica = 0
  }
}

class Obrero inherits Rol(verificadorRol = obrero) {
  var herramientas = []

  override method herramientas() = herramientas
}

class Mucama inherits Rol(verificadorRol = mucama) {
  // NO HACE NADA NUEVO
}

class Capataz inherits Rol(verificadorRol = capataz) {
    var subordinados = []

    method designarTrabajador(elCapataz, unaTarea) {
        var subordinadosCapacitados = subordinados.filter { subordinado => unaTarea.laPuedeRealizar(subordinado) }
        if ( subordinadosCapacitados.isEmpty() ){
            return elCapataz
        } else {
            return subordinadosCapacitados.max { subordinado => subordinado.experiencia() }
        }
    }
}

object mucama{
    // NO HACE NADA
}

object soldado{
    // NO HACE NADA
}

object obrero{
    // NO HACE NADA
}

object capataz{
    // NO HACE NADA
}