---
layout: post
title: "Bases de Datos - Notas para el final"
date: 2021-4-7
tags: bases de datos, DB, Databases, SQL, UBA, spanish, español, cs, algorithms
description: "Notas para el final de Bases de Datos. Basadas en las diapos teoricas en el campus. In Spanish."
---

**Independencia fisica**: Abstraccion entre los datos que ve el usuario, y su almacenamiento fisico -optimizaciones del DBMS etc-.

**Independencia lógica**: la capacidad del sistema de cambiar el esquema conceptual, sin cambiar la vista lógica que el usuario tiene de los datos.

**DML vs DDL**: DDL se usa para definir datos, e.g. CREATE, DROP, ALTER -agrega columnas-. DML se usa para manipular datos: no cambia el schema, solo cambia tuplas. DDL es horizontal, DML es vertical.

### MER -Modelo Entidad Relacion

Permite analizar requerimientos para generar un **DER** (Diagrama de Entidad-Relacion). 
Para diseñar:
- Identifico entidades
- Identifico relaciones
- Identifico cardinalidades
- Busco las relaciones no binarias
- Miro atributos y claves

## Algebra Relacional
Lenguaje formal utilizado por el modelo relacional. Va de relaciones a relaciones haciendo operaciones -consultas-.
Fundamento formal del modelo relacional. Permite optimizar queries. 

Operaciones: 

Unarias: Select, project, rename.

Binarias: Union, intersection, minus. Solo pueden hacerse entre entidades union compatibles: con mismos tipos en mismo orden.

Joins: Producto cartesiano, join -inner, nunca joinnea nulls- , equijoin -inner con solo = como operacion-, natural join: inner join entre campos de mismo nombre y deja uno solo de cada duplicado. Si no tienen mismo nombre, hay que meter rename primero. Y los outer.

Llamamos **selectividad del join** a la cardinalidad del join / la del producto de las cardinalidades de la tabla.

Division: A \\div B : Dame todas las tuplas de A tq matchean con toda tupla de B en los campos compartidos. Todo campo de B es campo de A, y se eliminan del resultado.

## Calculo Relacional de Tuplas

Otro lenguaje de consultas asociado al Modelo Relacional.
Lenguaje declarativo o descriptivo de las respuestas deseadas. 
Ej: { t | COND(t) }
- t es tupla
- t unica variable libre de la expresion
- COND fbf de CRT

Las formulas validas son t \\in R, r.A op s.B y r.A op c (tq c constante).
op = { <, >, =, !=}

Llamamos a una **expresion segura** cuando garantiza devolver una cantidad finita de tuplas como resultado. Sino, es insegura.
Equivalentemente, una expresion es segura si todas las tuplas resultantes son parte del dominio de la expresion -todos los valores de atributos de todas las tuplas de las relaciones involucradas-.
Si nos restringimos a expresiones seguras, CRT es equivalente a AR.

Existen consultas que no pueden formularse ni siquiera en LPO. Por ejemplo tratar una tabla como grafo y pedir si existe camino de cualquier longitud entre dos ejes.

SQL se basa en CRT + operaciones aritmeticas, joins y un par mas de condimentos -stored procedures, etc.-.

## Normalizacion

Tiene por objetivo **preservar la información**, pero **minimizar la redundancia**.
4 criterios de calidad de diseño:
- La **semántica de atributos clara** en los esquemas.
- Las tuplas deben **minimizar información redundante**.
- La cantidad de **valores NULL** debe ser minimizada.
- **Tuplas espúreas** no deberían poder ser generadas. -Natural join que genera cualquiera, como joinnear por pais-. Ocurre si hay campos compartidos entre dos tablas, pero no son FK ni PK de ninguna de las dos.

Anomalías de Actualización. Almacenar NATURAL JOINs introduce problemas adicionales.
- Se complica si surge un elemento de una de las dos tablas que no tiene nada asociado en la otra -genera nulls, como minimo.
- Si tengo data redundante, mantener consistencia a mano es un pain, y actualizar en bulk es poco acertado.

### Dependencias funcionales

Decimos a -> b si b depende de a - a define b-. Para un mismo valor de a, necesariamente b valdra lo mismo.

### FN basadas en PK
Asumiendo que conocemos todas las DF de toda relacion, y cada relacion tiene una PK definida.

