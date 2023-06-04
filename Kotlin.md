# KOTLIN

## Corutines

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
        println("Using thread Unconfined: ${Thread.currentThread()}")
    }

    //Mejorar performance, mas usado
    runBlocking(Dispatchers.Default) {
        println("Using thread Default: ${Thread.currentThread()}")
    }

    //Hilo para inputs/outputs
    runBlocking(Dispatchers.IO) {
        println("Using thread IO: ${Thread.currentThread()}")
    }


    //Hilo personalizado
    runBlocking(newSingleThreadContext("custom")) {
        println("Using thread custom: ${Thread.currentThread()}")
    }


//   TODO Solo para desarrollo Android
//    runBlocking(Dispatchers.Main) {
//        println("Using thread: ${Thread.currentThread()}")
//    }
}
```

