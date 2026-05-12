CREATE DATABASE IF NOT EXISTS student_marks;
USE student_marks;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    class VARCHAR(10) NOT NULL
);

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(50) NOT NULL
);

CREATE TABLE marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

INSERT INTO students (name, class)
VALUES
('Alice', '10A'),
('Bob', '10A'),
('Charlie', '10B');

INSERT INTO subjects (subject_name)
VALUES
('Math'),
('Science'),
('English');

INSERT INTO marks (student_id, subject_id, marks)
VALUES
(1, 1, 88),
(1, 2, 92),
(1, 3, 85),
(2, 1, 79),
(2, 3, 81),
(3, 2, 75);
