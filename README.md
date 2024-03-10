# Project Name: University Database Project

## Overview
This project involves the creation of a PostgreSQL database named "university_db" to manage information about students, courses, and enrollments. The database consists of three tables: `students`, `courses`, and `enrollment`. Additionally, sample data is inserted into these tables, and various SQL queries are provided to perform tasks such as data manipulation and retrieval.


## Database Setup
1. Ensure PostgreSQL is installed on your system. If not, you can download it from [PostgreSQL official website](https://www.postgresql.org/download/).
2. Create a new database  suitable name.
3. 
## Table Creation
Three tables are created for this project:
- `students` with fields: `student_id`, `student_name`, `age`, `email`, `phone`, `password`, `frontend_mark`, `backend_mark`, and `status`.
- `courses` with fields: `course_id`, `course_name`, and `credits`.
- `enrollment` with fields: `enrollment_id`, `student_id` (foreign key referencing `students`), and `course_id` (foreign key referencing `courses`).



## Queries
The project includes several SQL queries to perform various tasks:
1. Insert a new student record.
2. Retrieve names of students enrolled in the 'Next.js' course.
3. Update the status of the student with the highest total mark.
4. Delete courses with no students enrolled.
5. Retrieve names of students using LIMIT and OFFSET.
6. Retrieve course names and the number of students enrolled.
7. Calculate and display the average age of all students.
8. Retrieve names of students with email addresses containing 'example.com'.

Please feel free to review these queries to explore the capabilities of the database.

## Usage
1. Execute the SQL code for table creation and sample data insertion.
2. Run the provided queries to interact with the database.
