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

---
## Camino mínimo
Lo resolvemos para digrafos porque un grafo es un caso particular.

### 1 to many:
- **Todos los edges misma distancia** : Usamos el algoritmo para shortest path (BFS)
- **No hay edges negativos** : Algoritmo de Dijkstra (Prim with extra steps). Por cada vertice, va definiendo un dicc con la distancia al origen. Lo actualiza si encuentra una forma de llegar mas corta. El dicc puede hacerse con array (donde buscar el minimo lleva O(n) ) o con min-heap (donde toma m log(n), pero las lookups del heap son n log (n)). O(m log(n) ) es mejor que O(n^2) -implementación "naive" de array-, solo si m ~ O(n). Si m ~ O(n^2) (grafo denso) es mucho peor.

### many to many:
- **Floyd's Algorithm** : Funciona con pesos negativos pero **no si hay ciclos negativos**. Es cúbico en n. Usa una matriz de distancias que arranca inicializada con los pesos de los edges, y se va actualizando, en cada una de las k iteraciones con "caminos que tengan solo como intermediarios a los primeros k nodos".

## Grafos Hamiltonianos y Eulerianos.
Existen algoritmos polinomiales para saber si un grafo dado tiene un circuito euleriano, no uno hamiltoniano.

**Circuito euleriano**: pasa por **todos las aristas** de G una y sólo una vez. Un **Grafo Euleriano** tiene un ciclo euleriano.

Equivalencias:
- G es Euleriano.
- Todos los vértices tienen grado par.
- Las aristas de G pueden ser particionadas en ciclos simples.

Para **construir** el ciclo: aprovechamos que cada vertice tiene cantidad par de aristas. Partimos de uno cualquiera y avanzamos vertice por vertice. Siempre que entramos a uno podemos salir, pues cantidad par de aristas. Cuando volvemos al vertice inicial, entonces tenemos un ciclo. Si quedan aristas sin explorar en el grafo, repetimos partiendo por cualquier arista que tenga una punta en el ciclo que acabamos de descubrir, y obtenemos otro ciclo. Eventualmente formamos n ciclos que particionan a G, y la intercalación de estos es un ciclo (no simple) que pasa una vez por arista.

Un digrafo conexo es euleriano si, y sólo si, para todo nodo v de G se verfica que din(v) = dout(v).

**Circuito hamiltoniano** : pasa por **cada nodo** de G una y solo una vez. Si G tiene un ciclo Hamiltoniano, decimos que es un grafo Hamiltoniano.
El problema es NP-Hard no resuelto, y no tiene una buena caracterizacion.

Sea G un grafo conexo. Si existe W ⊂ V tal que G \\ W tiene c componentes conexas con c > \|W\| entonces G no es hamiltoniano.

**teorema de Dirac** : Sea G un grafo conexo tq n >= 3. Si para todo v en V, d(v) >= n/2, entonces **G Hamiltoniano**.
La inversa no es necesariamente cierta. (Ver C_k!)

**Condicion de Clausura** : Por cada par de vértices no adyacentes u y w, unirlos con una arista si d(u)+d(w) >= n. Repetir hasta convergencia. Si el resultado es hamiltoniano, el grafo inicial también lo es. Notar que todo grafo completo es hamiltoniano.

## Heuristicas y Metaheuristicas
Problema de Optimización: Determinar una solución factible (satisface toda restriccion) que minimice (o maximice) el objetivo.

Decimos que A es un algoritmo  – aproximado, con  ∈ R>0, si para toda instancia se cumple:
|f (x^A) − f (x∗)| ≤ |f (x∗)|

Por su facilidad de diseño e implementación, es muy frecuente utilizar procedimientos golosos. Si bien no aseguran que nos brinden una solución óptima (y en general no lo hacen), retornan soluciones de calidad aceptables en compensación por el esfuerzo computacional que requieren.

Para TSP muchas heurísticas existen que dan resultados ok pero tienen casos patologicos: hacer un kruskal -quedarse cada vez con el edge mas chico factible-, agregar el eje mas pequeño posible cada vez -greedy-, o armar un MST del grafo y recorrerlo para conseguir un camino Hamiltoniano. Esta ultima es 1-aproximada si el grafo cumple la desigualdad triangular -es euclideano-. 

Podemos ademas definir "vecindades" para nuestras soluciones: formas de generar soluciones cercanas en el espacio de soluciones, factibles, que podemos comparar para ver si hay ganancia tomandolas. Un ejemplo es k-opt: tomo k nodos y sus sucesores, y roto los ejes seleccionados. E.g., remuevo (i, i+1) y (j, j+1) y agrego (j, i+1), (i, j+1), formando 2-opt. Esto es cuadratico-ish. Definitivamente polinomico.

Esto nos da la noción de óptimo local: una solución que no tiene vecinos mejores. 

**Búsqueda Local** : buscar un optimo local haciendo un gradient descent discreto: hago alguna permutación hacia otra solución de la vecindad que mejore mi solución candidata, repetidas veces hasta que no pueda mejorarla mas con esta permutacion. E.g.: arranco con un ciclo feo para TSP y voy haciendo 2-opt greedily hasta llegar a la mejor posible. Podes buscar el optimo local de la vecindad cada vez, o solo ir siempre en direcciones que mejoren.

