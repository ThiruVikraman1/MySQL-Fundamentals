-- 1) Creating a database
CREATE DATABASE Practice_DB;
USE practice_db;
SHOW DATABASES;    -- Displays all the databases

-- 2) Creating a Table  
CREATE TABLE Students(
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email_id VARCHAR(100) UNIQUE,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
SELECT * FROM students;  -- selects the entire data from the table  

-- Add extra column in the TABLE
ALTER TABLE students
ADD Phone_numbers INT(10);

-- delete column
ALTER TABLE students
DROP COLUMN Phone_numbers;

SELECT * FROM students;

-- modify table  
ALTER TABLE students
MODIFY last_name VARCHAR(50) NOT NULL,
MODIFY Phone_number INT(10);

-- Changing table name
ALTER TABLE students
RENAME MY_Students;

SELECT * FROM MY_Students;

-- 3) new table 
CREATE TABLE Courses(
    course_id,
    course_name VARCHAR(50) UNIQUE NOT NULL,
    credits INT CHECK (credits between 1 and 5)
);

ALTER TABLE courses
MODIFY course_id INT AUTO_INCREMENT PRIMARY KEY;

-- Creating table with foreign key 
CREATE TABLE Enrollments(
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES my_students(student_id),
    FOREIGN KEY (course_id)  REFERENCES Courses(course_id)
)

-- remove all the rows from the table 
-- TRUNCATE TABLE Table_name