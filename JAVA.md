# JAVA

ctrl + alt + l, formatear en Intellij

<!-- https://drive.google.com/drive/folders/1BvSNyWfrmtWzEbjOmMDCmnYorYJzPuUr?usp=sharing -->

446965918

Variables de texto - metodos cadena}

## Interfaz Map

La interfaz `Map` en Kotlin define un conjunto de métodos para trabajar con una estructura de datos que almacena pares clave-valor. Hay varias implementaciones de la interfaz `Map` disponibles en Kotlin, cada una con sus propias características y casos de uso específicos. Algunas de las implementaciones más comunes de la interfaz `Map` son las siguientes:

1. `HashMap`: Es una implementación de `Map` basada en una tabla hash. Proporciona un acceso rápido a los elementos y no garantiza un orden específico de los pares clave-valor. Es útil cuando no se requiere un orden particular y se busca un rendimiento eficiente para la inserción, búsqueda y eliminación de elementos.

2. `LinkedHashMap`: Es una implementación de `Map` que mantiene el orden de inserción de los pares clave-valor. Además, permite acceder rápidamente a los elementos a través de una tabla hash. Esta implementación es útil cuando se necesita mantener el orden de inserción y tener un acceso rápido a los elementos.

3. `TreeMap`: Es una implementación de `Map` basada en un árbol de búsqueda binaria. Los pares clave-valor se ordenan según el orden natural de las claves o mediante un comparador personalizado. Esta implementación es adecuada cuando se necesita un orden específico de las claves y una rápida recuperación de los elementos en un orden específico.

4. `EnumMap`: Es una implementación especializada de `Map` diseñada específicamente para usar enumeraciones como claves. Solo permite claves de un tipo de enumeración específico y ofrece un rendimiento óptimo para ese caso de uso particular.

5. `ConcurrentHashMap`: Es una implementación de `Map` diseñada para admitir operaciones concurrentes en hilos múltiples sin la necesidad de bloquear todo el mapa. Proporciona un acceso concurrente seguro y un rendimiento optimizado en entornos de concurrencia.

Estas son solo algunas de las implementaciones más comunes de la interfaz `Map` en Kotlin. La elección de la implementación adecuada dependerá de los requisitos específicos de tu aplicación, como el orden de los elementos, el rendimiento y la concurrencia.

## Interfaz Set

La interfaz `Set` en Java define un conjunto de métodos para trabajar con una colección de elementos únicos sin un orden específico. Hay varias implementaciones de la interfaz `Set` disponibles en Java, cada una con sus propias características y casos de uso específicos. Aquí están algunas de las implementaciones más comunes de la interfaz `Set` y sus casos de uso:

1. `HashSet`: Es una implementación de `Set` basada en una tabla hash. Proporciona un acceso rápido a los elementos y no garantiza un orden específico. Se utiliza cuando se necesita almacenar elementos únicos sin preocuparse por el orden de iteración y cuando se requiere un rendimiento eficiente en términos de inserción, eliminación y búsqueda de elementos.

2. `LinkedHashSet`: Es una implementación de `Set` que mantiene el orden de inserción de los elementos. Además, permite un acceso rápido a los elementos a través de una tabla hash. Se utiliza cuando se necesita mantener el orden de inserción y tener un acceso rápido a los elementos.

3. `TreeSet`: Es una implementación de `Set` basada en un árbol de búsqueda balanceado. Los elementos se ordenan automáticamente en un orden ascendente utilizando el orden natural o un comparador personalizado. Se utiliza cuando se necesita almacenar elementos en un orden específico y cuando se requiere un acceso eficiente a los elementos en un orden ascendente.

4. `EnumSet`: Es una implementación especializada de `Set` diseñada específicamente para trabajar con elementos de tipo enumeración. Solo permite elementos de un tipo de enumeración específico y ofrece un rendimiento optimizado para ese caso de uso particular. Se utiliza cuando se necesita almacenar un conjunto de elementos de una enumeración y se busca un rendimiento eficiente.

