# JAVA ATS

## VARIABLES PRIMITIVAS

### V1

* byte, tamaño 8bytes, variable que puede almacenar números entreros entre  -128 a 127
* short, tamaño 16 bytes, variable que puede almacenar números entreros entre  -32768 a 32767
* int, tamaño 32 bytes, variable que puede almacenar números entreros entre  -2*10⁹ a 2*10⁹
* long, 64 bytes, -9*10^15 a -9*10^15.
* float, 32 bytes, se debe definir el numero como float con una "f" al final del numero.
* double, 64 bytes, reconoce automaticamente los decimales.
* char, para caracteres.
* bolean, son variales de falso (false) o verdadero (true).

___

## DATOS DE TIPO NO PRIMITIVO

### V3

* Integer, permite guardar valores enteros y el valor "null".
* String, permite declarar cadenas.

---

## SALIDA Y ENTRADA DE DATOS

### SCANNER

Se necesita importar "import java.util.Scanner"

~~~java
Scanner "nombre_variable" = new Scanner(System.in)
ej:
"variable_declarada".nextIn(); //Forma de pedir un dato al usuario.
~~~

Para pedir datos de otro tipo de variable se cambia el nextIn() por nextFloat(), nextDouble(), etc.

En el caso de ser variable del tipo String, se usa:

* .next para guardar lo que este hasta el primer espacio
* .nextLine()  para todo lo escrito
* next().charAt(0) para el primer caracter

### VENTANAS EMERGENTES

Es necesario importar el javax.swin.JOptionPance;

~~~java
JOptionPance.showInputDialog("texto a mostrar"); // Guarda una cadena.
Integer.parseInt(JOptionPane.showInputDialog("texto a mostrar")) // Para guardar numero entero
~~~

Para guardar un solo carácter, al final de la opción de cadena se agrega el .charAt(0);

ej:

~~~java
JOptionOane.showInputDialog("texto a mostrar").charAt(0);
~~~

En casa de necesitar otra variable es parecido al entero pero cambiando integer e int por los de la variable que se necesita-

Ej:

~~~java
Double.parseDouble(JOptionOane.showInputDialog("texto a mostrar"));
~~~

Para mostrar los datos se usa:

~~~java
JOptionPane.showMessageDialog(null,"texto a mostrar" +variable);
~~~

___

## OPERACIONES

El resto es el residuo de una división resto = a%b; el % se llama mob

a += b, esto es igual a "a = a + b;", esto sirve tambien resta, multiplicacion division y resto.

x++;				Aumenta en 1 el valor de la variable
x--;				Disminuye en 1 el valor de la variable
Para hacer un incremente/decremento como resultado en otra variable, la escritura seria y = ++x; 
si se hace y = x++; primero se asigna a y el valor de x y luego se hace el incremento de x.

**Raiz cuadrada**
Double "variable" = Math.sqrt (X) ; 	para usar math.sqrt se tiene que declarar la variable como double.
En caso de querer usar otro tipo de variable se usa (Int)Math.sqrt(X) ; este es para convertir en entero.

**Potencias**

Las variables para usar potencias tienes que ser double, 
ej: double "variable" = Math.pow(base, exponente) ;

**Redondeo**
long "variable" Math.round("x");	Si es para redondear un double la clase de la variable de salida debe ser long y para float debe ser int

**Ramdom**
Double "varaible" = Math.random ();

== igualdad
!= diferencia

\> mayor que
= mayor igual
< menor
<= menor igual
&& y (and)

| | es condicional O

---

## CONDICIONALES

if(condicion) {
	instruccion;
	}
else {
	isntrucoion2;
}

~~~java
if(x == Y) {
	JOptionPane.showMessageDialog(null,"El numero es");
	}
else {
	JOptionPane.showMessageDialog(null,"El numero no es");
	}
~~~

switch(x) {
	case 1: instrucción;
		break;				\<!--- para salir del switch --->
	case 2: instrucción;
		break;
	case x: instrucción;
		break;
	default: instrucción;		
	}

Si no esta el caso en el dato x ingresado se ejecuta default

