create database Baitap_buoi1
use  Baitap_buoi1
create table EMPLOYEE (
	EmpNo varchar(10) constraint PK_EMPLOYEE primary key, 
	EmpName varchar(20) not null, 
	BirthDay datetime not null, 
	DeptNo varchar(10) not null,
	MgrNo varchar(10) not null , 
	StartDate datetime not null, 
	Salary money not null,
	Llevel tinyint not null, -- do Level bi trung 
	Sstatus tinyint not null , 
	Note varchar(100),
	constraint CK_EMPLOYEE_Llevel check (Llevel between 1 and 7),
	constraint CK_EMPLOYEE_Sstatus check (Sstatus between 0 and 2)
)
Create Table SKILL
(
	SkillNo int IDENTITY(1,1) constraint PK_SKILL primary key,
	SkillName varchar(20) not null,
	Note varchar(100)
)
create table EMP_SKILL(
	SkillNo int constraint FK_EMP_SKILL_SkillNo references SKILL(SkillNo),
	EmpNo varchar(10) constraint FK_EMP_SKILL_EmpNo references EMPLOYEE(EmpNo),
	SkillLevel tinyint not null,
	RegDate datetime not null,
	Ddescription varchar(100),
	primary key (SkillNo, EmpNo),
	constraint CK_EMP_SKILL_SkillLv check(SkillLevel between 1 and 3)
)
create table DEPARTMENT
(
	DeptNo int IDENTITY(1,1) primary key,
	DeptName varchar(20) not null,
	Note varchar(100)
)

alter table EMPLOYEE
add Email varchar(50) not null default '';

create trigger add_email
on EMPLOYEE
after insert
as begin
	if exists (
		select *
		from inserted i join EMPLOYEE emp on i.Email = emp.Email
	)
	begin
	Rollback transaction;
	Throw 500001, 'l?i do email này ?ã có s?n ',1;
	end
	end

alter table EMPLOYEE 
add default 0 for MgrNo

alter table EMPLOYEE 
add default 0 for Sstatus

INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('HR', 'Human Resources');          
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('IT', 'Information Technology');   
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('Finance', 'Finance Dept');        
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('Marketing', 'Marketing Dept');    
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('Operations', 'Operations Dept');  
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('Sales', 'Sales Department');      
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('Logistics', 'Supply Chain');      
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('R&D', 'Research & Development');

INSERT INTO SKILL (SkillName, Note) VALUES ('Java', 'Programming Language');
INSERT INTO SKILL (SkillName, Note) VALUES ('SQL', 'Database Management');
INSERT INTO SKILL (SkillName, Note) VALUES ('Communication', 'Soft Skill');
INSERT INTO SKILL (SkillName, Note) VALUES ('Accounting', 'Finance Skill');
INSERT INTO SKILL (SkillName, Note) VALUES ('Marketing', 'Business Skill');
INSERT INTO SKILL (SkillName, Note) VALUES ('C++', 'Programming Language');
INSERT INTO SKILL (SkillName, Note) VALUES ('.NET', 'Microsoft Framework');
INSERT INTO SKILL (SkillName, Note) VALUES ('Python', 'Data Science');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note, Email)
VALUES ('NV05', 'Hoang Huy', '1985-12-10', (SELECT TOP 1 DeptNo FROM DEPARTMENT WHERE DeptName='Operations'), 'NV05', '2015-05-20', 30000000, 7, 0, 'Giam doc', 'huy.hoang@abc.com');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note, Email)
VALUES ('NV01', 'Nguyen An', '1990-03-15', (SELECT TOP 1 DeptNo FROM DEPARTMENT WHERE DeptName='HR'), 'NV05', '2018-01-10', 15000000, 5, 0, 'Quan ly HR', 'an.nguyen@abc.com');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note, Email)
VALUES ('NV02', 'Tran Binh', '1992-07-20', (SELECT TOP 1 DeptNo FROM DEPARTMENT WHERE DeptName='IT'), 'NV05', '2019-06-01', 18000000, 5, 0, 'Quan ly IT', 'binh.tran@abc.com');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note, Email)
VALUES ('NV03', 'Le Chi', '1999-11-05', (SELECT TOP 1 DeptNo FROM DEPARTMENT WHERE DeptName='IT'), 'NV02', '2022-03-12', 9000000, 2, 0, 'Dev', 'chi.le@abc.com');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note, Email)
VALUES ('NV04', 'Pham Dung', '1996-02-28', (SELECT TOP 1 DeptNo FROM DEPARTMENT WHERE DeptName='Finance'), 'NV05', '2020-09-01', 12000000, 3, 1, 'Ke toan', 'dung.pham@abc.com');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note, Email)
VALUES ('NV06', 'Do Minh', '2000-01-01', (SELECT TOP 1 DeptNo FROM DEPARTMENT WHERE DeptName='Marketing'), 'NV01', '2023-01-01', 8000000, 1, 0, 'Thuc tap', 'minh.do@abc.com');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note, Email)
VALUES ('NV07', 'Bui Hoa', '1994-05-15', (SELECT TOP 1 DeptNo FROM DEPARTMENT WHERE DeptName='R&D'), 'NV02', '2019-11-20', 25000000, 6, 1, 'Truong nhom R&D', 'hoa.bui@abc.com');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note, Email)
VALUES ('NV08', 'Lai Van', '1998-09-09', (SELECT TOP 1 DeptNo FROM DEPARTMENT WHERE DeptName='Sales'), 'NV01', '2021-08-08', 14000000, 3, 0, 'Sales', 'van.lai@abc.com');

INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES ((SELECT TOP 1 SkillNo FROM SKILL WHERE SkillName='Java'), 'NV06', 1, GETDATE());
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES ((SELECT TOP 1 SkillNo FROM SKILL WHERE SkillName='SQL'), 'NV07', 3, GETDATE());
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES ((SELECT TOP 1 SkillNo FROM SKILL WHERE SkillName='Communication'), 'NV08', 2, GETDATE());
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES ((SELECT TOP 1 SkillNo FROM SKILL WHERE SkillName='Accounting'), 'NV04', 3, GETDATE());
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES ((SELECT TOP 1 SkillNo FROM SKILL WHERE SkillName='Marketing'), 'NV05', 3, GETDATE());
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES ((SELECT TOP 1 SkillNo FROM SKILL WHERE SkillName='C++'), 'NV03', 2, GETDATE());
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES ((SELECT TOP 1 SkillNo FROM SKILL WHERE SkillName='.NET'), 'NV02', 3, GETDATE());
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES ((SELECT TOP 1 SkillNo FROM SKILL WHERE SkillName='Python'), 'NV07', 2, GETDATE());

ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK_EMPLOYEEDEPARTMENT FOREIGN KEY (Deptno) REFERENCES DEPARTMENT(Deptno);

ALTER TABLE EMP_SKILL
DROP COLUMN Description;

CREATE VIEW EMPLOYEE_TRACKING AS
SELECT EmpNo, Emp_Name, Level
FROM EMPLOYEE
WHERE Level BETWEEN 3 AND 5;