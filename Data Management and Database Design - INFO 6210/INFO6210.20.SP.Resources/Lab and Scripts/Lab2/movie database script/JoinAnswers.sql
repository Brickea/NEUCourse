-- Note: #number represents a new question, options a b c represent the same ways of doing those questions

#1
-- Write a query in SQL to compute a report which contain the genres of those movies 
-- with their average time and number of movies for each genres.
SELECT gen_title, AVG(mov_time), COUNT(gen_title) 
FROM movie
NATURAL JOIN  movie_genres
NATURAL JOIN  genres
GROUP BY gen_title;

#2
-- Write a query in SQL to list all the actors who have not acted in any movie between 1990 and 2000
-- solution a
SELECT act_fname, act_lname, mov_title, mov_year
FROM actor
JOIN movie_cast 
ON actor.act_id=movie_cast.act_id
JOIN movie 
ON movie_cast.mov_id=movie.mov_id
WHERE mov_year NOT BETWEEN 1990 and 2000;

-- short hand solution
SELECT a.act_fname, a.act_lname, c.mov_title, c.mov_year
FROM actor a, movie_cast b, movie c
WHERE a.act_id=b.act_id
AND b.mov_id=c.mov_id
AND c.mov_year NOT BETWEEN 1990 and 2000;

#3
-- Write a query in SQL to list the first and last names of all the actors who were cast in the movie 
-- 'Annie Hall', and the roles they played in that production.

SELECT act_fname,act_lname,role
  FROM actor 
	  JOIN movie_cast ON actor.act_id=movie_cast.act_id
		JOIN movie ON movie_cast.mov_id=movie.mov_id 
		  AND movie.mov_title='Annie Hall';
          
-- Write a query in SQL to find all the years which produced a movie that received a rating of 3 or 4, 
-- and sort the result in increasing order.
-- a
SELECT mov_year
FROM movie
INNER JOIN rating 
ON movie.mov_id = rating.mov_id
WHERE rev_stars IN (3, 4)
ORDER BY mov_year;

-- b
SELECT DISTINCT mov_year
FROM movie, rating
WHERE movie.mov_id = rating.mov_id 
AND rev_stars IN (3, 4)
ORDER BY mov_year;

-- c
SELECT DISTINCT mov_year
FROM movie
INNER JOIN rating USING(mov_id)
WHERE rev_stars IN (3,4)
ORDER BY mov_year;

#4
-- Write a query in SQL to find the first and last name of an actor with their role in 
-- the movie which was also directed by themselves
SELECT act_fname, act_lname, mov_title, role
FROM actor
JOIN movie_cast 
  ON actor.act_id=movie_cast.act_id
JOIN movie_direction 
  ON movie_cast.mov_id=movie_direction.mov_id
JOIN director 
  ON movie_direction.dir_id=director.dir_id
JOIN movie 
  ON movie.mov_id=movie_direction.mov_id
WHERE act_fname=dir_fname 
  AND act_lname=dir_lname;
  
-- Write a query in SQL to generate a report which contain the columns movie title, name of the 
-- female actor, year of the movie, role, movie genres, 
-- the director, date of release, and rating of that movie.

SELECT mov_title, act_fname, act_lname, 
mov_year, role, gen_title, dir_fname, dir_lname, 
mov_dt_rel, rev_stars
FROM movie 
NATURAL JOIN movie_cast
NATURAL JOIN actor
NATURAL JOIN movie_genres
NATURAL JOIN genres
NATURAL JOIN movie_direction
NATURAL JOIN director
NATURAL JOIN rating
WHERE act_gender='F';

-- Incase you wanna practise one on your own, try this one:
####
-- Write a query in SQL to generate a report which shows the year when most of the Mystery movies produces, 
-- and number of movies and their average rating.

-- Write a query in SQL to find the year when the movie American Beauty released.
SELECT mov_year
FROM movie
WHERE mov_title='American Beauty';

-- Write a query in SQL to list all the movies which 
-- released in the country other than UK.
SELECT mov_title, mov_year, mov_time, 
mov_dt_rel AS Date_of_Release, 
mov_rel_country AS Releasing_Country
FROM movie
WHERE mov_rel_country<>'UK';

-- Write a query in SQL to return the name of all reviewers
-- and name of movies together in a single list.
SELECT reviewer.rev_name
FROM reviewer
UNION
(SELECT movie.mov_title
FROM movie);

-- easy join:
-- Write a query in SQL to find the name of all 
-- reviewers who have rated 7 or more stars to their rating.
SELECT reviewer.rev_name
FROM reviewer, rating
WHERE rating.rev_id = reviewer.rev_id
AND rating.rev_stars>=7 
AND reviewer.rev_name IS NOT NULL;