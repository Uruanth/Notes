# KOTLIN

## Coroutine

### Constructores

* **runBlocking**: El menos recomendado, porque bloquea el hilo, solo se recomienda en las pruebas unitarias.
* **Launch**: Manda la subtarea a segundo plano pero no retorna nada.
* **Async**: Igual que el ***Launch*** pero este si retorna algo.
* **Produce**: ***Pendiente***, Usa canales.

### Funciones suspendibles

* Es una funcion que puede iniciar, pausar y reanudar.
* Solo se puede llamar desde una corrutina o desde otra función suspendible.
* Esta diseñado par corrutinas. 

**Estructura**:

```kotlin
suspend fun mySuspendFun(){
    //Other suspen function
    //or
    //Dispatcher
    //Code
}
```

#### Example:

```kotlin
//Si no hay una corrutina interna para llamar la funcion suspendida, solo se puede llamar desde otra funcion suspendida
fun main(){
    //Aqui es donde se crea la corrutina
    runBlocking{
    	operation operation(1,2);    
    }
}

//Aqui aun no se usa lo que es una corrutina
suspend fun operation(numA: Int, numB: Int){
    withContext(Dispatchers.Default){
    	println("Resultado = " + (numA + numB));    
    }
}
```

### Dispatchers

Nos permiten determinar el `Thread` que corresponde a la ejecución de una coroutine, estos dispatcher pueden ser:

* **Unconfined**: No importa sobre que hilo trabaje la coroutine.
* **Default**: El más usado, mejorar el rendimiento.
* **IO**: Usado para operaciones input/output
* **Main**: Para desarrollo android

**Example**:

```kotlin
fun main() {
    //No importa cual hilo sea
    runBlocking(Dispatchers.Unconfined) {
        println("Using thread Unconfined: ${Thread.currentThread().name}")
    }

    //Mejorar performance, mas usado
    runBlocking(Dispatchers.Default) {
        println("Using thread Default: ${Thread.currentThread().name}")
    }

    //Hilo para inputs/outputs
    runBlocking(Dispatchers.IO) {
        println("Using thread IO: ${Thread.currentThread().name}")
    }


    //Hilo personalizado
    runBlocking(newSingleThreadContext("custom")) {
        println("Using thread custom: ${Thread.currentThread().name}")
    }


//   TODO Solo para desarrollo Android
//    runBlocking(Dispatchers.Main) {
//        println("Using thread: ${Thread.currentThread()}")
//    }
}
```

### CoroutineScope

El Scope tiene todo lo de contexto, ademas puede tener coroutine dentro de otra. 

![image-20230603192711947](.\imagenes\kt_coroutine_scope.png)

### CoroutineContext

El contexto es similar a un Map, almacena datos de tipo Element con su respectivo Key.

![image-20230603192527950](.\imagenes\kt_coroutine_context.png)

### Exception s

### TimeOut

Se puede definir cuanto es el tiempo maximo que se permite en una coroutine, esto se hace con el metodo `withTimeout(123)`, donde el argumento que recibe es en milisegundos

#### Example:

```kotlin
fun main(){
    runBlocking {
        try {
            pow(2)
        } catch (e: TimeoutCancellationException){
            println("timeout coroutine")
        }
    }
}

suspend fun pow(d : Long){
    coroutineScope {
        var result = d
        //Kt permite marcar el 3000 como 3_000
        withTimeout(3_000){
            launch {
                repeat(50){
                    result *= d
                    println(result)
                    delay(100)
                }
            }
        }
    }
}
```

### Launch 

Se ejecuta en segundo plano, pero no se espera que retorne nada.

Se puede guardar la coroutine en una variable y esta sera de tipo `Job`.  Este posee algunos métodos utiles:

* **isActive:** Valida si la coroutine esta en ejecución, `true` lo esta, `false` no lo esta.
* **isCancelled:** Verificar si la coroutine fue cancelada.
* **isCompleted:** Verifica si la coroutine se completo satisfactoriamente.
* **join():** Suspende el hilo hasta que la coroutine termine para continuar con la ejecución. Espera a que se complete la coroutine.
* **cancel():** Cancelar la coroutine.

