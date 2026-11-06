CREATE DATABASE NetflixDB;

USE NetflixDB;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    registration_date DATE NOT NULL,
    plan ENUM('Basic', 'Standard', 'Premium') DEFAULT 'Basic'
);

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    genre VARCHAR(100) NOT NULL,
    release_year YEAR NOT NULL,
    rating DECIMAL(3, 1) NOT NULL
);

CREATE TABLE WatchHistory (
    watch_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    watched_date DATE NOT NULL,
    completion_percentage INT CHECK (completion_percentage >= 0 AND completion_percentage <= 100),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    user_id INT,
    review_text TEXT,
    rating DECIMAL(2, 1) CHECK (rating >= 0 AND rating <= 5),
    review_date DATE NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Users (name, email, registration_date, plan) 
VALUES
('John Doe', 'john.doe@example.com', '2024-01-10', 'Premium'),
('Jane Smith', 'jane.smith@example.com', '2024-01-15', 'Standard'),
('Alice Johnson', 'alice.johnson@example.com', '2024-02-01', 'Basic'),
('Bob Brown', 'bob.brown@example.com', '2024-02-20', 'Premium');

INSERT INTO Movies (title, genre, release_year, rating) 
VALUES
('Stranger Things', 'Drama', 2016, 8.7),
('Breaking Bad', 'Crime', 2008, 9.5),
('The Crown', 'History', 2016, 8.6),
('The Witcher', 'Fantasy', 2019, 8.2),
('Black Mirror', 'Sci-Fi', 2011, 8.8);

INSERT INTO WatchHistory (user_id, movie_id, watched_date, completion_percentage) 
VALUES
(1, 1, '2024-02-05', 100),
(2, 2, '2024-02-06', 80),
(3, 3, '2024-02-10', 50),
(4, 4, '2024-02-15', 100),
(1, 5, '2024-02-18', 90);

INSERT INTO Reviews (movie_id, user_id, review_text, rating, review_date) 
VALUES
(1, 1, 'Amazing storyline and great characters!', 4.5, '2024-02-07'),
(2, 2, 'Intense and thrilling!', 5.0, '2024-02-08'),
(3, 3, 'Good show, but slow at times.', 3.5, '2024-02-12'),
(4, 4, 'Fantastic visuals and acting.', 4.8, '2024-02-16');

-- 1. List all users subscribed to the Premium plan:
SELECT name, email
FROM users
WHERE plan = 'premium';

-- 2. Retrieve all movies in the Drama genre with a rating higher than 8.5:
SELECT title 
FROM movies 
WHERE genre = 'Drama' and rating > 8.5;

-- 3. Find the average rating of all movies released after 2015:
SELECT AVG(rating) as Average_Ratings
FROM movies 
WHERE release_year > 2015;

-- 4. List the names of users who have watched the movie Stranger Things along with their completion percentage:
SELECT U.name, WH.completion_percentage
FROM users U
JOIN watchhistory WH ON U.user_id = WH.user_id
JOIN movies M ON M.movie_id = WH.movie_id
WHERE M.title = 'Stranger Things';

-- 5. Find the name of the user(s) who rated a movie the highest among all reviews:
SELECT U.name
FROM users U 
JOIN reviews R ON U.user_id = R.user_id
WHERE rating = (SELECT MAX(rating) FROM Reviews);


-- 6. Calculate the number of movies watched by each user and sort by the highest count:
SELECT U.name, COUNT(W.watch_id) AS movies_watched 
FROM Users U 
JOIN WatchHistory W ON U.user_id = W.user_id 
GROUP BY U.user_id 
ORDER BY movies_watched DESC;

-- 7.List all movies watched by John Doe, including their genre, rating, and his completion percentage:
SELECT M.title, M.genre,M.rating, WH.completion_percentage
FROM movies M 
JOIN watchhistory WH ON M.movie_id = WH.movie_id
JOIN users U ON U.user_id = WH.user_id
WHERE U.name = 'John Doe';

-- 8.Update the movie's rating for Stranger Things:
UPDATE movies
SET Rating = 9.0 
WHERE title = 'Stranger Things';

SELECT * FROM movies;   -- Checking 

-- 9.Remove all reviews for movies with a rating below 4.0
DELETE FROM Reviews
WHERE movie_id IN (SELECT movie_id FROM Movies WHERE rating < 4.0);

-- 10. Fetch all users who have reviewed a movie but have not watched it completely (completion percentage < 100):
SELECT U.name, M.title, R.review_text 
FROM Users U
JOIN Reviews R ON U.user_id = R.user_id
JOIN Movies M ON R.movie_id = M.movie_id
LEFT JOIN WatchHistory W ON U.user_id = W.user_id AND M.movie_id = W.movie_id
WHERE (W.completion_percentage IS NULL OR W.completion_percentage < 100);

-- 11. List all movies watched by John Doe along with their genre and his completion percentage:
SELECT M.title,M.genre,WH.completion_percentage
FROM movies M 
JOIN watchhistory WH ON M.movie_id = WH.movie_id
JOIN users U ON U.user_id = WH.user_id
WHERE U.name = 'John Doe';

-- 12.Retrieve all users who have reviewed the movie Stranger Things, including their review text and rating:
SELECT U.name, R.review_text, R.rating
FROM Users U 
JOIN reviews R ON U.user_id = R.user_id
JOIN movies M ON R.movie_id = M.movie_id 
WHERE M.title = 'stranger Things';

-- 13. Fetch the watch history of all users, including their name, email, movie title, genre, watched date, and completion percentage:
SELECT U.name,U.email,M.title,M.genre,WH.watched_date,WH.completion_percentage
FROM users U 
JOIN watchhistory WH ON U.user_id = WH.user_id
JOIN movies M ON WH.movie_id = M.movie_id;

-- 14.List all movies along with the total number of reviews and average rating for each movie, including only movies with at least two reviews:
SELECT M.title,AVG(R.rating) AS Average_Rating, COUNT(R.review_id) AS Number_Of_Reviews
FROM movies M 
JOIN reviews R ON M.movie_id = R.movie_id
GROUP BY M.movie_id
HAVING COUNT(R.review_id) >= 2;