Estas son solo algunas de las implementaciones más comunes de la interfaz `Set` en Java. La elección de la implementación adecuada dependerá de los requisitos específicos de tu aplicación, como el orden de los elementos, el rendimiento y los tipos de datos utilizados.

## Interfaz List

En Java, la interfaz `List` también tiene varias implementaciones disponibles. Aquí están algunas de las implementaciones más comunes de la interfaz `List` en Java:

1. `ArrayList`: Es una implementación de `List` basada en un arreglo de tamaño variable. Proporciona un acceso rápido a los elementos por índice y admite operaciones eficientes de inserción y eliminación en la parte final de la lista. Es útil cuando necesitas un acceso rápido a los elementos y realizas operaciones frecuentes de inserción y eliminación al final de la lista.

2. `LinkedList`: Es una implementación de `List` basada en una lista enlazada. Proporciona un acceso rápido a los elementos en el inicio y el final de la lista, y admite operaciones eficientes de inserción y eliminación en cualquier posición de la lista. Es útil cuando necesitas realizar operaciones frecuentes de inserción y eliminación en cualquier posición de la lista.

3. `Vector`: Es una implementación de `List` similar a `ArrayList`, pero con métodos sincronizados para garantizar la seguridad en hilos múltiples. Es útil cuando necesitas una lista segura para operaciones concurrentes.

4. `CopyOnWriteArrayList`: Es una implementación de `List` que garantiza la seguridad en hilos múltiples sin necesidad de bloqueos. Realiza copias completas del arreglo interno al realizar operaciones de escritura, lo que puede ser más costoso en términos de memoria. Es útil cuando necesitas una lista inmutable o con pocos cambios y acceso concurrente seguro.

Estas son algunas de las implementaciones más comunes de la interfaz `List` en Java. La elección de la implementación adecuada depende de tus requisitos específicos, como el acceso, la inserción, la eliminación, la sincronización y el rendimiento en tu caso de uso particular.

## LinkedList

Paquete java.util

Son listas donde puede agregar elementos sin importar de que tipo sea.

Diferencia ArrayList - LinkedList https://www.youtube.com/watch?v=IX1T8P8hSPs&ab_channel=GeekUpTube

```java
LinkedList lista = new LinkedList();

lista.add("asdad");
lista.add(55);
lista.add(2, "agregar un valor en el indice indicado"); //Si hay el elemento en ese indice se dezplaza un indice mas el objeto que estaba en ese indice
lista.get(#); //Obtener el objeto del indice indicado en #
lista.remove(#) //Remover un elemento en el indice indicado en #
```

## Principios POO

1. Encapsulación: Mantener los atributos privados y solo se pueden acceder mediante metodos especificos (Getter & setters).
2. Abstracción: Metodos abstractos, cada uno deciside como se implementa el metodo
3. Herencia: Facilita la reutilización del codigo
4. Polimorfismo: Procesar los metodos o redefinir el metodo de la manera que se quiere asi se llame igual o se herede. Un metodo heredado puede tener una logica diferente a otro objeto que hereda del mismo padre.

La programación funcional se encarga en el ***como*** resolver. Se trabaja principalmente con funciones, se delega el trabajo a funciones

La programación declarativa se encarga en el ***que*** resolver.

## Lambda

Metodo anonimo.  Una funcion de alto orden, es aquella que recibe una funcion como argumento.

https://www.youtube.com/watch?v=vxCuatjsiCE&ab_channel=V%C3%ADctorOrozco

Basicamente lambda es una interfaz con un unico metodo, el cual se puede ejecutar como una funcion flecha

```java
interface NomInterface{
    double nomMetodo(tVar var1, tVar var2);
}
```

La forma clasica de implementar esta interfaz es:

```java
public static void main(String[] args) {

    NomInterface nomInstancia = new NomInterface(){

        @Override
        public double nomMetodo(tVar var1, tVar var2){
            return "el retorno o codigo para implementar la interface";
        }
    }

    }
```

Usando lamba:

