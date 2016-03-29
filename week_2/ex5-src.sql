-- SEC-5.1.1

/*
Query 18. Retrieve the names of all employees who do not have supervisors.
*/
SELECT Fname , Lname
FROM EMPLOYEE
WHERE Super_ssn IS NULL ;



--  SEC 5.1.2

-- Q4A
SELECT DISTINCT Pnumber
FROM PROJECT
WHERE 
Pnumber IN
    (   
        SELECT
        Pnumber
        FROM
        PROJECT , DEPARTMENT , EMPLOYEE
        WHERE
        Dnum = Dnumber AND
        Mgr_ssn = Ssn AND Lname ='Smith' 
    )
OR

Pnumber IN
    (   SELECT
        Pno
        FROM
        WORKS_ON , EMPLOYEE
        WHERE
        Essn = Ssn AND Lname = 'Smith'
    );


/*
Query 16. Retrieve the name of each employee who has a dependent with the
same first name and is the same sex as the employee.
*/

SELECT E.Fname , E.Lname
FROM EMPLOYEE AS E
WHERE E.Ssn IN 
(   
    SELECT Essn
    FROM DEPENDENT AS D
    WHERE E.Fname = D.Dependent_name
    AND E.Sex = D.Sex 
);




-- SEC 5.1.3


-- Q16A:
SELECT E.Fname , E.Lname
FROM EMPLOYEE AS E , DEPENDENT AS D
WHERE E.Ssn = D.Essn AND E.Sex = D.Sex
AND E.Fname = D.Dependent_name ;


-- 5.1.4

-- Q16B:
SELECT E.Fname , E.Lname
FROM EMPLOYEE AS E
WHERE EXISTS 
(
    SELECT *
    FROM DEPENDENT AS D
    WHERE E.Ssn = D.Essn AND E.Sex = D.Sex
    AND E.Fname = D.Dependent_name 
);



-- Query 6. Retrieve the names of employees who have no dependents.
SELECT Fname , Lname
FROM EMPLOYEE
WHERE NOT EXISTS (
    SELECT *
    FROM DEPENDENT
    WHERE Ssn = Essn
);




-- Query 7. List the names of managers who have at least one dependent.

SELECT Fname , Lname
FROM EMPLOYEE
WHERE
EXISTS (
    SELECT *
    FROM DEPENDENT
    WHERE Ssn = Essn
    AND
    EXISTS (
        SELECT *
        FROM DEPARTMENT
        WHERE Ssn = Mgr_ssn 

    )
);


-- Q3B:
SELECT Lname , Fname
FROM EMPLOYEE
WHERE NOT EXISTS (
    SELECT *
    FROM WORKS_ON B
    WHERE ( B.Pno IN (
            SELECT Pnumber
            FROM PROJECT
            WHERE Dnum =5
        )

        AND

        NOT EXISTS (
            SELECT *
            FROM WORKS_ON C
            WHERE C.Essn = Ssn
            AND
            C.Pno = B.Pno 
        )
    )
);

-- 5.1.5


/*
Query 17. Retrieve the Social Security numbers of all employees who work on
project numbers 1, 2, or 3.
*/
SELECT DISTINCT Essn
FROM WORKS_ON
WHERE Pno IN (1, 2, 3);




-- Q8A:
SELECT E.Lname AS Employee_name , S.Lname AS Supervisor_name
FROM EMPLOYEE AS E , EMPLOYEE AS S
WHERE E.Super_ssn = S.Ssn ;


--5.1.6

-- Q1A:
SELECT Fname , Lname , Address
FROM ( EMPLOYEE JOIN DEPARTMENT ON Dno = Dnumber )
WHERE Dname ='Research';



-- Q8B:
SELECT E.Lname AS Employee_name, S.Lname AS Supervisor_name
FROM( EMPLOYEE AS E LEFT OUTER JOIN EMPLOYEE AS S ON E.Super_ssn = S.Ssn );


-- Q2A:
SELECT Pnumber , Dnum , Lname , Address , Bdate
FROM (( PROJECT JOIN DEPARTMENT ON Dnum = Dnumber ) JOIN EMPLOYEE ON Mgr_ssn = Ssn )
WHERE Plocation ='Stafford';


-- 5.1.7


/*Query 19. Find the sum of the salaries of all employees, the maximum salary,
the minimum salary, and the average salary.
Q19:*/
SELECT SUM( Salary ), MAX( Salary ), MIN( Salary ), AVG( Salary )
FROM EMPLOYEE ;



/*Query 20. Find the sum of the salaries of all employees of the ‘Research’
department, as well as the maximum salary, the minimum salary, and the aver-
age salary in this department.*/
SELECT SUM( Salary ), MAX( Salary ), MIN( Salary ), AVG( Salary )
FROM ( EMPLOYEE JOIN DEPARTMENT ON Dno = Dnumber )
WHERE Dname ='Research';




/*Queries 21 and 22. Retrieve the total number of employees in the company
( Q21 ) and the number of employees in the ‘Research’ department ( Q22 ).
*/
SELECT COUNT( * )
FROM EMPLOYEE ;

-- Q22:
SELECT COUNT( * )
FROM EMPLOYEE , DEPARTMENT
WHERE DNO = DNUMBER AND DNAME ='Research';



/*Query 23. Count the number of distinct salary values in the database.
*/
SELECT COUNT( DISTINCT Salary )
FROM EMPLOYEE ;


-- Q5:
SELECT Lname , Fname
FROM EMPLOYEE
WHERE
( SELECT COUNT( * )
FROM DEPENDENT
WHERE
Ssn = Essn ) >= 2;


-- 5.1.8




/*Query 24. For each department, retrieve the department number, the number
of employees in the department, and their average salary.
Q24:*/
SELECT Dno , COUNT( * ), AVG( Salary )
FROM EMPLOYEE
GROUP BY Dno ;




/*Query 25. For each project, retrieve the project number, the project name, and
the number of employees who work on that project.
Q25:*/
SELECT Pnumber , Pname , COUNT( * )
FROM PROJECT , WORKS_ON
WHERE Pnumber = Pno
GROUP BY Pnumber , Pname ;



/*Query 26. For each project on which more than two employees work, retrieve
the project number, the project name, and the number of employees who work
on the project.
Q26:*/
SELECT Pnumber , Pname , COUNT( * )
FROM PROJECT , WORKS_ON
WHERE Pnumber = Pno
GROUP BY Pnumber , Pname
HAVING COUNT( * ) > 2 ;


/*Query 27. For each project, retrieve the project number, the project name, and
the number of employees from department 5 who work on the project.
Q27:*/
SELECT Pnumber , Pname , COUNT( * )
FROM PROJECT , WORKS_ON , EMPLOYEE
WHERE Pnumber = Pno AND Ssn = Essn AND Dno = 5
GROUP BY Pnumber , Pname ;






/*query, as shown in Query 28.
Query 28. For each department that has more than five employees, retrieve
the department number and the number of its employees who are making
more than $40,000.*/
SELECT Dnumber , COUNT( * )
FROM DEPARTMENT , EMPLOYEE
WHERE
Dnumber = Dno AND Salary > 40000 AND
EXISTS (   
    SELECT
    Dno
    FROM
    EMPLOYEE
    GROUP BY Dno
    HAVING COUNT(*) > 5
);