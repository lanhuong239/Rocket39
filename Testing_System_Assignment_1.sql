Drop database if exists ExamManagement;
Create database ExamManagement;
Use ExamManagement;
Drop table if exists Department;
Create table Department (
	department_id int NOT NULL AUTO_INCREMENT primary key,
    department_name nvarchar(50)
);

Drop table if exists Position;
Create table Position (
	position_id int NOT NULL AUTO_INCREMENT primary key,
    position_name nvarchar(50)
);


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
show tables;