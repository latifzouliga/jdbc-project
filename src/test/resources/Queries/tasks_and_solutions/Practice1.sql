--1. List all the employees first and last name with their salary in employees table
select FIRST_NAME, LAST_NAME, SALARY
from EMPLOYEES;

-- 2. How many employees have salary less than 5000?
select count(*)
from EMPLOYEES
where SALARY < 5000;

-- 3. How many employees have salary between 6000 and 7000?
select count(*)
from EMPLOYEES
where SALARY between 6000 and 7000;

select FIRST_NAME, SALARY
from EMPLOYEES
where SALARY between 6000 and 7000;

-- 4. List all the different region_ids in countries table
select REGION_ID
from COUNTRIES;

-- 5. Display the salary of the employee Grant Douglas (lastName: Grant,
--     firstName: Douglas)
select SALARY
from EMPLOYEES
where FIRST_NAME = 'Douglas'
  and LAST_NAME = 'Grant';

--     6. Display all department information from departments table
select *
from DEPARTMENTS;

--     -- if the department name values are as below
-- -- IT , Public Relations , Sales , Executive
select *
from DEPARTMENTS
where DEPARTMENT_NAME in ('IT', 'Public Relations', 'Sales', 'Executive');

--     7. Display the maximum salary in employees table
select max(SALARY)
from EMPLOYEES;
select SALARY
from EMPLOYEES
order by SALARY desc;

--     8. Display the the minimum salary in employees table
select min(SALARY)
from EMPLOYEES;

--     9. Display the average salary of the employees;
select round(avg(SALARY), 2)
from EMPLOYEES;

-- 10. Count the total numbers of the departments in departs table
select count(*)
from DEPARTMENTS;

-- 11. Sort the start_date in ascending order in job_history's table
select START_DATE
from JOB_HISTORY
order by START_DATE;

-- 12. Sort the start_date in descending order in job_history's table
select START_DATE
from JOB_HISTORY
order by START_DATE desc;

-- 13. Display all records whose last name contains 2 lowercase 'a's
select *
from EMPLOYEES
where LAST_NAME like '%a%';

-- 14. Display all the employees whose first name starts with ‘A'
select FIRST_NAME
from EMPLOYEES
where FIRST_NAME like '%A%';

-- 15. Display all the employees whose job_ID contains ‘IT'
select *
from EMPLOYEES
where JOB_ID like '%IT%';

-- 16. Display all unique job_id that end with CLERK in employee table
select distinct JOB_ID
from EMPLOYEES
where JOB_ID like '%CLERK';

-- 17.Display all employees first name starts with A and have exactly 4 characters
select FIRST_NAME
from EMPLOYEES
where FIRST_NAME like 'A___';

-- 18. Display all the employees whose department id in 50, 80, 100
select FIRST_NAME, DEPARTMENT_ID
from EMPLOYEES
where DEPARTMENT_ID in (50, 80, 100);

-- 19. Display all employees who does not work in any one of these department id —
-- > 90, 60, 100, 130, 120
select FIRST_NAME
from EMPLOYEES
where DEPARTMENT_ID not in (90, 60, 100, 130, 120);

-- 20. divide employees into groups by using their job id
select JOB_ID
from EMPLOYEES
group by JOB_ID;

-- -- 1 display the maximum salaries in each groups
select JOB_ID, max(SALARY)
from EMPLOYEES
group by JOB_ID;

-- -- 2 display the minimum salaries in each groups
select JOB_ID, MIN(SALARY)
from EMPLOYEES
group by JOB_ID;

-- -- 3 display the average salary of each group
select JOB_ID, avg(SALARY)
from EMPLOYEES
group by JOB_ID;

-- -- 4 how many employees are there in each group that have minimum
-- salary of 5000 ?
select JOB_ID, count(*)
from EMPLOYEES
where SALARY >= 5000
group by JOB_ID;

-- -- 5 display the total budgets of each groups
select JOB_ID, sum(SALARY)
from EMPLOYEES
group by JOB_ID;

-- 21. display all job_id and average salary who work as any of these jobs
-- IT_PROG,SA_REP, FI_ACCOUNT, AD_VP

