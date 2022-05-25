# Angular

## TypeScrip

Declarar variables, se puede especificar un solo tipo de dato o varios que puede aceptar la variable.

~~~typescript
let variable: string | number | boolean;
~~~

Dar valor por defecto a una función, siempre van primero los argumentos obligatorios (sin valor default), luego los que tienen un valor default. Si pongo un signo "?" antes de los dos puntos, le indico que es una variable opcional al momento de invocar la función.

~~~typescript
function nombreFun(arg1: number, 
                    arg2?: string,
                    arg3: string = 'valorDefault'){
 //contenido funcion   
}
~~~

### Funciones flecha

Ejemplos, las tres funciones son iguales:

~~~typescript
const funNormal = function( a: string ) {
    return a;
}

const funFlecha1 = ( a: string ) => {
    return a;
}

const funFlecha2 = ( a: string) => a;

//Asi se especifica que la funcion devuelve un string
const funFlecha2 = (): string => 'retorno';
~~~

Las funciones flechas al ser usadas no cambian el a lo que apunta en memoria al usar this, las funciones normales lo cambian.

### Promesas

La promesa se ejecuta, pero no detiene el resto del código si su respuesta se demora, al usar el método then, es porque retorna el objeto resolve, o sea que la operación se realizo con éxito, pero si falla, se captura con el método catch, este método es obligatorio usarlo a tener promesas.



Para que typeScrip sepa que tipo de dato retorna una promesa, se determina con Promise\<tipoDato> en la funcion que va a retornar el dato, solo se dice el  tipo de dato si la promesa retorna exitosamente(resolve), el error no es necesario.

~~~typescript
console.log("inicio");

 const retirarDinero = (montoRetirar: number): Promise<number>  => {
     
     let dineroActual = 1000;
     
     return new Promise( (resolve, reject)  =>{
         if (montoRetirar > dineroActual){
             reject('no hay fondos');
         } else {
             dineroActual -= montoRetirar;
             resolve( dineroActual):
         }
     });
 };

console.log("fin");

retirarDinero(290)
	.then( montoActual => console.log(`queda ${montoActual}`))
	.cathc( console.warn );
~~~

### Interface

~~~typescript
interface objeto {
    //atributos objeto
    nombre: string;
    id: number;
    atributo?: string; //Atributo opcional
}

const nomObj: objeto = {
    //debe tener los mismos atributos que la interface
}
~~~

### Clases

La palabra reservada export se usa para que la clase pueda ser usada en otros archivos y poder ser importada.

~~~typescript
export class nomClass {
    //Atributos
    nombre: string = 'valor por defecto'; //atributo inicializado
    atributo: tipoDato; //Atributo sin inicializar
    atributo?: string; //Atributo opcional
    
    constructor( atributos: tipoDato, ...){
        this.nombre= nombre; 
    }
    
    //Constructor con atributos, este no es necesario primero declarar los atributos de la clase, en el mismo contructor se hace
    
    constructor( public atributo: tipoDato,
                 public atributo3?: tipoDato, //Atributo opcional
                 private atributo2: tipoDato2 = 'valor default'){
        
    }
}

const nomVar: nomClass = new nomClass();
~~~







## Angular

instalar primero nodejs y luego angular con el comando 

~~~powershell
npm install -g @angular/cli
~~~

Ububtu

https://ubunlog.com/angular-instala-framework-ubuntu/

En la consola, crear un nuevo proyecto angular:

~~~powershell
ng new nombreProyecto
~~~

Configurar puerto de ejecución del proyecto, ## es el numero del puerto a asignar, sin el "--port ##" compila y corre el proyecto en el puerto por defecto (4200)

~~~powershell
ng server --port ##
~~~

Construir el proyecto para distribuición

~~~powershell
ng build --prod
~~~

Para importar un modulo, en el archivo app.module.ts, adicionalmente en la parte de NgModules en imports se agrega el nombre del modulo para porder ser usado.

~~~typescript
import { nombreModulo } from '@ubicacionEn/Proyecti'

// ejemplo
import { FormsModule } from '@angular/forms'
~~~

El enlace de las variables de js y el html se pueden modificar en tiempo real.

"title" es la variable a trabajar, definida en el archivo "app.componend.ts", esta variable se mostrara en el documento , y su valor variara a medida que cambie el input con ngModel

