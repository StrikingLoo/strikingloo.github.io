---
layout: post
title: "Ingenieria del Software II - Notas para el final"
date: 2021-08-06
tags: Inge2,inge2, UBA, spanish, español, cs, algorithms, fuzzing, testing
description: "Notas para el final de Inge2. Basadas en los videos de la teorica. In Spanish."
---

## Program Analysis

**Program Analysis**: Discover useful facts about a program. 

- Dynammic : Execute a program and learn about it
- Static: compile-time

Analysis can be complete (we find every useful fact) or sound (every fact we find is true). Typically static analysis is more complete, but dynammic analysis is more sound. 

## Iterative analysis

Armamos el control flow graph donde cada nodo es un statement y un nodo lleva a otro si puede precederlo. Vamos mappeando los valores posibles de variables si los sabemos, de nodo a nodo. Con eso podemos concluir, por ejemplo, si una variable siempre vale lo mismo en un cierto esstado.

El grafo usa statements del *while language* que es solamente un while; if ; y assignment. (con && y !). 

### Chaotic iteration

Iteramos los nodos del grafo en un orden aleatorio. Por cada nodo:

- Out[n] = intersection/union( x for x in IN[n] ) - kill(n) + gen(n). 

Elegir si intersection o union, y si out o in, te define 1 de 4 algoritmos. Repetimos hasta convergencia y entonces termina.

Siempre termina, pues los sets nunca se achican y hay un tamaño máximo finito.

