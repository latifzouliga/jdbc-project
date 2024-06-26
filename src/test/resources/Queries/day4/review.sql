
--display all information who is getting 3th lowest salary
    SELECT * FROM EMPLOYEES;

    SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY ASC;
    -- 3rd min is 2400

    --get 3rd min salary dynamically
    SELECT MAX(SALARY) FROM (SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY ASC)
    WHERE ROWNUM <4;

    SELECT * FROM EMPLOYEES
    WHERE SALARY = (SELECT MAX(SALARY) FROM (SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY ASC)
                    WHERE ROWNUM <4);

--who is making 46th min salary dynamically
SELECT * FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) FROM (SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY ASC)
                WHERE ROWNUM <47);

-- 1. Display full addresses from locations table in a single column

-- 2. Display all informations of the employee who has the minimum salary in employees
-- table
-- 3. Display the second minimum salary from the employees
-- 4. Display all informations of the employee who has the second minimum salary
-- 5. List all the employees who are making above the average salary;
-- 6. List all the employees who are making less than the average salary
-- 7. Display manager name of 'Neena'
-- 8. Find the 3rd maximum salary from the employees table (do not include duplicates)
-- 9. Find the 5th maximum salary from the employees table (do not include duplicates)
-- 10. Find the 7th maximum salary from the employees table (do not include duplicates)
-- 11. Find the 10th maximum salary from the employees table (do not include duplicates)
-- 12. Find the 3rd minimum salary from the employees table (do not include duplicates)
-- 13. Find the 5th minimum salary from the employees table (do not include duplicates)


















