import personas.*

object alegre {
    method esSexy(unaPersona) = false
}

object taciturna {
    method esSexy(unaPersona) = unaPersona.edad() < 30
}

object cambiante {
    const personalidadesBase = #{taciturna, alegre}

    method esSexy(unaPersona) = personalidadesBase.anyOne().esSexy(unaPersona)
}