En caso de que x sea un carácter se escribe
	case 'a': ...
Character.isUpperCase(x)		Si el caracter esta en mayuscula

---

## BUCLES

while(condition) {
	intruction
}

~~~java
while(a<=b) {
	a++;
}
~~~

do {
instruccion;
}while(condicion)		\<!---se ejecuta minimo una vez.--->



for(inicializacion ; condicion ; incremento/decremento) {
	instrucciones
}

~~~java
for(int i=1; 1<=10; i++) {
    }
~~~

___

## ARREGLOS

V 41

Tipo de variable[] nombre variable = new tipo de variable[dimensión].

Las posiciones del arreglo siempre empiezan desde  0.

~~~java
int[] edad = new int[4];
int[] edad = {6,7,3,1}; //definir los valores en las posiciones del arreglo
~~~

___

## ORDENAMIENTOS

### METODO BURBUJA

Se utiliza para ordenar arreglos de forma creciente o decreciente

~~~java
for(int i=0;i<(nElementos-1);i++) {
    for(int j=0;(nElementos-1);j++) {
         if(arreglo[j]>arreglo[j+1]) {
            aux = arreglo[j];
            arreglo[j]=arreglo[j+1];
            arreglo[j+1]=aux        
        }
    }
 }
~~~

### METODO POR INSERCIÓN

~~~java
for(int i=0;(i<nElementos);i++) {
    pos = i;
    aux = arreglo[i];
    
    while((pos>0) && (arregl[pos-1] > aux)) {
        arreglo[pos] = arreglo[pos-1];
        pos--;
    }
    arrego[pos] = aux
}
~~~

### BUSQUEDA SECUENCIAL

~~~java
while(i<5 && band == false) {
    if(arreglo[i] == dato) {
        band = true;
    }
    i++;           // para imprimir la posicion del arreglo es con (i-1).
}
~~~

___

## MATRICES

N filas y M columnas, las filas y columnas también empiezan su conteo de posición desde 0.

~~~java
int matriz["N"] ["M"] = {(a,b),(c,d),(d,e)} //Como imprimir la matriz

for(int i=0;i<N;i++) { // Numero de filas
    for(int j=0;j<M;j++) { // Numero de columnas
        System.out.print(matriz[i] [j]);        
    }
    System.out.print("")
}
~~~

## POO

Crear una clase

~~~java
public class coche { //public es el modificador de acceso
    				// coche es el nombre de la clase
}
~~~

Crear un objeto

~~~java
coche coche1 = new coche(); // Nombre clase, nombre objeto y "new"  contructores.
~~~

### METODOS: PARAMETROS Y ARMGUMENTOS

El parámetro es la declaración de una variable u objeto y el argumento es un valor que se envía.

### RETORNOS DE VALORES

El void no retorna a nada, si se cambia por int, retorna como entero

~~~java
public int sumar(int a, int b){
    int suma = a + b;
    return suma;
}
~~~

Si se usa this.atributo, se hace referencia al atributo de la clase y no al parámetro del constructor.

El modificador de acceso de los atributos esta por defecto, por lo tanto no puede ser usado por otros paquetes a menos que se agregue el public antes de declarar el atributo

~~~java
public int atributo; // cualquier clase de cualquier paquete lo puede usar
private int atributo; // solo lo puede usar en la misma clase.
protected int atributo; // Puede ser usado por la clase que lo contiene y por sus clases herederas.
~~~

## ENCAPSULADOS

## V68

Hay dos formas de usar atributos privados de entre clases:

1. Metodo setter: establecer un valor a un atributo.

~~~java
public void setatributo(int atributo) {
    this.atributo = atributo;
}
~~~

2. Metodo Getter: Mostrar un valor de un atributo.

~~~java
public int getatributo() {
    return atributo;
}
~~~

### DEFINIR CONSTANTE

Para definir una constante se utiliza la palabra final antes de declarar el tipo de variable.

~~~java
final String asdfda;  // Una cadena con un valor constante e incambiable.
~~~

Para hacer un atributo estática se coloco luego del modificador de acceso (pubblic/private) la palabra static.

