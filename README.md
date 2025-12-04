# 🧮 Tutorial SQL  
**Fundamentos de Bases de Datos, Consultas en SQL y Uso con Python**

Este repositorio contiene el material del curso **SQL**, enfocado en:

- Entender qué es una base de datos y por qué es clave en ciencia de datos.  
- Dominar las consultas en SQL (DQL) para extraer información.  
- Conocer los principales comandos SQL (DDL, DML, DCL, TCL).  
- Integrar SQL con **Python** para visualizar, crear e insertar datos.  
- Practicar con ejercicios teóricos y prácticos de nivel profesional.

 ![class](/ima/ima1.jpg)

Está pensado para estudiantes, analistas, programadores y científicos de datos que quieran usar SQL como herramienta base en sus proyectos.

---


🏁 Objetivo general del repositorio

Este repositorio busca servir como referencia compacta y práctica para:
	•	Entender las bases conceptuales de las bases de datos relacionales.
	•	Dominar la sintaxis esencial de SQL para hacer consultas reales.
	•	Conocer los comandos principales para definir, manipular y controlar datos.
	•	Aprender a combinar SQL + Python en proyectos de ciencia de datos.
	•	Practicar con ejercicios que simulan problemas del mundo profesional.

⸻

## 🗃️ 1. Fundamentos de Bases de Datos

En este módulo se revisan los conceptos esenciales:

- ¿Qué es una base de datos?  
- Historia de las bases de datos.  
- Modelo relacional de E.F. Codd.  
- Tablas, columnas, filas, claves primarias y foráneas.  
- Diferencias entre:
  - Bases de datos vs. Spreadsheets.
  - Bases de datos relacionales vs. no relacionales.
  - Bases de datos transaccionales vs. Data Warehouses.
- Índices, esquemas, normalización, restricciones, tablas de hecho y de dimensión.  
- Principales RDBMS comerciales (Oracle, SQL Server, PostgreSQL, MySQL, etc.).

Este bloque da el contexto teórico para entender por qué SQL sigue siendo central en el mundo de los datos.

---

## 🧾 2. Introducción al SQL

Aquí se presenta SQL como **lenguaje estándar para bases de datos relacionales**:

- ¿Qué es SQL y por qué es tan importante en ciencia de datos?  
- Cuándo usar SQL (consultas, análisis, integridad, seguridad, automatización).  
- SQL en local vs. SQL en la nube.  
- Breve historia y estandarización de SQL.  

---

## 🔍 3. La consulta base en SQL (DQL)

Este módulo se centra en la estructura de la consulta clásica:

```sql
SELECT ...
FROM ...
-- (JOIN ...)
WHERE ...
GROUP BY ...
HAVING ...
ORDER BY ...
LIMIT ...
```

Se profundiza en el rol de cada cláusula:

•	SELECT: qué columnas queremos.

•	FROM + JOIN: de qué tabla(s) obtenemos los datos y cómo las relacionamos.

•	WHERE: filtrado fila a fila.

•	GROUP BY: agregaciones por categoría.

•	HAVING: filtros sobre grupos.

•	ORDER BY: orden de los resultados.

•	LIMIT: limitar el número de filas devueltas.

Este es el núcleo de DQL (Data Query Language): el arte de hacer consultas.

⸻

🧱 4. Otros comandos SQL (DDL, DML, DCL, TCL)

Además de consultar, SQL permite definir, manipular y controlar la base de datos:

🛠️ DDL – Data Definition Language

Comandos:

	•	CREATE, DROP, ALTER, TRUNCATE, RENAME

Sirve para definir estructuras, tablas y esquemas.

🧪 DML – Data Manipulation Language

Comandos:

	•	INSERT, UPDATE, DELETE, MERGE

Sirve para insertar, modificar y eliminar registros.

🔐 DCL – Data Control Language

Comandos:

	•	GRANT, REVOKE

Sirve para el control de permisos y seguridad.

