---
layout: post
title: "Lógica y Computabilidad - Notas para el final"
date: 2021-05-30
tags: LyC, Logica, Computabilidad, UBA, spanish, español, cs, algorithms, Turing
description: "Notas para el final de LyC. Basadas en los apuntes de la teorica. In Spanish."
---

## Turing Machine
La maquina de turing es una maquina de estados con Q estados (Q finito) y un alfabeto \Sigma (finito) + una tira de simbolos con el input.
Por convencion el input es \* input 1 \* input2 ktp. 

Vamos a tener las transiciones del estado Qi al Qj segun que simbolo vemos, que dictan qué simbolo escribir. El simbolo escrito va en la posicion actual de la cabeza, excepto para simbolos R y L que son mover la cabeza.

La Turing Machine es equivalente a otras nociones de computabilidad o de "procedimiento efectivo" como el lenguaje C etc.

## Primitivas Recursivas (& PRC)
Primitiva recursiva: parto de algunas funciones axiomaticamente PR (sucesor, 0, y proyecciones de tuplas) y las compongo mediante:
- Composicion: h(x1...xn) = f(g1(x1...xn), ...,  gk(x1...xn)) 
- Recursion primitiva: 

> h(x1...xn, 0) = f(x1...xn)
> h(x1...xn, t+1) = g(h(x1...xn, t), x1...xn, t)

PRC: Una clase es PRC si es la clausura por composicion y recursion primitiva, de las funciones axiomaticamente PR + posiblemente otras.

PR : Una funcion es **primitiva recursiva** sii pertenece a toda clase PRC. Esto es, la funcion es el resultado de finitos pasos de composicion y recursion primitiva, partiendo de funciones iniciales.

**Minimizacion acotada:** Dado p un predicado en una clase PRC, la minimizacion acotada me da el minimo t tq p(t, X) si existe, o 0 si no.

**Minimización no acotada**: Dado p un predicado, la minimización no acotada me da el mínimo t tq p(t, X) si existe, y n otermina si no.

## Numero de Gödel
El número de Gödel codifica una n-upla de naturales \<x1,...,xn> como productoria donde cada factor es el i-ésimo primo a la xi-ésima potencia.

No es una codificación biyectiva, pero solo ignora 0s a la derecha así que si sabemos la dimensión no es un problema.

## Lenguaje S

Solo usa inc, dec y jnz. Usa X para inputs, Zi para auxiliares y devuelve siempre en Y (como rax).

Llamamos descripcion instantanea a la tupla (i, s) donde s es el estado de todas las variables usadas, i la linea en la que estamos.

i==n+1 -> programa termino. Para cada estado podemos calcular facil un estado "sucesor", y una sucesion de descripciones instantaneas desde un inicial a un terminal sucesores cada uno del anterior, se llama "cómputo".

Podemos generar el cómputo de un programa P para inputs r1...rn. En particular si existe decimos que el programa termina. Sino, no (la secuencia es infinita).

Funcion parcial f es S-parcial computable si existe un programa que se indefine donde la función se indefine, y vale lo mismo donde está definida.
Si es parcial computable y total, entonces es computable.


