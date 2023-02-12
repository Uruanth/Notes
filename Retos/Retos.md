# Retos

---

### Recorrer una matriz

* Se tiene una matriz de n x n que contiene números del 1 al 9, simulado usando una matriz unidimensional. Así, por ejemplo, esta matriz: 1 2 9 2 5 3 5 1 5 Se representaría como (1,2,9,2,5,3,5,1,5). El objetivo es identificar el camino que de la menor suma al recorrer el arreglo bi-dimencional de izquierda a derecha. Se empieza en la columna izquierda y se mueve siempre una columna a la derecha de la misma fila o a una fila hacia arriba o hacia abajo. En el ejemplo, si parte de 1, puede pasar al 2 o al 5. De ahí, si pasó al 5 puede pasar al 9 al 3 o al 5. Por otro lado, si pasa del 1 al 2, desde el 2 de la columna del medio no podría pasar al 5 de la ultima fila en la columna derecha. El valor de n puede ser entre 1 y 4.

~~~java
package com.grafo;

import java.util.*;
import java.util.logging.Logger;

public class Prueba {
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

    public static void main(String[] args) {
        init();
        List<Node> nodes = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            nodes.add(recursividad(i, 0, new Node(matriz.get(i).get(0))));
        }

        nodes.forEach(nodeInit->{
            caminoActual.clear();
            caminoActual.add(nodeInit.data);
            recursividadFor(0, nodeInit);
        });

        log.info("caminoFinal = " + caminoFinal);


    }

    public static void recursividadFor(int index, Node node) {
        if (caminoActual.size() > n) {
            throw new RuntimeException("se crecio esta monda");
        }

        if (index == (indiceMaximo - 1)) {
            node.children.forEach(nodeFinal -> {
                if (caminoActual.size() == n) {
                    caminoActual.set(indiceMaximo, nodeFinal.data);
                } else {
                    caminoActual.add(nodeFinal.data);
                }
                int sumaActual = caminoActual.stream().reduce(0, (a, b) -> a + b);
                int sumCamFi = caminoFinal.stream().reduce(0, (a, b) -> a + b);
                if (sumaActual < sumCamFi) {
                    caminoFinal.clear();
                    caminoFinal.addAll(caminoActual);
                }
            });
        } else {
            node.children.forEach(nodeHijo -> {
                if (caminoActual.size() == n) {
                    caminoActual.set(index+1, nodeHijo.data);
                } else  {
                    caminoActual.add(nodeHijo.data);
                }
                recursividadFor(index + 1, nodeHijo);
            });
        }
    }


    private static Node recursividad(int row, int column, Node node) {

        int nextCol = column + 1;
        if (nextCol > indiceMaximo || row > indiceMaximo) {
            return node;
        }
        if (row == 0) {
            node.children.add(new Node(
                    matriz.get(row).get(nextCol)
            ));
            node.children.add(new Node(
                    matriz.get(row + 1).get(nextCol)
            ));
            recursividad(row, nextCol, node.children.get(0));
            recursividad(row + 1, nextCol, node.children.get(1));
        } else if (row == indiceMaximo) {
            node.children.add(new Node(
                    matriz.get(row - 1).get(nextCol)
            ));
            node.children.add(new Node(
                    matriz.get(row).get(nextCol)
            ));

            recursividad(row - 1, nextCol, node.children.get(0));
            recursividad(row, nextCol, node.children.get(1));
        } else {
            node.children.add(new Node(
                    matriz.get(row - 1).get(nextCol)
            ));
            node.children.add(new Node(
                    matriz.get(row).get(nextCol)
            ));
            node.children.add(new Node(
                    matriz.get(row + 1).get(nextCol)
            ));
            recursividad(row - 1, nextCol, node.children.get(0));
            recursividad(row, nextCol, node.children.get(1));
            recursividad(row + 1, nextCol, node.children.get(2));
        }
        return node;
    }

    
    
    private static void init() {
        caminoFinal.addAll(List.of(0, 0, Integer.MAX_VALUE));
        List<Integer> numeros = new ArrayList<>();
        Arrays.stream(myArray).forEach(numeros::add);
        if (n / myArray.length == 0) {
            for (int i = 0; i < n; i++) {
                matriz.add(new ArrayList<>());
                matriz.get(i).addAll(numeros.subList(i * n, (i * n) + (n)));
            }
        }
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
    List<Node> children;

    Node(int data){
        this.data = data;
        this.children = new ArrayList<>();
    }

    @Override
    public String toString() {
        return "\nNode{" +
                "data=" + data +
                ", visited=" + visited +
                ", \nchildren=" + children +
                '}';
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