🔄 TCL – Transaction Control Language

Comandos:

	•	COMMIT, ROLLBACK, SAVEPOINT, SET TRANSACTION

Sirve para el manejo de transacciones y la consistencia de los datos.

🎯 DQL – Data Query Language

	•	SELECT como comando central de consulta.

⸻

🐍 5. SQL desde Python: visualizar, crear e insertar

En este módulo se ve cómo usar SQL desde Python, integrando lo mejor de ambos mundos:

•	Conexión a bases de datos desde Python.
	
•	Ejecución de consultas SQL y carga de resultados en pandas.DataFrame.
	
•	Exploración y visualización de datos obtenidos con SQL.
	
•	Creación de tablas y bases de datos desde Python.
	
•	Inserción y actualización de registros:
	
•	Insertar filas simples con SQL.
	
•	Insertar masivamente desde un DataFrame usando to_sql.
	
•	Uso de sqlite3, SQLAlchemy y otros conectores como ejemplos.

El objetivo es mostrar que el RDBMS administra la data, pero el uso analítico y de negocio suele hacerse desde otro lenguaje (en este curso: Python).

⸻

🧪 6. Asignaciones y prácticas

El curso incluye varias actividades para fijar los conceptos:

🧩 6.1. Creación de una base de datos y modelo estrella

•	Diseñar una base de datos temática (según el interés del estudiante).
•	Crear:

•	1 tabla de hecho

•	2 tablas de dimensión

•	Insertar al menos 10 filas en cada tabla.

•	Aplicar comandos:

•	DDL (CREATE, DROP, ALTER, TRUNCATE, RENAME)

•	DML (INSERT, UPDATE, DELETE)

•	DCL (GRANT, REVOKE)

•	TCL (COMMIT)

📊 6.2. Práctica DQL (consultas)

Ejercicios sobre una base de datos de ejemplo (tipo Sakila u otra base didáctica):

•	Consultas simples (SELECT * FROM ...).

•	Selección de columnas específicas.

•	Filtros con WHERE.

•	Distintos valores con DISTINCT.

•	Agregaciones con GROUP BY y HAVING.

•	Ordenamientos con ORDER BY.

•	Límites con LIMIT.

•	Consultas con condiciones temporales (last_update, etc.).

•	Consultas con JOIN para combinar tablas (opcional, pero recomendado).

Incluye tanto preguntas teóricas como ejercicios de codificación.

⸻

📚 7. Temas de exploración adicional

Para fomentar la investigación y profundización, se proponen temas para mini-presentaciones y ejemplos:

•	JOIN (INNER, LEFT, RIGHT, FULL).

•	Subqueries / subconsultas.

•	CONSTRAINTS (PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, etc.).

•	Vistas y tablas temporales.

•	Indexación en SQL.

•	Funciones de ranking (ROW_NUMBER, RANK, DENSE_RANK).

•	Uso de IA y asistentes que generan código SQL.

Cada tema incluye:

•	Una presentación breve (≤ 8 minutos).

•	Uno o varios ejemplos SQL.

⸻

⚙️ 8. Cómo usar este repositorio

Una posible forma de trabajar con este repo:

1.	Leer las presentaciones en orden:
	•	0. Bases de datos
	•	1. SQL: consultas
	•	2. SQL + Python

2.	Reproducir los ejemplos SQL en tu RDBMS preferido (PostgreSQL, MySQL, SQL Server, etc.).

3.	Resolver las asignaciones:
	•	Crear tu propia base de datos en modelo estrella.
	•	Desarrollar las consultas DQL propuestas.
	
4.	Implementar los ejemplos en Python:
	•	Conectar a una base de datos.
	•	Ejecutar SELECT, INSERT, UPDATE.
	•	Cargar resultados en pandas para analizarlos.

6.	Opcional: preparar una mini-presentación de uno de los temas avanzados (JOIN, subconsultas, constraints, vistas, etc.).



