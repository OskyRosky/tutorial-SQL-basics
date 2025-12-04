#####################################################################################################
######                             SQL: Consulta base o el DQL                                 ######
#####################################################################################################

###############
#    SELECT   #  Selección de las columnas 
###############

# Seleciono una variable

SELECT city 
FROM sakila.city 
LIMIT 10;

# Seleciono dos o más variable

SELECT city, country_id
FROM sakila.city 
LIMIT 10;

# Seleciono todas las variables

SELECT *
FROM sakila.city 
LIMIT 10;

# Seleciono todas las variables pero de otra tabla

SELECT * 
FROM sakila.actor
LIMIT 10;

# Cambio del nombre de la variable en la consulta

SELECT country_id, city as Ciudad
FROM sakila.city 
LIMIT 10;

###############
#    FROM     #  Selección de la o las tablas 
###############

# Selección de la información de la tabla actor 

SELECT * 
FROM sakila.actor;

# Selección a partir de varias tablas con los JOIN

SELECT sakila.actor.first_name, sakila.actor.last_name, sakila.film.title
FROM sakila.actor
JOIN sakila.film_actor ON sakila.actor.actor_id = sakila.film_actor.actor_id
JOIN sakila.film ON sakila.film_actor.film_id = sakila.film.film_id;

###############
#    WHERE     #  Filtrar en los registros a las filas de las tablas
###############

# Uso básico del Where

SELECT * 
FROM sakila.actor 
WHERE first_name = 'PENELOPE';

# WHERE con operadores lógicos (AND, OR)

SELECT * 
FROM sakila.actor 
WHERE first_name = 'PENELOPE' AND last_name = 'GUINESS';

# WHERE con comparaciones numéricas:

SELECT * 
FROM sakila.film 
WHERE rental_rate > 2.00;

# WHERE con operador NOT:

SELECT * 
FROM sakila.film 
WHERE NOT rental_rate = 2.99;

# WHERE con operador IN:

SELECT * 
FROM sakila.film 
WHERE rental_rate IN (0.99, 2.99, 4.99);

# WHERE con operador BETWEEN:

SELECT * 
FROM sakila.film 
WHERE rental_duration BETWEEN 3 AND 5;

# WHERE con operador LIKE (búsqueda de patrones):

SELECT * 
FROM sakila.actor 
WHERE last_name LIKE 'JOH%';

# WHERE con operador IS NULL o IS NOT NULL:

SELECT * 
FROM sakila.address 
WHERE postal_code IS NULL;

# WHERE con operador EXISTS:

SELECT * 
FROM sakila.film 
WHERE EXISTS 
	(SELECT * FROM sakila.inventory 
     WHERE sakila.film.film_id = sakila.inventory.film_id);
     
     
###############
#   GROUP BY  #   Agrupar filas que tienen los mismos valores en columnas especificadas
###############   GROUP BY es sinonimo de medidas de resumen

#  Uso básico

SELECT country_id, COUNT(*) 
FROM sakila.city 
GROUP BY country_id;

#  GROUP BY con COUNT:

SELECT rating, COUNT(*) 
FROM sakila.film 
GROUP BY rating;

# GROUP BY con SUM:

SELECT rating, SUM(rental_duration) as SUMA
FROM sakila.film 
GROUP BY rating;

# GROUP BY con AVG:

SELECT rating, AVG(rental_rate) AS Promedio
FROM sakila.film GROUP BY rating;

# GROUP BY con MAX y MIN:

SELECT rating, MAX(rental_rate), MIN(rental_rate) 
FROM sakila.film 
GROUP BY rating;

# GROUP BY con múltiples columnas:

SELECT rating, language_id, COUNT(*) 
FROM sakila.film 
GROUP BY rating, language_id;

# GROUP BY con funciones de cadena:

SELECT LEFT(title, 1) as initial, COUNT(*) 
FROM sakila.film 
GROUP BY LEFT(title, 1);

