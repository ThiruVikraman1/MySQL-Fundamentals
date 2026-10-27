USE practice_db;
SELECT * FROM my_students;

START TRANSACTION;

-- Insert a new student
INSERT INTO my_students (first_name, last_name, email_id, enrollment_date,Phone_number) 
VALUES ('Anna', 'Taylor', 'anna.taylor@example.com', '2024-11-16',7635827);

-- Savepoint before update
SAVEPOINT before_updates;

-- Update email of a student
UPDATE my_students 
SET email_id = 'invalid.email@example.com' 
WHERE student_id = 2;

-- Rollback to the savepoint
ROLLBACK TO before_updates;

-- Commit changes
COMMIT;

-- Set constrains
SET FOREIGN_KEY_CHECKS = 0;

-- Perform operations that violate constraints
DELETE FROM my_students WHERE student_id = 6;

SELECT * FROM my_students;
SET FOREIGN_KEY_CHECKS = 1;

