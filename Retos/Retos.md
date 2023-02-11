# Retos

---

### Recorrer una matriz

* Se tiene una matriz de n x n que contiene números del 1 al 9, simulado usando una matriz unidimensional. Así, por ejemplo, esta matriz: 1 2 9 2 5 3 5 1 5 Se representaría como (1,2,9,2,5,3,5,1,5). El objetivo es identificar el camino que de la menor suma al recorrer el arreglo bi-dimencional de izquierda a derecha. Se empieza en la columna izquierda y se mueve siempre una columna a la derecha de la misma fila o a una fila hacia arriba o hacia abajo. En el ejemplo, si parte de 1, puede pasar al 2 o al 5. De ahí, si pasó al 5 puede pasar al 9 al 3 o al 5. Por otro lado, si pasa del 1 al 2, desde el 2 de la columna del medio no podría pasar al 5 de la ultima fila en la columna derecha. El valor de n puede ser entre 1 y 4.

~~~java
package org.example.cardgame.application.command.adapter.bus;


import java.util.*;

public class MM {

    static int[] myArray = {
            1, 2, 9,
            2, 5, 3,
            5, 1, 5
    };
    static int n = 3;
    static List<List<Integer>> matriz = new ArrayList<>();
    static List<Integer> camino = new ArrayList<>();

    public static void main(String[] args) {
        init();
//        for (int i = 0; i < matriz.size(); i++) {
//            List<Integer> listIn = new ArrayList<>();
//            listIn.add(matriz.get(i).get(0));
//            var actual = recursividad(i, 1, listIn);
//            calculoMenor(actual);
//        }

        matriz.forEach(integers -> {
            List<Integer> listIn = new ArrayList<>();
            listIn.add(integers.get(0));
            var actual = recursividad(matriz.indexOf(integers), 1, listIn);
            calculoMenor(actual);
        });
        System.out.println("camino = " + camino);
    }

    private static void calculoMenor(List<Integer> actual) {
        if (camino.isEmpty()) {
            camino.addAll(actual);
        } else {
            int sumAnterior = camino.stream().reduce(0, (a, b) -> a = b);
            int sumActual = actual.stream().reduce(0, (a, b) -> a = b);
            if (sumAnterior < sumActual) {
                camino.clear();
                camino.addAll(actual);
            }
        }
    }

    private static void init() {
        List<Integer> numeros = new ArrayList<>();
        Arrays.stream(myArray).forEach(numeros::add);
        if (n / myArray.length == 0) {
            for (int i = 0; i < n; i++) {
                matriz.add(new ArrayList<>());
                matriz.get(i).addAll(numeros.subList(i * n, (i * n) + (n)));
            }
        }
    }

    private static int menorDelaLista(List<Integer> values) {
        return values.stream().reduce(values.get(0), (a, b) -> a < b ? a : b);
    }

    private static List<Integer> recursividad(int i, int j, List<Integer> ruta) {
        int menorColumna = 0;
        if (j == n) {
            return ruta;
        }
        if (i == 0) {
            List<Integer> next = List.of(
                    matriz.get(0).get(j),
                    matriz.get(1).get(j)
            );
            menorColumna = menorDelaLista(next);
            ruta.add(menorColumna);
            return recursividad(next.indexOf(menorColumna), j + 1, ruta);

        } else if (i == n - 1) {
            List<Integer> next = List.of(
                    matriz.get(n - 2).get(j),
                    matriz.get(n - 1).get(j)
            );
            menorColumna = menorDelaLista(next);
            ruta.add(menorColumna);
            return recursividad(next.indexOf(menorColumna), j + 1, ruta);

        } else {
            List<Integer> next = List.of(
                    matriz.get(i - 1).get(j),
                    matriz.get(i).get(j),
                    matriz.get(i + 1).get(j)
            );
            menorColumna = menorDelaLista(next);
            ruta.add(menorColumna);
            return recursividad(next.indexOf(menorColumna), j + 1, ruta);
        }

    }

}
~~~

---

### Maximo número de repeticiones del mismo caracter seguidas en un array

Dato un arreglo mostar cuantas veces seguida se repite un valor y cual es el valor que se repite mas veces

~~~java
package org.example.cardgame.application.command.adapter.bus;

import java.util.Arrays;
import java.util.concurrent.atomic.AtomicInteger;

public class Ocurr {
    static int[] myArray = {1, 2, 2, 4, 5, 6, 7, 8, 8, 8};

    public static void main(String[] args) {

        int numeroRepeticiones = 1;
        int anterior = myArray[0];
        int maximoRepeticiones = 1;
        int numeroQueSeRepite =0;

        for (int i =0; i<myArray.length;i++){
            if (myArray[i] == anterior) {
                numeroRepeticiones++;
            } else {
                numeroRepeticiones=1;
            }

            if (numeroRepeticiones > maximoRepeticiones) {
                maximoRepeticiones=numeroRepeticiones;
                numeroQueSeRepite=myArray[i];
            }
            anterior=myArray[i];
        }
        Arrays.stream(myArray).forEach(value -> {

        });

        System.out.println("Longest: " + maximoRepeticiones);
        System.out.println("Number: " + numeroQueSeRepite);

    }

    }
~~~

