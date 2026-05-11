-- 1. Titles of all movies from 2008
SELECT title
FROM movies
WHERE year = 2008;

-- 2. Birth year of Emma Stone
SELECT birth
FROM people
WHERE name = 'Emma Stone';

-- 3. Titles of all movies since 2018, in alphabetical order
SELECT title
FROM movies
WHERE year >= 2018
ORDER BY title;

-- 4. Number of movies with a 10.0 rating
SELECT COUNT (*)
FROM ratings
WHERE rating = 10.0;

-- 5. Titles and years of all Harry Potter movies, in chronological order (title beginning with "Harry Potter and the ...")
SELECT title, year
FROM movies
WHERE title LIKE '%Harry Potter and the%'
ORDER BY year;

-- 6. Average rating of movies in 2012
SELECT AVG(ratings.rating)
FROM movies
JOIN ratings ON movies.id = ratings.movie_id
WHERE year = 2012;

-- 7. All movies and ratings from 2010, in decreasing order by rating (alphabetical for those with same rating)
SELECT title,rating
FROM movies
JOIN ratings ON movies.id = ratings.movie_id
WHERE year = 2010
ORDER BY rating DESC, title ASC;

-- 8. Names of people who starred in Toy Story
SELECT name
FROM people
WHERE id IN (
SELECT person_id
FROM stars
WHERE movie_id IN (
SELECT id
FROM movies
WHERE title = 'Toy Story'));

-- 9. Names of all people who starred in a movie released in 2004, ordered by birth year
SELECT DISTINCT people.id, name
FROM people
JOIN stars ON people.id = stars.person_id
JOIN movies ON stars.movie_id = movies.id
WHERE year = 2004
ORDER BY birth;

-- 10. Names of all directors who have directed a movie that got a rating of at least 9.0
SELECT DISTINCT name
FROM people
JOIN directors ON people.id = directors.person_id
JOIN movies ON directors.movie_id = movies.id
JOIN ratings ON ratings.movie_id = movies.id
WHERE rating >= 9.0;

-- 11. Titles of the five highest rated movies (in order) that Chadwick Boseman starred in, starting with the highest rated
SELECT title
FROM movies
WHERE id IN (
    SELECT movie_id
    FROM stars
    WHERE person_id = (
        SELECT id
        FROM people
        WHERE name = 'Chadwick Boseman'
    )
)
ORDER BY (
    SELECT rating
    FROM ratings
    WHERE ratings.movie_id = movies.id
) DESC, title ASC
LIMIT 5;

-- 12. Titles of all of movies in which both Jennifer Lawrence and Bradley Cooper starred
SELECT title
FROM movies
WHERE id IN (
    SELECT movie_id
    FROM stars
    WHERE person_id = (
        SELECT id
        FROM people
        WHERE name = 'Bradley Cooper'
    )
)
AND id IN(
    SELECT movie_id
    FROM stars
    WHERE person_id = (
        SELECT id
        FROM people
        WHERE name = 'Jennifer Lawrence'
    )
);

-- 13. Names of all people who starred in a movie in which Kevin Bacon also starred
SELECT DISTINCT name
FROM people
JOIN stars ON people.id = stars.person_id
WHERE stars.movie_id IN (
    SELECT stars.movie_id
    FROM stars
    JOIN  people ON stars.person_id = people.id
    WHERE name = 'Kevin Bacon' AND birth = 1958
)
AND people.name != 'Kevin Bacon';
