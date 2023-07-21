# Scala

### Declarar variables:

```scala
// Poner el tipo de variable es opcional en la mayoria de los casos
// val se usa para crear variables inmutables
val r: String = "Alberto"

// var se usa para crear variables mutables 
var r = "Alberto"
```

### Variables de tipo lazy

Son variables que pueden ser usados luego o no, por eso se le dice al sistema que no gaste todos los recursos normales en una variable en estas 

**example:**

```scala
val x = 1/0
//Esto da un error

lazy val x = 1/0
//Esto no da error hasta que no sea utilizada, por lo tanto se ahorraron recursos
```

## Rangos

```scala
// Toma los valores de 1 hasta 5, el 5 incluido
var rango = 1 to 5

// Un rango con salto personalizado, en este caso seria, 1,5,9,13,17 ya el 21 no se toma porque se sale del rango
val rango = 1 to 20 by 4

// Tambien puedo hacer rangos de caracteres
val rango = 'a' to 'z'
```

## For

```scala
// ciclo for, con to toma hasta el valor 10
for ( z <- 1 to 10 ){
    // code
}

// No toma el 10
for ( z <- 1 until 10 ){
    // code
}

// Puedo agregar condiciones al for, solo se ejecuta si cumple la condicion
for ( z <- 1 until 10 if z%0 == 0){
    // code
}
```

### ForEach

```scala
var cadena = "prueba"

//Referenciar una funcion dentro del forEach
cadena.forEach(println)
```

#### Matchs

Como el switch case de Java, no es necesario poner un break.

```scala
var color = "red"

color match {
    case "red" => println("rojo")
    case "blue" | case "blue2" => println("blue o blue2")
    case color if(color == "yellow")  => println("blue o blue2")
    case _ => println("defaul")
}
```

### List

```scala
// Lista del mismo tipo
val lista = List("foo", "barr")

// Listas de diferentes tipos
val lista = List("foo", 1)

// Listas de tipadas, en este caso de cadenas (String)
val lista = List[String]("foo", "bar")

//Agregar datos a una lista de enteros
//Agrega el valor al final de la lista
listaInt = listaInt:+45

//Agregar el valor al inicio de la lista
listaInt = 88+:listaInt

//Una lista nueva en base a dos lista
listaNueva = lista1::lista2
```

### Funciones

Scala entiende que lo de la ultima linea es la que se va a retornar de la función

```scala
def nameFunct(): String = {
    //code
    "foo"
}

//Unit es como el Void en java
def foo(): Unit = {
    //code
}

def foo(bar1: Int, bar2: Int): Int = {
    //code
    bar1+ba
}

//Puede recibir como argumentos una cantidad indeterminada de argumentos de tipo numeros
def foo(operacion: String, numeros: Int*){
    //Code
}

//example, ambas son validas
foo("-", 1,2,3,4)
foo("-", 1,4)
```

### Modificadores de acceso

* al declarar una variable como `var` es automaticamente publica

* `private`

* `protected`

Al crear clases, si se define como parametro de la clase, son privados

```scala
/**
arg is private
barP is public
barPri is private
barPro is protected
*/
class foo(arg: String){
    var barP: Int = _
    private var barPri: Int = _
    protected var barPro: Int = _  
}


// Asi arg se convierte en una variable publica
class foo(var arg: String){
    var barP: Int = _
    private var barPri: Int = _
    protected var barPro: Int = _  
}
```

### Constructores

La clase y el constructor comparten codigo

```scala
class Foo(bar:String, var foo:Int){
    println("esto es parte del constructor")

    def fooAct(): Unit = {
    //code
    }
}
```

Constructores auxiliares

```scala
class Foo(bar:String, var foo:Int){
    println("esto es parte del constructor")

    private var attIn: Int = 0

    def this(bar:String, var foo:Int, attIn: Int){
        this(bar, foo)
        this.attIn = attIn
    }


    def fooAct(): Unit = {
    //code
    }
}
```

### Objects

Scala no posee metodos staticos, en vez de eso se genera un objeto de tipo singleton.

* Los objects son singletons

* No se pueden crear instancion de estos

* Todos sus metodos son publicos

* Pueden extender de clases y traits

* No puede recibir argumentos en el constructor

```scala
object Asignatura {
    def approve {
        println("foo")
    }

    def reject{
        println("foo")
    }
}

```

Cuando se usa un object y una clase que se llama igual, es como si fueran los metodos estaticos de la clase, haciendo el simil con Java.

El metodo `apply`, en el object se utiliza como si fuera un constructor y no es necesario llamarlo directamente

```scala
class Foo(var name: String, var lastname: String){
    override def toString: String = s"name: $name, lastName: $lastname"
}


object Foo{
    val TYPE = "BAR"

    def apply(arg: String): Foo = 
        new Foo(arg, TYPE)


    def fooStatic = {
        //Code
    }
}


object Main {
    def main(args: Array[String]): Unit = {
        var foo = new Foo("name", "lastName")

        //Esta llamando el metodo apply del object Foo
        Foo("algo")

    }
}
```



### Case Class

Crea un Object companion, que ya viene con el metodo apply y otros implementados, como:

* toString

* hashCode

* equals

* copy

* Getters

* Setters

```scala
case class Foo(bar: String){
    
}

object Main {
    def main(args: Array[String]): Unit = {
        //Llama al metodo apply
        var foo = Foo("name")
    }
}
```

### Abstrac class

No es necesario poner si el metodo es abstracto o no, si no tiene logica es abstracto

```scala
abstract class Foo(arg: String){
    def bar: Unit = {
        //Code
    }

    //Metodo abstracto
    def abstractBar: String
}


class Bar(foo: String) extends Foo(foo){
    override def abstractBar: String ={
        s"foo: $foo"
    }
}
```





## Utils

```scala
// Imprimir en consola
println("foo")

 // En caso que una funcion o metodo no requiera argumentos se puede omitir los parentesis finales
//Ambos funcionan
String.toUpperCase()
String.toUpperCase

//Interpolacion de cadenas
var nombre = "foo"
//Antepongo la s y con $nombre llamo la variable dentro de la cadena
println(s"te llamas $nombre")
```

### Console

Para compilar un archivo `.scala`, esto generara los archivos punto class

```scala
scalac <nameFile>.scala
```

Para ejecutar el codigo de los archivos `.class`, en el comando no hace falta especificar la extención del archivo, es:

```scala
scala <nameFile>
```