# GROUP BY con expresiones:

SELECT rental_rate * rental_duration as rate_duration, COUNT(*) 
FROM sakila.film 
GROUP BY rental_rate * rental_duration;

###############
#   HAVING    #   filtrar los resultados de una consulta después de que se haya aplicado la agrupación con GROUP BY
###############   
     
#      Uso básico de HAVING:
     
SELECT country_id, COUNT(*) 
FROM sakila.city 
GROUP BY country_id 
HAVING COUNT(*) > 5;

# HAVING con operadores lógicos (AND, OR):

SELECT rating, COUNT(*) 
FROM sakila.film 
GROUP BY rating 
HAVING COUNT(*) > 10 AND COUNT(*) < 50;

#   HAVING con operador NOT:

SELECT rating, COUNT(*) 
FROM sakila.film 
GROUP BY rating 
HAVING NOT COUNT(*) = 10;
  
# HAVING con operador BETWEEN:

SELECT rating, COUNT(*) 
FROM sakila.film 
GROUP BY rating 
HAVING COUNT(*) BETWEEN 10 AND 50;

# HAVING con SUM:

SELECT language_id, SUM(length) 
FROM sakila.film 
GROUP BY language_id 
HAVING SUM(length) > 10000;

# HAVING con AVG:

SELECT language_id, AVG(length) 
FROM sakila.film 
GROUP BY language_id 
HAVING AVG(length) > 120;

# HAVING con MAX y MIN:

SELECT language_id, MAX(length), MIN(length) 
FROM sakila.film 
GROUP BY language_id 
HAVING MAX(length) > 180;

# HAVING con funciones de cadena:

SELECT LEFT(title, 1) as initial, COUNT(*) 
FROM sakila.film 
GROUP BY LEFT(title, 1) 
HAVING initial = 'A';

# HAVING con múltiples condiciones:

SELECT language_id, AVG(length), COUNT(*) 
FROM sakila.film 
GROUP BY language_id 
HAVING AVG(length) > 120 AND COUNT(*) > 10;

# HAVING con subconsulta:

SELECT category_id, COUNT(*) 
FROM sakila.film_category 
GROUP BY category_id 
HAVING COUNT(*) > 
				(SELECT AVG(count_film) 
					FROM (SELECT COUNT(*) as count_film 
							FROM sakila.film_category 
                            GROUP BY category_id) as subquery)
;

###############
#   ORDER BY  #   ordenar los resultados de una consulta en función de una o más columnas
###############   

# Ordenación básica

SELECT * 
FROM sakila.film 
ORDER BY title;


# Ordenación descendente

SELECT * 
FROM sakila.film 
ORDER BY rental_rate DESC;

# Ordenación por múltiples columnas

SELECT * 
FROM sakila.film 
ORDER BY rental_rate DESC, length ASC;

# Ordenación con funciones

SELECT * 
FROM sakila.film 
ORDER BY LENGTH(title) DESC;

# Ordenación con expresiones

SELECT title, rental_rate * (1 + rental_duration) AS total_cost 
FROM sakila.film 
ORDER BY total_cost DESC;

###############
#    LIMIT    #  restringir el número de filas que se recuperan en el resultado de una consulta  
###############        

# Limitación básica:

SELECT * 
FROM sakila.film 
LIMIT 10;

# Limitación con OFFSET:

SELECT * 
FROM sakila.film 
LIMIT 5 OFFSET 10;

# Limitación con ORDER BY:

SELECT * 
FROM sakila.film 
ORDER BY rental_rate DESC 
LIMIT 5;

# Limitación con agrupación:

SELECT rating, COUNT(*) 
FROM sakila.film 
GROUP BY rating 
LIMIT 3;

# Limitación con subconsulta:

SELECT * 
FROM (
		SELECT * 
        FROM sakila.film 
        ORDER BY rental_rate DESC LIMIT 10) AS subquery 
LIMIT 5;