```java
public static void main(String[] args) {

    NomInterface nomInstancia = (tVar var1, tVar var2) -> "el retorno o codigo para implementar la interface";
    NomInterface nomInstancia = (var1, var2) -> "Se puede no colocar el tipo de variable que son los parametros";
    NomInterface nomInstancia = (var1, var2) -> {
     return "otra forma de declarar lambda, se usa para definir mas de una linea";   
    };
}
```

Las variables locales no se pueden modicar con lambdas.

Los atributos globales ( atributos de la clase), se pueden modificar en lambdas, ya sean estaticos o no.

## Funciones de alto orden

Tomando lo de lambda podemos definir un metodo

```java
public void FunAltoOrden(NomInterface param){
    param.nomMetodo(var1, var2)
}
```

Pero el param ya se debio haber implementado antes

```java
NomInterface nomInstancia = (var1, var2) -> "Se puede no colocar el tipo de variable que son los parametros";
FunAltoOrden(nomInstancia);
```

De este modo toda el comportamiento que se le implemto a esa instancia de la interfaz. Pero tambien se puede definir al enviarla como parametro

```java
FunAltoOrden((var1, var2) -> "Se puede no colocar el tipo de variable que son los parametros");
```

Incluso objetos que cumplan con  tener parametros iguales pueden ser referenciados para usar el comportamiento de la interface

```java
public class OtroObjeto(){
    double namOtroMetodo(tVar var1, tVar var2){
     return "instrucciones de este metodo totalmente diferente al de la interfaz"   
    }
}
```

y para referenciar este metodo como el de la interfaz en la funcion de alto orden

```java
var otrObjeto = new OtroObjeto();
FunAltoOrden(otroObjeto::namOtroMetodo);
```

De esta manera, los metodos que se referencia del objeto se podran usar como implementación de la funcion lambda.

### Mitocode ejemplo

```java
public class HighApp {

    private Function<String, String> convertirMayusculas = x -> x.toUpperCase();
    private Function<String, String> convertirMinusculas = x -> x.toLowerCase();

    public void imprimir(Function<String, String> funcion, String valor) {
        System.out.println(funcion.apply(valor));
    }

    public Function<String, String> mostrar(String mensaje) {
        return (String x) -> mensaje + x;
    }

    public void filtrar(List<String> lista, Consumer<String> consumidor, int longitud, String cadena){
        //lista.stream().filter(this.establecerLogicaFiltro(longitud)).forEach(consumidor);
        lista.stream().filter(this.establecerLogicaFiltro(cadena)).forEach(consumidor);
    }

    public Predicate<String> establecerLogicaFiltro(int longitud){
        return texto -> texto.length() < longitud;
    }

    public Predicate<String> establecerLogicaFiltro(String cadena){
        return texto -> texto.contains(cadena);
    }


    public static void main(String[] args) {
        HighApp app = new HighApp();
        app.imprimir(app.convertirMayusculas, "mitocode");
        app.imprimir(app.convertirMinusculas, "MITOCODE");

        String rpta = app.mostrar("Hola ").apply("MitoCode");
        System.out.println(rpta);

        List<String> lista = new ArrayList<>();
        lista.add("Mito");
        lista.add("Code");
        lista.add("MitoCode");

        //app.filtrar(lista, System.out::println, 5, null);
        app.filtrar(lista, System.out::println, 0, "Code");


    }
}
```

## Metodos por defecto (default methods)

Son metodos implementados en la interfaz

```java
interface NameInterface{

    void namMetodo();

    default void namMetodoDefault(){
       String asd = "instrucciones";
    }
}
```

Estos metodos se pueden usar sin necesidad de sobre escribirlos o implementarlos primero.

Si se implementan dos interfaces a una clase y tienen un metodo default que se llama igual, el IDE te obliga  implementar y sobre escribir el metodo para ser usado y el de la otra interfaz no.

```java
@Override
public void namMetodoDefault(){
    NameInterface.super.namMetodoDefault(); //Asi se usa el mismo metodo que la interface seleccionada
}
```

## Interfaces funcionales

Obliga a que sea una interfaz funcional que a la vez puede ser utilizada por funciones lambda.

Puede tener metodos default.

```java
@FunctionalInterface
public interface NameInterface{
    void nameMethod();
}
```

