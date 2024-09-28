object camion {
  var pesoMaximoTotal = 300 // EN KG
  var pesoActual = 0 // EN KG
  var objetos = []
  
  method cargar(unObjeto) {
    if ((pesoActual + unObjeto.peso()) <= pesoMaximoTotal) {
      objetos.add(unObjeto)
      pesoActual += unObjeto.peso()
    }
  }
  
  method descargar(unObjeto) {
    objetos.remove(unObjeto)
    pesoActual -= unObjeto.peso()
  }
  
  method objetos() = objetos
  
  method pesoActual() = pesoActual
}

object sillaA {
  var peso = 50
  
  method peso() = peso
}

object sillaB {
  var peso = 80
  
  method peso() = peso
}

object televisorA {
  var peso = 20
  
  method peso() = peso
}

object televisorB {
  var peso = 200
  
  method peso() = peso
}

object televisorC {
  var peso = 100
  
  method peso() = peso
}