---
layout: post
title: "Algoritmos y Estructuras de Datos III - Notas para el final"
date: 2021-02-22
tags: algo3, data structures, UBA, spanish, español, cs, algorithms
description: "Notas para el final de Algo3. Basadas en los apuntes de la teorica. In Spanish."
---

## Algoritmos
Secuencia finita de pasos que terminan en tiempo finito. 
Los pasos deben ser:
- **Precisos** (en su orden)
- **Bien definidos** (deterministicos)
- **Finitos** 

## Máquina RAM
- Tiene infinitos registros de tamaño infinito.
- Cada uno accesible en tiempo constante.

Instrucciones disponibles:
- Load, Store, Write, Read (las ultimas dos son para el I/O del algoritmo, las otras para la ram).
- add, sub, mult, div (misma complejidad independiente del tamaño del numero)
- jmp, jgtz, jz, halt

## Complejidad computacional

Definición informal: La complejidad de un algoritmo es una función que representa el tiempo de ejecución en función del tamaño de la entrada del algoritmo.

operacion elemental (O(1)) : no depende del tamaño del input, solo de la implementación.

Simplificamos asumiendo que toda operación elemental puede ser ejecutada en una unidad de tiempo. Interesa cómo crece el tiempo de ejecución de un algoritmo cuando el tamaño de las instancias de entrada crece. No interesa el tiempo exacto requerido por cada una de ellas.

**Modelo uniforme** : Cada operación básica tiene un tiempo de ejecución constante.
**Modelo logarítmico**: El tiempo de ejecución de cada operación es función del tamaño (cantidad de bits) de los operandos.

## Big O notation
Sii f es O(g), lim n->inf de f/g = c tq c > 0.

## Técnicas de diseño de algoritmos

Para demostrar la correctitud de un algoritmo tenemos que demostrar que **termina** y que **cumple la especificación**.

**Divide and Conquer** : Para obtener un algoritmo eficiente, la medida de los subproblemas debe ser similar y no necesitar resolver mas de una vez el mismo subproblema.

**Backtracking** :  Técnica para recorrer sistemáticamente todas las posibles configuraciones del espacio de soluciones.
Se recorre el arbol de soluciones parciales potenciales, y se llega a cada hoja siendo una con todos los elementos definidos. Podemos abandonar una rama del arbol prematuramente por criterios de poda: **Factibilidad** (no quedan soluciones posibles en esta rama) u **Optimalidad** (para problemas de optimización: ya no puede haber una solución óptima en esta rama).

Para poder hacer podas por factibilidad, tiene que cumplirse el **efecto dominó**: Si una solución parcial no es viable, sus extensiones tampoco lo serán.

**Dynamic Programming** : 
**Principio de optimalidad de Bellman** : Una solución óptima cada subsolución es a su vez óptima del subproblema correspondiente.

## Grafos

**Circuito Hamiltoniano** : Pasar por todos los vertices (Hamilton: cientifico victoriano: como paso por todas las ciudades en mi viaje?)

**Subgrafo** : H es subgrafo de G si H tiene un subconjunto de los vertices, y un subconjunto de los edges -que ademas obviamente solo van entre nodos de H-.
**Subgrafo generador** : H mismos vertices que G, pero subconjunto de aristas. 
**Subgrafo inducido**: H mismos aristas que G, si van entre nodos que estén en H. Osea, removiste nodos, pero no edges. 

**Grafo Bipartito** : Un grafo G con 2 o más vértices es bipartito sii **no tiene circuitos simples de longitud impar**.
**Árbol** : Un árbol es un grafo conexo sin circuitos simples.
Son equivalentes: 
- G es un árbol (un grafo conexo acíclico).
- Existe exactamente un camino simple entre cada par de vértices.
- G es conexo pero toda arista es puente.
- Si se le agregara una arista e a G, G+e tiene exactamente un ciclo, y ese ciclo tiene a e.
- G es un grafo sin circuitos simples y m = n − 1.
- G es conexo y m = n − 1.


Sea G un bosque con c componentes conexas. Entonces *m = n − c*.

**Arbol generador minimo**: Hallar el conjunto de aristas que arman un arbol generador del grafo G que minimizan la suma de los pesos.
Se resuelve con Prim: parto de un vertice cualquiera, v1, creo mi VT = {v1} y en cada paso selecciono la arista de menor costo entre las que tienen un extremo en VT y el otro en V \ VT .
O con Kruskal: Ordeno las aristas de mas chica a mas grande. Tomo en cada paso la siguiente arista que no forme un ciclo en mi grafo. Freno cuando tomé n-1 aristas -porque es un arbol-. En la practica: cada nodo arranca como su propio componente, y al unir un arista a mi arbol, pinto uno de los nodos del color del otro. Entonces ver que no formo ciclo == ver que ambos nodos del arista no estan en la misma componente -tienen distinto color-. Hermoso.
Prim's Algorithm is faster for dense graphs.