ej:

~~~html
<input type="text" [(ngModel)]="title">
{{ title }}
~~~

Dentro {{ }} se puede utilizar código JavaScript en el documento HTML del componente.



##### ngIf

Es un condicional if, que muestra lo que esta en la etiqueta si es true

~~~html
<div *ngIf="var === var2"> <!-- condicion--> 
    contenidi div
</di> 
~~~

##### ngFor

Para recorrer elementos de una lista, donde var1 es la variable temporal para recorrer la lista definida en el archivo "app.component.ts" e "i" es la variable que guarda el indice de cada varible en cada recorrido.

~~~html
<div *ngFor="let var1 of lista; index as i"> <!-- let i = index -->
    contenido div {{var1 }} {{ i }}
</div>
~~~



##### ngClass

Agregar una clase a la etiqueta si se cumple la condición, despues de la coma, es el else de la sentencia if . Lo que esta entre ' ', es el nombre de la clase que se va agregar.

~~~html
<div [ngClass]="{'text-primary':booleano==false, 'otraclse':booleano==true}">
    
</div>
~~~



##### ngSwitch

Es una setencia switch en las etiquetas se usa

~~~html
<div [ngSwitch]="variable">
    <p *ngSwitchCase?"'a que es igual'">Contenido etiqueta</p>
    <p *ngSwitchCase?"'a que es igual'">Contenido etiqueta</p>
    <p *ngSwitchCase?"'a que es igual'">Contenido etiqueta</p>
    <p *ngSwitchDefault>si no hay coin</p>
    
</div>
~~~







para ejecutar una función desde el componente ("app.component.ts") en el html

~~~html
<div (click)="nombreFuncion()">
    
</div>
~~~

En angular solo se pueden iterar arrays.



Generar componentes, genera un componente y actualiza los documentos

~~~powershell
ng g c nombreComponente
~~~

Generar pipe's

~~~powershell
ng g p nombrePipe
~~~

Levantar un servidor local

~~~powershell
ng serve 

ng serve -o #Abre el navegador por defecto
~~~

Recuperar los modulos del proyecto

~~~powershell
npm install
~~~



##### routerLink

Para mapear las paginas, estas rutas estan definidas en el el router component, rotuerLink recibe un arreglo como parametro, lo que se ve en el codigo es igua a: /nomRuta/nomRuta2

~~~html
<a [routerLink]="['nomRuta', 'nomRuta2']"></a>
~~~

##### routerLinkActive

Se usa para que en el nav, cuando se ingrese a esa pagina, el nav resalte en cual se esta

~~~html
<li routerLinkActive="active"></li>
~~~



Para poner los datos de una variable en un atributo de una etiqueta, se pone el atributo entre [] y el nombre de la variable entre ""

~~~html
<div [class]="variable">
    lorem 
</div>
~~~

##### Redireccionar desde codigo

~~~ts
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  constructor( private _router:Router) { }

  ngOnInit(): void {
  }

    redireccion(){
        //La ruta funciona igual routerLink
        this._router.navigate( ['nomRuta', 'nomRuta2'] )
    }
}
~~~

##### Pipes

Son procesos para transformar la info

~~~html
{{ var | pipe }} <!--uppercase puede ser un pipe que transforma la cadena en mayusculas -->
~~~

Eliminar el numero indicado de posiciones, funciona en cadenas, arreglos

~~~html
{{ var | slice:3 }}
~~~

obtener solo el intervalo indicado, de 0 a tres en el ejemplo  

~~~html
{{ var | slice:0:3 }}
~~~

pipe number, dejar con 3 decimales la variable de tipo number

~~~html
{{ var | number }}
~~~

especificar cantidad de decimales, si el entero es menor que la cantidad que solicita rellena con 0 a la izquierda

~~~html
{{ var | number : '1.0-0'}} <!-- 0 decimales, 1 posicion entera-->
{{ var | number : '3.0-0'}} <!-- 0 decimales, tres enteros-->
{{ var | number : '1.0-2'}} <!-- 2 decimales, 1 enteros-->
{{ var | number : '.0-2'}} <!-- 2 decimales, 0 enteros-->
~~~

Pipe porcentaje, si la variable es 0.25, al pasar por el pipe su porcentaje es 25%

