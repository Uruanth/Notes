# KOTLIN

## Coroutine

### Constructores

* **runBlocking**: El menos recomendado, porque bloquea el hilo, solo se recomienda en las pruebas unitarias.
* **Launch**: Manda la subtarea a segundo plano pero no retorna nada.
* **Async**: Igual que el ***Launch*** pero este si retorna algo.
* **Produce**: ***Pendiente***, Usa y genera channels.

### Funciones suspendibles

* Es una función que puede iniciar, pausar y reanudar.
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
* **join():** Suspende el hilo hasta que la coroutine termine para continuar con la ejecución. Espera a que se complete la `coroutine`.
* **cancel():** Cancelar la `coroutine`.

### Async

Crea una `coroutine`que bloquea el hilo en el que se ejecuta hasta que nos retorne un resultado, retorna un objeto de tipo ``Deferreded<t>`, que extiende de Job, posee los mismos  métodos y uno adicional que es: 

* **Await()\<T>**: Espera a que se termine la ejecución de una `coroutine`y retorna un objeto de tipo *T*.

Un uso común es para llamados ***HTTP***.

#### Example

```kotlin
fun main(){
    var foo = "";
    runBlocking {
        val deferred = async {
            getFoo("bar")
        }
        foo = deferred.await();
    }
    println(foo);
}

suspend fun getFoo(arg: String): String{
    delay(500);
    return when(arg){
        "foo" -> "Red"
        "bar" -> "Blue"
        else -> "Color not found"
    }
}
```

### Lock 

Hay casos en las que las `coroutines` utilicen al tiempo variables, para evitar que estos valores se vean afectados al final, se usa `Mutex`. con su método `withLock`, para evitar esto.

#### Example:

```kotlin
fun main() {
    val a = LockAndUnlock();
    a.startProducerAndCosumer();
}

class LockAndUnlock() {

    private val queue = ConcurrentLinkedQueue<Notes>();
    private var produced = 0;
    private var consumed = 0;
    private var finished = false;
    private val batch = IntArray(5);

    private val mutex = Mutex();

    fun startProducerAndCosumer(): Unit {
        runBlocking {
            //Producer
            launch(Dispatchers.Default) {
                val producers = List(100_000) {
                    launch {
                        val note = ChannelsUtil.getRandomNote();
                        if (queue.offer(note)) {
                            mutex.withLock {
                                produced++;
                            }
                        }
                    }
                }
                producers.joinAll();
                finished = true;

                println("Producer finished");
            }

            //Consumer
            launch(Dispatchers.Default) {
                val consumers = List(batch.size) {
                    launch {
                        while (!finished || queue.isNotEmpty()) {
                            if (queue.isNotEmpty()) {
                                val note = queue.poll();
                                if (note != null) {
                                    mutex.withLock {
                                        consumed++;
                                        batch[it]++;
                                    }
                                }
                            }
                        }
                    }
                }


                consumers.joinAll();
                println("Consumer finished")

            }
        }

        println("Queue size: ${queue.size}");
        println("Notes produced: $produced")
        println("Notes consumed: $consumed")

        val total = batch.reduce { acc, i ->
            acc + i
        }

        println("total: $total");
    }
}


class ChannelsUtil() {

    companion object {

        private val notes = Notes.values()

        fun getRandomNote(): Notes {

            val pos = (0..6).random()

            return notes[pos]

        }

    }

}

enum class Notes() { DO, RE, MI, FA, SOL, LA, SI }
```

### Channel

Al usar el `ConcurrentLinkedQueue`, esta es pensado en operaciones de concurrencia y no de `Coroutines`, por lo tanto no son lo mas eficientes, para esto, en `coroutines` tenemos los `channel`.



#### Example:

```kotlin
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.joinAll
import kotlinx.coroutines.launch
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock

fun main() {
    val a = Channels();
    a.startProducerAndCosumer();
}

class Channels() {
    //Channel puede recibin un arg en su constructor que indica la capacidad que posee
    private val channel = Channel<Notes2>();
    private var produced = 0;
    private var consumed = 0;
    private var finished = false;
    private val batch = IntArray(5);

    private val mutex = Mutex();

    fun startProducerAndCosumer(): Unit {
        runBlocking {
            //Producer
            launch(Dispatchers.Default) {
                val producers = List(100_000) {
                    launch {
                        val note = ChannelsUtil2.getRandomNote();
                        channel.send(note);
                        mutex.withLock {
                            produced++;
                        }
                    }
                }
                producers.joinAll();
                //TODO no olvidar cerrar los channel, ya que son un buffer
                channel.close();
                finished = true;

                println("Producer done");
            }

            //Consumer
            launch(Dispatchers.Default) {
                val consumers = List(batch.size) {
                    launch {
                        for (note in channel) {
                            mutex.withLock {
                                consumed++;
                                batch[it];
                            }
                        }

                    }
                }


                consumers.joinAll();
                println("Consumer finished")

            }
        }

        println("Notes produced: $produced")
        println("Notes consumed: $consumed")

        val total = batch.reduce { acc, i ->
            acc + i
        }

        println("total: $total");
    }
}