select JOB_ID, avg(SALARY)
from EMPLOYEES
group by JOB_ID
having JOB_ID in ('IT_PROG', 'SA_REP', 'FI_ACCOUNT', 'AD_VP');


-- 22.Display max salary for each department
select DEPARTMENT_ID, max(SALARY)
from EMPLOYEES
group by DEPARTMENT_ID;

-- 23. Display total salary for each department except department_id 50, and where is less than 30000
select DEPARTMENT_ID, sum(SALARY)
from EMPLOYEES
group by DEPARTMENT_ID
having DEPARTMENT_ID != 50
   and sum(SALARY) > 30000;

select distinct SALARY
from EMPLOYEES
order by SALARY desc;

select FIRST_NAME, LAST_NAME, SALARY
from EMPLOYEES
where SALARY = (select min(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc) where ROWNUM <= 2);

-- 1. Display full addresses from locations table in a single column
select STREET_ADDRESS, CITY, STATE_PROVINCE, POSTAL_CODE
from LOCATIONS;

select STREET_ADDRESS || ', ' || CITY || ',' || STATE_PROVINCE || ', ' || POSTAL_CODE
from LOCATIONS;

-- 2. Display all information of the employee who has the minimum salary in employees table
select *
from EMPLOYEES
where SALARY = (select min(SALARY) from EMPLOYEES);

-- 3. Display the second minimum salary from the employees

select min(SALARY)
from EMPLOYEES;
select min(SALARY)
from EMPLOYEES
where SALARY = (select min(SALARY) from EMPLOYEES where SALARY > (select min(SALARY) from EMPLOYEES));

-- 4. Display all information of the employee who has the second minimum salary
select *
from EMPLOYEES
where SALARY = (select min(SALARY) from EMPLOYEES where SALARY > (select min(SALARY) from EMPLOYEES));

-- 5. List all the employees who are making above the average salary;
select *
from EMPLOYEES
where SALARY > (select avg(SALARY) from EMPLOYEES);


-- 6. List all the employees who are making less than the average salary
select *
from EMPLOYEES
where SALARY < (select avg(SALARY) from EMPLOYEES);

-- 7. Display manager name of 'Neena'
select FIRST_NAME, LAST_NAME
from EMPLOYEES
where EMPLOYEE_ID in (select MANAGER_ID
                      from EMPLOYEES
                      where FIRST_NAME = 'Neena');
-- 8. Find the 3rd maximum salary from the employees table (do not include duplicates)
select distinct SALARY
from EMPLOYEES
order by SALARY desc;

select SALARY
from EMPLOYEES
where SALARY = (select min(SALARY)
                from (select distinct SALARY
                      from EMPLOYEES
                      order by SALARY desc)
                where ROWNUM <= 3);

-- 9. Find the 5th maximum salary from the employees table (do not include duplicates)
select SALARY
from EMPLOYEES
where SALARY = (select min(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc) where ROWNUM <= 5);

-- 10. Find the 7th maximum salary from the employees table (do not include duplicates)
select SALARY
from EMPLOYEES
where SALARY = (select min(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc) where ROWNUM <= 7);

-- 11. Find the 10th maximum salary from the employees table (do not include duplicates)
select distinct SALARY
from EMPLOYEES
where SALARY =
      (select min(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc) where ROWNUM <= 10);

-- 12. Find the 3rd minimum salary from the employees table (do not include duplicates)
select distinct SALARY
from EMPLOYEES
where SALARY = (select max(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY) where ROWNUM <= 3);

-- 13. Find the 5th minimum salary from the employees table (do not include duplicates)
select distinct SALARY
from EMPLOYEES
where SALARY = (select max(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY) where ROWNUM <= 5);


-- find the second max salary
select distinct SALARY
from EMPLOYEES
order by SALARY desc;

select distinct SALARY
from EMPLOYEES
where SALARY = (select max(SALARY)
                from EMPLOYEES
                where SALARY < (select distinct max(SALARY) from EMPLOYEES));

select distinct SALARY
from EMPLOYEES
where SALARY = (select min(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc) where ROWNUM <= 2);


