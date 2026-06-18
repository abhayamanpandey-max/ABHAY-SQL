CREATE DATABASE IF NOT EXISTS startersql;
USE startersql;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    salary DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Aarav', 'aarav@example.com', 'Male', '1995-05-14', 65000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'aarav@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Ananya', 'ananya@example.com', 'Female', '1990-11-23', 72000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ananya@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Raj', 'raj@example.com', 'Male', '1988-02-17', 58000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'raj@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Sneha', 'sneha@example.com', 'Female', '2000-08-09', 50000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'sneha@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Farhan', 'farhan@example.com', 'Male', '1993-12-30', 61000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'farhan@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Priyanka', 'priyanka@example.com', 'Female', '1985-07-12', 84000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'priyanka@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Aisha', 'aisha@example.com', 'Female', '1997-03-25', 56000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'aisha@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Aditya', 'aditya@example.com', 'Male', '1992-06-17', 69000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'aditya@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Meera', 'meera@example.com', 'Female', '1989-09-05', 77000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'meera@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Ishaan', 'ishaan@example.com', 'Male', '2001-10-02', 45000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ishaan@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Tanvi', 'tanvi@example.com', 'Female', '1994-04-18', 62000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'tanvi@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Rohan', 'rohan@example.com', 'Male', '1986-12-01', 75000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'rohan@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Zoya', 'zoya@example.com', 'Female', '1998-01-15', 54000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'zoya@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Karan', 'karan@example.com', 'Male', '1990-08-22', 68000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'karan@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Nikita', 'nikita@example.com', 'Female', '1987-03-10', 71000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'nikita@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Manav', 'manav@example.com', 'Male', '1996-11-29', 61000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'manav@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Divya', 'divya@example.com', 'Female', '1991-02-28', 57000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'divya@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Harshit', 'harshit@example.com', 'Male', '1993-09-09', 65000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'harshit@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Ritika', 'ritika@example.com', 'Female', '1999-05-05', 52000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ritika@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Imran', 'imran@example.com', 'Male', '1995-07-30', 63000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'imran@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Juhi', 'juhi@example.com', 'Female', '1992-10-14', 59000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'juhi@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Tushar', 'tushar@example.com', 'Male', '1990-01-08', 73000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'tushar@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Lata', 'lata@example.com', 'Female', '1984-11-11', 78000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'lata@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Yash', 'yash@example.com', 'Male', '1997-06-06', 64000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'yash@example.com');
INSERT INTO users (name, email, gender, date_of_birth, salary)
SELECT 'Fatima', 'fatima@example.com', 'Female', '1993-03-03', 55000.00 FROM dual WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'fatima@example.com');

SELECT COUNT(*) AS total_users FROM users;
SHOW TABLES;
SELECT * FROM users;