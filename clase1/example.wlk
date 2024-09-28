/* 

Todo es un OBJETO (elemento que se representa con caracteristicas y hace cosas). representacion de un ente computacional que exhibe comportamientos

Los objetos se comunican mediante MENSAJES (decir a algo que haga una accion), 
pero no todo MENSAJE sirve para cualquier OBJETO. Todos pueden recibir MENSAJES, pero no todos lo interpretan.

Los MENSAJES que entiende cada OBJETO dependen de su INTERFAZ. 

En resumen un OBJETO entiende MENSAJES que conforman su INTERFAZ (comportamiento ante mensajes).

Objeto 1 ------------ MENSAJE ---------> Objeto 2

Interfaz Objeto 2 
Saludar()

El COMPORTAMIENTO se basa en MÉTODOS (que forma va a trabajar el objeto cuando le manden el mensaje, pueden hacer O devolver, nunca ambas) 
y va a contener su ESTADO INTERNO (puede o no tener, atributos/variables).

*/

// REPL = Read Eval Print Loop -> Consola

// object nombre

object francoColapinto {

  var peso = 70 // var nombreVariable = valor | ES OTRO OBJETO, TODO ES OBJETO, el PESO es la RELACION/REFERENCIA a un OBJETO
                // Ahora tenemos EFECTO, las referencias cambian pero los OBJETOS no

  var auto = williams

  method chamuyar() { // metodo -> method nombre()
    return "Me contaron que sos muy divertida"
  }

  method correr(unosKilometros) { // method nombre(objeto) -> SU CONTEXTO DETERMINA EL TIPO
    peso = peso - unosKilometros / 50 // numero `op` parametro, el - y el / son mensajes que entienden numeros | REFERENCIA = OBJETO
    auto.correr(unosKilometros) // POLIMORFISMO | PILAR -> Dado un objeto que sepa correr
  }                               // Los NUMEROS tienen RESPONSABILIDAD -> Operarse (+,-,*,/)

  method peso() { // GETTER -> Da el atributo
    return peso
  }

  method auto(unAuto) { // auto -> Le da valor al mismo atributo, si devuelve lo mismo | SETTER
    auto = unAuto
  }

}

// Duck typing -> Si algo hace cuack, tiene dos patas y alas de pato es un PATO
// getAndSet (obtener y setear)
// ENCAPSULAMIENTO | PILAR --> Cada objeto actua SOBRE SUS MISMOS ATRIBUTOS, es una CAJA NEGRA para el resto
// Tell don't ask --> Decime no preguntes

// ASIGNAR RESPONSABILIDAD | PILAR -> Asignarlas completamente

// AMBIENTE/WORKSPACE -> Viven nuestros objetos

object williams {

  var nafta = 100

  method correr(unosKilometros) {
    nafta = nafta - unosKilometros / 7
  }

}

// Cuando modelamos algo, NO MODELAMOS LA REALIDAD
// No pensar en atributos --> Pensar en COMPORTAMIENTOS
// Well know object 

object ferrari {

    var nafta = 10
    var bateria = 80

  method correr(unosKilometros) { // COHESIÓN -> SOLO HACER UNA COSA
    self.gastarNafta(unosKilometros) // MENSAJE A MI MISMO
    self.gastarBateria(unosKilometros) // DELEGAR OBLIGATORIAMENTE, DEPENDE RESPONSABILIDAD
  }

  method gastarNafta(unosKilometros){
    nafta = nafta - unosKilometros / 7
  }

  method gastarBateria(unosKilometros){
    if (unosKilometros >= 100) {
      bateria = bateria - (unosKilometros - 100) / 100
    }
  }

}

// El COMPORTAMIENTO del AUTO es similar para todos los AUTOS que necesita Colapinto