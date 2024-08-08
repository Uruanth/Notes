# Retos

---

### Recorrer una matriz

* Se tiene una matriz de n x n que contiene números del 1 al 9, simulado usando una matriz unidimensional. Así, por ejemplo, esta matriz: 1 2 9 2 5 3 5 1 5 Se representaría como (1,2,9,2,5,3,5,1,5). El objetivo es identificar el camino que de la menor suma al recorrer el arreglo bi-dimencional de izquierda a derecha. Se empieza en la columna izquierda y se mueve siempre una columna a la derecha de la misma fila o a una fila hacia arriba o hacia abajo. En el ejemplo, si parte de 1, puede pasar al 2 o al 5. De ahí, si pasó al 5 puede pasar al 9 al 3 o al 5. Por otro lado, si pasa del 1 al 2, desde el 2 de la columna del medio no podría pasar al 5 de la ultima fila en la columna derecha. El valor de n puede ser entre 1 y 4.

~~~java
package com.grafo;

import java.util.*;
import java.util.logging.Logger;

public class Mejorando {

    static Logger log = Logger.getLogger("test");
    static int[] myArray = {
            1, 2, 9,
            2, 5, 3,
            5, 1, 5
    };

    static int n = 3;
    static List<List<Integer>> matriz = new ArrayList<>();
    static List<Integer> caminoFinal = new ArrayList<>();
    static List<Integer> caminoActual = new ArrayList();
    static int indiceMaximo = n - 1;

    static Map<String, Node> listaNodes = new HashMap<>();

    public static void main(String[] args) {
        init();
        generateMapNodes();
        asociarNodes();
        for (int row = 0; row < n; row++) {
            caminoActual.clear();
            caminoActual.add(listaNodes.get(getKey(row, 0)).data);
            findBestWay(0, listaNodes.get(getKey(row, 0)));
        }
        log.info(caminoFinal.toString());
    }

    private static void findBestWay(int index, Node node) {
        if (node.refChildren.isEmpty()) {
            if (caminoActual.size() == n) {
                caminoActual.set(indiceMaximo, node.data);
            } else {
                caminoActual.add(node.data);
            }
            int sumaActual = caminoActual.stream().reduce(0, (a, b) -> a + b);
            int sumCamFi = caminoFinal.stream().reduce(0, (a, b) -> a + b);
            if (sumaActual < sumCamFi) {
                caminoFinal.clear();
                caminoFinal.addAll(caminoActual);
            }

        } else {
            node.refChildren.forEach(keyChild -> {
                if (caminoActual.size() == n) {
                    caminoActual.set(index + 1, listaNodes.get(keyChild).data);
                } else {
                    caminoActual.add(listaNodes.get(keyChild).data);
                }
                findBestWay(index + 1, listaNodes.get(keyChild));
            });
        }
    }

    private static void init() {
        caminoFinal.addAll(List.of(0, 0, Integer.MAX_VALUE));
        if (n / myArray.length == 0) {
            List<Integer> numeros = new ArrayList<>();
            Arrays.stream(myArray).forEach(numeros::add);
            createMatriz(numeros);
        }
    }

    private static void createMatriz(List<Integer> numeros) {
        for (int i = 0; i < n; i++) {
            matriz.add(new ArrayList<>());
            matriz.get(i).addAll(numeros.subList(i * n, (i * n) + (n)));
        }

    }

    private static void asociarNodes() {
        for (int row = 0; row < n; row++) {
            for (int col = 0; col < n; col++) {
                String keyParent = getKey(row, col);
                String keyChildRowB = getKey(row - 1, col + 1);
                String keyChildRowC = getKey(row, col + 1);
                String keyChildRowA = getKey(row + 1, col + 1);
                if (listaNodes.containsKey(keyParent)) {
                    addRefChild(listaNodes.get(keyParent), List.of(
                            keyChildRowB, keyChildRowC, keyChildRowA
                    ));
                }

            }
        }
    }


    private static void addRefChild(Node node, List<String> possibleChild) {
        possibleChild.forEach(key -> {
            if (listaNodes.containsKey(key)) {
                node.refChildren.add(key);
            }
        });
    }

    private static String getKey(int row, int col) {
        return new StringBuilder().append(row).append(",").append(col).toString();
    }

    private static void generateMapNodes() {
        for (int row = 0; row < n; row++) {
            for (int col = 0; col < n; col++) {
                addNode(row, col);
            }
        }
    }

    private static void addNode(int row, int col) {
        listaNodes.put(
                getKey(row, col),
                new Node(matriz.get(row).get(col))
        );
    }
}
~~~

#### Clases adicionales utilizadas

~~~java
package com.grafo;

import java.util.ArrayList;
import java.util.List;

public class Node {

    int data;
    boolean visited;
	List<String> refChildren;
    
    Node(int data){
        this.data = data;
        this.children = new ArrayList<>();
    }

    @Override
    public String toString() {
        return "{\"Node\": {" +
                "\"data\":" + data +
                ", \"visited\":" + visited +
                ", \"refChildren\":" + refChildren +
                "}}";
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