select distinct min(SALARY)
from EMPLOYEES
where ROWNUM <= 2
order by SALARY desc;

select distinct SALARY
from EMPLOYEES
order by SALARY desc;

-- 1. FIND OUT COUNTRY NAME AND REGION NAME FROM COUNTRIES AND  REGION TABLE
select COUNTRY_NAME, REGION_NAME
from COUNTRIES C
         join REGIONS R on C.REGION_ID = R.REGION_ID;

-- 2. FIND OUT FIRST_NAME AND JOB_TITLE FROM JOBS AND EMPLOYEES TABLE
select FIRST_NAME, JOB_TITLE
from EMPLOYEES E
         join JOBS J on E.JOB_ID = J.JOB_ID;

-- 3. FIND OUT DEPARTMENT_NAME AND CITY
select DEPARTMENT_NAME, CITY
from DEPARTMENTS D
         join LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID;

-- 4. FIND OUT ALL CITIES AND COUNTRY NAMES
select CITY, COUNTRY_NAME
from LOCATIONS L
         join COUNTRIES C on L.COUNTRY_ID = C.COUNTRY_ID;

-- 5. FIND OUT FIRST_NAME, LAST NAME, DEPARTMENT ID , DEPARTMENT NAME  FOR DEPARTMENT ID 80 OR 40
select FIRST_NAME, LAST_NAME, D.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES L
         join DEPARTMENTS D on L.DEPARTMENT_ID = D.DEPARTMENT_ID
where D.DEPARTMENT_ID in (80, 40);

-- 6. FIND OUT CITY , COUNTRY_NAME OF THAT CITY , REGION_NAME OF THAT CITY
select city, COUNTRY_NAME, REGION_NAME
from LOCATIONS L
         join COUNTRIES C On L.COUNTRY_ID = C.COUNTRY_ID
         join REGIONS R on C.REGION_ID = R.REGION_ID;

-- 7. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME , CITY
select FIRST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY
from EMPLOYEES E
         join JOBS J on E.JOB_ID = J.JOB_ID
         join DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
         join LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID;

-- 8. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME , CITY , COUNTRY_NAME , REGION_NAME
select FIRST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGION_NAME
from EMPLOYEES E
         join JOBS J on E.JOB_ID = J.JOB_ID
         join DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
         join LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID
         join COUNTRIES C2 on L.COUNTRY_ID = C2.COUNTRY_ID
         join REGIONS R on C2.REGION_ID = R.REGION_ID;

-- 9. FIND OUR EMPLOYEES FIRST_NAME, LAST NAME, DEPARTMENT ID AND ALL
-- DEPARTMENTS INCLUDING WHERE DO NOT HAVE ANY EMPLOYEE.
select FIRST_NAME, LAST_NAME, D.DEPARTMENT_ID, DEPARTMENT_NAME from EMPLOYEES E
right join DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 10. FIND OUT ALL DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_ID
-- INCLUDING THOSE LOCATIONS WITH NO DEPARTMENT
select DEPARTMENT_NAME, L.LOCATION_ID, COUNTRY_ID
from DEPARTMENTS D
right join LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID;

-- 11.FIND OUT DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_NAME
-- INCLUDING THOSE COUNTRIES WITH NO DEPARTMENT
select DEPARTMENT_NAME, D.LOCATION_ID, COUNTRY_NAME
from DEPARTMENTS D
join LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID
right join COUNTRIES C2 on L.COUNTRY_ID = C2.COUNTRY_ID;

-- 12. FIND OUT EMPLOYEES FIRST_NAME, DEPARTMENT ID AND DEPARTMENT
-- NAME INCLUDING THOSE DOES NOT HAVE DEPARTMENT, INCLUDING THOSE
-- DEPARTMENTS DOES NOT HAVE ANY MATCHING EMPLOYEES
select FIRST_NAME, D.DEPARTMENT_ID, DEPARTMENT_NAME from  EMPLOYEES E
left join DEPARTMENTS D on D.DEPARTMENT_ID = E.DEPARTMENT_ID;



















