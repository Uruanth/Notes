#  RxJS

* Cuando una variable termina en "$" es un estándar para notar variables que son observables.

## A quien me puedo suscribir

~~~typescript
this.obs$ = new Observable<String>(subs => {
      subs.next('hola');
      subs.next('Mundo');

      subs.next('hola');
      subs.next('Mundo');

      subs.complete();

      //Forzar error
      // const a = undefined;
      // a.nombre = 'nombre';
      subs.next('hola');
      subs.next('Mundo');
    });
~~~

## Formas de suscribirme

~~~typescript
this.obs$.subscribe(
      valor => console.log('valor: ', valor),
      error => console.warn('error: ', error),
      () => console.log('complete')
    );
    
    console.log('[subscribe2]...')
    this.obs$.subscribe(this.obsevador);
	console.log('[subscribe3]...')
    this.obs$.subscribe({
        next?: value => console.log(value), 
        error: null, 
        complete: () => console.log('[complete]')});
);

  otroIntentando() {
    const subs = this.intervalo$.subscribe(num => console.log('[num]', num));

    //agragar varios observadores en uno para hacer un solo unsubscribe
    const sub1 = this.obs$.subscribe(this.obsevador);
    const sub2 = this.obs$.subscribe(this.obsevador);
    const sub3 = this.intervalo$.subscribe(this.obsevador);


    sub1.add(sub2)
      .add(sub3);

    setTimeout(() => {
      sub1.unsubscribe();
      // sub2.unsubscribe();
      // sub3.unsubscribe();
      subs.unsubscribe();
    }, 10000)

  }
~~~

## of  /  from

from recibe un array como argumento y devuelve sus valores en el flujo 

~~~typescript
pruebaOf() {
    //emisor que recibe todo tipo de argumentos
    const obs1$ = of(1, 2, 3, 4, 5, 6, function(){}, 'asdasdas');
    //Emisor de solo datos tipo number
    const obs$ = of<number>(1, 2, 3, 4, 5, 6);


    console.log('[inicio]')
    obs$.subscribe(
      next => console.log('[pruebaOf]', next),
      null,
      () => console.log('[pruebaOf] complete')
    );
    console.log('[fin]')
  }
~~~

## fromEvent

Escuchar eventos

~~~typescript
pruebaFromEvent(){
    // const src1$ = fromEvent( document, 'click');
    // const src2$ = fromEvent( document, 'keyup');
    /**
     * cada evento con si clase especifica permite usar todas sus propiedades
     * si no se pone a que clase de evento es, las propiedades especificas
     * del evento no podran ser usadas
     */
    const src1$ = fromEvent<PointerEvent>( document, 'click');
    const src2$ = fromEvent<KeyboardEvent>( document, 'keyup');

    const observer = {
      next: value => console.log('[fromEvent]:', value)
    }

    /**
     * Desestructurando el evento que llega, para solo usar
     * sus atributos x y y
     */
    src1$.subscribe(({x, y})=>{
      console.log(x,y);
    });
    src2$.subscribe(evento => {
      console.log(evento.key);
    });
  }

~~~

## range

~~~typescript
 pruebaRange(){
    // const source$ = of<number>(1,2,3,4,5,6);
    /**
     * El primer argumento es en que valor empezar
     * El segundo es cuantos valores se van a emitir
     * range(6) aqui el valor inicial es 0
     * range() aqui no emite ningun valor
     * range(1,10, asyncScheduler) volverlo asyncrono
     */
    const source$ = range(1,10, asyncScheduler);

    console.log('[range] inicio')
    source$.subscribe( console.log );
    console.log('[range] fin')

  }
~~~

## interval

Son observables asincronos por naturaleza, periodo por default es 0, el intervalo no da el complete.

~~~typescript
  const observer = {
      next: value => console.log('[interval]:', value),
      complete: () => console.log('[complete]')
    }

    const interval$ = interval(1000);
    console.log('[interval] inicio')
     interval$.subscribe( observer );
    console.log('[interval] fin')
~~~

## timer

~~~typescript
timer(2000); //envia datos en 2 seg  y luego completa el observable
~~~

