### Independencia de Datos

**Independencia lógica**: la capacidad del sistema de cambiar el esquema conceptual, sin cambiar la vista lógica que el usuario tiene de los datos.

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
Unarias: Select, project, rename
Binarias: Union, intersection, minus. Solo pueden hacerse entre entidades union compatibles: con mismos tipos en mismo orden.
Joins: Producto cartesiano, join -inner, nunca joinnea nulls- , equijoin -inner con solo = como operacion-, natural join: inner join entre campos de mismo nombre y deja uno solo de cada duplicado. Si no tienen mismo nombre, hay que meter rename primero. Y los outer.

Llamamos **selectividad del join** a la cardinalidad del join / la del producto de las cardinalidades de la tabla.

Division: A \\div B : Dame todas las tuplas de A tq matchean con toda tupla de B en los campos compartidos. Todo campo de B es campo de A, y se eliminan del resultado.