Haremos los tests de cada forma normal, y cada esquema que no pase algun test será descompuesto en esquemas mas pequeños que si lo pasen.
La forma normal de una relacion es la FN de nivel más alto que "aprueba".
Ante cada descomposición, debemos garantizar: **lossless join** -joinear los componentes no genera tuplas espureas- y **preservacion de DF** -cada DF está representada en algún esquema resultante-. La primera es un must, la segunda un NTH.

**Superclave**: conjunto de campos tq no hay dos tuplas distintas que sean iguales en todos ellos. Superset de una clave.

**Clave**: conjunto de campos que es superclave y minimal -si no tuviera ese campo, pues no seria superclave-.

**Clave primaria**: Designamos como PK a una de las claves candidatas, eligiendo de manera arbitraria.

**Atributo primo**: un atributo que pertenece a al menos una CK de la tabla.

### Formas normales

**FN1**: Cada campo debe tener como dominio solo valores atómicos. En la tupla, toma uno solo de estos. Si tengo campos multivaluados, los muevo a una tabla nueva y hago que tengan como FK la PK de la anterior.

**FN2**: Cada atributo no primo A de R **depende funcionalmente de manera completa de la PK de R, y de toda CK**. Osea, la PK de R es minimal, y abarca todos los otros campos minimalmente -no hay campos que dependan solo parcialmente de la PK-. 

**3FN**: Estar en 2FN y **ningun atributo no primo de R depende transitivamente de la PK**. E.g., empleado trabaja en depto #4 que se llama "blah". Si sabemos el numero de depto, sabemos el nombre, entonces depende solo transitivamente de la PK empleado.
Otra forma de verlo: para todo DF A -> B se da que o bien A es CK o bien B es atributo primo de R.

**BCFN**: Para toda dependencia funcional *no trivial* X -> A de R, X es CK de R. **Surrogate keys all the way down**.

### Clausura de dependencias

Para hallar la clausura de F un cjto de DFs, tengo las reglas **transitiva**, **reflexiva** y la de **incremento** (añadir a la derecha un mismo elemento en ambos lados de la ->).

Para un subcjto X de atributos de R, puedo hallar todos los atributos que dependen funcionalmente de X (X+) si voy dependencia por dependencia y, para cada dependencia A -> B, X+=B si A \in X.

Para hallar clave de R:
- K := R
- Por cada atributo A en K: si (K - A)+ es R entonces K-= A.
Al final tenemos una clave minimal.

Para descomponer una entidad R en entidades FN3 SPI y SPDF:
- Por cada dependencia X -> Y en un conjunto DF minimal, creo una entidad XY a menos que haya creado otra que contenga XY.
- Si ninguna entidad contiene una clave de R, creo una entidad que tenga alguna clave de R como campos.

Para descomponer en FNBC -SPI pero no SPDF-:
- Por cada DF X -> Y en el conjunto, creo una entidad XY y remuevo sucesivamente Y de R.


## Datos No-estructurados

Datos estructurados: Tienen un formato estricto, una estructura predefinida y fija.

Datos Semi-Estructurados: No tienen el mismo nivel de organización y predictibilidad que los datos estructurados. Los datos no residen en campos fijos o registros o tuplas, pero contienen elementos (marcas) que pueden separar los datos de manera jerárquica. Suelen representarse con JSON o XML y permiten modelar arboles de datos, etc. Punto medio entre estructurado -tablas de MR- y no-estructurado -un HTML pelado-. 

### XML

Un formato parecido a HTML, pero extensible -los usuarios inventan sus propias tags-. Datos autodescriptivos -markup-, estructurados como árbol, con anidamiento, ademas de human-readable. 
XML is slower than JSON, because it is designed for a lot more than just data interchange.

**DTD**: Una forma de definir schemas en XML -decir cuales son los campos, etc.-.

**XPath**: El "query" language para XML. Te da los nodos que cumplen un cierto path, que puede tambien incluir ciertas restricciones.
E.g. : `/BARS/BAR/PRICE[@theBeer = ”Miller”]`
Existe un actual query language para xml que estan estandarizando los de W3C: Xquery. 

## Transacciones

Una transacción es un conjunto de instrucciones que se ejecutan formando una unidad lógica de procesamiento. Una transaccion puede incluir uno o más accesos a la BD.

