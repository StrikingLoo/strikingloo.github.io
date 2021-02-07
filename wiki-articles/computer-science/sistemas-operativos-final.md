---
layout: post
title: "Sistemas Operativos - Notas para el Final"
date: 2021-02-06
tags: sysop, SO, OS, Operating Systems, Distributed systems, concurrency, UBA, spanish, español, cs, algorithms
description: "Notas para el final de MetNum. Basadas en las diapos de la teórica y adornadas con fragmentos del Silberschatz, Tanenbaum y Wikipedia."
---

# Sistemas Operativos

Preguntas Chapa

[https://docs.google.com/document/d/1QOFw99da5EBd8kaa5tli7xId3tFPLQNIvbWytqu8m7k/edit?usp=sharing](https://docs.google.com/document/d/1QOFw99da5EBd8kaa5tli7xId3tFPLQNIvbWytqu8m7k/edit?usp=sharing)

Preguntas Baader

[https://docs.google.com/document/d/1f7FMXf7JYZvsbXgXPROL4eU0OKl_1Li1lzBwNUVU5xo/edit?usp=sharing](https://docs.google.com/document/d/1f7FMXf7JYZvsbXgXPROL4eU0OKl_1Li1lzBwNUVU5xo/edit?usp=sharing)

## Sistema Operativo

Para qué? Dos cosas: de arriba hacia abajo: para usar más apropiadamente los recursos del hardware. De abajo hacia arriba: porque como usuario quiero poder abstraerme del hardware.

Incluye el kernel, y los drivers. Además, suele venir con archivos de configuración y binarios.

## Proceso

Programa en ejecución, incluyendo su contexto y memoria -y pid-.

### Process memory

* Data: La sección con variables globales -estaticas o constantes-.
* Text: La sección donde está guardado el código del programa.
* Heap: La heap del programa si usa memoria de reserva dinamica.
* Stack
* "Current activity": los registros (mencion especial al PC)

Puede terminar (con exit(CODE)), o forkear para spawnear un nuevo proceso. fork() + wait() = system(). fork() + exec() = run().

### Comunicacion entre procesos (IPC)

Podria hacerse por:

* Memoria compartida
* Recursos compartidos -e.g., un file-
* Señales

## Scheduling

Scheduling siempre es un tema de trade-offs. Algunas métricas posibles a optimizar son:

* Fairness (ecuanimidad).
* Eficiencia: usar el CPU al maximo.
* Carga: minimizar cantidad de procesos en ready.
* Tiempo de respuesta: el tiempo de respuesta 
* Latencia: tiempo entre que un proceso emerge y comienza a ejecutarse.
* Tiempo de ejecución (de un proceso).
* Throughput: procesos terminados / tiempo.
* Liberación de recursos: priorizar los procesos que mas recursos consumen primero.

Scheduling puede hacerse cooperativo o con desalojo (_preemptive_). El segundo es el mas comun, y suele usar la interrupcion del clock (cada ~20ms) para desalojar procesos (tambien llamado apropiarse).  

Algunos sistemas:

* **Round Robin**: turnos de quantum fijo entre procesos. Calibrar el quantum no es trivial. Puede combinarse con prioridades, y darle mayor prioridad a un proceso mientras mas "starved" está. También se aumenta la prioridad de un proceso si hace E/S, para 'premiarlo'.
* **FCFS/FIFO**: hace una queue y ejecuta secuencialmente -horrible por obvias razones-.
* **Multiples colas**: tener colas de 2,4,6,8... quanta, y pickear priorizando las mas cortas, pasando el proceso a la siguiente queue si no terminó luego de usar todo su tiempo. Resetteas un proceso que hace E/S a la de mayor prioridad.

En RT, al haber deadlines, hay toda otra familia de algoritmos de scheduling que no vimos. Un ejemplo simple es "earliest deadline first".

En SMP -multiples procesadores-, se prioriza darle el mismo proceso al mismo procesador consecutivamente. Esto es porque pasarle la cache de un procesador a otro es muy costoso, y si la invalido puede ser mas lento recrearla que hacerlo esperar. 

## Concurrencia

Toda ejecución debería dar un resultado equivalente a alguna ejecución secuencial de los mismos procesos.

Cuando esto no pasa, decimos que se produjo una condición de carrera.

Una forma posible para solucionarlo es logrando la exclusión mutua mediante secciones críticas (alias CRIT).

-  Sólo hay un proceso a la vez en CRIT. 
-  Todo proceso que esté esperando entrar a CRIT va a entrar. 
- Ningún proceso fuera de CRIT puede bloquear a otro.

Podemos usar locks: variables booleanas, compartidas. Cuando quiero entrar a la sección crítica la pongo en 1, al salir, en 0. Si ya está en 1, espero hasta que tenga un 0. 

Implementar esto ok necesita ayuda del hardware.

TestAndSet:

pone 1 y devuelve el valor anterior, pero de manera atómica: significa que es indivisible, incluso si tenemos varias CPUs.

Para usar una **variable atómica** tengo que hacer un while que le pegue al testAndSet, por lo que hago **_busy-waiting_**. Esto es muy **agresivo y costoso**. Usa el CPU sin obtener nada, en detrimento de otros procesos! Pero es mas rápido en responder.

**Lost wake-up problem**: Lo que pasa si usas un **array compartido como semaforo** (en vez de un actual semaforo). Pusheas algo pero te desalojan antes de avisar que qty > 0. El otro lado hace el check de qty y como es 0, va a quedar en wait(), pero el otro tira el wakeup() en el medio, entonces se pierde. Solo necesitas que te desalojen en el orden adversarial. 

Solución: semaforo.

Es un entero con dos operaciones que se ejecutan sin interrupciones: wait y signal. Wait espera -durmiendo- a que s>0 y hace s--; Signal hace s++ y despierta algún waiting. Un mutex es un semaforo de capacidad 1.

Un atomic bool tiene operaciones getAndSet(bool v) y testAndSet()==getAndSet(true). Con esto podemos implementar un mutex, al que se le llama spin lock -o TASLock-. 

Hace un while(testAndSet()) como lock, y set(false) como unlock. Esto hace busy waiting y puede ser un poco wasteful si hay mucho wait.

Si quiero un punto medio existe TTASLock, que reduce el overhead y el uso de recursos haciendo "while(true){ while (mtx.get ()) {} ;  if (! mtx. testAndSet ()) return ;" Osea que hace busy waiting con un get, y si rompe ahi recien hace el checkeo atomico. Si falla reintentara. 

### Parte 2

En los **programas paralelos, demostrar la correctitud** es una tarea muy distinta y difícil. **No podes usar precondición y post condición**, porque existen muchas ejecuciones distintas posibles. No podes hacer ninguna asunción sobre el scheduling. 

Nos interesa ver si las ejecuciones terminan, no tienen errores, inanición, etc. Entonces **definimos muchas propiedades deseables**, que pueden estudiarse por separado.

* **Safety** : No pasan cosas malas (you're safe hunny). **Tienen contraejemplo finito.**  (e.g., no hay deadlocks, hay exclusión mutua, etc.).
* **Liveness** : Cosas buenas sí pasan. **Contraejemplo infinito.** (e.g., el programa siempre avanza en el futuro).

### Propiedades deseables:

* Turnos: los procesos se comunican por turnos como haciendo una ronda.
* Rendezvous/Barrera: cada proceso ejecuta a(); b();. Todos los a() tienen que pasar antes que el primer b(). No hay que imponer restricciones sobre el orden de los a() o b().

**Exclusion** : [] #CRIT <= 1. (En todo momento, hay como mucho un solo proceso en cada zona crítica).

**Wait-Freedom**: Todo proceso que intenta acceder a la sección crítica, en algún momento lo logra, cada vez que lo intenta. “**libre de procesos que esperan (para siempre)**”.  == (Para todo i [] IN(i))

**Lock-Freedom (Progreso)** : Si hay al menos **un proceso en TRY y ninguno en CRIT**, entonces eventualmente hay **un proceso en CRIT**. (Si alguno esta intentando, y ninguno tiene el recurso, eventualmente alguien lo va a agarrar).

**Starvation Freedom**: (Para todo i [] OUT(i) )-->(Para todo i  [] IN(i)).

### Parte 3

Un conjunto de procesos está en livelock si estos continuamente cambian su estado en respuesta a los cambios de estado de los otros.

**Seccion critica de M miembros**: igual que de a 1 pero usas semaforo en vez de Mutex.

**SWMR** (Single-Writer/Multiple-Readers) : No se da solucion en clase. 

**Consenso**: todos se ponen de acuerdo en un valor, cada uno empieza con uno arbitrario. El acuerdo tiene que estar entre los valores iniciales, no puede ser un hardcodeado. Este problema esta **resuelto con compareAndSet** ( atom.cmp&set(e, v) = if atom.value() == e : atom.value=v; return True else return False;)

## Memoria

### Manejador de memoria

Subsistema de casi todos los SO

* Maneja el espacio libre/ocupado.
* Asigna y libera memoria.
* Controla el swapping.

Cómo manejo la memoria de múltiples procesos?

Trivialmente podría mandar a disco todos los procesos que no sean el actual e ir swappeando. Esto funcionaría, pero sería muy lento.

Puedo mantener a todos en memoria hasta no poder mas, y ahi ir cambiando, pero como elijo a quién desalojar? Y qué pasa cuando voy cambiando los addresses y la caché se invalida?

Surgen otros problemas:

* Reubicación (controlar el swapping).
* Manejo del espacio libre (evitar que se hagan pequeños pockets sin usar).
* Protección (un proceso no deberia poder leer la data de otro).

### Manejo del espacio libre

Para evitar tener bolsillos vacíos inutilizables, queremos que los espacios libres sean tan contiguos como sea posible. 

Un proceso suele administrar su memoria con secciones fijas para la data y el texto, una sección variable para el heap justo arriba, y arriba de todo el stack (que expands downwards in address space).

Para distribuir y manejar las paginas de memoria, el SO puede organizarse con distintas estrategias.

**Bitmap** : tengo un array con un bit por página, 0 libre 1 ocupado. Asignar y liberar es barato en O(1), pero hallar páginas libres consecutivas es caro (lineal).

**Linked-List** :  Cada nodo tiene la dirección de comienzo y el tamaño del bloque -que puede variar-. Liberar es O(1) si tengo el nodo, asignar es similar si sé dónde. Los procesos tienen toda su memoria contigua.

Algunas políticas par asignar bloques en un sistema con lista: 

* First fit: si entra asigno.
* Best fit: termina performando igual de bien.
* quick fit: tener precomputada una lista con bloques de los tamaños mas usados.

Todos generan fragmentacion (cachos desperdiciados). Las soluciones actuales usan estadística de los tamaños pedidos, y son altamente no triviales. 

### Reubicación

Uso swapping + memoria virtual. Para esto necesito al MMU (de Hardware). El MMU añade una capa de abstracción para que la dirección virtual que el programa pide se mappee a una dirección física en la memoria, que si no está llena se carga del disco.

MMU: tabla de paginas

Usamos tabla multinivel (tabla de tablas) para no tener que tener toda en memoria.

Dirección de 32bits: 10 para primera tabla, 10 segunda, 12 offset.

Como el lookup de paginas es costoso, se agrega el TLB (Translation Lookaside Buffer) como cache que va directo de virtual a fisica.

## E/S

Los **drivers** son el **software intermediario** entre el SO y los dispositivos de E/S. Corren con **máximo privilegio**: pueden hacer colgarse a todo el sistema. De ellos depende el **rendimiento de E/S**, que es fundamental para el rendimiento combinado del sistema. Son de **código muy****especifico**.

La interacción con dispositivos puede ser por:

* **Polling**: costosa por ser busy, pero tiene muy baja latencia y es simple, con cambios de contexto programados.
* **Interrupciones**: es asíncrona y permite que el driver descanse, pero genera interrupciones impredecibles. 
* **DMA**: desentiende al CPU de la lectura y escritura de memoria, con un manager que habla directo con el driver.

API del subsistema de E/S : Todo es un archivo! Read/Write, Open/Close.

Scheduling de disco: mover el cabezal lleva tiempo y el disco son muchos cilindros con alturas y rotaciones. Hacerlo óptimo es altamente no trivial, se suelen usar algoritmos complejos con prioridades. Algunos de los simples serian FCFS, SSTF, o "Scan" que es "voy y vengo y siempre agarro lo siguiente primero".

**Spooling**: el dispositivo encola los eventos y los hace esperar, sin intermediar el kernel. Esto evita que el usuario se bloquee. Ejemplo: impresora. 

**Backups**:

**Total**: backuppeo todo.

**Diferencial**: backuppeo todo desde el ultimo total.

**Incremental**: backuppeo todo desde el ultimo incremental.

**RAID**: Redundant Array of Inexpensive Disks

### File Systems

Un archivo es una secuencia de bytes sin estructura + nombre. 

Un File System lo suele representar como una lista de bloques+metadata.

No puedo simplemente guardar todos los bloques consecutivamente, porque si el archivo crece no sabría que hacer con él.

Podríamos usar una linked-list para bloques, pero la lectura arbitraria de segmentos seria muy costosa (O(n)). Solución: Usar una **tabla que marca el siguiente de cada bloque**, o si el bloque está vacío o es fin de archivo. Este sistema usa **FAT**.

Desventajas: la tabla esta entera en memoria, es poco robusto (si caes y no llegas a bajarla a disco), y es un bottleneck porque todos usan la misma.

**Inodos**: Esto usa Unix. Cada archivo tiene un inodo con metadata y los primeros 12 bloques. Después una tabla con un nivel de indirección, una con dos niveles y una con tres. Esto permite tener en memoria solamente las tablas correspondientes a archivos abiertos. 

Los directorios tienen en el inodo un bloque por archivo, que tiene la metadata, el nombre y un link al inodo del archivo/directorio.

**Links**:

El **link fisico** simplemente **mappea dos archivos al mismo inodo**. El link **simbólico** mappea **un inodo a un path** que tiene otro inodo al archivo. Si cambias el inodo al que ese path apunta, el simbolico se ve afectado pero el fisico no.

Journaling se usa para garantizar consistencia: tenes un buffer intermedio al que escribis rapido y secuencialmente los cambios, para restaurar si se cae el sistema. 

Para preguntar a Facu: cuando cambio de proceso cambia la cache? O la cache es solo por cada quantum? tomaran RAID o NFS? no creo. Que es soft updates?

## Seguridad

Existe una distinción entre protección y seguridad, pero no vamos a darle mucha bola. 

La seguridad tiene 3 partes: **Confidencialidad, Integridad y Disponibilidad**.

En un sistema de seguridad hay **Sujetos** que hacen **Acciones** sobre **Objetos**.

Hay 3 propiedades deseables: Authentication, Authorization y Accountability.

### RSA
Tengo clave privada y publica. Puedo encriptar con la privada y cualquiera con la publica desencripta y sabe que algo es mío. Con esto se implementa la firma digital: tengo un documento, le computo un hash y te mando el doc y el hash encriptado con mi clave privada. Como tenes mi clave publica, podes facilmente verificar que el documento no fue adulterado. Un atacante necesitaria mi clave privada para romper el documento y generar un hash falso.

RSA en detalle funciona: tomando dos primos grandotes p y q (> 10^200). 
- Hago `n = p*q`
- `n' = (p-1) * (q - 1)`
- `Let e in range(3, n'-1) such that n' % e != 0`
- `Let d such that (d * e) % n' == 1`
- e es la clave de encripción **pública**. d la de desencripción **privada**.

Para encriptar : cada caracter m -> m^e % n.
Para desencriptar : cada caracter encriptado c -> c^d % n.
## Sistemas distribuidos

Conjunto de recursos conectados que interactúan.

Pueden compartir memoria (por hardware o por software -#Facu: tomaran esto en detalle?-)

**Sincronicos**: 

Telnet : Me conecto remoto a otra computadora y corro el programa ahi -como hacer ssh-.

RPC: llamo a una funcion y me es transparente, pero del otro lado se ejecuta codigo remoto y devuelve. Es sincrónico. (#Facu: mas diferencias?)

**Asincronicos**:

RPC asincrónico.

Message Passing -sending & receiving- (e.g., MPI, o con pipes).

### Message Passing

En este tema ignoramos fault tolerance o caída de paquetes.

Al no haber memoria compartida o TAS, como hacemos la sincronización? 

Puede usarse un **enfoque centralizado**: un solo nodo tiene todos los recursos, y spawnea un proceso por cada otro nodo para que negocien los recursos con los mecanismos no distribuidos. **Esto es horrible** porque si cae el nodo central morimos, y porque es un bottleneck y podría no estar a distancia optima de todos. 

Otros enfoques:

**Orden parcial no reflexivo de eventos** -para no depender de clocks, que son imposibles de sincronizar-. El orden es: eventos en un mismo nodo tienen el orden del nodo. Envio de un evento viene siempre antes que recepcion del evento. Ademas, esto es transitivo. Si no tengo A -> B ni B -> A entonces asumo concurrencia. 

Si queremos un orden total, rompemos los empates con criterios arbitrarios: si los eventos son concurrentes entonces da lo mismo el orden.

**Acuerdo bizantino**: si hay posibles fallas en la comunicación, no hay solución al problema de poner N procesos de acuerdo en un valor V, en tiempo finito. Aun si el valor es booleano.

Si

* **En vez de caerse paquetes, caen nodos**, y
* Sé que a lo sumo caen k < n nodos.

entonces **se puede resolver consenso** en O((k + 1) · n^2 ) pasos.


### Métricas para algoritmos distribuidos

* Cantidad de mensajes enviados.
* Fallas soportadas.
* Información requerida.

Problemas en 3 familias: **orden de eventos**, **exclusión mutua** y **consenso.**

Vamos a ver algoritmos asumiendo que **ningún proceso cae, y no se pierden mensajes**.

### Exclusión Mutua

**Token Passing**: Los procesos se pasan el "_token_" en un anillo secuencial. Si quiero acceder a la zona crítica espero hasta tener el token, la uso y lo vuelvo a pasar. Pro: Si no hay fallas no hay starvation. Con: es wasteful.

**Broadcast**: 

Cuando quiero acceder a la sección crítica, envío una solicitud(Pi, ts). 

Solo puedo entrar cuando recibí _todas_ las respuestas.

Si entro, voy encolando pedidos y los respondo todos cuando salgo.

Respondo inmediatamente si no quiero entrar a la ZC, o yo quise entrar a la ZC y el ts del pedido que recibo es menor que el mío.

**Lock distribuido:**

**Cada proceso tiene un lock** del recurso. Cada vez que un proceso quiere acceder a un recurso para escribir, pide **al menos n/2+1 locks**. Toma la máxima timestamp usada y la incrementa, luego **broadcastea** a todos esos nodos el nuevo valor. 

El lector pide también n/2+1 locks y siempre **lee el de timestamp mayor**. Necesariamente si tomas la mayoría de locks, al menos uno tenga el valor actual.
