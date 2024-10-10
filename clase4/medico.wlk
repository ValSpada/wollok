import drCasaT2.*

class Medico inherits Persona {
  const dosis
  
  // SUPER -> SABE QUE DEBE BUSCAR CONTRAER ENFERMEDAD PERO EMPIEZA DE LA CLASE PADRE DONDE ESTA SUPER
  // Existe solo para evitar recursividad infinita, SE CAGA EN EL METHOD LOOKUP
  override method contraerEnfermedad(unaEnfermedad) {
    super(unaEnfermedad) // MISMOS PARAMETROS QUE RECIBE Y SE LO MANDA PARA CLASE PADRE
    self.atenderA(self)
  }
  
  method atenderA(unaPersona) {
    unaPersona.recibirMedicamento(dosis)
  }
}