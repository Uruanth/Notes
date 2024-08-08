# **BASICO**

## VARIABLES

String, number & boolean.

const, constante; let, declarar variable en scope de bloque, var scope funciones;

los enteros en entradas no definidas como numero toca convertirlos en enteros.

~~~javascript
variable = parseInt(variable);		//Convertir variable en entero.
~~~

## ARRAY `del otro curso`

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
arreglo.push();						//agregar un valor al final del arreglo
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

## BUCLES

while, do while, for.

~~~javascript
for (let i=0;i<n;i++) {
    if (i==n+2) {
        continue;				//La palabra continue se usa para saltar ese punto en el bucle.
        break;					//La palabra continue se usa para terminar en ese punto en el bucle.
    }
}
~~~

for in, devuelve el valor de la posición de la variable1 en la variable2 hasta completar todos los elementos.

for of, devuelve el contenido de la posición de la variable1 en la variable2 hasta completar todos los elementos.

~~~javascript
for (variable2 in variable1) {
    instrucción;			
}
for (variable2 of variable1) {
    instrucción;			
}
~~~

## FUNCIONES

Las funciones pueden tener n parámetros, para que funciones cuando se llame se deben declarar estos parámetros para que se ejecute.

~~~javascript
function nombreFunct(parametron,...){			//Declarar nueva funcion
    instrucciones;
}
nombreFunct(parametron);					//Llamando a la función
--- 
nomFunction = function() {			//otra forma de declarar funciones
    instrucciones;
}
nomFunction();						//Llamar a la función
~~~

### ARROW FUNCTION

Cuando no se usan parámetros o se usan varios, es obligatorio los paréntesis, para un solo parámetro no es necesario; si es solo una instrucción se pueden omitir los corchetes. 

~~~javascript
const variable = (parametros) => { 
    instrucciones;
} Programación orientada a objetos
~~~

## Programación orientada a objetos

~~~javascript
class nameClass {
    constructor(parametros,...,n){
        this.Parametro1 = Parametro1;
        this.Parametro2 = Parametro2;
        this.Parametron = Parametron;
        ...
    }
        nombreMetodo(){
            instrucciones metodo;
        }	
}
const objectNew = new nameClass(parametro1,...,parametron);			//crear nuevo objeto
object.atributo						//Invocar datos del atributo/metodo seleccionado.
~~~

## Herencia

~~~javascript
class nombreClass extends clasePadre {
    constructor(atributos){
        super(atributos);		//atributosque se quieren heredar del padre
        this.atributoNew = atributoNew;  //atributo agregado para esta clase
    }
    metedoNew(){
        instrucciones;
    }
}
~~~

### static

Metodos que se pueden usar sin necesidad de crear el objeto, solo invocando la clase y el metodo.

~~~javascript
class nameClass {
    constructor(parametros,...,n){
        this.Parametro1 = Parametro1;
        this.Parametro2 = Parametro2;
        this.Parametron = Parametron;
        ...
    }
	static nombreMetodo(){
            instrucciones metodo;
        }	
}
object.nombreMetodo();	//invocar metodo sin crear el objeto	
~~~

<!--- Repasar Setters & Getters --->

## METODOS DE CADAENA

~~~javascript
var1.concat(var2);			//Concatenar var1 con var2
var1.startsWith(var2);		//si la var1 empieza con var2, retorna valor boleano
var1.endsWith(var2);		// si la var1 termina con var2, retorna valor boleano
var1.includes(var2);		// si var1 contiene var2, indiferente de su posición, retorna valor bolea
var1.indexOf(var2);			// La posición de la primera letra de var2 en var1, si retorna -1, no existe
var1.lastIndexOf(var2);		// La posición de la primera letra de var2 en var1 (pero la ultima considencia que haya), si retorna -1, no existe
~~~

Rellenar cadenas, si no tiene la cantidad de caracteres que se indican, si los tiene no se rellena.

~~~javascript
var1.padStart(--,"adas");	//rellenar al inicio var1, el -- numero de veces que se le indique con "adas".
var1.padEnd(--,"adas");	//rellenar al final var1, el -- numero de veces que se le indique con "adas".
var1.repeat(--); 	// Repetir la variable la cantidad -- de veces indicada
~~~

Separar cadenas y dejar los datos en array.

~~~javascript
var1.split("##");	//Separar la cadena en cada ## determinado.
~~~

