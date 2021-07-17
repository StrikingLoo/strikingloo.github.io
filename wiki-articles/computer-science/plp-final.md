---
layout: post
title: "Paradigmas de Lenguajes de Programacion - Notas para el final"
date: 2021-07-10
tags: PLP, UBA, spanish, español, cs, algorithms
description: "Notas para el final de PLP. Basadas en las teóricas de la materia, y adornadas luego al leer las preguntas tipicas de final. In Spanish."
---
.
## Calculo Lambda

Definimos axiomas y reglas de tipado ( Γ ▷ A : σ) y de evaluación ( M -> M' ). Tenemos M ->> M' que es la relación de terminación (M termina en M'), la clausura transitiva de la evaluación en un small step. Siempre termina en una forma normal (un termino irreducible, no necesariamente valor).

Decimos que dos expresiones son alpha equivalentes (y esto formara una relacion de equivalencia) si solo difieren en los nombres de sus variables **ligadas**. 

- Todo término bien tipado termina
- Si un término cerrado esta bien tipado, entonces evalúa a un valor

**Error**: La evaluación no puede continuar, pero el término no es un valor. (variables libres, o la expresión no tipa).

**Corrección** : Progreso + Preservación (de tipo). Para M correcto, o bien M valor o bien M -> M', tq si M tipa σ M' también.

### Inferencia de tipos
Dada la funcion erase(M) que devuelve a M pero sin anotaciones de tipos, queremos hallar, dado U que no tiene anotaciones de tipos, un M tq 
- Γ ▷ M : σ 
- erase(M) = U.

Usamos tipos Nu (s,t, u, v...) para indicar tipos genericos. Luego tenemos S, una sustitucion que mappea genericos a particulares. Decimos que el soporte de S son los tipos que altera (transformacion sintactica) y que Γ' ▷ M' : σ' es instancia de Γ ▷ M : σ  sii existe S tq es la sustitución que la genera (Sa = a'). 

La funcion de inferencia W toma U sin anotaciones e infiere W(U) = Γ ▷ M : σ tq Erase(M) = U, y Γ ▷ M : σ es derivable.

Ademas si Γ ▷ M : σ  es derivable, es una instancia de W(U) (osea que W me da una inferencia correcta pero ademas la mas general posible).

S y T dos sustituciones pueden unificarse (nos quedamos con la mas general que respete a ambas). Ademas podemos componerlas (una sustitucion corre y luego la otra) y son asociativas. Decimos que S es mas general que T si existe U tq T = US. Osea que S es mas general que T, pues T instancia de S.

Dada una ecuacion de unificacion, buscamos el MGU (el unificador más general). Esto es que es solución, y es la más general posible. Para una ecuación de unificación, siempre hay un unico MGU si hay solucion, modulo nombres de variables.

Al unificar se toma un elemento del conjunto de ecuaciones por vez y: si es funciones, se subdivide. Si es nat=nat o bool=bool se elimina, igual que con cualquier par trivial. Si es s=σ se reemplaza σ por s en todo el conjunto antes de eliminar. Y si queda una unificacion inviable (bool=nat, etc.) se borra (**colision**) al igual que si tengo σ != s, y s in FV(σ). (e.g., σ -> τ = τ).

### Subtipado

Decimos que τ \<: σ sii en todo contexto en el que se espera σ, puede usarse τ.

Surge regla de subsuncion (subsumption) : σ \< τ  -> si algo tipa σ, tipa τ.

El subtipado es transitivo y reflexivo, pero no tiene simetría ni antisimetría, así que no es un orden, solo un preorden.

En registros, el subtipado es mas complejo: subtipamos por width (más campos, más especifico, {} es supertipo de todos), por depth (si todos mis campos matchean todos los tuyos, pero para cada uno mio tengo un subtipo del tuyo, soy subtipo) y por permutaciones (porque es invariante a permutacion).

Una subfuncion tiene un dominio mas grande, y una imagen mas chica.

## Objetos

Vimos herencia, herencia multiple vs simple (y el problema de overwriting metodos), method dispatch (dinamico o estatico, linkeo de nombre de metodo al codigo mismo. Arranca por la clase actual y va subiendo hasta object a ver si se definio. Super sobreescribe esto estaticamente).

Traits: en calculo sigma, un trait es un objeto que todos sus metodos son lambdas que no dependen de self. Osea que es inmutable y su estado no afecta ningun metodo. Con un trait t (todos sus metodos no dependen de self -self no es FV del cuerpo del metodo-), podemos construir en base a él un constructor.

Una clase es un trait completo que provee un metodo new (que permite instanciar objetos). El new de clase c hace un pasamanos y devuelve un nuevo objeto o, tq si llamamos al metodo m de ese nuevo objeto o, en su def llama al de c, pasandole el self de o como parametro.

## Paradigma Lógico

Se especifican **hechos** y un **objetivo** que se quiere probar. Es *declarativo*.

A tautologia sii ¬A insatisfacible. Luego para probar A, probamos que ¬A es insatisfacible. Para esto, prolog usa resolución.

El metodo de resolucion prefiere asumir que las proposiciones estan en **forma normal conjuntiva**. Luego, usa la **regla de resolución**.

Una proposición está en FNC si es una conjunción (C1 and C2... and Cn) y cada Ci es una disyunción (Bi1 or Bi2 ... or Bin). Un FNC es un And de Ors.
Podemos modelar una FNC como un set de sets de literales (A o ¬A).

Si tengo {A, P} y {B, ¬P} entonces es equivalente a eso y {A, B}. En ese caso llamamos a {A, B} la resolvente de las dos primeras. El resolvente de {P} y {¬P} es {}.

El resolvente de dos clausulas C1 y C2 es C tq para algun literal L tq L en C1 y ¬L en C2, C = (C1 - {L})U(C2 - {¬L}).

El resultado de aplicar la regla de resolucion a un conjunto, es que si dos clausulas tienen una misma literal con distinto signo, esa se va y queda la union. E.g., tengo {a, ¬b} y {a,b} y me queda {a}. Esto es un "paso de resolución". Agregar un paso de resolución preserva **insatisfactibilidad**. Si llegamos a la clausula vacía, entonces el conjunto inicial era insatisfactible.

El metodo de resolución siempre termina, y refuta sii insatisfactible. 

Para probar A tautologia hacemos esto: 
- Generar ¬A
- Pasarla a FNC.
- Aplicar resolución.
- Si hay refutación, A es tautología.
- Sino, A no es tautología (y hay instancia de negación).

Las L-formulas son las formulas de LPO que salen de un lenguaje de LPO (con una L-estructura con predicados, funciones y constantes y variables).

Una sentencia es una formula sin FV. Por el teorema de Church, no hay un algoritmo que determine si una formula de primer orden es valida, pero sí hay semi-decisión: si es insatisfactible hay refutacion, si es satisfactible podría no detenerse.

Con LPO para refutar algo le hacemos varias transformaciones.
- **FNN (Forma normal negada)** : A y ¬A, unidas por AND y OR, forall y Existe. No puede tener \-\> ni negaciones antes de parentesis o dobles: si tiene negaciones los tiene justo antes de una atomica.
- **FNP (Forma normal prenexa)** : Igual que FNN pero todos los cuantificadores para la izquierda extrema.
- **FNS (Forma normal de Skolem)** : Se obtiene mediante Skolemizacion: elimino los cuantificadores existenciales sin alterar la satisfactibilidad. La satisfactibilidad se mantiene, pero todo predicado de la forma ∃x tq P(x) se cambia a "P(c)" tq c constante nueva. Esto preserva satisfactibilidad, pero no validez. La c con la que reemplazamos a las variables de los ∃, es f(x,y...z) tq x, y, z son las variables libres que quedaban de los existe. f siendo una funcion nueva agregada al lenguaje, y agregamos las variables que estuvieran libres en el predicado de existe.

Finalmente para skolemizar tomo cada predicado de forma ∃x.B y cambio x por f(x1...xn) tq x1...xn son todas las variables ligadas que aparecen en B. Si no hay variables ligadas, pongo una constante fresca c. 

Lo mejor es skolemizar de afuera hacia adentro, pero no es deterministica (podria elegir un orden arbitrario para muchos existe anidados).

Para pasar de skolem a clausal, como ya tenemos todos los quant a la izquierda, tenemos muchos forall y luego una sentencia B. Pasamos B a B' una sentencia en FNC. Luego separamos cada conjuncion (osea todos los OR juntos) distribuyendo los quants (forall x A AND B --> forall x A AND forall x B). Esto luego se simplifica como {A, B}.

En LPO la resolucion se hace unificando primero terminos de ambos lados (a diferencia de proposicional, para lidiar con cosas como {P(x), ¬ P(A)} que es insatisfactible. Una vez mas la resolución preserva satisfactibilidad.

### Resolucion lineal

Preserva completitud pero reduce espacio de busqueda considerablemente respecto de la general.

Parto de C0 y voy eligiendo una Bi de mi conjunto de clausulas Bi y haciendo la unificacion entre esas dos (sacando la resolvente).

Con clausulas de Horn podemos reducir aun mas el espacio de busqueda, sin perder completitud, pero restringiendonos a una subclase de fórmulas: solo una de las literales de una formula puede ser positiva, el resto negadas. Osea que cada Ci tiene 0 o 1 literal positivo, el resto negado.

La clausula "goal" es toda negativa (quiero refutar una clausula que es un monton de OR de cosas negadas, osea que lo que probaria es la afirmacion de la interseccion). 

No toda formula de LPO puede expresarse con una clausula de Horn. Pero esto es mucho más eficiente y suficientemente expresivo. (e.g., P(x) OR Q(x))

### Resolucion SLD

Una Definite Clause tiene exactamente un literal positivo. Sea P U {G} tq P son clausulas de definicion y G una negativa (el goal).
S = P U {G} son las de entrada. P es el programa o knowledge base y G el goal a demostrar (negado!). 

Una resolucion SLD es una secuencia N0...Nn tq **N0 = G** y cada Ni es una **clausula negativa**. Ademas Ni+1 es la resolvente entre Ni y algun Ci tq hay un ¬Ak en Ni que unifica con un Ak en Ci, y agregamos las demas clausulas de Ci a Ni+1 si las hay.

**Correctitud**: Si un conjunto de clausulas de Horn tiene refutacion SLD entonces es insatisfacible.

**Completitud**: Si P U {G} Son clausulas de Horn como se dijo antes, y es insatisfacible, entonces existe una refutacion SLD en la que G es la primera clausula.

Prolog usa SLD con busqueda de arriba hacia abajo, y seleccion de izquierda a derecha de las clausulas de mi Goal actual. 
