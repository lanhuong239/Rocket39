Drop database if exists ExamManagement;
Create database ExamManagement;
Use ExamManagement;

-- Department table
Drop table if exists Department;
Create table Department (
	department_id int NOT NULL AUTO_INCREMENT primary key,
    department_name nvarchar(50)
);

-- Position table
Drop table if exists `Position`;
Create table `Position` (
	position_id int NOT NULL AUTO_INCREMENT primary key,
    position_name nvarchar(50)
);

-- Account table
Drop table if exists Account;
Create table Account (
	account_id int NOT NULL AUTO_INCREMENT primary key,
    email varchar(50),
    user_name varchar(50),
    full_name varchar(50),
    department_id int,
    position_id int,
    create_date date,
    foreign key (department_id) references Department (department_id),
    foreign key (position_id) references Position (position_id)   
);

-- Group table
Drop table if exists `Group`;
Create table `Group` (
	group_id int NOT NULL AUTO_INCREMENT primary key,
    group_name varchar(50),
    creator_id int,
    create_date date,
	foreign key (creator_id) references Account (account_id)
);

-- GroupAccount table
Drop table if exists GroupAccount;
CREATE TABLE GroupAccount (
  group_account_id INT NOT NULL AUTO_INCREMENT primary key,
  group_id INT NOT NULL,
  account_id INT NOT NULL,
  join_date DATE,
  foreign key (group_id) references `Group` (group_id),
foreign key (account_id) references `Account` (account_id));
 
-- TypeQuestion table 
Drop table if exists TypeQuestion;
CREATE TABLE TypeQuestion (
  type_id INT NOT NULL AUTO_INCREMENT primary key,
  type_name enum ('Essay','Multiple-Choice')
  );

-- CategoryQuestion table   
Drop table if exists CategoryQuestion;
CREATE TABLE CategoryQuestion (
  category_id INT NOT NULL AUTO_INCREMENT primary key,
  category_name varchar(50)
  );  

-- Question table  
Drop table if exists Question;
Create table Question (
	question_id bigint NOT NULL AUTO_INCREMENT primary key,
    content nvarchar(256),
    category_id int,
    type_id int,
    creator_id int,
    create_date date,
    foreign key (type_id) references TypeQuestion (type_id),
    foreign key (category_id) references CategoryQuestion (category_id),
	foreign key (creator_id) references `Account` (account_id)
);

-- Answer table 
Drop table if exists Answer;
Create table Answer (
	answer_id int NOT NULL AUTO_INCREMENT primary key,
    content nvarchar(256),
    question_id bigint,
    is_correct Boolean,
    foreign key (question_id) references Question (question_id) ON DELETE CASCADE
);

-- Exam table 
Drop table if exists Exam;
Create table Exam (
	exam_id bigint NOT NULL AUTO_INCREMENT primary key,
    code nvarchar(50),
    title nvarchar(256),
    category_id int,
    duration int,
    creator_id int,
    create_date date,
    foreign key (category_id) references CategoryQuestion (category_id),
	foreign key (creator_id) references Account (account_id)
);

-- ExamQuestion table 
Create table ExamQuestion (
	exam_question_id int NOT NULL AUTO_INCREMENT primary key,
	exam_id bigint,
	question_id bigint,
    foreign key (exam_id) references Exam (exam_id),
	foreign key (question_id) references Question (question_id)
);

-- Insert into Department table
INSERT INTO Department (department_name) VALUES
    ('HR'),
    ('Finance'),
    ('IT'),
    ('Marketing'),
    ('Operations'),
    ('Sales'),
    ('Customer Support'),
    ('Research and Development'),
    ('Quality Assurance'),
    ('Legal');

-- Insert into Position table
INSERT INTO `Position` (position_name) VALUES
    ('Manager'),
    ('Developer'),
    ('Accountant'),
    ('Marketing Specialist'),
    ('Operations Coordinator'),
    ('Sales Representative'),
    ('Customer Support Agent'),
    ('Software Engineer'),
    ('QA Analyst'),
    ('Legal Counsel');

