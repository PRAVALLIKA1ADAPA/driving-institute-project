/* 2023-07-18 17:41:19 [28 ms] */ 
CREATE table Branch(
    branch_id SERIAL,
    road_no int not null,
    colony varchar(255) not null,
    pin_code int not null,
    city varchar(255) not null,
    state varchar(255) not null,
    PRIMARY KEY (branch_id)
)
;
/* 2023-07-18 17:41:49 [3 ms] */ 
SELECT*from branch LIMIT 100 OFFSET 0;
/* 2023-07-18 17:52:11 [11 ms] */ 
INSERT INTO branch(
    road_no,
    colony,
    pin_code,
    city,
    state
)
VALUES(
    23,
    'SPNagar',
    500085,
    'Hyd',
    'Telangana'
)
;
/* 2023-07-18 17:52:30 [3 ms] */ 
SELECT*FROM branch LIMIT 100 OFFSET 0;
/* 2023-07-18 18:04:39 [18 ms] */ 
CREATE TABLE Tutor(
    tutor_id SERIAL,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    dob DATE,
    hiring_date DATE,
    branch_id int,
    PRIMARY KEY (tutor_id),
    Foreign Key (branch_id) REFERENCES Branch(branch_id)
);
/* 2023-07-18 18:05:21 [3 ms] */ 
select * from Tutor LIMIT 100 OFFSET 0;
/* 2023-07-18 18:10:00 [12 ms] */ 
ALTER TABLE Tutor ALTER COLUMN dob SET NOT NULL;
/* 2023-07-18 18:10:16 [23 ms] */ 
ALTER TABLE Tutor ALTER COLUMN hiring_date SET NOT NULL;
/* 2023-07-18 18:18:29 [14 ms] */ 
CREATE TABLE Student(
    student_id SERIAL,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    dob DATE not null,
    branch_id int not null,
    PRIMARY KEY (student_id),
    Foreign Key (branch_id) REFERENCES Branch(branch_id)
)
;
/* 2023-07-18 18:36:26 [12 ms] */ 
CREATE TABLE Tutorial(
    tutorial_id SERIAL,
    date_of_enrollment DATE not null,
    student_id int not null,
    PRIMARY KEY (tutorial_id),
    Foreign Key (student_id) REFERENCES Student(student_id)
)
;
/* 2023-07-18 18:44:56 [10 ms] */ 
CREATE TABLE Exam(
    student_id int not null,
    tutor_id int not null,
    date_of_exam DATE not null,
    ifPassed BOOLEAN not null,
    tutorial_id int not null,
    Foreign Key (student_id) REFERENCES Student(student_id),
    Foreign Key (tutor_id) REFERENCES Tutor(tutor_id),
    Foreign Key (tutorial_id) REFERENCES Tutorial(tutorial_id)
)
;