Son necesarias para sistemas multiusuario: la base es accedida por mas de un usuario en concurrencia. 

Podes marcarla con `begin transaction`, `end transaction` y puede o no ser read-only.

Un **data item** es lo que se bloquea en una transaccion, y su granularidad puede ser de registros, valores de atributo, o un bloque de disco. La operacion puede ser un read o un write, y pasa por un buffer de la DBMS. Interesante: la escritura puede verse diferida si el recovery-manager lo desea (see: logging). 

El control de concurrencia es necesario porque de lo contrario, accesos concurrentes podrian generar estados incorrectos.

Algunos problemas posibles son: Lost update, Temporary Update (Dirty Read), Incorrect Summary Problem -le pegaste a una variable bien y otra aun no-, Unrepeatable Read Problem -leer el mismo atributo dos veces, una de las dos dirty-. 

Una transaccion puede ser committed o aborted. En el segundo caso todas sus operaciones deben revertirse. 

### ACID Properties

ACID es un conjunto de propiedades de las bases de datos relacionales.

- **Atomicity** : Transacción como unidad atómica. Las operaciones de una transacción se ejecutan en su totalidad o no se ejecuta ninguna.
- **Consistency preservation**: Si la transaccion se ejecuta, mueve la base entre estados consistentes -segun reglas establecidas al definir cada entidad-.
- **Isolation**: La ejecucion de una transacción no debe interferir en la de otra que se ejecute de manera concurrente. Cada transacción debe aparentar ser ejecutada como si lo hiciera en aislamiento.
- **Durability**: Los cambios aplicados en la DB por una transaccion committeada, deben persistir en la BD. No pueden perderse por fallos.

### Componentes del DBMS

Scheduler: controla el orden en el que se ejecutan las transacciones.

Recovery Manager: es el encargado de asegurar la durabilidad y atomicidad de las transacciones.

### Scheduling de transacciones

Definicion parcial de transacción: Conjunto de operaciones, parcialmente ordenado, que debe o bien terminar en commit o en abort, y especificar un orden para los read y write.

**Historia**: orden en que se ejecuta un conjunto de transacciones. La unica restricción es que las operaciones de una misma transaccion deben respetar su orden parcial. 

**Conflicto**: si dos operaciones pertenecen a transacciones distintas, operan sobre un mismo item y al menos una de ellas es un write, tenemos conflicto.

### Tipos de conflictos

- **Lost update** – dos transacciones intentan escribir el mismo item y el resultado de la primera se pierde porque se sobre escribe con el segundo antes de que se puedan grabar.
- **Phantom Read** – La transacción reejecuta la misma query pero el conjunto de tuplas resultados son distintos. Notar que hay tuplas nuevas o viejas. Es un caso dentro de non-repeatable read.
- **Dirty Read** – Una transacción lee un dato que NO ha sido committed.
- **Non-repeatable read**: Leo un registro, alguien mas lo escribe, leo de nuevo. El dato committed me cambia el valor de alguna tupla.

Podes ir subiendo el nivel de aislamiento de tu base de datos para evitar los lost updates, los dirty reads, non-repeatable reads y los phantom reads, en ese orden. 

Una historia completa H sobre T conjunto de transacciones es un orden parcial \<H tq H es union de Ti, U\<i esta en U\<H y para todo par p, q de operaciones en conflicto, p\<q o q\<p estan en \<H.

Dos historias son equivalentes si están definidas sobre el mismo conjunto de transacciones y contienen las mismas operaciones, ordenan las operaciones en conflicto de las transacciones no abortadas en el mismo orden.

Una historia es serializable, si existe una historia equivalente que es serial -corre primero toda uan transaccion, luego otra, etc.-. Esto es importante porque una historia serializable puede correrse mejorando la performance sin comprometer correctitud de las operaciones.

### Grafo de seriabilidad

Dada una historia H, construimos SG(H)
- Agrego un nodo por transaccion
- Agrego un arco de Ti a Tj si hay una operacion en conflicto y Ti ocurre antes que Tj

Una historia sera serializable si SG(H) es aciclico.

### Tipos de Historias

