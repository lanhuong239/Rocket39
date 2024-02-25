DROP DATABASE IF EXISTS User;
CREATE DATABASE User;
USE User;

DROP TABLE IF EXISTS User;

CREATE TABLE User (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE KEY NOT NULL,
    password VARCHAR(255) NOT NULL,
    exp_in_year INT,
    pro_skill VARCHAR(255),
    project_id INT,
    role ENUM('MANAGER', 'EMPLOYEE') NOT NULL
);

-- Insert Managers
INSERT INTO User (full_name, email, password, exp_in_year, pro_skill, project_id, role)
VALUES
  ('Manager1', 'manager1@mail.com', 'manager1', 8, NULL, 1, 'MANAGER'),
  ('Manager2', 'manager2@mail.com', 'manager2', 12, NULL, 2, 'MANAGER'),
  ('Manager3', 'manager3@mail.com', 'manager3', 6, NULL, 3, 'MANAGER'),
  ('Manager4', 'manager4@mail.com', 'manager4', 9, NULL, 4, 'MANAGER'),
  ('Manager5', 'manager5@mail.com', 'manager5', 11, NULL, 5, 'MANAGER'),
  ('Employee1', 'employee1@mail.com', 'employee1', NULL, 'Dev', 1, 'EMPLOYEE'),
  ('Employee2', 'employee2@mail.com', 'employee2', NULL, 'Test', 2, 'EMPLOYEE'),
  ('Employee3', 'employee3@mail.com', 'employee3', NULL, 'Java', 3, 'EMPLOYEE'),
  ('Employee4', 'employee4@mail.com', 'employee4', NULL, 'SQL', 4, 'EMPLOYEE'),
  ('Employee5', 'employee5@mail.com', 'employee5', NULL, 'DevOps', 5, 'EMPLOYEE');


