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

SELECT E.EmpName, E.Email, D.DeptName
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DeptNo = D.DeptNo
WHERE DATEDIFF(MONTH, E.StartDate, GETDATE()) >= 6;

SELECT DISTINCT E.EmpName
FROM EMPLOYEE E
JOIN EMP_SKILL ES ON E.EmpNo = ES.EmpNo
JOIN SKILL S ON ES.SkillNo = S.SkillNo
WHERE S.SkillName IN ('C++', '.NET');

SELECT 
    E.EmpName AS EmployeeName,
    M.EmpName AS ManagerName,
    M.Email AS ManagerEmail
FROM EMPLOYEE E
JOIN EMPLOYEE M ON E.MgrNo = M.EmpNo;

SELECT D.DeptName, E.EmpName
FROM DEPARTMENT D
JOIN EMPLOYEE E ON D.DeptNo = E.DeptNo
WHERE D.DeptNo IN (
    SELECT DeptNo
    FROM EMPLOYEE
    GROUP BY DeptNo
    HAVING COUNT(*) >= 2
)
ORDER BY D.DeptName;

SELECT E.EmpName, E.Email, ES.SkillNo
FROM EMPLOYEE E
LEFT JOIN EMP_SKILL ES ON E.EmpNo = ES.EmpNo
ORDER BY E.EmpName ASC;

SELECT EmpName, Email, BirthDay
FROM EMPLOYEE
WHERE Status = 0
AND EmpNo IN (
    SELECT EmpNo
    FROM EMP_SKILL
    GROUP BY EmpNo
    HAVING COUNT(*) > 1
);

CREATE VIEW VW_WorkingEmployees
AS
SELECT 
    E.EmpName,
    S.SkillName,
D.DeptName
FROM EMPLOYEE E
JOIN EMP_SKILL ES ON E.EmpNo = ES.EmpNo
JOIN SKILL S ON ES.SkillNo = S.SkillNo
JOIN DEPARTMENT D ON E.DeptNo = D.DeptNo
WHERE E.Status = 0;