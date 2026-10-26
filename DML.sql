USE practice_db;


-- 1) Insert values in the columns
INSERT into my_students (first_name,last_name,email_id,enrollment_date)
VALUES('Thiru','Vikraman','thiruvikraman2211@gmail.com','2025-10-11');

SELECT * FROM my_students;

-- Inserting multiple rows data 
INSERT into my_students (first_name,last_name,email_id,enrollment_date)
VALUES
('Vikram','K','vikram2211@gmail.com','2025-11-9'),
('Hari','Haran','hariharan2211@gmail.com','2025-1-25');

SELECT * FROM my_students;

-- 2)Updating the data  
UPDATE my_students
SET Phone_number = 888
WHERE student_id = 1;

UPDATE my_students
SET Phone_number = 866800416
WHERE student_id = 2;

UPDATE my_students
SET Phone_number = 8889854
WHERE student_id = 1;


UPDATE my_students
SET Phone_number = 88898542
WHERE student_id = 3;

SELECT * FROM my_students;

-- 3) Update multiple columns 

SET SQL_SAFE_UPDATES = 0;

UPDATE my_students
SET last_name ='karthick', email_id ='vikramkarthick@gmail.com'
where first_name = 'Vikram';

-- Update all rows 
UPDATE my_students
SET enrollment_date = '2025-10-25';

INSERT into my_students (first_name,last_name,email_id,enrollment_date,Phone_number)
VALUES
('Max','Verstappen','maxver@gmail.com','2024-11-12',33333333),
('kimi','antonelli','kimi2211@gmail.com','2024-11-12',889988);

CREATE TABLE archived_students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,  
    first_name VARCHAR(50) NOT NULL,            
    last_name VARCHAR(50),                      
    email VARCHAR(100) UNIQUE,                 
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP   
);

INSERT INTO archived_students (student_id, first_name, last_name, email, enrollment_date)
SELECT student_id, first_name, last_name, email_id, enrollment_date
FROM my_students
WHERE enrollment_date = '2024-11-12';

SELECT* FROM my_students;

SELECT* FROM archived_students;










-- 2)Updating the data  