---
layout: post
title: "Reconocimiento de Patrones - Notas para el coloquio"
date: 2021-07-02
tags: patrones, pattern recognition, UBA, spanish, español, cs
description: "Notas para el final de Algo3. Basadas en los apuntes de la teorica. In Spanish."
---

## Ajuste polinomial
Buscamos hallar W tq ∑X\_i^t\*W\_t minimice el rmse, pero no queremos un grado n del polinomio demasiado grande para no overfittear. Ademas podemos agregar regularización l1 o l2. Si el orden del polinomio es cercano a N, overfittea fuerte (y los coeficientes tienden a ser muy altos!).

## Regresión lineal
Hallar W tq W\_i\*X\_j + b minimice el rmse. Es una regresión lineal.

## Validacion cruzada (cross-validation)
Divido el dataset en K fragmentos, y uso k-1 de train y el ultimo de test, repito k veces y agrego todas las métricas. Vuelve al resultado más robusto.

**Modelo discriminativo vs generativo**: Un modelo generativo modela P(x\| C) y usa eso con Bayes. Uno discriminativo directamente intenta modelar P(C \| x) ignorando la distribución latente (casi todos los que solemos usar son discriminativos).

Hay todo un tema de ecuaciones pero what it all boils down to es que si minimizamos el MSE maximizamos la likelihood de los datos (osea P(t\|X)).

A fin de cuentas, el output **y** es la proyección de **t** en el espacio generado por las funciones de base Fi. Osea, en el hipoplano que generan las fi, lo mas cercano a **t** que puede estarse. **t** son las labels. (proyeccion del vector de todos los labels en el subespacio de todos los outputs).

En el update step, sumamos al vector w de pesos, por cada instancia, esa instancia, escalada por el residuo, por lr. e.g., X2\*1e-5\*(0.2) si me falto 0.2.

Si agregamos regularizacion, nos termina quedando a minimizar un termino de likelihood y uno de costo. 

diapo 1, 158. arg min -> arg max?
diapo 2, aprendizaje secuencial, el update del vector w está bien?
