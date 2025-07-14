CREATE DATABASE wscube;

USE wscube;

CREATE TABLE users (
	id int unsigned,
    name varchar(100),
    email varchar(150),
    password varchar(100),
    contact varchar(15),
    address text,
    dob date,
    gender enum("M", "F", "O"),
    status boolean
);

INSERT INTO users
(id, name, email, password, contact, address, dob, gender, status)
VALUES(
	1,
    'Jhon',
    'jhon123@gmail.com',
    '12345',
    '+91 1234567890',
    'Kolaghat',
    '1999-01-10',
    'M',
    1
);

INSERT INTO users
(id, name, email, password, contact, address, dob, gender, status)
VALUES
(2, 'Jenny', 'jenny123@gmail.com', '12345', '+91 222098765', 'Kolkata', '1998-03-20', 'F', 1),
(3, 'Samiran', 'samiran123@gmail.com', '12345', '+91 1111111111', 'Japan', '2004-06-30', 'M', 0);

INSERT INTO users
VALUES
(4, 'Zephyrus', 'zephyrus123@gmail.com', '12345', '+91 2345678905', 'Osaka', '2000-06-21', 'M', 1),
(5, 'Test', 'test123@gmail.com', '12345', '+91 5555555555', 'London', '1991-03-20', 'F', 1);

SELECT * FROM users;

SELECT id, name, email FROM users;

SELECT id, name AS "User Name", status FROM users;

SELECT id, name AS "User Name", email, status FROM users WHERE status = 1;


CREATE TABLE students (
	id INT NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    age TINYINT CHECK(age >= 18),
    status BOOLEAN DEFAULT 1
);

INSERT INTO students
(id, name, email, age)
VALUES
(1, 'Samiran', 'samiran123@gmail.com', 21);

SELECT * FROM students;

INSERT INTO students
(id, name, email, age)
VALUES
(2, 'Zephyrus', 'zephyrus123@gmail.com', 31),
(3, 'Guddu', 'guddu123@gmail.com', 22),
(4, 'Jhon', 'jhon123@gmail.com', 25),
(5, 'Delta', 'delta123@gmail.com', 28);

SELECT * FROM students WHERE age >= 25 AND age < 30;

SELECT * FROM students WHERE age = 21 OR age = 25;

SELECT * FROM students WHERE age IN(19, 22, 21, 31);


INSERT INTO students
(id, name, email, age)
VALUES
(6, 'Deon', 'deon123@gmail.com', 23);

SELECT * FROM students WHERE name LIKE('d%');
SELECT * FROM students WHERE name LIKE('%n');