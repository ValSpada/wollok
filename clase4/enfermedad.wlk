// NUESTRA INTERFAZ
// Method lookup, ir buscando el metodo a medida que sube

// Enfermedad es una SUPERCLASE
class Enfermedad {
  // CLASE ABSTRACTA, NO SE INSTANCIA
  var cantidadCelulasAmenazadas
  
  method atenuarse(cantidad) {
    cantidadCelulasAmenazadas -= cantidad
  }
  
  method estaCurada() {
    return cantidadCelulasAmenazadas <= 0
  }

  method cantidadCelulasAmenazadas() = cantidadCelulasAmenazadas
  
  method afectar(unaPersona) // CON ESTE METODO, ES ABSTRACTO
}