configuraciones especiales

~~~typescript
//Inicia un interval que inicia en 2000 ms
const timer$ = timer(2000,1000); 
~~~

## asyncSecheduler

~~~typescript
testAsyncScheduler(){
    const saludar = () => console.log('[scheduler] hola mundo');
    const saludar2 = nombre => console.log('[scheduler] hola', nombre);
    asyncScheduler.schedule( saludar, 2000 );
    //El tercer argumento es el estado de la funcion, solo peude recibir un estado, este puesde ser de cualquier tipo, ejemplo un JSON, por eso no funciona con funciones de dos argumentos o mas
    asyncScheduler.schedule( saludar2, 2000, "fernando" );
  }

//crear un intervalo con asyncScheduler
 const sub$ = asyncScheduler.schedule( function(state){
      console.log('[scheduler] state', state);
      this.schedule( state+1, 1000);
    }, 3000, 0);

    // setTimeout(()=>{
    //   sub$.unsubscribe();
    // },5000);

    //se desuscribe igual que con el setTimeout
    asyncScheduler.schedule(()=> sub$.unsubscribe(), 10000);

  }

~~~

## Subject

Es un observador al cual se le pueden suscribir otros observer

~~~typescript
 /**
   * 1- Casteo multiple
   * 2- Es un observer
   * 3- Next. error, complete
   */
const uu = this.intervalo$.subscribe(this.subject$);
const subs1 = this.subject$.subscribe(subs => console.log('subs1', subs));
const subs2 = this.subject$.subscribe(subs => console.log('subs2', subs));
~~~



## otros

~~~typescript
 otrosOfFrom() {
    const observer = {
      next: value => console.log('[ofFrom]:', value),
      complete: () => console.log('[complete]')
    }


    // const src$ = from([1,2,1,3,4,6,6]);
    // const src$ = of(...[1,2,1,3,4,6,6]);
    // const src$ = from(
    //   fetch('https://api.github.com/users/klerith')
    // );

    // src$.subscribe( async (rep) => {
    //   const dataResp = await rep.json();
    //   console.log(dataResp);
    // });

    const miGenerador = function*(){
      yield 1;
      yield 2;
      yield 3;
    }

    const iterable = miGenerador();
    from ( iterable ).subscribe(observer);


  }
~~~

# Operadores

![image-20220305201727036](C:\Users\dairon.perilla\AppData\Roaming\Typora\typora-user-images\image-20220305201727036.png)

## map

~~~typescript
range(1,2).pipe(
	map<number, number> (val => val*10) //el primer generico indica que entra y el segundo que sale del map
)
.subscribe( console.log );
~~~

## pluck

retorna el valor de un atributo dado, devuelve el 2 de este objeto { 'v' : 2 } si se usa como argumento 'v';

~~~typescript
import { pluck } from 'rxjs/operators';

const keyup$ = fromEvent<KeyboardEvent>(document, 'keyup');

const keyupPluck$ = keyup$.pipe(
    pluck('key')
)
.subscribe( console.log )


//Para llamar la propiedad de la propuiedad del objeto que se recibe
//Seria como objeto.atributoPadre.atributohijo
const keyupPluck$ = keyup$.pipe(
    pluck('atributoPadre', 'atributoHijo')
)
.subscribe( console.log )
~~~

## mapTo

Transforma los elementos del flujo en lo que se pone como argumento.

~~~typescript
testMapTo() {
    const keyup$ = fromEvent<KeyboardEvent>(document, 'keyup');
    const keyupMapTo$ = keyup$.pipe(
      mapTo('target')
    )
      .subscribe(console.log)
  }
~~~

## filter

Igual que en java

## Encadenar operadores

~~~typescript
    const keyupMapTo$ = keyup$.pipe(
      map('target'),
      filter('codigo filter') 
    )
~~~

## tap

El tap permite recibir observables, y seguir el proceso de emision

