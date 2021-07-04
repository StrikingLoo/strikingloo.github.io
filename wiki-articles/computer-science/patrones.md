---
layout: post
title: "Reconocimiento de Patrones - Notas para el coloquio"
date: 2021-07-02
tags: patrones, pattern recognition, UBA, spanish, español, cs
description: "Notas para el final de Algo3. Basadas en los apuntes de la teorica. In Spanish."
---

## Modelos Lineales
### Ajuste polinomial

Buscamos hallar W tq ∑X\_i^t\*W\_t minimice el rmse, pero no queremos un grado n del polinomio demasiado grande para no overfittear. Ademas podemos agregar regularización l1 o l2. Si el orden del polinomio es cercano a N, overfittea fuerte (y los coeficientes tienden a ser muy altos!).

### Regresión lineal
Hallar W tq W\_i\*X\_j + b minimice el rmse. Es una regresión lineal.

### Validacion cruzada (cross-validation)
Divido el dataset en K fragmentos, y uso k-1 de train y el ultimo de test, repito k veces y agrego todas las métricas. Vuelve al resultado más robusto.

**Modelo discriminativo vs generativo**: Un modelo generativo modela P(x\| C) y usa eso con Bayes. Uno discriminativo directamente intenta modelar P(C \| x) ignorando la distribución latente (casi todos los que solemos usar son discriminativos).

Hay todo un tema de ecuaciones pero what it all boils down to es que si minimizamos el MSE maximizamos la likelihood de los datos (osea P(t\|X)).

A fin de cuentas, el output **y** es la proyección de **t** en el espacio generado por las funciones de base Fi. Osea, en el hipoplano que generan las fi, lo mas cercano a **t** que puede estarse. **t** son las labels. (proyeccion del vector de todos los labels en el subespacio de todos los outputs).

En el update step, sumamos al vector w de pesos, por cada instancia, esa instancia, escalada por el residuo, por lr. e.g., X2\*1e-5\*(0.2) si me falto 0.2.

Si agregamos regularizacion, nos termina quedando a minimizar un termino de likelihood y uno de costo. 

### Bias variance tradeoff

Cuando tenemos un modelo de regresion, si hacemos una loss L(t, y) = (t - y)^2, integrada sobre todo X, t, pasa que nos quedan dos terminos:

``` (y(x) - E[t| X])^2 + (E[t |X] - t)^2 ```

El primero es sobre cuanto la esperanza de y dado X se parece al valor correcto, el segundo sobre cuanto la esperanza difiere del valor concreto de y que generamos. Uno mide el fitness, el otro la varianza del label mismo dado X. Si t es super ruidoso en función de X (nuestras features no tienen suficiente poder) entonces no tiene tanto caso preocuparnos por la fitness del modelo.
El valor de y(x) que minimiza la loss, como no podemos cambiar la varianza de t con y, es `y(x) = E[t | x]`. Llamamos a la diferencia entre y(x) y E[t\|x] 'sesgo', y usamos el sesgo cuadrado sumado a la varianza como funcion de perdida.

Finalmente, dado un dataset D, pasa que la esperanza de la loss es sesgo^2+varianza ( **del predictor** )+ruido (varianza del label dado x).
**Aqui imagen**
**imagen sesgo varianza computados**
Consultar como se computan empiricamente sesgo y varianza

## Regresión Logística

Si asumimos que hay dos clases C1, C2 y que X distribuye normal (multivariada) con misma matriz de covarianza para ambas clases pero cambiando la media, la regresión logistica fittea perfecto. 

LR fittea sigma(Wx + b) a la probabilidad de la clase. Podemos generalizar agregando funciones de base (e.g., si todos C1 caen dentro de un circulo y C2 fuera, agregar x^2 y y^2 va como trompada). 

La funcion es convexa pero no tiene solución cerrada.

Para multiples clases, usamos softmax en vez de sigmoidea.

