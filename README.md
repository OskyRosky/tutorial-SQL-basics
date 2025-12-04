# 🧮 Tutorial SQL  

**Fundamentos de Bases de Datos, Consultas en SQL y Uso con Python**

Este repositorio contiene el material del curso **SQL**, enfocado en:

- Entender qué es una base de datos y por qué es clave en ciencia de datos.  
- Dominar las consultas en SQL (DQL) para extraer información.  
- Conocer los principales comandos SQL (DDL, DML, DCL, TCL).  
- Integrar SQL con **Python** para visualizar, crear e insertar datos.  
- Practicar con ejercicios teóricos y prácticos de nivel profesional.

Está pensado para estudiantes, analistas, programadores y científicos de datos que quieran usar SQL como herramienta base en sus proyectos.

 ![class](/ima/ima1.jpg)

---

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