**Very busy expressions**: Out[n] = intersection(in[n'] for each n' in SUCC)  - kill(n) + gen(n) (mide expresiones que se usan en todos los sucesores! Y que en el medio ninguna variable que aparece en ella cambió de valor)

**Reaching definitions** : Out[n] = union(in[n'] for each n' in PRE) - kill(n) + gen(n) (dónde se hizo la ultima asignacion no overwritten?).

**Available Expressions** : Out[n] = intersection(in[n'] for each n' in PRE) - kill(n) + gen(n) (expresiones que ya se computaron, y no se modificaron luego, en todos los caminos a este program point.)

**Live Variables Analysis**: Out[n] = union(in[n'] for each n' in SUCC) - kill(n) + gen(n) (A variable is live if there is a path to a use of the variable that does not redefine the variable (the current value *might* be useful!) )

## Pointer Analysis

Queremos trackear si dos pointers podrian o deberian aliasear entre ellos (el may-analysis suele ser mas interesante y comun que el must).

E.g., tengo v = new Color(); u = v; luego may-alias(u, v).

Para eso pasamos el programa en lenguaje while++ (le agregamos new, assignments, indexar con ., e indexar con \[\*\]), removelos el control flow (todos los while, for e if se mueren) y con el nuevo grafo resultante, aun si es bastante primitivo, metemos flechas azules cuando var -> cosa y rojas cuando cosa.attr = cosa'. 
Asignamos las flechas azules por **allocation site**, no solo por clase.

Por cada statement de while++-flow, siempre agregamos nodos y flechas, nunca removemos: por cada assignment e = new X(); agregamos flecha azul de e a X, donde hay un nodo X por cada allocation site. Por cada assignment v1 = v2; hacemos flechita de v1 a cada nodo tq v2-> ese nodo. 

 Si el statement pinta v1.a = v2 entonces flechita roja de v1 a cada nodo tq v2 -> nodo, con un label == a en la flechita.

**Flow abstraction**: como abstraemos el flujo. Podemos ser flow-insensitive (remover todo el control de flujo) o flow-sensitive (dejarlo).

**Heap abstraction**: Refiere a la granularidad de cómo representamos los objetos para los que se aloca memoria y generan referencias. i.e., como particionamos un conjunto no acotado de objetos concretos a uno finito de objetos abstractos. Basicamente qué añadimos como nodo al grafo. Hay muchos sound schemes, podemos cambiar la precision y eficiencia. 

- **Allocation site based**: cada allocation site (new X();) tiene un nodo propio. Finitely many abstract objects.
- **Type based**: Menos granulado, menos costoso. Cantidad de tipos es finito, cantidad de objetos abstractos tambien. Al menos te dice el tipo de cada variable.
- **Heap insensitive**: Un solo abstract object que es simplemente la heap. Todas las variables le apuntan con azul, y todos los atributos en rojo tambien.

### Modeling Aggregate Data Types: Records

- **Field Insensitive**: merge all fields of each record.
- **Field based**: merge each field for all records.
- **field sensitive**: keep each field of each record object separate.

## Constraint-Based analysis

Nos deja separar implementacion del analisis, de declaracion de constraints (what de how) y abstraernos de la primera para concentrarnos en la segunda.

Puede ser interprocedural o intraprocedural. Ejemplo constraint language: datalog.

Es un lenguaje como prolog. Le pasas tu control-flow graph como un set de constraints por edges, le pasas como son las relaciones de kill y gen, y boom te genera analisis como live-variables o reaching definitions. 

Tambien puede manejar may-alias analysis flow-independent si le pasas las reglas de qué hacer en los assignments, en los new y estas hecho.

## Testing

- Tester != Developer (porque asi errores no coinciden tanto). 
- Recursos finitos
- Especificaciones compartidas por tester y developer, ya que el tester las necesita para ver que el programa es consistente, y el developer para saber qué programar.

Los approaches de testing caen en 4 categorias, como 4 cuadrantes en 2 ejes ortogonales: manual vs automatic y black- vs white-box.

Por ejemplo, manual y black box: no miro codigo y pruebo la UI de algo a mano clickeando todo.

Whitebox seria si miro el codigo y veo de cubrir todas las branches tocando botones a mano.

Automatico: Podriamos activar lugares al azar de la UI sucesivamente, sin mirar el codigo ni nada. O podriamos hacer un analisis estatico del codigo antes de automaticamente triggerear UI events, en cuyo caso esto es whitebox y automatico. 

### Automated vs Manual testing

**Automated**
- Finds bugs more quickly
- No need to write tests (cheaper)
- Less maintenance cost when software changes

**Manual**
- Potentially better coverage
- Code less bloated

Idealmente queremos combinar ambos.

### Black-box vs White-box

**Black-box**: Basado en mirar inputs y outputs del programa.
- Works for code that can't be modified
- Code can be in any operable format

**White-box**: Basado en mirar el codigo fuente directamente.
- Efficient
- Can have a much better coverage

Usamos pre y post condiciones, idealmente escritos en el mismo lenguaje del codigo.

### Testing quality

**Code Coverage**: Can be measured in functions, statements, branches, lines and blocks. Pro: easy to measure. Con: doesn't imply robustness.

**Mutation Analysis**: Assumes the programmer wrote a close to right code. Tests variations of the program (e.g., replace x < k with x > k, or w + 1 to w - 1). If the testsuit eis good, it should break on mutants. If it doesn't, then we add a test that covers that case. As a possible problem: what happens when mutation generates equivalent programs?

### Mutation Analysis


Tomo el codigo de una funcion y le aplico operadores de mutacion. Hacen un solo pequeño cambio al codigo, e.g. cambiar un + por un -, una expr por abs(expr), o por 0, intercambiar argumentos de funcion, etc. Luego le corro el testsuite. Si rompe por los bugs introducidos en el cambio, decimos que "la testsuite mata al mutante", de lo contrario decimos que no. Llamamos el **mutation score** al % de mutantes que mueren sobre el total, para un total prefijado (y configuramos que mutaciones queremos usar, etc.).

Algunos mutantes pueden ser equivalentes: para todo input tienen el mismo output, aun si hay o no un defecto en su comportamiento.

Notar que hay muchisimos mutantes posibles para un solo programa pequeño (aun para un solo statement). Algunas formas de resolver esto para ganar escalabilidad son: ejecutar para cada mutante, solo los inputs que tienen covertura de ese statement mutado. Mutacion debil: veo si modifique el valor de una variable del estado luego de mutar un statement, en vez de mirar si modifique el output mismo del programa. 

### Random Testing (Fuzzing)

**Monkey Testing (for Android)**: Generate a sequence of tapping events (down and up, or down, drag and up), then generate many different random sequences and check if any one sequence crashes the program.

**Concurrency testing**: Simulate different thread schedules by adding artificial delays between threads, appending "Sleep()" calls randomly on different threads' code. Shown to be a lot better than stress testing.

We call a bug's "depth" the quantity of ordering constraints needed to guarantee the bug takes place. E.g., "statement1 before statement 2 and statement 2 before statement 3". These constraints imply scheduler behaviour, and transcend thread boundaries (inside a thread, two statements will always go in the same order, obv).

Cuzz and other frameworks say most bugs have small depth.

Pros: Can be a lot easier to use than manual testing, cheaper and more efficient. Con: uses more tests per coverage point and may find useless bugs (like weird unsanitized inputs). Also makes many tests that simply don't pass preconditions.

> Automatic testing should complement, not replace manual testing.

Podemos usar alguna [gramática formal](/wiki-articles/computer-science/tleng-final) para generar inputs aleatorios que sean validos. De esta forma, especialmente en programas de mayor complejidad, los inputs generados tienen mas chances (idealmente 100%) de cumplir las precondiciones del programa a testear, siendo mucho mas eficiente la generacion de tests.

