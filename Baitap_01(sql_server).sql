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
