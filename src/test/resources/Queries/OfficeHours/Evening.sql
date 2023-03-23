select * from EMPLOYEES;
select * from EMPLOYEES where EMAIL = 'SKING';
---- PRACTICE 1 ----
--4. List all the different region_ids in countries table , distinct gives not duplicated, unique
select distinct REGION_ID from COUNTRIES;
-- comment line

--5. Display the salary of the employee Grant Douglas (lastName: Grant, firstName: Douglas)
select SALARY from EMPLOYEES;  -- requires filtering : where
select SALARY from EMPLOYEES where LAST_NAME = 'Grant' and FIRST_NAME = 'Douglas';


--6. Display all department information from departments table
select * from DEPARTMENTS;
-- if the department name values are as below
-- IT , Public Relations , Sales , Executive
select * from DEPARTMENTS
where DEPARTMENT_NAME in ('IT', 'Sales', 'Public Relations', 'Executive');

-- 16 . Display all unique job_id that end with CLERK in employee table
select distinct JOB_ID from EMPLOYEES
where JOB_ID like '%CLERK';
-- bring me information of people in employees DB whose phone numbers start with 590
SELECT * FROM employees WHERE phone_number LIKE '590%';

-- 20-4 How many employees are there in each group that have minimum
-- salary of 5000 ?
select  JOB_ID, count(*) from EMPLOYEES
where salary >= 5000
group by JOB_ID ;

-- which groups makes minimum avg salary
-- -- salary of 5000 ?, min(salary) ---- only groups whose employees at least makes 5000
select  JOB_ID, avg(SALARY) from EMPLOYEES
group by JOB_ID
having avg(salary) >= 5000;

select  JOB_ID, count(*) from EMPLOYEES
group by JOB_ID
having min(salary) >= 5000;

-- 21. display all job_id and average salary who work as any of these jobs
-- -- IT_PROG,SA_REP, FI_ACCOUNT, AD_VP   --- it works with both having and where

select JOB_ID, avg(SALARY) from EMPLOYEES
group by JOB_ID
having JOB_ID in ('IT_PROG','SA_REP', 'FI_ACCOUNT', 'AD_VP');

select JOB_ID, avg(SALARY) from EMPLOYEES
where JOB_ID in ('IT_PROG','SA_REP', 'FI_ACCOUNT', 'AD_VP')
group by JOB_ID;


-- 23. Display total salary for each department except department_id 50, and where total salary more than 30000
select DEPARTMENT_ID, sum(SALARY) from EMPLOYEES
group by DEPARTMENT_ID
having sum(SALARY) >= 30000 and DEPARTMENT_ID != 50;


---- PRACTICE 2 ----
--8.  Find the 3rd maximum salary from the employees table (do not include duplicates)


--12. Find the 3rd minimum salary from the employees table (do not include duplicates)

---- PRACTICE 3 ----
-- 1. FIND OUT COUNTRY NAME AND REGION NAME FROM COUNTRIES AND  REGION TABLE


-- 3.  FIND OUT DEPARTMENT_NAME AND CITY


-- 5.  FIND OUT FIRST_NAME, LAST NAME, DEPARTMENT ID , DEPARTMENT NAME FOR DEPARTMENT ID 80 OR 40


-- 7. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME ,  CITY


-- 8. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME ,CITY , COUNTRY_NAME , REGION_NAME


-- 11 .FIND OUT DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_NAME INCLUDING THOSE COUNTRIES WITH NO DEPARTMENT
