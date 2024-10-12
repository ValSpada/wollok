import drCasaT2.*

class JefeDeDepartamento inherits Persona {
  const subordinados = #{}
  
  method atenderA(unaPersona) {
    subordinados.anyOne().atenderA(unaPersona)
  }
}