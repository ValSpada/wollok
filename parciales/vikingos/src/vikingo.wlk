class Vikingo {
    var casta

    method esProductivo()

    method esDeCasta(unaCasta) = self.casta() === casta

    method casta() = casta
}

class Soldado innherits Vikingo{
    var vidasCobradas = 0
    var cantidadDeArmas = 0
    
    override method esProductivo() = self.cobroMasDeTantasVidas(20) && self.tieneArmas()

    method cobroMasDeTantasVidas(cantidad) = vidasCobradas > cantidad

    method tieneArmas() = cantidadDeArmas > 0
}

class Granjero innherits Vikingo{
    var cantidadHectareas = 0
    var cantidadHijos = 0

    override method esProductivo = cantidadHectareas / 2 >= cantidadHijos
}

const jarl = "Jarl"
const karl = "Karl"
const thrall = "Thrall"