## SVM (Support Vector Machines)
Sea g(x) = Wx + b, clasificamos x a clase 1 si g(x) > 0, clase 2 si no. Notar que W es perpendicular a la superficie de decisión (por ejemplo, en R^3 dicta un plano tq si estás de un lado sos clase 1, del otro clase 2. En R^2 es una recta, etc.

De todos los hiperplanos que separan perfectamente ambas clases, el metodo SVM elige el que maximiza el **margen**.

El hiperplano sera perpendicular a W, y tendrá distancia al origen igual a \|w0\|/\|\| W \|\|, pues g(0) = w0. 

Llamamos vectores de soporte a los puntos que yacen justo al borden del margen (los que g(x) = 1 o g(x) = -1). 

En general la distancia de X al plano será g(x)/\|\| W \|\| . Por esto intentamos minimizar la norma de W, para maximizar esa distancia.

Finalmente, esto mappea a un problema de optimización: minimizar la norma de W, restringido a Wx+b > 1 si clase 0, < -1 si clase 1 (o viceversa).

Pasa a explicar multiplicadores de lagrange. Si tengo f(x) una funcion y g(x) una restriccion que quiero que valga 0, puedo tomar
L(x) = f(x) + lambda * g(x). El max de f restringido a g = 0 sera cuando dL = 0, osea cada componente es 0, y ademas dL/dlambda = 0.

The optimization algorithm to generate the weights proceeds in such a way that only the support vectors determine the weights and thus the boundary.

En el problema de optimizacion aparecen multiplicandose fi(xi)*fi(xj) (dos instancias distintas), pero podemos cambiar eso por otras funciones que dependan directo de x y x' para ahorrarnos el mappeo intermedio a un espacio de mayor dimensionalidad. E.g., 
``` (1 + x*x^t)^2 ``` es como haber mappeado a (x1,x2) -> (1, sqrt(2)*x1, sqrt(2)x2, x1^2, x2^2, sqrt(2)x1x2)

Otro kernel de uso frecuente es e^(-t*\|\| x - x' \|\|^2) (exponential decay). Es equivalente a haber mappeado el vector con una fi de infinitos componentes de output (por la serie de Taylor de e^x).

``` fi: x -> e^(-x^2)(1, sqrt(2)*x, ..., sqrt(2^k/k!)*x^k ) ```

El parametro t si lo hago crecer el modelo overfittea (porque genera clusters de grados mas y mas chicos).

Condiciones tq K(x,y) es kernel: K(x,y) == K(y,x) y ademas, para todo conjunto x1...xn tiene que darse que la matrix tq 

``` Mij = K(xi, xj) ``` cumple ser semi-definida positiva.

## Decision Trees
Para el algoritmo CART, elijo greedily en cada paso hacer la particion j, s tq de un lado quedan los que en la variable Xj tienen un valor < s, del otro \>=. 

Elijo la partición tq minimizo el rmse sumado en ambos lados, si aproximo los valores de cada region con el promedio.

Arbol muy grande overfittea, muy chico underfittea. Elegimos un arbol de tamaño T0 tq si segumos haciendo split quedan muy pocos nodos, y despues se prunea.

Definimos Nm cuantos instancias caen en la region m, cm el centro de la region (la media para lo que caen ahi) y Qm el costo de la region (la varianza empirica).

Luego definimos C(T) el costo de complejidad como ∑NmQm(T) + l\|T\|  donde l es hiperparametro.  

Notar que eso nos da una sucesion de arboles: partimos del arbol mas grande (porque dividir mas siempre reduce el costo del arbol) y vamos sucesivamente podando el split de menor diferencia de costo ahorrada. 

Para el caso de clasificacion, le asignamos a cada hoja la clase más representada en la region. Luego usamos Gini o Cross-entropy o simplemente class error para medir el costo de cada split. 

** Gini ** : 1 - ∑ pmk^2 donde pmk es la probabilidad de cada clase k en la region m (e.g. si son 50/50 esto sera gini=.5).

** Cross-entropy ** : - ∑ pmk log(pmk) (sumado sobre todos los k para esta region m)

** class error ** : 1 - pmk para la k mas probable.

diapo 1, 158. arg min -> arg max?
diapo 2, aprendizaje secuencial, el update del vector w está bien?
