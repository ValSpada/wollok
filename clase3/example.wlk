/* COLECCIONES

- Entienden el mensaje size() = Cantidad de objetos
- Las listas son mutables (pero el OBJETO es inmutable en sí mismo)
- Al agregar un elemento, tenemos un atributo (indice) al elemento (base 0)
- Las listas son un tipo de COLECCION
- Las listas tienen repetidos porque con atributos referencia a los mismos objetos

- miLista.add("hola") = ["Hola"] | miLista.remove("Hola") = [] y acomoda los indices
- miLista.get(posicion) -> Nos responde la posicion
- miLista.anyOne() -> devuelve cualquiera
- miLista.head() / miLista.first() -> primero
- miLista.last() -> ultimo
- miLista.asSet() -> Damelo como set 
- miLista.filter() -> Filtrar mediante objetos que funcionan de condiciones

- string.startsWith("letras") -> Verifica si tiene estas letras
*/

/* CONJUNTOS

- No tienen orden (no esta indexada)
- No tiene elementos repetidos

- var miSet = #{} -> apunta a "Set"
- miSet.add("a") -> Set apunta al objeto
- miSet.size() -> Tamaño del conjunto
- miSet.anyOne() -> Devuelve cualquier elemento del conjunto
- miSet.asList() -> Damelo como lista
- map 
- forEach -> Aplica una funcion que espera tener efecto en toda la lista
- any
- all
- sumList

- Dos conjuntos (o listas) son iguales si tienen mismos elementos, pero no son IDENTICOS
*/

/*

== -> Compara los elementos 
=== -> Son objetos identicos (IDENTIDAD)

*/

/* CLASES

- Molde para crear objetos que tienen el mismo comportamiento

- new nombreClase()
- const nombre = new nombreclase() -> REFERENCIA INMUTABLE a la clase 

*/

/* LAMBDAS ALAN KAY EDITION (Bloques) 

- SON OBJETOS 
- Los bloques retornan lo que el mensaje retorna

- Example: atributo.filter({ atributo => condicion })
- Example: id.apply(valor) -> Aplica a la lambda el valor, y se aplican la cantidad de valores que recibe
- Example: { a, b => a + b } -> Siendo a y b los parametros

*/


class Recital { 

  var asientos = [] 

  method ventaEntrada(persona) {
    asientos.add(persona)
  }

  method entradasVendidas() = asientos.size()

  method asientosAsignadosConInicial(inicial) {
    return asientos.filter({ nombre => nombre.startsWith(inicial) })
  }

}