-- Insert into Account table
INSERT INTO Account (email, user_name, full_name, department_id, position_id, create_date) VALUES
    ('john.doe@example.com', 'john_doe', 'John Doe', 1, 1, '2023-01-01'),
    ('alice.smith@example.com', 'alice_smith', 'Alice Smith', 3, 2, '2023-01-02'),
    ('bob.jones@example.com', 'bob_jones', 'Bob Jones', 3, 3, '2023-01-03'),
    ('emily.white@example.com', 'emily_white', 'Emily White', 4, 4, '2023-01-04'),
    ('charlie.brown@example.com', 'charlie_brown', 'Charlie Brown', 5, 5, '2023-01-05'),
    -- Add more records as needed
    ('susan.wilson@example.com', 'susan_wilson', 'Susan Wilson', 1, 2, '2023-01-06'),
    ('peter.jenkins@example.com', 'peter_jenkins', 'Peter Jenkins', 2, 4, '2023-01-07'),
    ('linda.james@example.com', 'linda_james', 'Linda James', 3, 1, '2023-01-08'),
    ('robert.smith@example.com', 'robert_smith', 'Robert Smith', 4, 3, '2023-01-09'),
    ('amy.martin@example.com', 'amy_martin', 'Amy Martin', 5, 2, '2023-01-10');

-- Insert into Group table
INSERT INTO `Group` (group_name, creator_id, create_date) VALUES
    ('Development Team', 2, '2023-01-01'),
    ('Marketing Team', 4, '2023-01-02'),
    ('Finance Team', 3, '2023-01-03'),
    ('HR Team', 1, '2023-01-04'),
    ('Operations Team', 5, '2023-01-05'),
    -- Add more records as needed
    ('Sales Team', 6, '2023-01-06'),
    ('Customer Support Team', 7, '2023-01-07'),
    ('R&D Team', 8, '2023-01-08'),
    ('QA Team', 9, '2023-01-09'),
    ('Legal Team', 10, '2023-01-10');

-- Insert into GroupAccount table
INSERT INTO GroupAccount (group_id, account_id, join_date) VALUES
    (1, 2, '2023-01-01'),
    (1, 3, '2023-01-02'),
    (2, 4, '2023-01-03'),
    (3, 5, '2023-01-04'),
    (4, 1, '2023-01-05'),
    -- Add more records as needed
    (2, 6, '2023-01-06'),
    (3, 7, '2023-01-07'),
    (4, 8, '2023-01-08'),
    (5, 9, '2023-01-09'),
    (5, 10, '2023-01-10');

-- Insert into TypeQuestion table
INSERT INTO TypeQuestion (type_name) VALUES
    ('Essay'),
    ('Multiple-Choice');

-- Insert into CategoryQuestion table
INSERT INTO CategoryQuestion (category_name) VALUES
    ('General Knowledge'),
    ('Programming'),
    ('Finance'),
    ('Marketing'),
    ('Operations'),
    -- Add more records as needed
    ('Sales'),
    ('Customer Support'),
    ('Research'),
    ('Quality Assurance'),
    ('Legal');

-- Insert into Question table
INSERT INTO Question (content, category_id, type_id, creator_id, create_date) VALUES
    ('What is the capital of France?', 1, 1, 2, '2023-01-01'),
    ('What is the main programming language in Android development?', 2, 2, 3, '2023-01-02'),
    ('What is a balance sheet?', 3, 1, 4, '2023-01-03'),
    ('Define target audience in marketing.', 4, 2, 5, '2023-01-04'),
    ('What is supply chain management?', 5, 1, 1, '2023-01-05'),
    -- Add more records as needed
    ('Who is the president of the United States?', 1, 1, 6, '2023-01-06'),
    ('What is the capital of Japan?', 2, 2, 7, '2023-01-07'),
    ('Define ROI in finance.', 3, 1, 8, '2023-01-08'),
    ('What is a marketing funnel?', 4, 2, 9, '2023-01-09'),
    ('What is ISO 9001?', 5, 1, 10, '2023-01-10');

-- Insert into Answer table
INSERT INTO Answer (content, question_id, is_correct) VALUES
    ('Paris', 1, true),
    ('Java', 2, true),
    ('A financial statement', 3, true),
    ('Group of individuals likely to be interested in a product', 4, true),
    ('Management of the flow of goods and services', 5, true),
    -- Add more records as needed
    ('Joe Biden', 6, true),
    ('Tokyo', 7, true),
    ('Return on Investment', 8, true),
    ('A model that represents the stages of a prospect becoming a customer', 9, true),
    ('International Organization for Standardization standard for quality management', 10, true);

