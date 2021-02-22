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
**Modelo logar´ıtmico**: El tiempo de ejecución de cada operación es función del tamaño (cantidad de bits) de los operandos.

## Big O notation
Sii f es O(g), lim n->inf de f/g = c tq c > 0.