~~~javascript
var1.substring(a,b);	//Mostrar los elementos de la cadena desde la posición a hasta b, no muestra la posición b.
var1.toLowerCase(); 	//Convierte todo a minuscula.
var1.toUpperCase();		//Convierte todo a mayuscula.
var1.toString();		//Covierte var1 en cadena.
var1.trim();			//Borrar los espación en blanco.
var1.trimEnd();			//Borrar los espación en blanco del inicio.
var1.trimStart();		//Borrar los espación en blanco del final.
~~~

## Métodos de array

~~~javascript
var1.reverse();		//invierte el array.
var1.sort();		//Ordenar el arreglo de manera alfabetico/numerico
var1.splice(a,b,c,...n);	//inicio, cantidad de elementos a borrar, c a n elementos a agregar en el lugar de a y b.
var1.slice(a,b);		//retorna los valores en un nuevo array desde a hasta b, b no incluido. (-1 se refiere al ultimo elemento del arreglo) 

var1.filter(fnc);		//fnc funcion a realizar, permite realizar un nuevo arreglo si es necesario.

//Ejemplo filter, retorno lista de los pares. Filter devuelve el elemento si cumple la condicion
//La funcion se ejecuta a cada elemento del arreglo
var namArray = [10,2,2,3,4,5];

namArray.filter(function(element){
   return element % 2 === 0; 
});

//Map, ejecuta una vez por cada elemento, convierte a los cuadrados
//La funcion se ejecuta a cada elemento del arreglo
var namArray = [10,2,2,3,4,5];
namArray.map(function(elemt){
    return Math.pow(elemt, 2);
}),

    

var1.forEach(fnc);		//Realiza las instrucciones de la función va para cada elemento del arreglo.
//Ejemplo forEach
var namArray = [10,2,2,3,4,5];
//recibe como argumentos, el elemento, el index en el que esta y el arreglo de cual se utiliza
namArray.forEach(function(elemt, index, arreglo){
    arreglo[index] = Math.pow(elemt, 2);
});
~~~

Es un metodo de arreglos, donde recibe como argumento otra funcion (callback), esta segunda funcion toma como argumentos el valor anterior retornado, si es la primera vuelta del arreglo es vacio, el segundo argumento es el valor actual de la vuelta que da la itereccion, en la primera vuelta, el valor actual es el valor del arreglo con index 0, el parametro index, es el que indica en que vuelta del arreglo se encuentra y por ultimo es el arreglo con el que va a trabajar.

~~~javascript
//Reduce
var letras = ["h","a","sd","d"];
letras.reduce(function(valorAnterior, valorActual, index, arreglo){
   return valorAnterior + valorActual; 
});
//El resultado seria la concatenación del arreglo "hasdd"
//Es como si se hubiera usado el metodo join("").

//aqui el valor inicial se cambio, por lo cual el ciclo empiza con ese valor en la variable valorAnterior
letras.reduce(function(valorAnterior, valorActual, index, arreglo){
   return valorAnterior + valorActual; 
},"valorInicial valorAnterior");
~~~





los métodos includes, indexOf, lastIndexOf, también funcionan en arreglos, pero toman todo el valor de cada posición para hacer las verificaciones.

## Objeto Math

