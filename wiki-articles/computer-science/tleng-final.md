
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

