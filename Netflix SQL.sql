CREATE TABLE netflix_titles (
    show_id VARCHAR(20),
    type VARCHAR(20),
    title TEXT,
    director TEXT,
    "cast" TEXT,
    country TEXT,
    date_added DATE,
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(50),
    listed_in TEXT,
    description TEXT
);

SELECT COUNT(*)
FROM netflix_titles;


-- Check total number of records

SELECT COUNT(*) AS total_records
FROM netflix_titles;


-- Display First 5 Records

SELECT *
FROM netflix_titles
LIMIT 5;

-- Count Movies and TV Shows Analysis

SELECT type,
       COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY type;

-- Top Countries by Number of Titles
-- Top 10 Countries Producing Netflix Content
SELECT country,
       COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;

-- Most Common Content Ratings
-- Rating Distribution
SELECT rating,
       COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY rating
ORDER BY total_titles DESC;

-- Number of Titles Released Per Year
-- Content released 
SELECT release_year,
       COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year;


-- Most Popular Netflix Genres
-- Top Genres
SELECT listed_in,
       COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY listed_in
ORDER BY total_titles DESC
LIMIT 10;

-- Oldest Content on netflix

SELECT title,
       release_year
FROM netflix_titles
ORDER BY release_year ASC
LIMIT 10;

-- Newest Content On Netflix

SELECT title,
       release_year
FROM netflix_titles
ORDER BY release_year DESC
LIMIT 10;

-- Number of Movies

SELECT COUNT(*) AS total_movies
FROM netflix_titles
WHERE type = 'Movie';

-- Number of TV Shows

SELECT COUNT(*) AS total_tv_shows
FROM netflix_titles
WHERE type = 'TV Show';

-- Top Movie Ratings

SELECT rating,
       COUNT(*) AS total_movies
FROM netflix_titles
WHERE type = 'Movie'
GROUP BY rating
ORDER BY total_movies DESC;

-- Content Added to Netflix each Year

SELECT EXTRACT(YEAR FROM date_added) AS year_added,
       COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY year_added
ORDER BY year_added;