~~~html
{{ var | percent}} <!-- pasa una variable decimal a su porcentaje-->
{{ var | percent : '2.2-2'}} <!-- 2 enteros, siempre ver 2 decimales-->
~~~

Pipe moneda (currency)

~~~html
{{ var | currency 'EUR'}} <!-- le pone a la variable el simbolo de la moneda especificada, en la pagina de angular docs esta los diferentes valores-->
~~~

Pipe JSON , puede generar errores en los metodos del objeto

~~~html
{{ var | json}} <!-- pasa un objeto a formato JSON-->
~~~

Pipe async, espera a que llegue una respuesta, ejemplo peticiones.

~~~html
{{ var | async }} <!-- -->
~~~

Pipe Date, mas propiedades de mostrar la fecha en el docs de angular 

~~~html
{{ var | date }} <!-- mostrar la fecha de forma corta-->
{{ var | date: 'medium' }} <!-- mostrar la fecha, con hora minuto y segundo-->
~~~









##### input notas

funcion con la tecla enter, al presionar la tecla enter en el input, este va a invocar la funcion heroe y va a tomar el valor dentro del input, para eso se uso el #buscar, para hacer referencia a el mismo.

~~~html
<input type="text" (key.enter)="heroe(buscar.value)" #buscar>
~~~



##### Obtener parametros de la URL

Dibde la URL de ejemplo es "http://cualquiercosa/termino" donde "termino" es el parametro a recibir, esto se hace en el archivo de ts del componente.

~~~typescript
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  constructor( private activatedRoute: ActivatedRoute ) { }

  ngOnInit(): void {

    this.activatedRoute.params.subscribe (params => {
      console.log(params['termino']);
    });

  }

}
~~~

#####  Inputs y outputs entre componentes

<!-- Ver video videos seccion 4, es para compartir información entre componentes del proyecto -->

###### Input

Se usa para enviar un argumento de un componente padre a un hijo.

~~~html
<app-prueba [varPrue]="'DASDFE'"></app-prueba>
~~~

El componente hijo es: 

~~~typescript
import { Component, OnInit, Input } from '@angular/core';
import { PruebaService } from 'src/app/servicios/prueba.service';

@Component({
  selector: 'app-prueba',
  templateUrl: './prueba.component.html',
  styleUrls: ['./prueba.component.css']
})
export class PruebaComponent implements OnInit {

  @Input()
  varPrue!: string;

  constructor() { }

  ngOnInit(): void {
  }

}
~~~

###### Output



##### Peticiones HTTP

###### GET

Primero se importa el modulo necesario para hacer las peticiones (HttpClient).

La funcion flecha devuelve el resultado de la peticion y lo almacena en la variable resp y esta dentro de la funcion lo almacena en una variable local defininda anteriormente ( this.var )

~~~typescript
import { HttpClient } from '@angular/common/http'



export class nameClass {
    
	var: any[]=[];
    
    constructor( private http: HttpClient ){
        this.http.get( 'url de la peticion get' )
        .subscribe( resp => {
            this.var = resp;
        })
    }
}
~~~



##### Inyectables

Son servicios que se pueden usar en los otros componentes sin necesidad de declararlo en el app.module.

Al inyectar el servicio este se puede usar en otro componente, es como importar una clase en java, de manera que puedo instanciarla y acceder a su logica.

~~~typescript
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class PruebaService {

  constructor() { }
}
~~~

Y para inyectarlo en otro componente, se importo y se inyecto en el constructor

~~~typescript
import { Component, OnInit } from '@angular/core';
import { PruebaService } from 'src/app/servicios/prueba.service';

@Component({
  selector: 'app-prueba',
  templateUrl: './prueba.component.html',
  styleUrls: ['./prueba.component.css']
})
export class PruebaComponent implements OnInit {

  booleano: boolean= false;

  constructor(private servicio: PruebaService) { }

  ngOnInit(): void {
  }

}
~~~



### Routing

El pasar entre componentes



# PREGUNTAS

1. ¿Porque al usar el [(ngModel)], es necesario definir un atributo name, si no se usa la variable en el mismo archivo html?
2. ¿Porque no puedo dejar un input() sin inicializar?
3. ¿Porque se puede usar la notación @input variable!: tipoVariable; sin que marque error por no estar inicializada?
