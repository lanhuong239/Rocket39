Drop database if exists FresherTrainingManagement;
Create database FresherTrainingManagement;
Use FresherTrainingManagement;

Drop table if exists Trainee;
Create table Trainee (
	trainee_id int NOT NULL AUTO_INCREMENT primary key,
    full_name varchar(50),
    birth_date date,
    gender enum('male','female','unknown'),
    et_iq int check(et_iq>0 and et_iq<20),
    et_gmath int check(et_gmath>0 and et_gmath<20),
    et_english int check(et_english>0 and et_english<50),
    training_class varchar(50),
    evaluation_notes varchar(50)
);

alter table Trainee
add column vti_account varchar(50) NOT NULL unique;


