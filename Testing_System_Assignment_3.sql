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
    question_id bigint,
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
    ('alice.smith@example.com', 'alice_smith', 'Alice Smith', 2, 2, '2023-01-02'),
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
    
-- q2
select * 
from Department;

-- lấy ra id của phòng ban "Sale"
select department_id
from Department
where department_name = 'Sale';

-- q4: lấy ra thông tin account có full name dài nhất
-- hàm MAX thường được sử dụng để lấy giá trị lớn nhất từ một cột số
select *
from Account
ORDER BY LENGTH(full_name) DESC
LIMIT 1;

SELECT *
FROM Account
WHERE LENGTH(full_name) = (SELECT MAX(LENGTH(full_name)) FROM Account);

-- q5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT *
FROM Account
WHERE 
LENGTH(full_name) = (SELECT MAX(LENGTH(full_name)) FROM Account)
and department_id = 3;

-- q6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT DISTINCT g.group_name
FROM `Group` g
JOIN GroupAccount ga ON g.group_id = ga.group_id
JOIN Account a ON ga.account_id = a.account_id
WHERE ga.join_date < '2019-12-20';

-- q7: Lấy ra ID của question có >= 4 câu trả lời

select question_id 
from (
select question_id, count(answer_id) count_answer
from Answer
group by 1) count
where count_answer >=4;

SELECT question_id
FROM Answer
GROUP BY question_id
HAVING COUNT(answer_id) >= 4;

-- q8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 2023-01-05
select `code`
from Exam
where duration >= 60 and create_date < '2023-01-05';

-- q9: Lấy ra 5 group được tạo gần đây nhất
select *
from `Group`
order by create_date desc
limit 5;

-- q10: Đếm số nhân viên thuộc department có id = 2
select count(*) 
from `Account`
where department_id = 2;

-- q11: Lấy ra nhân viên có tên bắt đầu bằng chữ "E" và kết thúc bằng chữ "e"
select *
from `Account`
where full_name like 'E%e';

-- q12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
delete 
from Exam
where create_date < '2023-01-02';

-- q13: Xóa tất cả các question có nội dung bắt đầu bằng từ "What"
delete 
from Question
where content like 'What%';

-- q14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
update Account
set full_name = 'Nguyễn Bá Lộc', email = 'loc.nguyenba@vti.com.vn'
where account_id = 5;

-- q15: update account có id = 5 sẽ thuộc group có id = 4
update GroupAccount
set group_id = 4
where account_id = 5;

select * from Account;
select * from Exam;