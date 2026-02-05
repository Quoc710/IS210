
-- === PHẦN 1: TẠO BẢNG ===
CREATE TABLE DEPARTMENT
(
    DeptNo NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    DeptName VARCHAR2(20) NOT NULL,
    Note VARCHAR2(100)
);

CREATE TABLE EMPLOYEE (
    EmpNo varchar2(10) constraint PK_EMPLOYEE primary key, 
    EmpName varchar2(20) not null, 
    BirthDay date not null,       
    DeptNo number not null,
    MgrNo varchar2(10) default '0' not null, -- Đã gộp default vào đây luôn
    StartDate date not null,      
    Salary number not null,       
    Llevel number(3) not null,     
    Sstatus number(3) default 0 not null,    -- Đã gộp default vào đây luôn
    Note varchar2(100),
    constraint CK_EMPLOYEE_Llevel check (Llevel between 1 and 7),
    constraint CK_EMPLOYEE_Sstatus check (Sstatus between 0 and 2)
);

CREATE TABLE SKILL
(
    SkillNo NUMBER GENERATED ALWAYS AS IDENTITY CONSTRAINT PK_SKILL PRIMARY KEY,
    SkillName VARCHAR2(20) NOT NULL,
    Note VARCHAR2(100)
);

CREATE TABLE EMP_SKILL(
    SkillNo NUMBER CONSTRAINT FK_EMP_SKILL_SkillNo REFERENCES SKILL(SkillNo),
    EmpNo VARCHAR2(10) CONSTRAINT FK_EMP_SKILL_EmpNo REFERENCES EMPLOYEE(EmpNo),
    SkillLevel NUMBER NOT NULL,
    RegDate DATE NOT NULL,
    -- Đã bỏ cột Ddescription ngay từ đầu cho đỡ phải Alter
    PRIMARY KEY (SkillNo, EmpNo),
    CONSTRAINT CK_EMP_SKILL_SkillLv CHECK(SkillLevel BETWEEN 1 AND 3)
);
-- Thêm cột Email vào bảng EMPLOYEE
ALTER TABLE EMPLOYEE
ADD Email VARCHAR2(50) DEFAULT ' ' NOT NULL;
-- === PHẦN 2: TẠO KHÓA NGOẠI VÀ TRIGGER ===

-- Thêm khóa ngoại cho Employee trỏ về Department
ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK_EMPLOYEEDEPARTMENT FOREIGN KEY (Deptno) REFERENCES DEPARTMENT(Deptno);

-- TRIGGER ĐÃ SỬA LOGIC (QUAN TRỌNG)
CREATE OR REPLACE TRIGGER add_email
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    -- Chỉ kiểm tra trùng nểu Email KHÁC khoảng trắng mặc định
    IF :NEW.Email != ' ' THEN
        SELECT COUNT(*) INTO v_count
        FROM EMPLOYEE
        WHERE Email = :NEW.Email;

        IF v_count > 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Lỗi do email này đã có sẵn');
        END IF;
    END IF;
END;
/ 
-- (Dấu / ở trên bắt buộc phải có để chạy trigger)

-- === PHẦN 3: INSERT DỮ LIỆU ===

-- 1. Insert DEPARTMENT trước (Để lấy ID 1,2,3,4,5)
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('HR', 'Human Resources');
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('IT', 'Information Technology');
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('Finance', 'Finance Department');
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('Marketing', 'Marketing Department');
INSERT INTO DEPARTMENT (DeptName, Note) VALUES ('Operations', 'Operations Department');

-- 2. Insert SKILL (Để lấy ID 1,2,3,4,5)
INSERT INTO SKILL (SkillName, Note) VALUES ('Java', 'Programming language');
INSERT INTO SKILL (SkillName, Note) VALUES ('SQL', 'Database skill');
INSERT INTO SKILL (SkillName, Note) VALUES ('Communication', 'Soft skill');
INSERT INTO SKILL (SkillName, Note) VALUES ('Accounting', 'Finance skill');
INSERT INTO SKILL (SkillName, Note) VALUES ('Marketing', 'Business skill');

-- 3. Insert EMPLOYEE (DeptNo nhập 1,2,3,4 thay vì D01...)
INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note)
VALUES ('NV01', 'Nguyen An', DATE '1998-03-15', 1, 'M01', DATE '2021-01-10', 12000000, 3, 0, 'Chinh thuc');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note)
VALUES ('NV02', 'Tran Binh', DATE '1997-07-20', 2, 'M01', DATE '2020-06-01', 15000000, 4, 0, 'Thuc tap');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note)
VALUES ('NV03', 'Le Chi', DATE '1999-11-05', 2, 'M02', DATE '2022-03-12', 9000000, 2, 0, 'Chinh thuc');

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note)
VALUES ('NV04', 'Pham Dung', DATE '1996-02-28', 3, 'M02', DATE '2019-09-01', 18000000, 5, 1, 'Chinh thuc');

-- Lưu ý: DeptNo = 4 phải tồn tại bên bảng Department thì dòng này mới chạy được
INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Llevel, Sstatus, Note)
VALUES ('NV05', 'Hoang Huy', DATE '1995-12-10', 4, 'M03', DATE '2018-05-20', 22000000, 6, 0, 'Truong phong');

-- 4. Insert EMP_SKILL
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES (1, 'NV01', 2, DATE '2022-01-10');
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES (2, 'NV01', 3, DATE '2022-03-15');
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES (3, 'NV02', 2, DATE '2021-06-20');
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES (4, 'NV04', 1, DATE '2020-10-05');
INSERT INTO EMP_SKILL (SkillNo, EmpNo, SkillLevel, RegDate) VALUES (5, 'NV05', 3, DATE '2019-08-12');

-- === PHẦN 4: TẠO VIEW ===
CREATE OR REPLACE VIEW EMPLOYEE_TRACKING AS
SELECT EmpNo, EmpName, Llevel
FROM EMPLOYEE
WHERE Llevel BETWEEN 3 AND 5;