class ChannelsUtil2() {

    companion object {

        private val notes = Notes2.values()

        fun getRandomNote(): Notes2 {

            val pos = (0..6).random()

            return notes[pos]

        }

    }

}

enum class Notes2() { DO, RE, MI, FA, SOL, LA, SI }
```

### Produce

Se especializa en la creación de `coroutines` con la capacidad de transmitir datos a través de un `channel`. Es constructor retorna un objeto de tipo `ReceiveChannel` que es el usado para la transmisión de datos.

#### Example:

```kotlin
//Produce and consume without produce constructor.
fun main() {
    println("fun main")
    val colorP = ColorProducer();
    val colorC = ColorConsumer();
    runBlocking {
        launch {
            colorP.produceStream();
        }

        launch {
            colorC.consumeStream(colorP.getChannel())
            colorC.released();
        }

    }
 }


class ColorProducer(private val dispatcher: CoroutineDispatcher = Dispatchers.Default) {
    private val channel = Channel<Colors>();
    fun getChannel(): ReceiveChannel<Colors> = this.channel;

    suspend fun produceStream() = withContext(dispatcher) {
        ColorsUtil.getListColors().forEach { color ->
            channel.send(color);
        }
        channel.close();
    }


}

class ColorConsumer(private val dispatcher: CoroutineDispatcher = Dispatchers.Default) : CoroutineScope {
    private val job = Job();
    override val coroutineContext: CoroutineContext
        get() = job + dispatcher

    suspend fun consumeStream(colors: ReceiveChannel<Colors>) = withContext(dispatcher) {
       //Usando la nueva funcion, con el constructor produce
        colors
            .filterByPrimary()
            .consumeEach { color: Colors -> println(color) }
    }


    fun released(){
        this.job.cancel();
    }
    
    //Constructor produce, agrega una nueva funcion a la clase existente para ser usada
    @OptIn(ExperimentalCoroutinesApi::class)
    private fun ReceiveChannel<Colors>.filterByPrimary(): ReceiveChannel<Colors> = produce {
        consumeEach { color: Colors ->
            if (!color.isPrimay){
                send(color)
            }
        }
    }
    
}

data class Colors(
    val name: String,
    val hexadecimal: String,
    val isPrimay: Boolean,
    val rgb: String
)

class ColorsUtil {
    companion object {
        fun getListColors(): List<Colors> {
            return listOf(
                Colors("blue", "#09372", false, "0.4.3"),
                Colors("red", "#7567567", true, "10.43.31"),
                Colors("ff", "#04452", false, "20.34.223"),
                Colors("beeue", "#09355", false, "220.204.3"),
            )
        }
    }
}

```

Con el constructor produce, retornamos objetos de tipo `ReceiveChanel\<T>`, de tal manera que podemos extender las funcionalidades de nuestros `channels`. 

### Flows

En vez de emitir una lista de una llamada, se emite un flujo de objetos, re-actividad.

* Hot stream, se emiten datos así no sean requeridos.
* Cold stream, se emiten datos bajo demanda.

Constructores:

* **flowOf():** Crear un flujo a partir de un conjunto fijo de valores.
* **flow { ... }:** función de construcción para construir flujos arbitrarios a partir de llamadas secuenciales para emitir la función.
* **channelFlow { ... }**: función de construcción para construir flujos arbitrarios a partir de llamadas potencialmente simultáneas a la función de envío.

#### Operadores intermedios:

* **`Map`**
* **`Filter`**
* **`filterNot`**

#### Flat operators

* **`flatMapConcat`**: Retorna otro flujo
* **`flatMapMerge`**: Combina los flujos y va emitiendo sin necesitad de esperar que alguno se complete
* **`flatMapLatest`**: Completa los flujos y a medida que llegan y empieza a emitir uno nuevo
* **`zipOperator`**: Une dos flujos, y emite un resultado por cada par de valores emitidos, si un flujo emite mas elementos que el otro, estos valores son omitidos
* **`combine`**: Si un flujo emite mas elementos que el otro, se combina con el ultimo elemento emitido por el otro flujo

#### Final operators

*  **collect**

#### Accumulators

* **reduce**
* **fold**
* **single**

#### Exceptios handles

* **`catch`**: No rompe el flujo, y se puede luego continuar con otros flujos si es necesario, pero los flujos anteriores seran completados. Igual repasar el tema de manejo de errores

