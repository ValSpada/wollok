class Enfermedad {

  var cantidadCelulasAmenazadas
  
  method atenuarse(cantidad) {
    cantidadCelulasAmenazadas -= cantidad
  }
  
  method estaCurada() {
    return cantidadCelulasAmenazadas <= 0
  }

  method cantidadCelulasAmenazadas() = cantidadCelulasAmenazadas
  
  method afectar(unaPersona)
}