import medico.*

class JefeDeDepartamento inherits Medico {
  const subordinados = #{}
  
  method atenderA(unaPersona) {
    subordinados.anyOne().atenderA(unaPersona)
  }
}