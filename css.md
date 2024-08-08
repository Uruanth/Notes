

# Grid

~~~css
.container {
  display: grid;
  /* Numero y tamaño columbas grilla */
  /* grid-template-columns:33% 33% 33%; */

  /* Repetir el valor deseado */
  grid-template-columns: repeat(4, 1fr);
  /* Tamaño filas */
  grid-template-rows: auto;
  /* Espaciado entre filas y columnas 
    puede usarse solo para filas o columnas con
    column-gap: ;
    row-gap: ;
    */
  gap: 1em;
  /* Definir el minimo y maximo tamaño de las filas */
  grid-auto-rows: minmax(20px, auto);
}
~~~

# Animaciones

Las animaciones son invocadas de la siguiente manera

```css
animation-name: nombreFrame;
/*Duracion de la animacion*/
 animation-duration: 3s;
/*Veces que se repite la animacion, puede ser infinita*/
animation-iteration-count: infinite;
/*si la animacion debe enmpzar del 0 al 100, o viceveraa, pero si queremos que sea de 0 a 100 a 0 se usa el valor alternate, y para de  100 a 0 a 100 alternate-reverse*/
animation-direction: normal;
animation-direction: reverse;
animation-direction: alternate;
animation-direction: alternate-reverse;

/*None es valor por defecto
backwards, hace que la etiqueta cuando se cargue tenga los estilos de inicio de la animacion
forwards, mantiene el valor final de la animacion
both es ambos*/
animation-fill-mode: none;
animation-fill-mode: backwards;
animation-fill-mode: forwards;
animation-fill-mode: both;

/*Tiempo que se demora la animacion en empezar*/
animation-delay: 2s;

/*
forma en como cambia la velocidad de la animacion
ease: valor por defecto
ease-in: Comienza lento y aumenta la velocidad
ease-in-out: Comienza lento, acelera y lento al final
ease-out: Comienza rapido y disminuye la velocidad
linear: Toda la velocidad es constante
*/
animation-timing-function: ease;
animation-timing-function: ease-in;
animation-timing-function: ease-in-out;
animation-timing-function: ease-out;

/*Estado de la animación
Por defecto es running, ejecutandose,
paused es pausar la animacion
*/
animation-play-state: running;
animation-play-state: paused;


/*Shorthut
El orden no importa, solo que el primer valor de tiempo siempre se tomara como la duracion y el segundo como el delay
*/
animation: <direction> <repeticiones> <keyframe> <duracion-inicial> <delay>;

```

Toda animaciones es declarada en un keyframe de la siguiente manera

## Keyframe

El 0 y el 100% pueden ser remplazadas por las palabras from y to respectivamente y se tendria el mismo resultado

```css
@Keyframes nombreFrame {
		0% {
				transform: scale(1);
		}
		100% {
			transform: scale(1.9);
		}
}
```
El 0 y el 100% pueden ser remplazadas por las palabras from y to respectivamente y se tendria el mismo resultado

~~~css
@Keyframes nombreFrame {
		from {
				transform: scale(1);
		}
		to {
			transform: scale(1.9);
		}
}
~~~

