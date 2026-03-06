
--1
SELECT name as "Ten khach hang",id as "Ma khach hang"
FROM s_customer 
ORDER BY id desc;
--2
select userid
from s_emp
where id=23;
--3
select last_name ||' '|| first_name as "Employees"
from s_emp
where dept_id = 10 or dept_id =50
order by "Employees"
-- 4
select last_name ||' '|| first_name as "Employees"
from s_emp 
where lower(last_name) like '%s%' 
or lower(first_name) like '%s%'
--5
select userid,start_date
from s_emp
where start_date >= date '1990-05-14'
and start_date <= date '1991-05-26'
--6
select first_name || ' ' || last_name AS name,salary
from s_emp
where salary between 1000 and 2000

--7
select first_name || ' ' || last_name AS "Employee Name",
       salary AS "Monthly Salary"
from s_emp
where salary > 1350
and dept_id in (31,42,50)
--8
select first_name || ' ' || last_name as name, start_date
from s_emp
where extract(year from start_date) = 1991;
--9
SELECT id,
       first_name || ' ' || last_name AS name,
       salary * 1.15 AS increased_salary
FROM s_emp;

--10
SELECT first_name || ' ' || last_name AS name,
       start_date,
       TO_CHAR(NEXT_DAY(ADD_MONTHS(start_date,6),'MONDAY'),
       'fmDdsp "of" Month YYYY') AS review_date
FROM s_emp;

--11
SELECT name
FROM s_product
WHERE LOWER(name) LIKE '%ski%';

--12
SELECT first_name || ' ' || last_name AS name,
       ROUND(MONTHS_BETWEEN(SYSDATE, start_date)) AS months_worked
FROM s_emp
ORDER BY months_worked;

--13
SELECT COUNT(DISTINCT manager_id) AS total_managers
FROM s_emp
WHERE manager_id IS NOT NULL;

--14
SELECT MAX(total) AS Highest,
       MIN(total) AS Lowest
FROM s_ord;

--15
SELECT p.name,
       p.id,
       i.quantity AS ORDERED
FROM s_product p
JOIN s_item i
ON p.id = i.product_id
WHERE i.ord_id = 101;

--16
SELECT c.id AS customer_id,
       o.id AS order_id
FROM s_customer c
LEFT JOIN s_ord o
ON c.id = o.customer_id
ORDER BY c.id;

--17
SELECT o.customer_id,
       i.product_id,
       i.quantity
FROM s_ord o
JOIN s_item i
ON o.id = i.ord_id
WHERE o.total > 100000;

--18
select first_name || ' ' || last_name as full_name
from s_emp
where id not in (
    select distinct manager_id
    from s_emp
    where manager_id is not null
);
--19
select name 
from s_product
where name like 'Pro%'
order by name
--20
select name , short_desc 
from s_product 
where lower(short_desc) like '%bicycle%'
--21
select short_desc
from s_product
--22
select first_name || ' ' || last_name || ' (' || title || ')' as emp_info
from s_emp
--23
select manager_id, count(id) as SoNhanVienQuanLy
from s_emp
where manager_id is not null
group by manager_id
--24
select manager_id, count(id) as SoNhanVienQuanLy
from s_emp
where manager_id is not null
group by manager_id
having count(id) >= 20
--25
select r.id, r.name, count (d.id) as SoPhongBanTrucThuoc
from s_region r left join s_dept d on r.id = d.region_id
group by r.id, r.name

--26
select C.NAME , COUNT(DISTINCT O.ID) AS SO_LUONG_DON_DAT_HANG 
from S_CUSTOMER C 
LEFT JOIN S_ORD O ON O.CUSTOMER_ID = C.ID 
GROUP BY C.NAME
--27
select C.NAME , COUNT(O.ID) AS SO_LUONG_DON_DAT_HANG from S_CUSTOMER C LEFT JOIN S_ORD O ON O.CUSTOMER_ID = C.ID GROUP BY C.NAME ORDER BY COUNT(O.ID) DESC FETCH FIRST 1 ROWS ONLY;
--28
SELECT C.NAME, SUM(O.TOTAL) AS TONG_TIEN_NHIEU_NHAT
FROM S_CUSTOMER C
JOIN S_ORD O ON O.CUSTOMER_ID = C.ID
GROUP BY C.NAME
ORDER BY SUM(O.TOTAL) DESC
FETCH FIRST 1 ROWS ONLY;
--29
SELECT E.LAST_NAME , E.FIRST_NAME, E.START_DATE
FROM S_EMP E
WHERE E.DEPT_ID = 
( SELECT DEPT_ID 
    FROM S_EMP 
    WHERE FIRST_NAME = 'Lan'
)
AND FIRST_NAME <> 'Lan'
--30
SELECT E.ID, E.LAST_NAME, E.FIRST_NAME, E.USERID
FROM S_EMP E
WHERE E.SALARY > (
    SELECT AVG(SALARY) 
    FROM S_EMP
);
--31
SELECT E.ID, E.LAST_NAME, E.FIRST_NAME, E.USERID
FROM S_EMP E
WHERE E.SALARY > (
    SELECT AVG(SALARY) 
    FROM S_EMP
) AND E.FIRST_NAME LIKE '%L%'

--32
SELECT C.NAME
FROM S_CUSTOMER C
WHERE C.ID NOT IN (
SELECT O.customer_id
FROM S_ORD O
);