~~~javascript
Math.sqrt(a);			//raiz cuadrada de a
Math.cqrt(a);			//raiz cubica de a
Math.max(a,...,n);		//El numero mas alto 
Math.min(a,...,n);		//El numero mas bajo
Math.randow();			//Número aleatorio entre 0 y 1, no toma 0 y 1.
Math.round();			// Redondear
Math.fround();			// ?? no creo que haga falta
Math.floor();			//Devuelve el entero menor del numero. Redondea para abajo.
Math.trunc();			//Elimina la parte decimal del numero y solo muestra la parte entera.	
Math.pow(#,$);			//Elevear # a la potencia $
~~~

## Consola

~~~javascript
console.clear();	//Limpia la consola.
console.info("");	//Mustra en consola la info entre "".
console.log("");	//Mostrar algo en consala.
console.table([array]); //genera una tabla.
console.warn("");		//da una advertencia.
console.dir();		//Una lista interectiva del objeto. No estandar. Muy similar al .info().
console.count();	//lleva el conteo de cuantas veces se a ejecutado. Con .counReset() se reinicia el conteo.
console.group("nGrupo");	//crea un grupo, se puede crear un grupo dentro de otro. Con .groupEnd() se finaliza el grupo actual.
console.groupCollapsed("");	// Inicia el grupo cerrado.
console.time();			//Inicia un temporizador de tiempo.
console.timeLog();		//Muestra en cuanto va el temporizador de tiempo.
cosole.timeEnd(); 		//Finaliza el conteo y lo muestra.
~~~

Si en console.log("") pongo al iniciar las "%c" puedo modificar el estilo de lo que se muestra en consola.

## DOM (Document Object Mode)

Toda etiqueta es un nodo.

### Métodos de selección de elementos

~~~javascript
document.getElementById("");			//Selecciona un elemento por ID.
document.getElementByTagName("");		//Selecciona todos los elementos que coincida con el grupo especificado de selectores.
document.querySelector("./#");			//Devuelve el primer elemento que coincida con el grupo. Con . para clases con # para id.
document.querySelectorAll("./#");			//Devuelve todos los elementos que coincidan con el grupo especificado de selectores. Con . para clases con # para id.
~~~

### Métodos para definir, obtener y eliminar  atributos.

~~~javascript
.setAttribute("a","b");		//Modifica o crea el valor de un atributo. a es el atributo a modificar, b es el nuevo valor a dar. 
.getAttribute();		//Obtiene el valor de un atributo.
.removeAttribute();		//Remuve el valor del atributo.
~~~

### Atributos globales

~~~javascript
contentEditable="true/false";			//hace editable el contenido.
dir="ltr/rtl";						   //Dirección del texto, izquierda a deracha/viseversa. 
hidden="true/false";					//Oculta o muestra el contenido.
tabindex="0";							//hace focus en al objeto en ese index numerado, orden en que se escojen los objetos con la tecla tab.
tittle="new"							//Definir nuevo titulo que se desee.
~~~

### Atributos de los inputs

Los atributos del objeto se pueden modificar desde el objeto sin necesidad de .setAttribute();.

object.atributo="valorNuevo"

~~~javascript
className	//Nombre de clase.
value		//Valor que tiene.
type		//Tipo del objeto.
accept		//Tipo de archivo que acepta, ej: image/png.
form		//asignar nomnbre a que formulario pertenece
minLength	//Minima longitud de caracteres que puede tener el input
placeholder	//texto del input que se borra cuando se va a dar un valor. Marca de agua.
required	//Si es requerido el espacio, al asignar cualquier caracter a este atributo, el input se vuelve requerido. 
~~~

El atributo style es para modificar todo el estilo de css que toma como un objeto.

### Clases, classList y métodos de classlist

~~~javascript
object.classList.add("");			//Agregar una clase.
object.classList.remove("");		//Remueve la clase.
object.classList.item(a);			//Devuelve el valor en la posición indicada.
object.classList.contains("");		//Verifica si tiene la clase especificada y devuelve un booleano.
object.classList.repalce("a","b");		//Remplaza la clase a por la clase b.
object.classList.toggle("",true);		//Agrega o quita la clase. El true es para forzar que si ya la tiene, la deje; false es para que siempre la quite.

~~~

## Creación y obtención de objetos en html

~~~javascript
variable.textContent;		//Muestra el contenido de la variable, no incluye etiquetas internas.
var1.innerText;				//Solo muestra el contenido visible de la etiqueta, no incluye etiquetas internas (No se recomienda uso)

var1.innerHTML;				//Muestra el contenido con etiquetas internas y sus atributos.
var1.oterHTML;				//Muestra el contenido con etiqueta principal e internas y sus atributos.
~~~

## Creación de elementos



~~~javascript
document.createElement("LI"); 		//Crear un nuevo elemento, LI de lista, todo en mayuscula, basicamente se determina que tipo de etiqueta se quiere crear.
var1.createTextNode("");			//Crea un objeto texto dentre del item.
var1.appendChild(var2);				//es un metodo que se aplica al padre para
document.createDocumentFragment();	//Crea un fragmento de documento para ahorrar recursos.
~~~

## Obtención y modificación de hijos

~~~javascript
var1.firstChild;			//Devuelve el primer hijo.		
var1.lastChild;				//Devuelve el ultimo hijo.
var1.firstElementChild;		//Devuelve el primer elemento hijo.
var1.lastElementChild;		//Devuelve el ultimo elemento hijo.
var1.childNodes;			//Devuelve una lista con los nodos hijos, no es un array es una NodeList
var1.children;				//Devuelve una lista solo con los elementos hijos.
~~~

## Métodos de child

~~~javascript
var1.replaceChild(a,b);		//Donde a es el hijo que se desea colocar y b el que se desea remplazar.
var1.removeChild(a);		//Donde a es el hijo a eliminar.
var1.hasChildNodes(a);		//Devuelve booleano si tiene o no hijos el elemento.
~~~

### Propiedades de los padres

~~~javascript
var1.parentElement;			//Da el elemento padre de la var1
var1.parentNode;			//Da el nodo padre de la var1.
~~~

### Propiedades de los hermanos (Siblinds)

~~~javascript
var1.nextSibling					//Siguiente hermano
var1.previusSibling					//Hermano anterior
var1.nextElementSibling				//Siguiente elemento hermano.
var1.previousElementSibling			//Elemento hermano anterior.

var1.closest("./#")					//Muestra el contenemos mas cercano de ese elemnto.
~~~



# MID LEVEL

## Objeto Windows

1. Hereda las propiedades de eventTarget.

~~~javascript
window.open("enlace");		//Abre pestaña emergente con el enlace deseado.
window.close(ventana definida);	//Cierra la pestaña seleccionada.
window.closed;				//Retorna un boleado si la ventana esta cerrada/abierta (true/false)
window.stop;				//Deja de cargar la ventana.
window.alert("msj");		//da un mensaje emergente, se puede omitir el window.
window.print();				//Se la configuración de impresión de la pagina.
promt("msj");				//Muestra un dialogo emergente para pedir un string al usuario.
confirm("msj");				//Genera un mensaje emergente con opciones aceptar/cancelar (true/false)

window.screen;				//Objeto que tiene las propiedades de la pantalla.

window.scrollx;				//Cuanto se desplazo en el eje x.
window.scrolly;				//Cuanto se desplazo en el eje y.
window.scroll(x,y);			//Mostrar la posición x y y del scroll.

window.resizeBy();			//Cambiar tamaño de la ventana en una cantidad especifica.
.resizeTo();				//redimenciona dinamicamente la ventana
.moveBy();					//mueve la ventana a una ubicación relativa.
.moveTo();					//Mueve la ventana a una posición absoluta.
~~~

## Location

~~~javascript
window.location.href;				//Devuelve el URL de la pagina actual.
window.location.hostname;			//muestra el hostname.
window.location.pathname;			//En que parte del dominio esta acutualmente.
window.location.protocol;			//Muestra el protocolo.
window.location.assign();			//
~~~

## Google developer tools

Al inspeccionar en google se obtienen varias herramientas. 

## Eventos

~~~javascript
var1.addEventListener("click",nFuncion);

function nFunction(){			//Funciones flecha no aplican.
    instrucciones;
    var1.removeEventListener("click",nFunction);	//Solo se puede remover de esta forma.
}

var1.addEventListener("click",()=>{		//otra forma de llamar la funcion en el evento.
    instrucciones;
});

var1.addEventListener("click",(e)=>{
    e.stopPropagation();		//Evita que los demas eventos similares se ejecuten.
});
~~~

| mouse                                                        | teclado                                   | interfaz                                                     |
| ------------------------------------------------------------ | ----------------------------------------- | ------------------------------------------------------------ |
| click                                                        | keydown (cuando se oprime una tecla)      | error (cuando sucede un error durante la carga de un archivo multimedia). |
| dbclick                                                      | keypress (cuando se presiona y se suelta) | load (cuando un archivo es cargado)                          |
| mouseover (cuando el puntero se pone sobre el objeto o uno de sus hijos) | keyup (cuando se suelta)                  | beforeunload (Ocurre antes de de que el documente este po descargarse) |
| mouseout (cuando el puntero sale del objeto)                 |                                           | unload (ocurre una vez se a descargado la pagina)            |
| contexmenu (click derecho)                                   |                                           | resize (Cuando cambia de tamaño la vista del documento)      |
| mouseenter (cuando se mueve sobre el objeto, igual que el mousemove, se recomienda uso en internet exploret) |                                           | scroll (cuando se usa la barra de desplazamiento  de un elemento) |
| mousemove (cuando el puntero se mueve sobre un objeto)       |                                           | select (despues de que el usuario selecciona algun texto de \<input> o \<textarea>) |
| mouseleave (Cuando sale del objeto, se ejecuta cada vez que se mueve) |                                           |                                                              |
| mousedown (Al dar clic, no hace falta soltar el clic para ejecutar) |                                           |                                                              |
| mouseup (Solo se ejecuta cuando se suelta el clic)           |                                           |                                                              |

https://www.w3schools.com/jsref/obj_events.asp

## Temporizadores

~~~javascript
const var1 = setTimeout(()=>{
    instrucciones;
},a)				//donde a es el tiempo en que se ejecuta en ms.

clearTimeout(var1);	//limpiar el temporizador de la var1.
~~~

~~~javascript
const var1 = setInterval(()=>{
    instrucciones;
},a)			//donde a es el tiempo en que se ejecuta en ms.

clearInterval(var1);	//limpiar el temporizador	
~~~

## Try ... Catch

No contempla los errores de sintaxis. Finally no es necesario usarlo.	

~~~javascript
try {
    error;
}
catch(error){
    instrucciones en caso de error;
}
finally {
    instrucciones;				//el finally tiene prioridad sobre los otros, siempre se ejecuta.
}
~~~

throw lanza un error.

## Código obsoleto

Consultar bibliografia.

## Callback

Es una función que llama a otra función

## Promesas

## Peticiones HTTP



___

# EJEMPLOS:

### Ejemplo 1

Crear un sistema para mostrar 20 tipos de llaves diferentes que muestren precio, modelo, imagen y nombre, final del curso básico.

~~~javascript
const contenedor = document.querySelector(".flx-container");

function crearLlave(nombre,modelo,precio){
    img = "<img class='llame-img' src='llave.png'>";
    nombre = `<h2>${nombre}</h2>`;
    modelo = `<h3>${modelo}</h3>`;
    precio =`<p>>Precio: <b>$${precio}</b></p>`;
    return 	[img,nombre,modelo,precio];
}

let documentFragment = document.createDocumentFragment();

for (i=0;i<20;i++) {
    let precioRandom = Math.random()*10+30;
    let modeloRandom = Math.random()*10000;
    let llave = crearLlave(`llave ${i}`,`modelo ${modeloRandom}`,`${precioRandom}`);
    let div = document.createElement("DIV");
    div.addEventListener("click",()=>{
        document.querySelector(".key-data").value = number
    });
    div.tabIndex = i;
    div.classList.add(`item-${i}`,`flex-item`);
    div.innerHTML = ...llave;		//operador sprit
    documentFragment.appenChild(div);
}
contenedor.appendChild(documentFragment);
~~~

## Parte CSS

~~~css
.flex-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    color: #333;
    font-family: sans-serif;
}

