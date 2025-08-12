CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT
);

INSERT INTO students VALUES
(1, 'Arjun', 20),
(2, 'Priya', 21),
(3, 'Ravi', 19);

INSERT INTO marks VALUES
(1, 1, 'Math', 85),
(2, 1, 'Science', 78),
(3, 2, 'Math', 92),
(4, 3, 'Science', 88);

SELECT name,(SELECT AVG(marks) FROM marks) AS avg_marks FROM students;

select name,(select sum(marks) FROM marks) as sum_marks FROM students;

SELECT name FROM students WHERE age > (SELECT avg(age) FROM students);

SELECT name FROM students
WHERE student_id IN (SELECT student_id FROM marks WHERE marks > 80);

SELECT name FROM students s
WHERE EXISTS (SELECT 1 FROM marks m WHERE m.student_id = s.student_id AND m.subject = 'Math');

SELECT name,(SELECT AVG(marks) FROM marks m
WHERE m.student_id = s.student_id) AS avg_marks
FROM students s;

 SELECT name, avg_marks FROM (SELECT s.student_id, s.name, AVG(m.marks) AS avg_marks FROM students s 
JOIN marks m ON s.student_id = m.student_id
GROUP BY s.student_id) AS student_avg
WHERE avg_marks > 80;

SELECT name
FROM students
WHERE age = (
    SELECT AVG(age)
    FROM students
);