## Referencia a metodos

Metodos referenciados no pueden recibir parametros, son metodos que tienen una estructura parecida a la de una interfaz funcional, de tal manera que se puede usar un metodo definido como implementación del metodo de la interfaz mediante referencia, pueden ser incluso metodos estaticos.

```java
public class namClass{

    public void nomMetodo(){
        String a="instrucciones";
    }      
}

public class namClass2{

    namClass nC = new namClass();

    //Esto hace que el comportamiento de la implementacion de la interface sea el de el metodo nomMetodo
    NameInterface nI = nC::nomMetodo;
}
```

Tambien puede referenciar constructores

```java
  public class namClass{

      String atr1, atr2;

      public namClass(){

      }  

      public namClass(String atr1, String atr2){

      }  
  }

  -------------------------------------------------------------------------

  @FunctionalInterface
  public interface NameInterface{
      NamClass nameMethod(String atr1, String atr2);
  }

  -------------------------------------------------------------------------
  public class main{

      public static void main(String[] args){

      NameInterface inf = (atr1, atr2) -> (new namClass(atr1, atr2));
         namClass nC = inf.nameMethod("atr1", "atr2");

      //Referenciando el constructor seria, como el constructor tambien recibe dos parametros es posible.
      NameInterface inf = namClass::new;
      namClass nC = inf.nameMethod("atr1", "atr2");

      }
  }
```

## ForEach (Collection)

```java
public class nameClass{

    List<String> lista;

    public void llenarLista(){
        lista = new ArrayList<>();
        lista.add("add1");
        lista.add("add2");
        lista.add("add3");

    }

    public void usarForEach(){

        //Imprimir los elementos de la lista usando una funcion lambda
        lista.forEach(x -> System.out.println(x)); 

        //Imprimir los elementos de la lista usando una funcion referenciada
        //el metodo println cumple con la condicion para ser referenciada al recibir un parametro.
        lista.forEach(System.out::println);

    }

}
```

## RemoveIf

```java
public class nameClass{

    List<String> lista;

    public void llenarLista(){
        lista = new ArrayList<>();
        lista.add("add1");
        lista.add("add2");
        lista.add("add3");

    }

    public void usarRemoveIf(){

        //recorre la lista y cuando coincida con "cadena" elimina el elemento
        lista.removeIf(x ->  x.equalsIgnorecase("cadena"));

    }

}
```

## Sort

```java
public class nameClass{

    List<String> lista;

    public void llenarLista(){
        lista = new ArrayList<>();
        lista.add("add1");
        lista.add("add2");
        lista.add("add3");

    }

    public void usarSort(){

        //recorre la lista y ordena comparando los elementos, en orden alfabet
        lista.sort((x, y) -> x.compareTo(y));
        //Invierte el orden de organización
        lista.sort((x, y) -> y.compareTo(x));

    }

}
```

## Sream

Es un metodo de las listas (colecciones) que nos da nuevos metodos

```java
public class nameClass{

    List<String> lista1;
    List<String> lista2;

    public nameClass(){
        lista1 = new ArrayList<>();
        lista1.add("cadena1");
        lista1.add("cadena2");
        lista1.add("cadena3");
        lista1.add("cadena4");

        lista2 = new ArrayList<>();
        lista1.add("cadena1");
        lista1.add("cadena2");

    }


    /**El metodo stream habilita el metodo filter, el cual se usa una lambda para definir el que hacer
    Luego se le aplica al resultado el metodo forEach para imprimir en pantalla el resultado
    En este caso se busco los objetos empiezan por m
    */
    public void filtar(){
        lista.stream().filter(x -> x.startsWith("m")).forEach(System.out::print);
    }


    public void ordenar(){
        //Ordenar de forma ascendente
        lista.stream().sorted().forEach(System.out::print);
        //Ordenar de forma descendente
        lista.stream().sorted((x,y) -> y.compareTo(x)).forEach(System.out::print);

    }

    //Transformar los elementos de la lista en lo que se indique en la expresion map
    public void transformar(){
        //Pasar todos los elementos cadena de la lista en mayusculas
        lista.stream().map(String::toUpperCase).forEach(System.out::print);

        //Convierte cada elemento en entero y le suma 1, usando lambda en el metodo map
        lista2.stream().map(x -> Integer.parseInt(x)+1).forEach(System.out::println);
    }

    //Limita el numero de elementos a usar, se indica en entero, en este caso solo imprime los elementos indicados
    public void limitar(){
        lista.stream().limit(#).forEach(System.out::print);
    }


    //Cuenta el numero de elementos de la lista
    public void contar(){
        long x = lista.stream().count();
        System.out.println(x);    
    }

}
```

