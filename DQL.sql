USE practice_db;

-- 1) Select Query
SELECT * FROM my_students;   -- Fetch all the data in the TABLE

-- Select specific columns
SELECT first_name,email_id
FROM my_students;

-- 2)Where clause
SELECT first_name,last_name,enrollment_date
FROM my_students
WHERE enrollment_date > '2024-01-01';  -- Fetch sutdents name enrolled after specific date

SELECT * FROM my_students;

-- 3)Logical operators

SELECT first_name, last_name, enrollment_date
FROM my_students
WHERE enrollment_date BETWEEN '2025-10-24' AND '2025-10-28';

-- 4)OrderBy

SELECT first_name, last_name, enrollment_date 
FROM my_students 
ORDER BY enrollment_date DESC; -- Fetch students names by enrollment_date in descending order

-- 5)Limit
SELECT first_name, last_name 
FROM my_students
LIMIT 2;    -- Fetch the first 2 rows

-- 6)Aggregation with groupby
SELECT enrollment_date, COUNT(*) AS total_students 
FROM my_students 
GROUP BY enrollment_date;   -- count the  number of students by enrollment date

-- Common Aggregate Functions:
-- COUNT(): Counts the number of rows.
-- SUM(): Adds up values.
-- AVG(): Calculates the average.
-- MAX(): Finds the maximum value.
-- MIN(): Finds the minimum value.

ALTER TABLE my_students
ADD Marks INT;

SELECT * FROM my_students;

-- Updating multiple rows
UPDATE my_students
SET marks = CASE
    WHEN student_id = 2 THEN 35
    WHEN student_id = 3 THEN 45
    WHEN student_id = 4 THEN 75
    WHEN student_id = 1 THEN 67
    WHEN student_id = 5 THEN 74
    ELSE marks
END
WHERE student_id IN (1,2,3,4,5);


SELECT * FROM my_students;

-- More aggregate functions
SELECT sum(marks) AS total_sumofmarks
FROM my_students;

SELECT avg(marks) AS avergeMark
FROM my my_students;

SELECT min(marks) AS minMark
FROM my_students;

SELECT max(marks) AS maxMark
FROM my_students;

-- Combined Aggregations
SELECT 
    SUM(marks) AS total_mark,
    AVG(marks) AS average_mark,
    MIN(marks) AS min_mark,
    MAX(marks) AS max_mark
FROM my_students;

SELECT 
    SUM(marks) AS total_mark,
    AVG(marks) AS average_markr,
    MIN(marks) AS min_mark,
    MAX(marks) AS max_mark
FROM my_students
GROUP BY student_id;

-- HAVING Clause
-- Fetch enrollment dates with more than 2 students
SELECT enrollment_date, COUNT(*) AS total_students 
FROM my_students 
GROUP BY enrollment_date 
HAVING total_students > 2;