-- Insert into Exam table
INSERT INTO Exam (code, title, category_id, duration, creator_id, create_date) VALUES
    ('EXAM001', 'General Knowledge Test', 1, 60, 1, '2023-01-01'),
    ('EXAM002', 'Programming Test', 2, 90, 2, '2023-01-02'),
    ('EXAM003', 'Finance Test', 3, 75, 3, '2023-01-03'),
    ('EXAM004', 'Marketing Test', 4, 45, 4, '2023-01-04'),
    ('EXAM005', 'Operations Test', 5, 120, 5, '2023-01-05'),
    -- Add more records as needed
    ('EXAM006', 'Sales Test', 6, 60, 6, '2023-01-06'),
    ('EXAM007', 'Customer Support Test', 7, 90, 7, '2023-01-07'),
    ('EXAM008', 'Research Test', 8, 75, 8, '2023-01-08'),
    ('EXAM009', 'QA Test', 9, 45, 9, '2023-01-09'),
    ('EXAM010', 'Legal Test', 10, 120, 10, '2023-01-10');

-- Insert into ExamQuestion table
INSERT INTO ExamQuestion (exam_id, question_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    -- Add more records as needed
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);
    
-- q1: Tạo view có chứa danh sách nhân viên thuộc phòng ban It
Drop view if exists sale_employees;
Create view sale_employees as
select a.full_name, d.department_name
from Account a
inner join Department d on a.department_id = d.department_id
where d.department_name like '%It%';

Select *
from sale_employees

-- q2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE OR REPLACE VIEW vw_GetAccount AS
SELECT
    a.account_id,
    a.full_name,
    COUNT(g.group_id) AS group_count
FROM
    Account a
INNER JOIN
    GroupAccount g ON a.account_id = g.account_id
GROUP BY
    a.account_id, a.full_name
ORDER BY
    group_count DESC
LIMIT 1;

-- Create the view
DROP VIEW IF EXISTS max_groups_account;
CREATE VIEW max_groups_account AS
SELECT
    a.account_id,
    a.email,
    a.user_name,
    a.full_name,
    COUNT(ga.group_id) AS group_count
FROM
    Account a
JOIN
    GroupAccount ga ON a.account_id = ga.account_id
GROUP BY
    a.account_id, a.email, a.user_name, a.full_name
HAVING
    group_count = (SELECT MAX(group_count) FROM (SELECT account_id, COUNT(group_id) AS group_count FROM GroupAccount GROUP BY account_id) AS max_group_count);

-- Query the view
SELECT * FROM max_groups_account;

-- q3: Tạo view có chứa câu hỏi có những content quá dài (content quá 30 từ được coi là quá dài) và xóa nó đi
delete 
from Question
where length(content)>30;

-- q4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất

update Account
set department_id = 3
where account_id = 4;

Drop view if exists maxnv_department;
Create view maxnv_department as
select d.department_name, count(account_id)
from Department d
inner join Account a on a.department_id = d.department_id
group by a.department_id
HAVING count(a.department_id) = (SELECT MAX(countDEP_ID) AS maxDEP_ID FROM
(SELECT count(A1.department_id) AS countDEP_ID FROM account A1
GROUP BY A1.department_id) AS TB_countDepID);

select *
from maxnv_department

CREATE VIEW DepartmentEmployeeCount AS
SELECT
    d.department_id,
    d.department_name,
    COUNT(a.account_id) AS employee_count
FROM
    Department d
LEFT JOIN
    Account a ON d.department_id = a.department_id
GROUP BY
    d.department_id, d.department_name
ORDER BY
    employee_count DESC;

SELECT *
FROM DepartmentEmployeeCount
LIMIT 1;

-- q5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
Drop view if exists nguyen_employees;
Create view nguyen_employees as
select q.question_id, q.content, a.full_name
from Question q
inner join Account a on a.account_id = q.creator_id
where a.full_name like 'Bob%'

select *
from nguyen_employees



select * from ExamQuestion;
select * from Department;
select * from Position;
select * from Question;
select * from TypeQuestion;
select * from GroupAccount;