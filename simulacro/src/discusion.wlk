import filosofo.*
import argumentos.*

class Partido {
    var filosofo
    var argumentos = #{}

    method filosofo() = filosofo

    method argumentos() = argumentos

    method mitadArgumentosEnriquecedores() {
        var argumentosEnriquecedores = argumentos.filter{ argumento => argumento.esEnriquecedor() }
        return argumentosEnriquecedores.size() > (argumentos.size() / 2)
    }

    method agregarArgumento(unArgumento) {
        argumentos.add(unArgumento)
    }
}

class Discusion {
    var partido1
    var partido2
    
    method esBuena() = self.mitadArgumentosDeLosPartidosSonEnriquecedores() && self.filosofosEstanEnLoCorrecto()
    

    method mitadArgumentosDeLosPartidosSonEnriquecedores() = partido1.mitadArgumentosEnriquecedores() && partido2.mitadArgumentosEnriquecedores()

    method filosofosEstanEnLoCorrecto() = partido1.filosofo().estaEnLoCorrecto() && partido2.filosofo().estaEnLoCorrecto()
}