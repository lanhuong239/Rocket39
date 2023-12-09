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
  join_date DATE );
 
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
	foreign key (creator_id) references Account (account_id)
);

-- Answer table 
Drop table if exists Answer;
Create table Answer (
	answer_id int NOT NULL AUTO_INCREMENT primary key,
    content nvarchar(256),
    question_id int,
    is_correct Boolean,
    foreign key (question_id) references Question (question_id)
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

-- Insert data into Department table
INSERT INTO Department (department_name) VALUES
    ('HR'),
    ('Finance'),
    ('IT'),
    ('Marketing'),
    ('Operations');

-- Insert data into Position table
INSERT INTO Position (position_name) VALUES
    ('Manager'),
    ('Developer'),
    ('Accountant'),
    ('Marketing Specialist'),
    ('Operations Coordinator');

-- Insert data into Account table
INSERT INTO Account (email, user_name, full_name, department_id, position_id, create_date) VALUES
    ('john.doe@example.com', 'john_doe', 'John Doe', 1, 1, '2023-01-01'),
    ('alice.smith@example.com', 'alice_smith', 'Alice Smith', 2, 2, '2023-01-02'),
    ('bob.jones@example.com', 'bob_jones', 'Bob Jones', 3, 3, '2023-01-03'),
    ('emily.white@example.com', 'emily_white', 'Emily White', 4, 4, '2023-01-04'),
    ('charlie.brown@example.com', 'charlie_brown', 'Charlie Brown', 5, 5, '2023-01-05');

-- Insert data into Group table
INSERT INTO Group (group_name, creator_id, create_date) VALUES
    ('Development Team', 2, '2023-01-01'),
    ('Marketing Team', 4, '2023-01-02'),
    ('Finance Team', 3, '2023-01-03'),
    ('HR Team', 1, '2023-01-04'),
    ('Operations Team', 5, '2023-01-05');

-- Insert data into GroupAccount table
INSERT INTO GroupAccount (group_id, account_id, join_date) VALUES
    (1, 2, '2023-01-01'),
    (1, 3, '2023-01-02'),
    (2, 4, '2023-01-03'),
    (3, 5, '2023-01-04'),
    (4, 1, '2023-01-05');

-- Insert data into TypeQuestion table
INSERT INTO TypeQuestion (type_name) VALUES
    ('Essay'),
    ('Multiple-Choice');

-- Insert data into CategoryQuestion table
INSERT INTO CategoryQuestion (category_name) VALUES
    ('General Knowledge'),
    ('Programming'),
    ('Finance'),
    ('Marketing'),
    ('Operations');

-- Insert data into Question table
INSERT INTO Question (content, category_id, type_id, creator_id, create_date) VALUES
    ('What is the capital of France?', 1, 1, 2, '2023-01-01'),
    ('What is the main programming language in Android development?', 2, 2, 3, '2023-01-02'),
    ('What is a balance sheet?', 3, 1, 4, '2023-01-03'),
    ('Define target audience in marketing.', 4, 2, 5, '2023-01-04'),
    ('What is supply chain management?', 5, 1, 1, '2023-01-05');

-- Insert data into Answer table
INSERT INTO Answer (content, question_id, is_correct) VALUES
    ('Paris', 1, true),
    ('Java', 2, true),
    ('A financial statement', 3, true),
    ('Group of individuals likely to be interested in a product', 4, true),
    ('Management of the flow of goods and services', 5, true);

-- Insert data into Exam table
INSERT INTO Exam (code, title, category_id, duration, creator_id, create_date) VALUES
    ('EXAM001', 'General Knowledge Test', 1, 60, 1, '2023-01-01'),
    ('EXAM002', 'Programming Test', 2, 90, 2, '2023-01-02'),
    ('EXAM003', 'Finance Test', 3, 75, 3, '2023-01-03'),
    ('EXAM004', 'Marketing Test', 4, 45, 4, '2023-01-04'),
    ('EXAM005', 'Operations Test', 5, 120, 5, '2023-01-05');

-- Insert data into ExamQuestion table
INSERT INTO ExamQuestion (exam_id, question_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

