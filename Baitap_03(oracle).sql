-- BAI TAP 03 nằm ở đây luôn 
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
CREATE OR REPLACE PROCEDURE Update_Emp_Level AS
    v_count NUMBER;
BEGIN
    UPDATE Employee
    SET Level_Emp = 2
    WHERE Level_Emp = 1 
      AND MONTHS_BETWEEN(SYSDATE, StartDate) / 12 >= 3;

    v_count := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('Số lượng nhân viên được cập nhật: ' || v_count);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Lỗi: ' || SQLERRM);
END;
/
-- CAU C
CREATE OR REPLACE PROCEDURE Get_Out_Employee_Info (p_EmpNo IN VARCHAR2) AS
    v_name Employee.EmpName%TYPE;
    v_email Employee.Email%TYPE;
    v_dept Name Department.DeptName%TYPE;
BEGIN
    SELECT e.EmpName, e.Email, d.DeptName
    INTO v_name, v_email, v_deptName
    FROM Employee e
    JOIN Department d ON e.DeptID = d.DeptID
    WHERE e.EmpNo = p_EmpNo AND e.Status = 'Out'; -- Giả sử cột Status đánh dấu nghỉ việc

    DBMS_OUTPUT.PUT_LINE('Tên: ' || v_name || ' | Email: ' || v_email || ' | Phòng: ' || v_deptName);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Không tìm thấy nhân viên đã nghỉ việc với mã này.');
END;
/
-- CAU D
CREATE OR REPLACE FUNCTION Emp_Tracking (p_EmpNo IN VARCHAR2) 
RETURN NUMBER AS
    v_salary NUMBER;
BEGIN
    SELECT Salary INTO v_salary
    FROM Employee
    WHERE EmpNo = p_EmpNo AND Status = 'Working'; -- Chỉ lấy người đang làm việc
    
    RETURN v_salary;
EXCEPTION
    WHEN NO_DATA_FOUND THEN RETURN 0;
END;
/
-- CAU E
CREATE OR REPLACE TRIGGER Check_Invalid_Emp
BEFORE INSERT OR UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF :NEW.Level_Emp = 1 AND :NEW.Salary > 10000000 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Lỗi: Nhân viên Level 1 không được có lương trên 10,000,000!');
    END IF;
END;
/
-- CAU F
    DECLARE
    CURSOR cur_emp IS
        SELECT EmpNo, Level_Emp, StartDate, 
               (SELECT COUNT(*) FROM Employee_Skills s WHERE s.EmpNo = e.EmpNo) as skill_count
        FROM Employee e;
    
    v_current_salary NUMBER;
    v_years NUMBER;
BEGIN
    FOR r IN cur_emp LOOP
        v_current_salary := Emp_Tracking(r.EmpNo); -- Sử dụng lại function câu d
        v_years := MONTHS_BETWEEN(SYSDATE, r.StartDate) / 12;

        IF v_current_salary > 0 THEN -- Nếu nhân viên còn đang làm việc
            -- Điều kiện 1: Level 2, làm ít nhất 2 năm, nhiều kỹ năng
            IF r.skill_count > 1 AND r.Level_Emp = 2 AND v_years >= 2 THEN
                UPDATE Employee SET Salary = Salary + 300000 WHERE EmpNo = r.EmpNo;
            
            -- Điều kiện 2: Level 3, làm ít nhất 3 năm, nhiều kỹ năng
            ELSIF r.skill_count > 1 AND r.Level_Emp = 3 AND v_years >= 3 THEN
                UPDATE Employee SET Salary = Salary + 500000 WHERE EmpNo = r.EmpNo;
            END IF;
        END IF;
    END LOOP;

    COMMIT; -- Lưu tất cả nếu thành công
    DBMS_OUTPUT.PUT_LINE('Cập nhật lương hoàn tất!');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK; -- Hoàn tác nếu có bất kỳ lỗi nào
        DBMS_OUTPUT.PUT_LINE('Cập nhật thất bại, hệ thống đã Rollback. Lỗi: ' || SQLERRM);
END;
/
