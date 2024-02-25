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
VALUES ('Manager1', 'manager1@mail.com', 'manager1_password', 8, NULL, 1, 'MANAGER');

INSERT INTO User (full_name, email, password, exp_in_year, pro_skill, project_id, role)
VALUES ('Manager2', 'manager2@mail.com', 'manager2_password', 12, NULL, 2, 'MANAGER');

INSERT INTO User (full_name, email, password, exp_in_year, pro_skill, project_id, role)
VALUES ('Manager3', 'manager3@mail.com', 'manager3_password', 6, NULL, 3, 'MANAGER');

INSERT INTO User (full_name, email, password, exp_in_year, pro_skill, project_id, role)
VALUES ('Manager4', 'manager4@mail.com', 'manager4_password', 9, NULL, 4, 'MANAGER');

INSERT INTO User (full_name, email, password, exp_in_year, pro_skill, project_id, role)
VALUES ('Manager5', 'manager5@mail.com', 'manager5_password', 11, NULL, 5, 'MANAGER');

-- Insert Employees
INSERT INTO User (full_name, email, password, exp_in_year, pro_skill, project_id, role)
VALUES ('Employee1', 'employee1@mail.com', 'employee1_password', NULL, 'Dev', 1, 'EMPLOYEE');

INSERT INTO User (full_name, email, password, exp_in_year, pro_skill, project_id, role)
VALUES ('Employee2', 'employee2@mail.com', 'employee2_password', NULL, 'Test', 2, 'EMPLOYEE');

INSERT INTO User (full_name, email, password, exp_in_year, pro_skill, project_id, role)
VALUES ('Employee3', 'employee3@mail.com', 'employee3_password', NULL, 'Java', 3, 'EMPLOYEE');

INSERT INTO User (full_name, email, password, exp_in_year, pro_skill, project_id, role)
VALUES ('Employee4', 'employee4@mail.com', 'employee4_password', NULL, 'SQL', 4, 'EMPLOYEE');

INSERT INTO User (full_name, email, password, exp_in_year, pro_skill, project_id, role)
VALUES ('Employee5', 'employee5@mail.com', 'employee5_password', NULL, 'DevOps', 5, 'EMPLOYEE');

