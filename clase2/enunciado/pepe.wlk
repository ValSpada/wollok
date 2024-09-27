// TOP - DOWN
// COHESIÓN
// PENSAR EN COMPORTAMIENTO : Si hace algo no devuelve, si devuelve no hace algo
// ¿De quién es la responsabilidad?
// Hacer algo -> Si ejecuto lo que quiero y despues de eso el diagrama cambia, hay efecto 

// ¿Quién tiene la informacion mínima e indispensable para

object pepe {

    var property aniosAntiguedad = 1 // Property -> Setter y getter solos
    var puesto = desarrollador
    var bonoPresentismo = bonoPorPresentismoNulo // No le tengamos miedo a cosificar (reify/reificar)
    var property faltas = 0
    var bonoResultado = bonoResultadoFijo

    method sueldo() = self.sueldoNeto() + self.bonoPresentismo() + self.bonoResultado()  
    // Quiero que pepe entienda el mensaje SUELDO    

    method sueldoNeto() = puesto.sueldoNeto(aniosAntiguedad) // GANAMOS POLIMORFISMO -> Extensible
        
        /*
        if (puesto == "desarrollador")  {
            return 1000 + 25  * aniosAntiguedad
        } else if (puesto == "manager") {
            return 1500 + 50  * aniosAntiguedad
        } else if (puesto == "gerente") {
            return 2500 + 100 * aniosAntiguedad
        }
        */

    method bonoPresentismo() = bonoPresentismo.sueldo(self) // PASARSE A SI MISMO PARA CALCULAR
                                                                   // Tell don't ask -> PEDILOunasFaltas
    method bonoResultado() = bonoResultado.sueldo(self)

    method faltas() = faltas // GETTER
    
    method aniosAntiguedad() = aniosAntiguedad // GETTER -> Devuelve
    
    method puesto(unPuesto) {
        puesto = unPuesto
    }

    method bonoPresentismo(unBonoPorPresentismo) {
        bonoPresentismo = unBonoPorPresentismo
    }

    method bonoResultado(unBonoPorResultado) {
        bonoResultado = unBonoPorResultado
    }

}

object desarrollador {

    method sueldoNeto(unosAniosAntiguedad) {
        return 1000 + 25 * unosAniosAntiguedad
    }

}

object manager {
    
    method sueldoNeto(unosAniosAntiguedad) {
        return 1500 + 50 * unosAniosAntiguedad
    }

}

object gerente {
    
    method sueldoNeto(unosAniosAntiguedad) {
        return 2500 + 100 * unosAniosAntiguedad
    }

}

object bonoPorPresentismoNulo {

    method sueldo(_unEmpleado) = 0 // SE puede forzar el polimorfismo

}

object bonoPorPresentismoPorFaltas {
sueldo
    method sueldo(unEmpleado) {
        if (unEmpleado.faltas() == 0) {
            return 100
        } else if (unEmpleado.faltas() == 1) {
            return 50 - unEmpleado.aniosAntiguedad()
        } else {
            return 0
        }
    } 

}

object bonoPresentismoNioqui {

    method sueldo(unEmpleado) = 2 ** unEmpleado.faltas() // ** = Elevar

}

object bonoResultadoSTI {

    method sueldo(unEmpleado) = unEmpleado.sueldoNeto() * 0.25

}

object bonoResultadoFijo {

    method sueldo(unEmpleado) = 15 + unEmpleado.aniosAntiguedad()

}

object bonoResultadoNulo {

    method sueldo(_unEmpleado) = 0

}

// PRUEBAS AUTOMATIZADAS / TESTS -> El sistema funciona sin hacer casos a mano
// Test unitario (al que apuntamos): Que una unidad del sistema funcione
//          Test federales
// Test de integracion: Que todo el flujo del sistema funcione
// Test de regresión: 

// Alta Cohesión + Bajo Acoplamiento (Muy ligado, saber todo)