.flex-item {
    flex-grow: 1;
    margin: 20px;
    max-width: 300px;
    border: 2px solid #333;
    padding: 0 20px;    
}

.flex-item:hover {
    border-color: #71a154:
    box-shadow: 0px 0px 30px #317324;
}

h2,h3 {
    margin: 0;
}

h3 {
    color: #999;
}

p b {
    color: #71a154;
}

.llave-img {
    width: 300px;
}

form {
    width: 100%;
    text-align: center;
    padding: 50px;
}

input[type"submit"]{
    background: #317124;
    color: #fff;
    boder: none;
    padding: 12px 36px;
    font-size: 17px;
    letter-spacing: 1px;
}
~~~



___

# **JAVASCRIP** MIRSHA

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





___

# Sofka

## Closures

Son funciones que se autoinvocan para no contaminar el scope global.

Las funciones hijas pueden modificar las variables de las funciones padre.

~~~javascript
(function(){
    //Funcion que se autoinvoca
})();

function nameFunction(variable){
    function childFunction(){
        return variable +"instrucciones"
    }
    return childFunction;
}
~~~

## JSON (Java Scrip Object Notation)

En los json se pueden guardar variables desde primitivas hasta arreglos y funciones. Con la palabra reservada this, se puede acceder a otros atributos del json

~~~json
{
    nombre: "nimbre",
    funcion: function(){
        insstrucciones
    },
    arreglo: ["asdad",1,"ad"]
}
~~~

## Prototype

Es el atributo que muestra la clase de la cual se creo el objeto.

Si le agrego algo al prototipo se le agrega a todos los objetos instaciados de este,

~~~javascript
var objeto1 = new nameClase();
var objeto2 = new nameClase();

//Atributo solo presente en el objeto 1
objeto1.nuevoAtributo="asdad";

//Atributo agregado a objeto1 y objeto2
nameClase.prototype.nuevoAtributo="nuevo atributo para todos los objetos asi ya esten instanciados, los atributos en los json pueden ser funciones";
~~~

## Template string

Es el uso de `` en  JS.

---

# TRUCOS O CONSEJOS

* alt + 96 = ` 
* ctrl + } = comentar código (sublime text, vsc )

~~~javascript
alert();	//Mostrar mensaje en navegador
promt();	//Solicitar info en el navegador, mediante un pop up.
	let variable = promt("texto a mostrar"); 	
~~~

​	