import personajes.*
import casas.*

object sutil {
  method accionParaLaCausa(objetivo) {
    var casaPobre = casas.min{ casa => casa.patrimonio() }
    var persona = casaPobre.miembros().findOrElse({miembro => miembro.estaVivo() && miembro.noTieneConyuges()}, { throw new DomainException(message = "No se encontro a nadie") })

    objetivo.casarse(persona)
  }
}

object asesino {
    method accionParaLaCausa(objetivo) {
        objetivo.morir()
    }
}

object asesinoPrecavido {
    method accionParaLaCausa(objetivo) {
        if (objetivo.estaSolo()) {
            objetivo.morir()
        }
    }
}

object disipado {
    var porcentaje = 0.1

    method accionParaLaCausa(objetivo) {
        objetivo.derrocharFortuna(porcentaje)
    }
}

object miedoso {
    method accionParaLaCausa(_objetivo) {
        // No hacen nada porque son terribles cagones
    }
}