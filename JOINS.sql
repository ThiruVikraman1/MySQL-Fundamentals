USE practice_db;

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES my_students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


SELECT * FROM my_students;
SELECT * FROM courses;
SELECT * FROM enrollments;

Insert into courses (course_id,course_name,credits)
values (101,"AI",3),
(102,"ML",2),
(103,"DL",3);

insert into enrollments(enrollment_id,student_id,course_id)
values(1,1, 101),
       (2,2, 102),  
       (3,3, 103);

-- inner joins
-- Fetch students and their associated course names
SELECT my_students.first_name, my_students.last_name, courses.course_name ,courses.course_id,my_students.student_id
FROM my_students 
INNER JOIN enrollments ON my_students.student_id = enrollments.student_id
INNER JOIN courses ON enrollments.course_id = courses.course_id;

-- left joins
-- Fetch all students, including those not enrolled in any course
SELECT my_students.first_name, courses.course_name 
FROM my_students 
LEFT JOIN enrollments ON my_students.student_id = enrollments.student_id 
LEFT JOIN courses ON enrollments.course_id = courses.course_id;


-- Right Joins
SELECT my_students.student_id, first_name
FROM my_students
RIGHT JOIN enrollments
ON my_students.student_id = enrollments.student_id;

-- Natural Join
SELECT * FROM my_students
NATURAL JOIN enrollments;

-- Full join
SELECT my_students.first_name, my_students.last_name,my_students.student_id, enrollments.course_id
FROM my_students
LEFT JOIN enrollments ON my_students.student_id = enrollments.student_id 

UNION

SELECT my_students.first_name, my_students.last_name,my_students.student_id, enrollments.course_id
FROM my_students
RIGHT JOIN enrollments ON my_students.student_id = enrollments.student_id;
