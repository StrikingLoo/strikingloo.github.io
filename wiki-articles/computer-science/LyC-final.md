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



