
-- Create Students Table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age NUMERIC(2, 0) CHECK (age >= 18) NOT NULL,
    email VARCHAR(100) UNIQUE,
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(50),
    mobile VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ 
);


-- Create Courses Table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    credits INTEGER NOT NULL,
        created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Create Enrollment Table
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id),
    course_id INTEGER REFERENCES courses(course_id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);




--  Data Insertion


INSERT INTO students (student_name, age, email, frontend_mark, backend_mark,  mobile, password)
VALUES
('John Doe', 18, 'john.doe@example.com', 85, 90, '1234567890', 'password123'),
('Jane Smith', 20, 'jane.smith@example.com', 80, 88,  '9876543210', 'pass456'),
('Alice Johnson', 19, 'alice.johnson@example.com', 78, 92,  '5551112233', 'securePass123'),
('Bob Williams', 22, 'bob.williams@example.com', 75, 85, '9998887777', 'bobPass'),
('Eva Davis', 18, 'eva.davis@example.com', 88, 90,  '7776665555', 'evaSecure'),
('Charlie Brown', 21, 'charlie.brown@example.com', 82, 79, '4443332222', 'charlie123'),
('Sophia Miller', 20, 'sophia.miller@example.com', 95, 87,  '1110009999', 'sophiaPass'),
('Daniel Wilson', 19, 'daniel.wilson@example.com', 79, 94,  '6665554444', 'danielPass'),
('Grace Moore', 18, 'grace.moore@example.com', 91, 88, '2223334444', 'grace123'),
('Henry Turner', 20, 'henry.turner@example.com', 84, 91,  '8887776666', 'henrySecure'),
('Olivia Hall', 21, 'olivia.hall@example.com', 76, 93,  '5550001111', 'oliviaPass'),
('Liam Davis', 18, 'liam.davis@example.com', 89, 86,  '9991112222', 'liamSecure'),
('Ava Thomas', 22, 'ava.thomas@example.com', 83, 90,  '7778889999', 'avaSecurePass'),
('William White', 19, 'william.white@example.com', 77, 95,  '4445556666', 'williamPass'),
('Emma Taylor', 20, 'emma.taylor@example.com', 92, 89,  '1112223333', 'emmaSecure'),
('James Brown', 21, 'james.brown@example.com', 85, 92,  '6667778888', 'jamesSecure'),
('Isabella Wilson', 18, 'isabella.wilson@example.com', 87, 91,  '9990001111', 'isabella123'),
('Noah Smith', 20, 'noah.smith@example.com', 80, 88,  '3334445555', 'noahSecure'),
('Mia Johnson', 19, 'mia.johnson@example.com', 94, 87, '7778889999', 'miaSecure'),
('Benjamin Davis', 22, 'benjamin.davis@example.com', 76, 93,  '2223334444', 'benjamin123');






INSERT INTO courses (course_name, credits) VALUES
( 'Next.js', 3),
( 'React.js', 4),
( 'Databases', 3),
('Prisma', 3),
('JavaScript Fundamentals', 3),
('Node.js Development', 4),
('Web Security', 3),
('TS', 4),
('Database Design', 3),
('GraphQL Fundamentals', 3);



INSERT INTO enrollment (student_id, course_id) VALUES
(1, 8),
(1, 2),
(2, 1),
(3, 2),
(2, 3),
(3, 1),
(4, 2),
(4, 10),
(5, 1),
(10, 1),
(14, 9);



-- show Data 


SELECT * FROM students  ;
SELECT * FROM courses ;
SELECT * FROM enrollment;


-- delete table  Data 

drop Table students;

drop Table courses;
drop Table enrollment;




DELETE FROM students
WHERE student_id = 22;

-- update table  Data 
UPDATE students
SET mobile = '1111', updated_at = CURRENT_TIMESTAMP
WHERE student_id = 1;




-- Insert a new record for 'Reazoanul Hasan' Query 1


INSERT INTO students (student_name, age, email, frontend_mark, backend_mark,  mobile, password)
VALUES (' Hasan', 25, 'hasan@gmail.com', 60, 90,  '1234567890', 'hasan123');
-- Query 2
SELECT students.student_name
FROM students
JOIN enrollment ON students.student_id = enrollment.student_id
JOIN courses ON enrollment.course_id = courses.course_id
WHERE courses.course_name = 'Next.js';

-- Query 3
UPDATE students
SET status = 'Awarded'
WHERE student_id = (
    SELECT student_id
    FROM students
    ORDER BY (frontend_mark + backend_mark) DESC
    LIMIT 1
);


-- Query 4
DELETE FROM courses
WHERE NOT EXISTS (
    SELECT 1
    FROM enrollment
    WHERE enrollment.course_id = courses.course_id
);


-- Query 5
SELECT student_name
FROM students
ORDER BY student_id
OFFSET 2
LIMIT 2;

-- Query 6
SELECT courses.course_name, COUNT(enrollment.student_id) as students_enrolled
FROM courses
LEFT JOIN enrollment ON courses.course_id = enrollment.course_id
GROUP BY courses.course_id;



-- Query 7
SELECT AVG(age) AS average_age
FROM students;


-- Query 8
SELECT student_name
FROM students
WHERE email LIKE '%example.com%';