~~~typescript
 testTap(){
    const numeros$ = range(2,7).pipe(
      tap(x => console.log('[tap]:', x)),
      map(val => val*10),
      tap({
        next: valor => console.log('[tapAfter]:',valor),
        complete: () => console.log('[tap]: complete')
      })
    );

    numeros$.subscribe(val => console.log('[tapSubscribe]:', val))
  }
~~~

## reduce

va acumulando todo el flujo de acuerdo a la funcion, y se da como valor inicial el 0, solo emite el resultado cuando el observable se complete.

~~~typescript
reduce( (acumulado, actual) => acumulado + actual, 0);

testReduce(){
    interval(500).pipe(
      tap(console.log),
      take(6),
      reduce((acc, cur) => acc+cur, 5)
    ).subscribe({
      next: val => console.log('[reduce]:', val),
      complete: ()=> console.log('[reduce]: complete')
    })
  }
~~~

## scan

El scan va retornando cada acumulado y no solo cuando se complete el observable

~~~typescript
scan( (acumulado, actual) => acumulado + actual, 0);

testScan(){
    interval(500).pipe(
      tap(console.log),
      take(6),
      scan((acc, cur) => acc+cur, 5)
    ).subscribe({
      next: val => console.log('[scan]:', val),
      complete: ()=> console.log('[scan]: complete')
    });
  }
~~~

# Operadores no tan comunes

## take

Toma solo la cantidad de elementos dichos y luego completa el obsarvable.

~~~typescript
observable$.pipe(
	take(3)
).subscribe( console.log )
~~~

## first

Completa el obsevable despues del primer valor

~~~typescript
observable$.pipe(
	first()
).subscribe( console.log )
~~~

aqui el first solo va a emitir el valor cuando haya alguno que cumpla la condicion e imediatamente completa el observable, el observable puedue seguir enviando datos pero el first no permite que pasen.

Es como un filter. 

 ~~~typescript
 observable$.pipe(
 	first(value => value>0)
 ).subscribe( console.log )
 ~~~

## takeWhile

Recibe elementos hasta que la condicion sea falsa, cuando sea falsa se completa el observable.

Si se desea recibir el valor que hizo falsa la condicion se asigna un segundo argumento como verdadero, por defecto es falso

~~~typescript
observable$.pipe(
	takeWhile(value => value>0, true)
).subscribe( console.log )

//Desestructurando
observable$.pipe(
    map( ({x,y}) => ({x,y}) )
	takeWhile( ({y}) => y > 0, true)
).subscribe( console.log )
~~~

## takeUntil

Se emiten valores hasta que se reciba otro observable.

En este caso cuando se de un clic en el documento se completara el "observable$"

~~~typescript
observable$.pipe(
	takeUntil(fromEvent(documento,'click'))
).subscribe( console.log )
~~~

## Skip

evita que sigan en el flujo el numero indicado de elementos, omite la cantidad especifica de elementos en el orden de llegada.

~~~typescript
observable$.pipe(
	skip(3)
).subscribe( console.log )
~~~

## distinct

Permite le paso de todos los elementos que sean diferentes en el flujo, ninguno continua si ya se emitio

~~~typescript
observable$.pipe(
	distinct()
).subscribe( console.log )

//En caso de objetos para poder identificar cuales ya se emitieron
observable$.pipe(
	distinct(val => val.atributo)
).subscribe( console.log )
~~~

## distinctUntilChanged

Emite elementos si el valor anterior es diferente al que se esta emitiendo v 

~~~typescript
observable$.pipe(
	distinctUntilChanged()
).subscribe( console.log )

//En caso de objetos para poder identificar si el objeto anterior es igual al actual mediante un atributo
observable$.pipe(
	distinct( (anterior, actual) => anterior.atributo === actual.atributo)
).subscribe( console.log )
~~~

## distinctUntilKeyChanged

Evita la emision de un elemento que contenga la misma propiedad k que el anterior

~~~typescript
observable$.pipe(
	distinctUntilKeyChanged("k")
).subscribe( console.log )
~~~

# Operadores que trabajan con el tiempo

## debounceTime

Controla la cantidad de msjs, solo continua el flujo con el ultimo elemento que se emitio y tuvo un lapso de tiempo igual o superior entre elementos al dado.