Decimos Ti lee X de Tj si Tj fue la ultima en escribir X antes que Ti leyera, y no abortó.
Luego los tipos de historias son:
- **Recuperable** (RC): Si cuando Ti lee de Tj en H, si ci \\in H, cj < ci. (Si leo de j, j committeo antes que yo si committee).
- **Evita abort en Cascada** (ACA): Ti lee de Tj en H, entonces cj < ri(x). (Si leo de j, j committeo *antes de que leyera*).
- **Estricta** (ST): si wj(x) < oi(x), o bien aj < oi(x) o cj < oi(x), oi(x) \\in {wi(x), ri(x)}. (si *leo o escribo* algo que tocó j, j tiene que ya haber terminado -por abort o por commit-).

Alivorte, ST: si la operacion de escritura de Ti precede a una operacion conflictiva de Tj otra transaccion, entonces el commit o abort de Ti tambien debe precederla. Es como tratar cada registro como un mutex, y los commit/abort son unlocks.

ACA: Si una Ti va a realizar un read, tiene que esperar hasta que toda transaccion que escribe antes haga un commit.

Recuperable: si Ti hace un read dirty, no puede committear hasta que la otra haya committeado.

### Control de concurrencia

**Lock binario**: lockeo cada registro con un lock -un mutex- que bloquea tanto read como write. Hasta que no hay Ui(x) no puede haber otro Li(x). 

**Lock multiple -compartido-**: puedo hacer un wLi(x) o un rLi(x). La primera evita reads y writes posteriores hasta el unlock, pero la segunda sigue permitiendo los reads. 

**2PL**: Cada transaccion debe hacer su ultimo lock antes de su primer unlock. Si esto se cumple, el scheduler puede patear cada operacion que genere conflicto, y no liberarla hasta que el lock correspondiente se libera. 

Se llama two-phase porque hay una fase de "crecimiento" en la que las transacciones adquieren locks, y una de decrecimiento en la que los pierden. Puede generar deadlocks, pero se hace un wait-for graph y, si hay un ciclo implica deadlock.
Pero 2PL garantiza seriabilidad! Aun si no previene deadlocks o rollbacks en cascada.

Ademas, existe 2PL ST que es igual pero solo unlockea los de escritura luego de committear o abortar, y 2PL Riguroso que no libera ningun lock hasta no haber committeado.

**Timestamp-based**: Cada transaccion tiene una timestamp TS(Ti). Cuando leo, si el registro se escribio despues entonces me abortan. Si se escribio antes, leo si ya esta committeado, sino espero. Cuando escribo, si el registro se leyó despues, me abortan. Si se escribio despues, pero no se leyo, pueden ignorarme -regla de Thomas- o no. En caso de leer, ademas espero hasta que se committeo la ultima transaccion en escribir. 

Cuando una operacion es imposible, decimos que no es **físicamente realizable**.

Esto asegura seriabilidad tambien.

**Multiversion**: Guardo todas las versiones de un registro que sepa que alguien puede usar -todas las escrituras posteriores a la version mas vieja por timestamp.

## NO-SQL Databases

Diseñadas tomando en cuenta la existencia de datos no estructurados (o semi estructurados).

No relacionales, open-source, distribuidas, escalan muy bien horizontalmente.

- No tienen schema
- Sencillas de replicar
- Interfaz sencilla
- Almacenan grandes volumenes de datos
- Son BASE en vez de ACID

### BASE

Base significa que dan **Basic Availability** (availability as in CAP-theorem), **Soft state** (el estado va mutando aun sin intervención externa, debido a la consistencia eventual) y **Eventual consistency** (El sistema va a ser consistente a lo largo del tiempo, si no recibe inputs en el medio).

Osea que, si el sistema se lo deja quieto, su estado va a ir mutando hacia una consistencia, que garantiza, y en todo momento va a devolver respuestas no-errores, aunque quizas no sean el dato mas reciente.

Enfasis en fault-tolerance distribuido y redundancia. Muchos discos distintos con mucha replicacion. 

No hay garantia de consistencia como la de ACID, pero si a que eventualmente va a haber un unico estado, si se deja al sistema quieto. No hay garantias de una deadline.

Partition tolerance: el sistema sigue andando aun si se cae un nodo.

### Key-Value Store

Son la base que mas escala. Almacenan items como ciudadano de primer orden, en un sistema de pares key, value, donde un item puede ser de muchos tipos ricos -texto plano, XML, JSON, imagenes- y sin ningun schema. Pueden guardarse en "dominios" como semi-estructura.

