-- hr_analytics_extended.sql
-- Extended HR Analytics SQL*Plus Project Script (10+ employees)
-- Created by ChatGPT (GPT-5 Thinking mini)

SET ECHO ON
SET FEEDBACK ON
SET SERVEROUTPUT ON
PROMPT ====== HR Analytics extended schema setup ======

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE promotions CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE attendance CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE employees CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE departments CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
PROMPT Dropped old tables (if any)

-- Create tables
CREATE TABLE departments (
  department_id NUMBER PRIMARY KEY,
  department_name VARCHAR2(100)
);

CREATE TABLE employees (
  emp_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  gender CHAR(1),
  department_id NUMBER,
  job_title VARCHAR2(100),
  hire_date DATE,
  salary NUMBER(12,2),
  performance_score NUMBER(3,2),
  CONSTRAINT fk_emp_dept FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE attendance (
  attendance_id NUMBER PRIMARY KEY,
  emp_id NUMBER,
  month_start DATE,
  days_present NUMBER,
  days_absent NUMBER,
  CONSTRAINT fk_att_emp FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE promotions (
  promotion_id NUMBER PRIMARY KEY,
  emp_id NUMBER,
  promotion_date DATE,
  new_title VARCHAR2(100),
  new_salary NUMBER(12,2),
  CONSTRAINT fk_prom_emp FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

PROMPT Tables created.

-- Insert departments
INSERT INTO departments VALUES (1, 'Data & Analytics');
INSERT INTO departments VALUES (2, 'Human Resources');
INSERT INTO departments VALUES (3, 'Marketing');
INSERT INTO departments VALUES (4, 'Finance');
INSERT INTO departments VALUES (5, 'IT Support');

COMMIT;

-- Insert employees (12 employees)
INSERT INTO employees VALUES (101, 'John', 'Smith', 'M', 1, 'Data Analyst', TO_DATE('2018-04-12','YYYY-MM-DD'), 70000, 4.20);
INSERT INTO employees VALUES (102, 'Priya', 'Sharma', 'F', 2, 'HR Executive', TO_DATE('2019-01-17','YYYY-MM-DD'), 55000, 4.50);
INSERT INTO employees VALUES (103, 'David', 'Brown', 'M', 3, 'Marketing Lead', TO_DATE('2017-09-03','YYYY-MM-DD'), 85000, 3.80);
INSERT INTO employees VALUES (104, 'Sneha', 'Patil', 'F', 1, 'Data Engineer', TO_DATE('2020-07-22','YYYY-MM-DD'), 72000, 4.10);
INSERT INTO employees VALUES (105, 'Arjun', 'Rao', 'M', 2, 'HR Manager', TO_DATE('2016-11-15','YYYY-MM-DD'), 92000, 4.60);
INSERT INTO employees VALUES (106, 'Aisha', 'Khan', 'F', 3, 'Marketing Analyst', TO_DATE('2021-03-10','YYYY-MM-DD'), 63000, 4.00);
INSERT INTO employees VALUES (107, 'Rohit', 'Desai', 'M', 4, 'Finance Analyst', TO_DATE('2015-06-01','YYYY-MM-DD'), 78000, 3.90);
INSERT INTO employees VALUES (108, 'Meera', 'Iyer', 'F', 5, 'IT Support Engineer', TO_DATE('2022-02-20','YYYY-MM-DD'), 50000, 3.70);
INSERT INTO employees VALUES (109, 'Sameer', 'Patel', 'M', 1, 'Senior Data Analyst', TO_DATE('2014-10-05','YYYY-MM-DD'), 95000, 4.70);
INSERT INTO employees VALUES (110, 'Kavita', 'Joshi', 'F', 4, 'Finance Manager', TO_DATE('2013-12-12','YYYY-MM-DD'), 102000, 4.40);
INSERT INTO employees VALUES (111, 'Vikram', 'Malhotra', 'M', 3, 'Content Strategist', TO_DATE('2020-05-18','YYYY-MM-DD'), 61000, 3.95);
INSERT INTO employees VALUES (112, 'Nisha', 'Verma', 'F', 5, 'IT Technician', TO_DATE('2019-08-09','YYYY-MM-DD'), 47000, 3.85);

COMMIT;

-- Insert attendance records (12+ rows across months)
INSERT INTO attendance VALUES (1, 101, TO_DATE('2024-07-01','YYYY-MM-DD'), 21, 2);
INSERT INTO attendance VALUES (2, 102, TO_DATE('2024-07-01','YYYY-MM-DD'), 20, 3);
INSERT INTO attendance VALUES (3, 103, TO_DATE('2024-07-01','YYYY-MM-DD'), 19, 4);
INSERT INTO attendance VALUES (4, 104, TO_DATE('2024-07-01','YYYY-MM-DD'), 22, 1);
INSERT INTO attendance VALUES (5, 105, TO_DATE('2024-07-01','YYYY-MM-DD'), 18, 5);
INSERT INTO attendance VALUES (6, 106, TO_DATE('2024-07-01','YYYY-MM-DD'), 20, 3);
INSERT INTO attendance VALUES (7, 107, TO_DATE('2024-07-01','YYYY-MM-DD'), 21, 2);
INSERT INTO attendance VALUES (8, 108, TO_DATE('2024-07-01','YYYY-MM-DD'), 22, 1);
INSERT INTO attendance VALUES (9, 109, TO_DATE('2024-07-01','YYYY-MM-DD'), 20, 3);
INSERT INTO attendance VALUES (10, 110, TO_DATE('2024-07-01','YYYY-MM-DD'), 19, 4);
INSERT INTO attendance VALUES (11, 111, TO_DATE('2024-07-01','YYYY-MM-DD'), 21, 2);
INSERT INTO attendance VALUES (12, 112, TO_DATE('2024-07-01','YYYY-MM-DD'), 22, 1);

-- Add another month for some employees for trend
INSERT INTO attendance VALUES (13, 101, TO_DATE('2024-08-01','YYYY-MM-DD'), 20, 3);
INSERT INTO attendance VALUES (14, 104, TO_DATE('2024-08-01','YYYY-MM-DD'), 21, 2);
INSERT INTO attendance VALUES (15, 105, TO_DATE('2024-08-01','YYYY-MM-DD'), 19, 4);
INSERT INTO attendance VALUES (16, 109, TO_DATE('2024-08-01','YYYY-MM-DD'), 22, 1);

COMMIT;

-- Insert promotions (5 promotions)
INSERT INTO promotions VALUES (1, 101, TO_DATE('2022-03-01','YYYY-MM-DD'), 'Senior Data Analyst', 85000);
INSERT INTO promotions VALUES (2, 102, TO_DATE('2023-08-15','YYYY-MM-DD'), 'HR Specialist', 60000);
INSERT INTO promotions VALUES (3, 104, TO_DATE('2024-06-10','YYYY-MM-DD'), 'Senior Data Engineer', 90000);
INSERT INTO promotions VALUES (4, 109, TO_DATE('2021-11-20','YYYY-MM-DD'), 'Lead Data Scientist', 115000);
INSERT INTO promotions VALUES (5, 110, TO_DATE('2019-05-01','YYYY-MM-DD'), 'Senior Finance Manager', 120000);

COMMIT;

PROMPT ===== Department-wise average salary =====
SELECT d.department_name,
       ROUND(AVG(e.salary),2) AS avg_salary,
       COUNT(*) AS headcount
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_salary DESC;

PROMPT ===== Gender pay gap by department =====
SELECT d.department_name,
       e.gender,
       ROUND(AVG(e.salary),2) AS avg_salary,
       COUNT(*) AS count_emp
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name, e.gender
ORDER BY d.department_name, e.gender;

PROMPT ===== Top performing employees =====
SELECT emp_id,
       first_name || ' ' || last_name AS full_name,
       job_title,
       performance_score
FROM employees
ORDER BY performance_score DESC NULLS LAST
FETCH FIRST 10 ROWS ONLY;

PROMPT ===== Attendance: absenteeism rate per employee (percentage) =====
SELECT e.emp_id,
       e.first_name || ' ' || e.last_name AS full_name,
       SUM(a.days_present) AS total_present,
       SUM(a.days_absent) AS total_absent,
       ROUND((SUM(a.days_absent) / NULLIF((SUM(a.days_present) + SUM(a.days_absent)),0)) * 100,2) AS absence_pct
FROM attendance a
JOIN employees e ON a.emp_id = e.emp_id
GROUP BY e.emp_id, e.first_name, e.last_name
ORDER BY absence_pct DESC NULLS LAST;

PROMPT ===== Promotions analysis (salary increase) =====
SELECT e.emp_id,
       e.first_name || ' ' || e.last_name AS full_name,
       e.job_title AS old_title,
       p.new_title,
       e.salary AS old_salary,
       p.new_salary,
       p.promotion_date,
       (p.new_salary - e.salary) AS salary_increase
FROM promotions p
JOIN employees e ON p.emp_id = e.emp_id
ORDER BY salary_increase DESC NULLS LAST;

PROMPT ===== Advanced: Rank employees by department salary (dense_rank) =====
SELECT d.department_name,
       e.emp_id,
       e.first_name || ' ' || e.last_name AS full_name,
       e.salary,
       DENSE_RANK() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS dept_salary_rank
FROM employees e
JOIN departments d ON e.department_id = d.department_id
ORDER BY d.department_name, dept_salary_rank;

PROMPT ===== Example: attendance vs performance grouping =====
WITH emp_abs AS (
  SELECT e.emp_id,
         e.first_name || ' ' || e.last_name AS full_name,
         e.performance_score,
         NVL(SUM(a.days_absent),0) AS total_absent
  FROM employees e
  LEFT JOIN attendance a ON e.emp_id = a.emp_id
  GROUP BY e.emp_id, e.first_name, e.last_name, e.performance_score
)
SELECT CASE WHEN total_absent >= 6 THEN 'High absence (>=6)' WHEN total_absent >=3 THEN 'Medium absence (3-5)' ELSE 'Low absence (0-2)' END AS absence_group,
       ROUND(AVG(performance_score),2) AS avg_perf,
       COUNT(*) AS emp_count
FROM emp_abs
GROUP BY CASE WHEN total_absent >= 6 THEN 'High absence (>=6)' WHEN total_absent >=3 THEN 'Medium absence (3-5)' ELSE 'Low absence (0-2)' END;

PROMPT ===== Done. =====
