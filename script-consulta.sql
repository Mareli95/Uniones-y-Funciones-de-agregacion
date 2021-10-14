# ---------------------------
# MICRODESAFÍO 1
# ---------------------------
/*Utilizando la base de datos de películas queremos conocer, por un lado, los títulos y el
nombre del género de todas las series de la base de datos. Por otro, necesitamos listar los
títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada
uno de ellos.*/

/* Series: Títulos,nombre de género de todas las series de la base de datos*/
SELECT * FROM genres;
SELECT * FROM series;

SELECT series.title, genres.name 
FROM series
INNER JOIN genres ON series.genre_id = genres.id;

/* Episodios: titulos de episodios, junto con nombre y apellido de los actores que trabajan en ellos*/
select * from episodes;
SELECT * FROM actor_episode;
SELECT * FROM actors;

SELECT episodes.title,CONCAT (actors.first_name, ' ', actors.last_name) AS actor
FROM episodes
INNER JOIN actor_episode ON  actor_episode.episode_id = episodes.id
INNER JOIN actors ON actor_episode.actor_id=actors.id;
# ---------------------------
# FIN MICRODESAFÍO 1
# ---------------------------
# ---------------------------
# MICRODESAFÍO 2
# ---------------------------
/*Para nuestro próximo desafío necesitamos obtener a todos los actores o actrices (mostrar
nombre y apellido) que han trabajado en cualquier película de la saga de la Guerra de las
galaxias, pero ¡cuidado!: debemos asegurarnos de que solo se muestre una sola vez cada
actor/actriz.*/

SELECT * FROM actor_movie;
SELECT * FROM movies;
SELECT * FROM actors;

SELECT DISTINCT CONCAT(actors.first_name, ' ', actors.last_name) AS Actor, movies.title
FROM actors
INNER JOIN actor_movie
ON actors.id=actor_movie.id
INNER JOIN movies
ON actor_movie.movie_id=movies.id
WHERE movies.title LIKE '%galaxias%';

# ---------------------------
# FIN MICRODESAFÍO 2
# ---------------------------
# ---------------------------
#MICRODESAFÍO 3
# ---------------------------
/*Debemos listar los títulos de cada película con su género correspondiente. En el caso de
que no tenga género, mostraremos una leyenda que diga "no tiene género". Como ayuda
podemos usar la función COALESCE() que retorna el primer valor no nulo de una lista.*/

select * from movies;
select * from genres;

SELECT  movies.title AS Pelicula,  COALESCE(genres.name, 'no tiene género') AS Genero
FROM movies
LEFT JOIN genres ON genres.id = movies.genre_id;
# ---------------------------
# FIN MICRODESAFÍO 3
# ----------------------------
# ----------------------------
# MICRODESAFÍO 4
# ----------------------------
/*Necesitamos mostrar, de cada serie, la cantidad de días desde su estreno hasta su fin, con
la particularidad de que a la columna que mostrará dicha cantidad la renombraremos:
“Duración”.*/

select * from series;
SELECT title ,DATEDIFF(end_date, release_date) AS Duración 
FROM series; 
# ---------------------------
# FIN MICRODESAFÍO 4
# ----------------------------
# ----------------------------
# MICRODESAFÍO 5
# ----------------------------
SELECT * FROM actors;
-- Actores ordenados alfábeticamente cuyo nombre sea mayor a 6 carácteres
SELECT first_name FROM actors WHERE LENGTH(first_name)> 6 ORDER BY first_name ASC;

-- Cantidad total de todos los episodios guardados en la base de datos;
SELECT COUNT(*) FROM episodes; 

-- Título de todas las series y total de temporadas que tiene cada una de ellas
select * from series;
select * from seasons;

select series.title, max(seasons.number) AS 'Temporadas'
from series
inner join seasons on series.id = seasons.serie_id
group by series.title;

-- Mostrar, por cada género, la cantidad total de películas que posee, siempre que sea mayor o igual a 3.
SELECT genres.name , COUNT(movies.title)
FROM genres
INNER JOIN movies ON genres.id = movies.genre_id
GROUP BY genres.name
HAVING COUNT(movies.title) >=3;

SELECT genres.name, count(genres.name) FROM movies INNER JOIN genres ON genres.id = genre_id GROUP BY genres.name HAVING count(genres.name) >= 3;