Puede tener redundancia y no tener integridad referencial. Escalan muy bien y funcionan bien con object-oriented design.

Son buenos almacenando datos, pero si se quiere analizarlos conviene primero transferirlos a una base relacional u otro formato.

Al no haber estructura, la integridad de datos queda como ejercicio para el programador.

### Document-oriented Databases

Son menos libres que los kvs, pero a cambio tienen datos mas claros. Cada valor **debe** ser un XML o JSON -un documento-, pero pueden diferir en estructura y datos. Vuelve el concepto de metadata, y eso permite indexar algunos campos, u otras optimizaciones. 

### Column Family Databases

Columnas de datos relacionados. Un grupo de columnas tiene una funcion similar a una tabla en una base relacional. Las "column families" son columnas que se acceden y almacenan juntas. Una column family es un par clave, valor, donde la clave es el nombre de la family, y el valor es el conjunto de columnas agrupadas. Pueden repetirse.

Termina siendo como si una key mappeara a un json, en un kvs, pero con un poco mas de schema -los jsons tienen todos mas o menos los mismos campos- y con redundancia y particiones. 

Escalan muy bien y soportan datos semi estructurados, con indices, pero no tienen consistencia inmediata ni datos relacionales.

## Optimizacion de consultas

El **Procesamiento de consultas** permite la extracción de datos desde un lenguaje de consulta. Los pasos son **Parsear y traducir**, **optimizar**, **Generar el codigo en instrucciones** y **ejecutar la consulta**.

El optimizador de consultas genera varios **planes de ejecución** para la consulta, evalua los costos y se queda con el mas eficiente.

El procesador de consultas toma la consulta y la ejecuta segun el plan, para devolver el resultado.

El optimizador busca generar el plan de ejecución más eficiente, tipicamente en cantidad de accesos a disco.

Una query sin agregaciones termina siendo una sucesion de productos cartesianos, un filtro por las condiciones del where, y una proyeccion de las columnas pedidas.

### Indices

Pueden ser **Clustered o non-clustered**: Clustered significa que el archivo en el que estan almacenados los registros está ordenado por este campo. Non-clustered si no. Osea, los datos del archivo estan fisicamente ordenados por ese campo.

**Denso o no denso**: Tiene todos los valores, o solo algunos.

**Primario o secundario**: Primario es que tiene le registro entero, secundario es que tiene un nivel de indirección: solo tiene el rid como value.

B+ Clustered Tree : **Repasar!**
Static Hash: Un hashtable con cantidad fija de buckets, donde cada entry apunta a una lista encadenada de bloques. Muy buenos para buscar por igualdad o desigualdad.

### Algoritmos para operaciones

Cada operacion de AR tiene distintos algoritmos para ejecutarla -operadores fisicos-. 
**Pipeline**: Se le pasan los resultados de la primera operacion a la segunda en streaming a medida que se generan, evitando almacenarlos en el medio y acelerando el proceso. 

Los filtros, los productos cartesianos/joins y la union e interseccion son todos conmutables. 


## Logging

El DBMS necesita un modulo de recovery que administre situaciones de recuperacion de datos ante una falla.

### Tipos de errores

- **Fallas en las transacciones:** Pueden ser **Errores Lógicos** (la transacción no se completa porque ocurre un error interno como romper una restriccion) o **Errores de estado interno** (el DBMS termina la transaccion por abort, deadlock, etc.).
- **Fallas de Sistemas**: Fallas de SW (bugs en el DBMS), fallas de HW (crash recuperable de la computadora).
- **Fallas de almacenamiento**: Son irrecuperables, se resuelven solo con backup and restore, y redundancia.

### Recuperacion

Los algoritmos de recovery tienen dos partes: acciones que se ejecutan **mientras la transacción está ocurriendo** para garantizar la recuperabilidad ante una falla. Y acciones que se llevan a cabo **una vez que una falla sucede.**

El DBMS tiene un cache manager que hace fetch y flush como esperarias, con bits de dirty y present.

El Recovery Manager (RM) tiene una interfaz simple: writes que toman Ti, Ri y v/w -segun si redo o undo, guardar valor nuevo o viejo-, commit y abort, y un restart que recupera ante crash.

