--CAU A: CHÈN 8 DONG DU LIEU
--(DEPARTMENT)
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('HR', 'Human Resources');          
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('IT', 'Information Technology');   
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('Finance', 'Finance Dept');        
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('Marketing', 'Marketing Dept');    
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('Operations', 'Operations Dept');  
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('Sales', 'Sales Department');      
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('Logistics', 'Supply Chain');      
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('R&D', 'Research & Development');

--(SKILL)
INSERT INTO SKILL (SkillName, Note) VALUES ('Java', 'Programming Language');
INSERT INTO SKILL (SkillName, Note) VALUES ('SQL', 'Database Management');
INSERT INTO SKILL (SkillName, Note) VALUES ('Communication', 'Soft Skill');
INSERT INTO SKILL (SkillName, Note) VALUES ('Accounting', 'Finance Skill');
INSERT INTO SKILL (SkillName, Note) VALUES ('Marketing', 'Business Skill');
INSERT INTO SKILL (SkillName, Note) VALUES ('C++', 'Programming Language');
INSERT INTO SKILL (SkillName, Note) VALUES ('.NET', 'Microsoft Framework');
INSERT INTO SKILL (SkillName, Note) VALUES ('Python', 'Data Science');

--(EMPLOYEE)
INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note, Email)
VALUES ('NV05', 'Hoang Huy', DATE '1985-12-10', (SELECT DeptNo FROM DEPARTMENT WHERE DeptName='Operations' AND ROWNUM=1), 'NV05', DATE '2015-05-20', 30000000, 7, 0, 'Giam doc', 'huy.hoang@abc.com');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note, Email)
VALUES ('NV01', 'Nguyen An', DATE '1990-03-15', (SELECT DeptNo FROM DEPARTMENT WHERE DeptName='HR' AND ROWNUM=1), 'NV05', DATE '2018-01-10', 15000000, 5, 0, 'Quan ly HR', 'an.nguyen@abc.com');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note, Email)
VALUES ('NV02', 'Tran Binh', DATE '1992-07-20', (SELECT DeptNo FROM DEPARTMENT WHERE DeptName='IT' AND ROWNUM=1), 'NV05', DATE '2019-06-01', 18000000, 5, 0, 'Quan ly IT', 'binh.tran@abc.com');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note, Email)
VALUES ('NV03', 'Le Chi', DATE '1999-11-05', (SELECT DeptNo FROM DEPARTMENT WHERE DeptName='IT' AND ROWNUM=1), 'NV02', DATE '2022-03-12', 9000000, 2, 0, 'Dev', 'chi.le@abc.com');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note, Email)
VALUES ('NV04', 'Pham Dung', DATE '1996-02-28', (SELECT DeptNo FROM DEPARTMENT WHERE DeptName='Finance' AND ROWNUM=1), 'NV05', DATE '2020-09-01', 12000000, 3, 1, 'Ke toan', 'dung.pham@abc.com');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note, Email)
VALUES ('NV06', 'Do Minh', DATE '2000-01-01', (SELECT DeptNo FROM DEPARTMENT WHERE DeptName='Marketing' AND ROWNUM=1), 'NV01', DATE '2023-01-01', 8000000, 1, 0, 'Thuc tap', 'minh.do@abc.com');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note, Email)
VALUES ('NV07', 'Bui Hoa', DATE '1994-05-15', (SELECT DeptNo FROM DEPARTMENT WHERE DeptName='R&D' AND ROWNUM=1), 'NV02', DATE '2019-11-20', 25000000, 6, 1, 'Truong nhom R&D', 'hoa.bui@abc.com');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note, Email)
VALUES ('NV08', 'Lai Van', DATE '1998-09-09', (SELECT DeptNo FROM DEPARTMENT WHERE DeptName='Sales' AND ROWNUM=1), 'NV01', DATE '2021-08-08', 14000000, 3, 0, 'Sales', 'van.lai@abc.com');

--(EMP_SKILL)
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES ((SELECT SkillNo FROM SKILL WHERE SkillName='Java' AND ROWNUM=1), 'NV06', 1, SYSDATE);
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES ((SELECT SkillNo FROM SKILL WHERE SkillName='SQL' AND ROWNUM=1), 'NV07', 3, SYSDATE);
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES ((SELECT SkillNo FROM SKILL WHERE SkillName='Communication' AND ROWNUM=1), 'NV08', 2, SYSDATE);
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES ((SELECT SkillNo FROM SKILL WHERE SkillName='Accounting' AND ROWNUM=1), 'NV04', 3, SYSDATE);
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES ((SELECT SkillNo FROM SKILL WHERE SkillName='Marketing' AND ROWNUM=1), 'NV05', 3, SYSDATE);
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES ((SELECT SkillNo FROM SKILL WHERE SkillName='C++' AND ROWNUM=1), 'NV03', 2, SYSDATE);
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES ((SELECT SkillNo FROM SKILL WHERE SkillName='.NET' AND ROWNUM=1), 'NV02', 3, SYSDATE);
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES ((SELECT SkillNo FROM SKILL WHERE SkillName='Python' AND ROWNUM=1), 'NV07', 2, SYSDATE);

COMMIT;



-- CAU B 
SELECT e.EmpName, e.Email, d.DeptName, e.StartDate
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.DeptNo = d.DeptNo
WHERE MONTHS_BETWEEN(SYSDATE, e.StartDate) >= 6;
--CAU C
SELECT e.EmpName, s.SkillName
FROM EMPLOYEE e
JOIN EMP_SKILL es ON e.EmpNo = es.EmpNo
JOIN SKILL s ON es.SkillNo = s.SkillNo
WHERE s.SkillName IN ('C++', '.NET');
-- CAU D
SELECT 
    e.EmpName AS Ten_Nhan_Vien, 
    m.EmpName AS Ten_Quan_Ly, 
    m.Email AS Email_Quan_Ly
FROM EMPLOYEE e
JOIN EMPLOYEE m ON e.MgrNo = m.EmpNo;
-- CAU E
SELECT d.DeptName, e.EmpName
FROM DEPARTMENT d
JOIN EMPLOYEE e ON d.DeptNo = e.DeptNo
WHERE d.DeptNo IN (
    SELECT DeptNo 
    FROM EMPLOYEE 
    GROUP BY DeptNo 
    HAVING COUNT(*) >= 2
)
ORDER BY d.DeptName;
--CAU F
SELECT e.EmpName, e.Email, es.SkillNo
FROM EMPLOYEE e
JOIN EMP_SKILL es ON e.EmpNo = es.EmpNo
ORDER BY e.EmpName ASC;
-- CAU G
SELECT EmpName, Email, BirthDay
FROM EMPLOYEE
WHERE EmpNo IN (
    SELECT EmpNo
    FROM EMP_SKILL
    GROUP BY EmpNo
    HAVING COUNT(*) >= 2
);
--CAU H
CREATE OR REPLACE VIEW VIEW_WORKING_EMP AS
SELECT e.EmpName, s.SkillName, d.DeptName
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.DeptNo = d.DeptNo
JOIN EMP_SKILL es ON e.EmpNo = es.EmpNo
JOIN SKILL s ON es.SkillNo = s.SkillNo;