En este caso solo se mostraran los elementos que tengan un segundo de diferencia o mas

~~~typescript
observable$.pipe(
	debounceTime(1000)
).subscribe( console.log )
~~~

## throttleTime

Emite el primer elemento que se hizo en un lapso de tiempo de 1 seg con la anterior emision. Lo contrario del debounceTime.

~~~typescript
observable$.pipe(
	throttleTime(1000)
).subscribe( console.log )

//Si ambas son falsas emite el primero nada mas
//Los dos verdaderos emite el primero y el ultimo
observable$.pipe(
	throttleTime(1000, asyncScheduler, {
        leading: false,
        trailing:true
    })
).subscribe( console.log )
~~~

## sampleTIme

Cada tiempo dado emite un elemento, este elemento sera el ultimo que se dio en ese lapso de tiempo, si no hubo un evento no emite nada.

~~~typescript
observable$.pipe(
	sampleTime(1000)
).subscribe( console.log )
~~~

## sample

![sample marble diagram](https://rxjs.dev/assets/images/marble-diagrams/sample.png)

Se emite el ultimo elemento recibido cuando un evento es emitido por un segundo observer, en este caso "observable2$"

~~~typescript
observable$.pipe(
	sample(observable2$)
).subscribe( console.log )
~~~

## auditATime

Espera a que se empiecen a emitir elementos, cuando el primero es emitido empieza contar el tiempo establecido y da paso al ultimo elemento emitido en ese lapso de tiempo y reinicia el proceso de conteo.

Si el observer es completado durante el lapso de tiempo establecido no se emitira nada.

~~~typescript
observable$.pipe(
	sample(observable2$)
).subscribe( console.log )
~~~

# Ajax/RxJS

Esta en el paquete rxjs/ajax

## catchError

Atrapar errores en el obsevable, este tambien puede retornar un nuevo observable

~~~typescript
ajax( url )
    .pipe(
    	map( ... ),
    	catchError( ... )           
	).subscribe( console.log );
            
            
const manejoError = (err: AjaxError) => {
            console.warn('error en:', err.message);
            return of([]);
        }
~~~

~~~typescript
headers = {
    'Content-Type': 'application/json',
    'mi-token': 'asdasd4655'
}

//Con getJSON ya me devuelve la data en formato JSON
const obs$ = ajax.getJSON( url, headers )
	.pipe( catchError( manejoError ) );


obs$.subscribe( data => console.log('data:',data) );

//Como en el pipe manejo el error, y no lanzo ningun error, el subscribe ejecuta el next,
//si uso el throw error, ejecuta el error.
obs$
    .pipe(
		catchError( manejoError )
	)
    .subscribe( {
        next: val => console.log('val:',val),
        error: err => console.log('err:',err),
        complete: () => console.log('completo'),
} );


~~~

## post - put - delete

~~~typescript
ajax.post( url, body, headers );
ajax.put( url, body, headers );
ajax.delete( url, headers );

//Aqui se puede cambiar el tipo de la peticion dinamicamente, en caso del delete o get no importa que el objeto tenga un body. En el back se maneja eso
ajax({
    url: url,
    method: 'POST',
    headers: {
        'mi-token': 'asd123'
    },
    body: {
        id: 1,
        nombre:'asdads'
    }
}).subscribe( console.log );
~~~

# Operadores de transformacion (aplanamiento)

 https://app.quicktype.io/

Sacar modelos de clase facil

## mergeAll

Emite todos los valores de diferentes observables y no se completa hasta que no se complete a todos los observables que este subscrito.

~~~typescript
observable$.pipe(
	map( texto => ajax.getJSON(...) ), //Sale un observable de la peticion
    mergeAll(), //Aplana el objeto de observable a json
    pluck('atributo') //Sale el atributo de cada objeto emitido
).subscribe( console.log )
~~~

## mergeMap

Regresa un nuevo elemento pero puede tener un observable como transformador, usa el observable por cada elemento que llega del flujo

~~~typescript
observable$.pipe(
	mergeMap( (elemento) => interval(1000) //Empieza a emitir valores como un intervalo normal por cada elemento que le llegue
            .pipe( take(3) ) //Toma solo tres por cada elemento para dejar un flujo infinito por el interval
            )
).subscribe( console.log )
~~~

## switchMap

Retorna la subscripcion a un nuevo observable, el switch map genera una nueva subscripcion por cada elemento que le llega. Si se emite otro elemento mientras aun no se completa la emision del anterior la completa y va con la siguiente.

~~~typescript
observable$.pipe(
	switchMap( (elemento) => interval(1000) ) //Retorna valores del intervalo hasta que llega un nuevo valor del flujo, cancela el intervalo y vuelve a em
).subscribe( console.log )
~~~

## concatMap

Retorna la subscripcion a un nuevo observable, el cocatMap genera una nueva subscripcion por cada elemento que le llega. Si se emite otro elemento mientras aun no se completa la emision del anterior, espera a que se complete y luego empieza a emitir el observable que seguia en el orden de emision.

~~~typescript
observable$.pipe(
	cocathMap( (elemento) => interval(1000) ) //Retorna valores del intervalo hasta que se completa y luego continua con la siguiente emision. 
).subscribe( console.log )
~~~

## exhaustMap

Retorna la subscripcion a un nuevo observable, el cocatMap genera una nueva subscripcion por cada elemento que le llega. Si se emite otro elemento mientras aun no se completa la emision del anterior, ignora la nueva supscripcion, solo genera una nueva subscripcion si la anterior ya se completo

~~~typescript
observable$.pipe(
	cocathMap( (elemento) => interval(1000) ) //Retorna valores del intervalo hasta que se completa y luego continua con la siguiente emision. 
).subscribe( console.log )
~~~

# Operadores y metodos de combinacion de observables

No confundir concat, merge con Operadores de transformacion obsoletos (no importar de rxjs/Operators).

## startWith

Hace que el primer elemento que se emita sea el del argumento del startWith

~~~typescript
observable$.pipe(
    startWit( 0 ) //El primer valor que se emite es 0
).subscribe( console.log )
~~~

## endWith

Hace que el ultimo elemento que se emita sea el del argumento del endWith

~~~typescript
observable$.pipe(
    endWit( 0, 1 ) //El ultomo valor que se emite es 1 y antes que este 0.
).subscribe( console.log )
~~~

# concat

Resibe observables o iterables y lo crea como un nuevo observador.

Los flujos se empiezan a emitir en el orden que esta en el argumento del concat y el siguiente empieza cuando el anterior se completa.

~~~typescript
observable$.pipe(
    concat( interval$.pipe ( take(3) ),
           interval$.pipe ( take(2) )
).subscribe( console.log )
~~~

## merge

Va emitiendo los valores de cada observador que recibe como argumento, pero no se completa la emicion hasta que no se completen todos los obsevables.

~~~typescript
observable$.pipe(
    concat( interval$.pipe ( take(3) ),
           interval$.pipe ( take(2) )
).subscribe( console.log )
~~~

## combineLatest

Emite un arreglo de los observables que recibe como argumento, envia siempre una combinacion de los ultimos elementos enviados por cada observable.

Combina los observables para emitir un solo arreglo con los dos elementos emitidos, cada arreglo se emite cuando uno de los obsevables emite un elemento, el arreglo que emite el combine es la union de los dos ultimos elementos enviados por cada observable, por esto un arreglo puede repetir uno de sus argumentos si un observable no ha vuelto a emitir elementos.

~~~typescript
observable$.pipe(
    combineLatest( interval$.pipe ( take(3) ),
           interval$.pipe ( take(2) )
).subscribe( console.log )
~~~

## forkJoin

Recibe observables como argumento, se subscribe a todos estos y cuando todos se completan emite un solo arreglo con todos los últimos elementos emitidos por los observables

~~~typescript
forkJoin(observable1$, 
         observable2$, 
         observable3$
).subscribe( console.log )
~~~













---

# Ejercicio de ProgressBar

target.documentElement.clientHeight

target.scrollingElement.scrollHeight

target.scrollingElement.scrollTop