El RM puede ser **Undo** -escribe a disco cada write, y los deshace si la transaccion aborta-, o **redo** -loggea cada cambio y, ante un commit, lo pasa al disco-.

Todas las operaciones, commits y aborts se registran en el log, para luego poder restaurar. Se mantiene en memoria -log buffer- y cada tanto se persiste en un archivo. En cada commit, o en group commit policy -agrupa varios commits antes de flushear-.

**Undo rule**: Si el disco tiene el ultimo valor committeado de X antes de reemplazarlo con uno nuevo, preservarlo en el log.

**Redo rule**: Si una Ti committea, persistir los cambios en el disco.

**Garbage Collection**: [Ti, x, v] puede eliminarse si Ti abortó, o si Ti committeo y alguien mas ya soreescribio.

**Undo/Redo**: Es el mas complicado. El write guarda la Ti en una lista de activas, y escribe [Ti, x, v\_old, v\_new] en el log, pero pone el valor v en la cache-entry de x -fetcheando primero si no estaba-. El read solo lee de la cache y fetchea si missea. El commit mueve Ti de activas a committeadas, y loggea el commit. En el abort, se va cargando en la cache el valor de cada x de antes de la Ti. 

Ante un restart: por cada entry del log, si x no se habia visto antes, se le asigna un slot en el cache. Si Ti estaba committeada, copiar v en el slot alocado para x y mover x a "redone" -un empty set-. Sino, copiar la imagen anterior de x en el slot de x en cache, y mover x a undone. Si Ti es committeada, removerla de activas. 

**Repasar esto!!**

**Checkpoints**: Un checkpoint agrega la entry \<checkpoint> y hace flush del log a disco. Escribe todos los datos dirty committeados sin persistir. Luego en un crash podemos ignorar toda transaccion committeada antes del  ultimo checkpoint. Decimos que un checkpoint es quiescente si bloquea las transacciones. 

---

## Long Duration Transactions

Una LDT puede ser:
- Transaccion que escribe/modifica **muchos registros** en el orden de millones+
- Un **Workflow que conecta diferentes bases** e.g., por redes.

Para ejecutar una SDT creamos una "saga" que es un grafo de acciones, donde cada una bloquea a la siguiente, asociada cada una a una "compensacion" que es su accion inversa. Si quiero revertir una saga ejecutada -un path del grafo- hago el path a la inversa ejecutando las compensaciones. 

### In-memory databases

Almaceno todo en memoria sin bajarlo a disco. Puedo tener o no persistencia. Si la tengo, es a traves de un transaction log, lo unico que escribo. Si quiero restaurar la base desde disco solo tengo que ejecutar el log de nuevo. Pueden ser por rows o columnares.

### Distributed Databases

Colecciones de bases de datos, distribuidas en una red de computadoras, potencialmente heterogenea.
Nos empieza a importar el **costo de transferencia** de un conjunto de rows a la hora de optimizar operaciones.

Se abstrae al usuario de muchas complejidades de la arquitectura de la base. I.e., transparencia de:
- **Organizacion de los datos**: Tenemos transparencia de ubicacion y nombres: el usuario no sabe donde guardamos cada cosa.
- **Fragmentacion**: Hay sharding horizontal -subdividir en rows- y vertical -por columnas-, y esto le es transparente al usuario.
- **Replicacion**: redundancia para fault-tolerance.
- **Otros**: tiene que ver con optimizaciones y ejecucion.

Algunas propiedades deseables: Disponibilidad -uptime-, escalabilidad -horizontal o vertical-, partition tolerance, autonomia -de nodos individuales- 

Datos y Software distribuídos en multiples lugares, pero conectados a través de una red de comunicaciones.
**Grado de Homogeneidad** : Si todos los servers y usuarios utilizan el mismo software.

## Integracion de datos

Integracion de datos vs transferencia. En una tenes alguna interfaz transparente para hacer consultas que agrega datosde multiples fuentes (BDs distintas, web, no estructurados, etc.). En la otra transferis datos de una base a otra que son de una misma naturaleza y estructuras homomorficas. Podes usar mappeos de schemas, que se hacen a menudo con "Source target tuple generating dependencies": triggers que mappean un campo de una tabla a otro de la otra (so.scoring -> pay.payment\_id).