Para heredar una clase se escribe:

~~~java
public class heredero extends padre {
    
}
~~~

Se hereda los atributos y métodos.

### SOBRE ESCRITURA DE MIEMBROS

Se modifica el método seleccionado en la clase heredera

~~~java
@override
public class metodo() {
    instrucciones; 		// se modifican las instrucciones del metodo heredado para esta clase.
}
~~~

### CLASES Y METODOS ABSTRACTOS

Se dice abstracto a todo aquello que no se sabe como se va a realizar en la clase, pero si se hace en las clases herederas.

~~~java
public abstract class clasePadre {
    public abstract void metodo();
}
~~~

Cuando un método es abstracto automáticamente la clase es abstracta.

En la clase heredera  se especifica el método abstracto usando @override.

### EXCEPCIONES

~~~java
public void metodo() throws FileNotFoundException {
    File archivo = new File("ruta archivo");	//instruccion leer archivos
    FileReader fr = new FileReader(archivo);
}
~~~

## CREACION DE INTERFACES

~~~java
public class metodo extends JFrame { //exporta javax.swing.JFrame
    public metodo() { 		// constructor
        this.setSize(ancho,largo); //tamaño en enteros
        setDefaultcloseOperation(EXIT_ON_CLOSE); // terminar procesos de la ventana.
        setTitle("asdas");	//Titulo de la ventana
        setLocation(x,y);	//Posicion en que se abre la ventana
        setBounds(x,y,ancho,largo);	//es un shotcut de setSize y setLocation
        setLocationRelativeTo(null); //La ventana se abre en el centro de la pantalla
        
private void iniciarComponentes
        JPanel objeto = new JPanel();
        this.getContentPane().add(objeto); //agregar panel a la ventana
        objeto.setBackground(Color.##);	//establecer color del panel
        objeto.setLayout(null);		//Desactivar diseño predeterminado del panel

        JLabel etiqueta = new JLabel("sdsdf"); // crear una etiqueta con un texto
        etiqueta.setText("asdasd");		//Forma alternativa de asignar texto a la etiqueta
        objeto.add(etiqueta); // agregar la etiqueta al panel
        etiqueta.setBounds(x,y,ancho,alto); //Ubicacion de la etqueta y tamaño, cuando desactiva el layout del panel.
         JLabel etiqueta = new JLabel("sdsdf", SwingConstants.CENTER); // Alineación, LEFT, RIGHT o CENTER.

        /* Hay que desactivar los diseños por defecto de la etiqueta para modificar el diseño*/
        
        etiqueta.setOpaque(true); //Permitir modificar el diseño de la etiqueta.
        etiqueta.setForeground(Color.#); // color letra etiqueta.
        etiqueta.setBackground(Color.#); //Color fondo etiqueta.
        etiqueta.setHorizontalAligment(SwingConstants.CENTER);	//Determinar alineación horizontal
        etiqueta.setFont(new Font("arial",Font.estilo_de_letra,tamaño_letra));	
        /*establecer la fuente del texto, el estilo esta en BOLD, negrilla; ITALIC, cursiva; PLAIN, plano*/ 
        	
        //Insertar imagen
        JLabel imagen = new JLabel(new ImageIcon("nombre_imag.jpg"));
        panel.add(imagen); //agregar imagen al panel
        
        
        /* Alternativa a insertar imagen*/
        ImageIcon imagen = new ImageIcon("nombre_imag.jpg");
        JLabel imagen = new JLabel(imagen));
        panel.add(imagen); //agregar imagen al panel
        //otro
        JLabel imagen = new JLabel();
        imagen.setIcon(new ImageIcon("nombre_imag.jpg"));        	
        panel.add(imagen); //agregar imagen al panel
        
    }    
}

// En la clase principal
public class Principal {
    public static void main (String[] args) {
        metodo v1 = new metodo(); 		//creamos un objeto de la clase donde tenemos el constructor de ventana
        v1.setVisible(true);			//Hacer visible la ventana.
    }
}
~~~

## 	BOTONES

~~~java

~~~

