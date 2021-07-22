---
layout: post
title: "Teoría de Lenguajes - Notas para el final"
date: 2021-07-21
tags: TLeng, UBA, spanish, español, cs, algorithms
description: "Notas para el final de Tleng. Basadas en las teóricas de la materia, y adornadas luego al leer las preguntas tipicas de final. In Spanish."
---

## Definiciones

## Lema de Pumping

Sii un lenguaje es finito (tiene finitas cadenas) todo automata que lo reconoce será acíclico.

Lema de pumping para regulares:

Existe n, para todo w, tq (w in L AND \|w\| >= n) -> Existe x,y,z tq
- w = xyz
- \|xy\| <= n
- \|y\| <= 1
- Para todo i >= 0, xy^iz in L.

Osea existe algun n, tq para todo w en L de longitud al menos n, existe una manera de tomar los primeros hasta n caracteres, tq tomo un sufijo no vacio de ese prefijo, lo pumpeo i veces para i >= 0, y siempre ese pumpeado esta en el lenguaje.

---

Si tengo una gramatica regular, existe un AFND que genera el mismo lenguaje (es straightforward la conversion).

Si tengo un AFD, hay una gramatica regular equivalente.

Dada una expresion regular r, existe un AFND-l M tq #qf = 1, y L(M) = L(r). 

Estas 3 se demuestran por induccion en la longitud de la cadena. En las primeras dos probamos la equivalencia entre As -> wa y d(s, wa) = qf. 
En la tercera vamos por induccion en la longitud de la regex (cantidad de operadores) e induccion estructural.

Ademas, dado un AFD existe una regex que acepta el mismo lenguaje. 

---

## Propiedades de lenguajes regulares

- Son cerrados en complemento, union e intersección finitas (no infinitas, ver \{ a^kb^k \}).
- Problemas decidibles en lenguajes regulares : **pertenencia (dado w, está en L?), vacuidad (L = {}?), finitud (#L) y equivalencia (se resuelve por diferencia de conjuntos, que es regular por lo visto mas arriba)**.

## Automatas de pila

*img*

Aceptación puede ser por estado final (si al terminar de procesar la cadena, llegué a un estado en F, acepto la cadena independientemente del contenido de la pila) o por pila vacía (si al terminar de procesar la cadena la pila está vacía, acepto independientemente de en qué estado estoy).

Para cualquier automata con aceptacion por estado final, podemos facilmente construir uno de aceptación por pila vacia (en todos los estados finales ponemos transicion lambda a un nodo que simpemente desapila todos los elementos hasta vaciar la pila. Inicialmente pusheamos a la pila un caracter distinguido que el automata anterior nunca poppeaba, para evitar vaciar la pila en el medio por error).

Para el otro lado tambien es facil construir un automata de aceptacion por estado partiendo de uno de pila vacia: podemos agregar a todos los nodos una transición si la pila tiene un cierto simbolo distinguido agregado, que lleve a un nuevo nodo final adicionado. Luego al comienzo partimos de un q0' que pushea ese distinguido inicial, entonces corre todo el otro automata, deja la pila vacia salvo por el simbolo nuevo X0, y ahi salta por transición lambda a un Qf que lo poppea y termina.

Las gramaticas libres de contexto pueden modelarse con un automata de pila que acepte el lenguaje que genera. Puede pushear tanto Vn como Vt a la pila, el resto es intuitivo. Tiene un solo nodo q0. 

"Si en el tope de la pila hay un símbolo no-terminal t, el automata lo reemplazará por el lado derecho α de alguna produccion del mismo de tal manera que el símbolo mas a la izquierda en el lado derecho de dicha produccion quede en el tope de la pila. 

Si en el tope de la pila hay un símbolo terminal t, el automata constatara que es igual al próximo símbolo en la cadena de entrada y lo desapilará. 
Este automata acepta L por pila vacía."

### Automata de pila deterministico

Tiene para cada tripla q, a, A de estado, caracter y tope de pila, como mucho una transición posible. Y en particular si tiene transición lambda para un estado y tope, entonces no tiene transición no-lambda.

Si un idioma no es libre de prefijos (x en L entonces xy no en L), entonces todo automata de pila M que acepta L necesariamente será no-deterministico. (Sino, vacio la pila y termino, porque necesito aceptar x, y nunca podria aceptar xy).

## Gramáticas libres de contexto

Una gramatica G es ambigua si para una cadena w, existen dos árboles de derivación distintos.

Un lenguaje L independiente de contexto es **intrinsecamente ambiguo** si para toda G tq L(G) = L, G es ambigua.

Si una cadena w tiene un árbol de derivación en G tq su altura = h, sea a = max( {\|b\| tq A -> b in P} ), \|w\|<= a^h.

Hay un pumping para indep de contexto. 

Si L1, L2 son indep de contexto, también lo son:
- L1 U L2
- L1L2
- L1+

Sin embargo L1 AND L2 no siempre será indep de contexto. 

Si L1 regular y L2 indep de contexto, entonces L1 AND L2 es indep de contexto.

L1 indep de contexto deterministico, entonces L1^c tambien. Si L1 no-det, entonces L1^c puede ser cualquier cosa.

Llamamos a w **forma sentencial** de G gramática, si G -\*> w. Llamamos a A alcanzable en G si existe una forma sentencial que lo contiene. Llamamos a A activo si existe w tq A =\*> w. 

Una gramática G es reducida si todo no-terminal es alcanzable y activo. Decimos que una gramática es propia si no tiene producciones borradoras (A -> lambda).

**Forma Normal de Chomsky**: si G es una gramática y genera un lenguaje L indep de contexto que no contiene lambda, hay una G' cuyas todas producciones son de la pinta:

`A -> BC | a`

Para A,B,C Vn y a Vt, tq L(G') = L(G).

**Forma normal de Greibach** : Dado un mismo lenguaje (indep de contexto, sin cadena vacia), existe una gramatica que lo genera tq todas sus prod tienen pinta:

`A -> a w`

Tq w in Vn\*, a in Vt.