## Optional

Ayuda a manejar el ***"NullPointExcenption"***

```java
public class OptionalApp {

    //Manejar el error si el optional no esta inicializado     
    public void probar(String valor){
        //System.out.println(valor.contains("mito"));            

        try{
            Optional op = Optional.empty();
            op.get();                        
        }catch(Exception e){
            System.out.println("No hay elemento");
        }        
    }

    //Manejo de nulos
    public void orElse(String valor){
        //Que el opcional acepta nulos
        Optional<String> op = Optional.ofNullable(valor);
        //El valor por defecto si el valor es nulo
        String x = op.orElse("predeterminado");
        System.out.println(x);
    }

    //Si el valor es nulo, especificar que error se quiere enviar
    public void orElseThrow(String valor){
        Optional<String> op = Optional.ofNullable(valor);
        op.orElseThrow(NumberFormatException::new);
    }

    //Si esta inicializado devuelve true de lo contrario false
    public void isPresent(String valor){
        Optional<String> op = Optional.ofNullable(valor);
        System.out.println(op.isPresent());
    }

    public static void main(String[] args) {
        OptionalApp app = new OptionalApp();
        //app.probar("Mito");
        //app.orElse("Mito");
        //app.orElseThrow("Mito");
        app.isPresent("Mito");
    }
}
```

## Stream Paralelo

Se usa para realizar procesos por hilos, por lo cual son procesos asincronos. Se debe usar con moderación. Generalmente para aplicaciones de escritorio.

El metodo se usa igual que los stream pero se cambia por ***"parallelStream()"***

## Map

Los hashMap son como los diccionarios de python, listas de pares llave valor.

```java
public class App {

    private Map<Integer, String> map;

    public void poblar() {
        map = new HashMap<>();
        map.put(1, "Mito");
        map.put(2, "Code");
        map.put(3, "Suscribete");
    }

    public void imprimir_v8() {
        //Imprimir los valores del hashMap
        map.forEach((k,v) -> System.out.println("Llave: " + k + " Valor: " + v));
        //Imprimir los valores del hashMap
        map.entrySet().stream().forEach(System.out::println);
    }


    public void insertarSiAusente() {
        //Agregar un valor si no se encuentra, no sobreescribe
        map.putIfAbsent(2, "Jaime");
        //Agregar un valor si no se encuentra, no sobreescribe
        map.put(2, "Jaime");


    }
    //Si encuentra la llave hacer lo que se indica
    public void operarSiPresente() {
        map.computeIfPresent(3, (k,v)-> k + v);
        System.out.println(map.get(3));
    }

    public void obtenerOrPredeterminado() {
        //Si encuentra el valor devolverlo, sino dar el valor por default    
        String valor = map.getOrDefault(5, "valor por defecto");
        System.out.println(valor);
    }


    public void recolectar() {

        //Genera un mapa de llave valor de los valores que contengan la letra "o"
        Map<Integer, String> mapaRecolectado = map.entrySet().stream()
                .filter(e->e.getValue().contains("o"))
                .collect(Collectors.toMap(p-> p.getKey(), p-> p.getValue()));

        mapaRecolectado.forEach((k,v)-> System.out.println("Llave: " + k + " Valor: " + v));
    }



    public static void main(String[] args) {
        App app = new App();
        app.poblar();
        //app.imprimir_v7();
        //app.insertarSiAusente();
        //app.imprimir_v8();
        //app.operarSiPresente();
        //app.obtenerOrPredeterminado();
        app.recolectar();
    }

}
```

