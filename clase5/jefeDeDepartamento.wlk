import persona.*

class JefeDeDepartamento inherits Persona {
  const subordinados = #{}
  
  method atenderA(unaPersona) {
    subordinados.anyOne().atenderA(unaPersona)
  }
}