## Metaheuristicas
Buscan mejorar la busqueda local tradicional para no quedar varados en minimos locales. Pueden ser mas o menos simples, y usar memoria en vez de solo mirar vecinos.

**Busqueda Tabú** : Memoriza T soluciones visitadas, y las elimina de las opciones V\* en N(s) para explorar.  Clasifica como tabú ciertos atributos de las soluciones (e.g., alguna arista en un TSP).
Se detiene el algoritmo por criterios de parada: cantidad de iteraciones, falta de soluciones mejores, solucion optima global hallada (si se sabe por teoria). 

Solemos usar metaheuristicas para resolver problemas NP-Hard, por falta de algoritmos exactos que los resuelvan en tiempo polinomico. 

## Planaridad
Un grafo es planar si puedo representarlo en el plano sin que sus aristas se superpongan. 
Determinar planaridad es polinomial: basta ver que el grafo no contiene a k3,3 ni a k5 (minima cantidad de aristas o vertices para no-planaridad, respectivamente).

Una cota util:
Si G es conexo y planar con n ≥ 3, entonces m ≤ 3n − 6.

## Coloreo
Dado un grafo, puedo pintar sus aristas de colores tq no haya dos vecinos del mismo color?
Problema NP-Hard! :D 
Tenemos cotas:
- Chi(Kn) = n
- G bipartito, Chi(G) = 2 (salvo que sea m=0)
- H_2k ciclo de n par, Chi(H_2k) = 2
- h_2k+1, Chi = 3
- T arbol, Chi(T) = 2

Ademas tenemos un monton de cotas copadas:
> Sea w(G) el tamaño de su máxima clique. Esta es una cota inferior de chi. Osea w(G) <= chi(G).
Pero, sorpresa, esta cota no es ajustada! 

**Grafos de Mycielsky**: su clique mas grande siempre es k2, pero su chi es arbitrariamente grande! Forman una sucesion tq chi(Mi) = i.

Mas cotas:
> Chi(G) <= D(G) + 1 tq D(G) es su máximo degree. Si G no es ciclo impar o completo, entonces Chi(G) <= D(G)

Esta cota tampoco es ajustada: ver K1,k

> G un grafo planar => Chi(G) <= 4

Este problema es NP-Hard! No hay solucion polinomica, se usan heuristicas, programacion lineal entera o backtracking.

**Heurística secuencial** : A cada nodo le asigno el minimo color "posible". Recorro los nodos en orden. El resultado es subóptimo pero válido.
S -> LF -> SL -> SI -flippear colores de cada componente filtrando por dos colores- (con SL). Cada una gana cotas mas ajustadas que la anterior, pero todas tienen casos patologicos.
SI+SL colorea siempre un planar con <=5, y un bipartito con 2.
**Coloreo de Aristas** : Denominado Chi'(G), es pintar aristas tq dos aristas con un vértice en común no coincidan. Chi'(G) = D(G) + d tq d en {0,1}

## Matching y cubrimientos
- **Matching máximo** : Hallar maximo conjunto de edges tq no dos edges incidan en un mismo vertice.
- **Conjunto independiente máximo**: Hallar máximo conjunto de vércitces no adyacentes entre si de a pares.
- **Recubrimiento de aristas mínimo**: Mínimo conjunto de vértices que sean incidentes en toda arista.
- **Recubrimiento de vértices mínimo**: Misma idea para el otro lado.

Matching máximo es polinómico. Conjunto independiente máximo es NP-Hard.
S es un conjunto independiente <-> V \\ S es un cubrimiento de aristas.

Interesante: Cada conjunto de vertices pintados de un **mismo color** en un coloreo de G, es un **conjunto independiente**. Evidentemente el color de mayor cardinal no necesariamente sea el conjunto independiente maximal del grafo, sin embargo.(pensar en hojas).
Esto ultimo nos da un algoritmo greedy de coloreo muy simple (y obviamente suboptimo): tomar un nodo no pintado, extender su conjunto independiente maximal (mirando cada vez el nodo de menor grado de adyacentes entre candidatos), pintarlo de un color, repetir hasta convergencia. 

### Cartero chino
El problema del cartero chino consiste en encontrar un **circuito** que pase por todas las aristas, minimizando el peso. Si hay un ciclo euleriano ganamos, pero sino hay que repasar una misma arista al menos dos veces. Cómo elegimos?

- Tomamos todos los nodos de degree impar. Los llamamos S.
- Por cada vi, vj en S, hallamos d(vi, vj), la longitud de su camino mínimo.
- Armamos Ks su grafo completo con distancias d(vi, vj) como pesos.
- Hallamos matching de peso minimo de este grafo (esto es polinomico, cubico, pero no vimos como hacerlo).
- Construimos el multigrafo G\* duplicando en G las aristas que conforman un camino mínimo entre vi y vj. G\* es euleriano.
- Hallamos el ciclo euleriano en G\*, y ahora es minimo.