## Anotaciones de repetición (API reflection)

Mayormente es usada en tiempo de ejecución

## Date API

```java
public class App {

    public void verificar(int version) {
        if (version == 7) {
            Calendar fecha1 = Calendar.getInstance();
            Calendar fecha2 = Calendar.getInstance();
            fecha1.set(1991, 0, 21);
            System.out.println(fecha1.after(fecha2));
        } else if (version == 8) {
            LocalDate fecha1 = LocalDate.of(1991, 01, 21);
            LocalDate fecha2 = LocalDate.now();

            System.out.println(fecha1.isAfter(fecha2));
            System.out.println(fecha1.isBefore(fecha2));

            LocalTime tiempo1 = LocalTime.of(22, 30, 50);
            LocalTime tiempo2 = LocalTime.now();

            System.out.println(tiempo1.isAfter(tiempo2));
            System.out.println(tiempo1.isBefore(tiempo2));

            LocalDateTime fechaTiempo1 = LocalDateTime.of(1991, 1, 21, 22, 30, 50);
            LocalDateTime fechaTiempo2 = LocalDateTime.now();

            System.out.println(fechaTiempo1.isAfter(fechaTiempo2));
            System.out.println(fechaTiempo1.isBefore(fechaTiempo2));

        }
    }

    // currentTimeMillis
    public void medirTiempo(int version) throws InterruptedException {
        if (version == 7) {
            long ini = System.currentTimeMillis();
            Thread.sleep(1000);
            long fin = System.currentTimeMillis();
            System.out.println(fin - ini);
        } else if (version == 8) {
            Instant ini = Instant.now();
            Thread.sleep(1000);
            Instant fin = Instant.now();
            System.out.println(Duration.between(ini, fin));
        }
    }

    // Calendar
    public void periodoEntreFechas(int version) {
        if (version == 7) {
            Calendar nacimiento = Calendar.getInstance();
            Calendar actual = Calendar.getInstance();

            nacimiento.set(1991, 0, 21);
            actual.set(2017, 2, 04);

            int anios = 0;

            while (nacimiento.before(actual)) {
                nacimiento.add(Calendar.YEAR, 1);
                if (nacimiento.before(actual)) {
                    anios++;
                }
            }
            System.out.println(anios);
        } else if (version == 8) {
            LocalDate nacimiento = LocalDate.of(1991, 1, 21);
            LocalDate actual = LocalDate.now();

            Period periodo = Period.between(nacimiento, actual);
            System.out.println("Han transcurrido " + periodo.getYears() + " años y " + periodo.getMonths() + " meses y "
                    + periodo.getDays() + " dias, desde " + nacimiento + " hasta " + actual);
        }
    }

    // Conversion
    public void convertir(int version) throws ParseException {
        if (version == 7) {
            String fecha = "21/01/1991";
            DateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
            Date fechaConvertida = formateador.parse(fecha);
            System.out.println(fechaConvertida);

            Date fechaActual = Calendar.getInstance().getTime();
            formateador = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss a");
            String fechaCadena = formateador.format(fechaActual);
            System.out.println(fechaCadena);
        } else if (version == 8) {
            String fecha = "21/01/1991";
            DateTimeFormatter formateador = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            LocalDate fechaLocal = LocalDate.parse(fecha, formateador);
            System.out.println(fechaLocal);

            formateador = DateTimeFormatter.ofPattern("ddMMyyyy");
            System.out.println(formateador.format(fechaLocal));
        }
    }

    public static void main(String[] args) {
        App app = new App();

        try {
            // app.verificar(8);
            // app.medirTiempo(8);
            // app.periodoEntreFechas(8);
            app.convertir(8);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

## Logger

Es para mostrar en consola como msj de ejecucion, es mejor que mostrar un ***sout***

```java
Logger logger =  Logger.getLogger("nombre del logger");

//Para usarlo se importa tambien la clase Level de java.util
//El primer termino es una constante que ind
logger.log(Level.WARGNING, "mensaje a mostrar");
```
