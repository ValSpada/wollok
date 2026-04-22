import filosofo.*

class Actividad {
  method realizarse(unFilosofo)
}

object tomarVino inherits Actividad {
  override method realizarse(unFilosofo) {
    unFilosofo.disminuirIluminacion(10)
    unFilosofo.aniadirHonorifico("el borracho")
  }
}

class JuntarseEnElAgora inherits Actividad {
  var filosofoCitado
  
  override method realizarse(unFilosofo) {
    unFilosofo.aumentarIluminacion(filosofoCitado.nivelIluminacion() / 10)
  }
}

object admirarPaisaje inherits Actividad {
  override method realizarse(unFilosofo) {
    
    // NO HACE NADA
  }
}

class MeditarBajoUnaCascada inherits Actividad {
  var metros
  
  override method realizarse(unFilosofo) {
    unFilosofo.aumentarIluminacion(10 * metros)
  }
}

class PracticarDeporte inherits Actividad {
  var dias
  
  override method realizarse(unFilosofo) {
    unFilosofo.rejuvenecer(dias)
  }
  
  method dias() = dias
}

const practicarFutbol = new PracticarDeporte(dias = 1)

const practicarPolo = new PracticarDeporte(dias = 2)

const practicarWaterpolo = new PracticarDeporte(dias = 2 * practicarPolo.dias())