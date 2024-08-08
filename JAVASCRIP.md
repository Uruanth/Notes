# **JAVASCRIP** 

Se puede googlear MDN para encontrar información de desarrollador (moxilla developer network)

var para declarar variables globales, let para variables de bloque.

cont para definir constantes

imprimir algo en la consola del navegador, console.log();

~~~javascript
variable.toLowerCase();	//Pasar todo a minuscula
variable.toUpperCase();	//Pasar todo a mayuscula
variable.includes("cadena a buscar") //El resultado lo entrega como un booleano.
variable.trim(); // Eliminar espacios de más.
variable.split("caracter"); // genera arreglos entre el caracter especifico.

/* Para interporlar entre una cade, se ${variable}, de tal manera que la cadena de la variable quede concatenada en la otra variable, ademas que toda la cadena debe estar entre ` ` (acento invertido / template.string)

Tambien en este se respetan los saltos de lineo y otro.
*/

let variable = "asdasdasd $[variable2] asdad asd";

~~~

Para definir la cantidad de números decimales a mostrar se usa el método toFixed(#); el los paréntesis se define la cantidad de decimales. El método parseInt(), parseFloat(), etc, sirve para convertir los datos a ese tipo de variable.

 ~~~javascript
console.log(variable.toFixed(1)); //imprime en la consola el valor de la variable con 1 decimal.
 ~~~

### UNDEFINED NULL & NaN (Not a number)

Una variable indefinida es aquella que no se le asigno ningún valor, el NaN es cuando se trata de hacer una operación con una cadena.

### RETURN

Al usar return, lo que se hace es asignar un valor a la función en que se encuentra, las siguientes líneas dentro de la función son excluidas. 

En una función también se puede asignar valores predeterminados a los parámetros.

~~~javascript
//valores predeterminados de los parametros estan despues de los iguales.
function funcion(parametro1="asdasdasd", paremetro2=0){	
    instrucciones
    return $$		//se define a quiere que retorne la funcion, valor o cadena, ambos son validas
}
~~~

## ARRAY (ARREGLOS)

En un arreglo puede haber anidado otro, para imprimir o navegar entre ellos se pone primero la posicion dentro del primer arreglo y luego la posición que se desea imprimir de segundo arreglo, y asi sucesivamente el numero de arreglos anidados que se tengan.

Con .length puedo saber la longitud del arreglo.

[`unshift()`](https://developer.mozilla.org/es/docs/Web/JavaScript/Referencia/Objetos_globales/Array/unshift) y [`shift()`](https://developer.mozilla.org/es/docs/Web/JavaScript/Referencia/Objetos_globales/Array/shift) funcionan exactamente igual de `push()` y `pop()`, respectivamente, excepto que funcionan al principio de la matriz, no al final.

~~~javascript
const a=[];	//definir un arreglo
const a=[1, true, "asda", ["a", 1, "c"]]	// dar valores al arreglo
console.log(a[3][0]);	//Imprimir el valor de la posicion 0 del arreglo anidado.
const a = Array.of(1, 2, 3,...);		//otra forma de declarar arreglos
const a = Array(100).fill(false);		//un arreglo de 100 posiciones llenadas con el valor false.
const a = new Array(asd)				//otra forma de definir arreglos.
arreglo.push($$)						//agregar un valor al final del arreglo
arreglo.pop();							//quita el ultimo elemento

let a = [1,2,3,4]
    console.log(a)
    a.forEach(function (el, index) {	 //imprimir posicion elemento (el) y numero de indice (index)
        console.log(`<li id="${index} "> ${el}</li>`)
    });

// convertir una cadena separada por comas en una arreglo.
let myData = 'Manchester,London,Liverpool,Birmingham,Leeds,Carlisle';
let myArray = myData.split(',');

//Convertir un arreglo en una cadena separada por signos de seperación.
let myNewString = myArray.join(',');
~~~

## OBJETOS

Los objetos pueden almacenar todo tipo de información en forma de atributos y métodos(funciones).

~~~javascript
 const jon={
           as: 1,
           ss: 'asd',
           d: [1,
           3,
           'sadddd'
        ],
        fnt: function(){
            console.log('asdddd')
        }
       }
 console.log(jon.atributo/metodo) 
//Para llamar en consola el metodo o atributo seleccionado, si se necesita un dato de un atributo en forma de arreglo, vuelve y se llama con un . despues de llamar al atributo arreglo.
object.keys(objeto);	//listar los atributos y metodos del objeto en un arreglo
object.values(objeto);	//listar los valores de atributos y metodos del objeto en un arreglo
"objeto".hasOwnProperty("atributo/metodo"):	//Busca si el objeto tiene o no el atributo o metodo.
~~~

## OPERADORES

Los mismos que java.

~~~javascript
=== //comparacion del mismo dato y valor 
== igualdad
!= diferencia
> mayor que
= mayor igual
< menor
<= menor igual
i+=x //i=i+x
i++ //i=i+1

! //not
|| //or
&&	//and
~~~

## CONDICIONALES

### IF

~~~javascript
if(condicion){
    instrucciones
} else {    
}
//El operador ternario permite ejecutar un if/else en una sola linea, pero no permite anidar.
let variable = (condición)?"intruccion si es verdadero":"instruccion si es falso"
~~~

### SWITCH

~~~javascript
switch(key){
    	case $$:			//$$ caso en la que esta la llave
            instrucción
            break;			//romper el ciclo
    	default:
        	instruccion		//en caso de que no este en los casos definidos.
}
~~~

### CICLOS

#### WHILE

~~~javascript
do {
    intrucciones	
} while (condicion);
// la diferecia entre el do while y el while es que el primero se ejecutsa por lo menos una vez.
while (condicion) {
    instrucciones
}
~~~

#### FOR

Buscar forin y forof

~~~javascript
for(indicador;condición;cambio){
 	instrucciones   
}
~~~

## MANEJO DE ERRORES

~~~javascript
try{
    se introduce el codigo a evaluar;
} catch (error) {
    captura cualquier error en el try;
} finally {
    se ejucuta al final haya o no error;	
}
~~~

___

Con break te sales de la estructura en que esta y con continue, solo se salta esa condición y sigue el ciclo en el siguiente paso.

___

anteponer ... en un arreglo genera un solo arreglo y no dos 

~~~javascript
arreglo1 = [n,n,n,n,n]
arreglo2 = [m,m,m,m,m]
arreglo3 = [arreglo1, arreglo2] = [[n,n,n,n,n], [m,m,m,m,m]]
arreglo3 = [...arreglo1, ...arreglo2] = [n,n,n,n,n,m,m,m,m,m]
~~~

### ARROW FUNCTION

Cuando no se usan parámetros o se usan varios, es obligatorio los paréntesis, para un solo parámetro no es necesario; si es solo una instrucción se pueden omitir los corchetes. 

~~~javascript
const variable = (parametros) => { 
    instrucciones;
}
~~~

### PROTOTYPE

Se generan métodos prototype, cuando algún método de un objeto no vaya a estar en todos sus hijos al crearsen, pero si que se lo puedan utilizar.

~~~javascript
function animal(nombre, edad) {
    //atributos
    this.nombre=nombre
    this.edad=edad
   }
//metodo prototipo
animal.prototype.metodo = function() {
    instrucciones		
}
~~~

### HERENCIA

~~~javascript
function animal(nombre, edad) {
    //atributos
    this.nombre=nombre
    this.edad=edad
   }
//metodo prototipo
animal.prototype.metodo = function() {
    instrucciones		
}
//herencia / asociación prototipica
	function heredero(nombre, edad, tamanio) {
        this.super=animal
        this.super(nombre, edad)
        this.tamanio
    }
//heredando de animal
heredero.prototype = new animal();

//Se pueden modificar los metodos prototipo del padre 
heredero.prototype.metodo = function() {
    nuevas instrucciones;	
}

~~~

