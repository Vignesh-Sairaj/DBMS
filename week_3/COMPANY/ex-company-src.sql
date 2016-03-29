/*
1. For each department whose average employee salary is more than $30,000, retrieve the 

department name and the number of employees working for that department.

2. Suppose that we want the number of male employees in each department making more than 

$30,000, rather than all employees. Can we specify this query in SQL? Why or why not?

3. Specify the following queries in SQL on the database schema of company 

a. Retrieve the names and major departments of all straight-A students (students who have a 

grade of A in all their courses).

b. Retrieve the names and major departments of all students who do not have a grade of A in any 

of their courses.

4. In SQL, specify the following queries on the company database using the concept of nested 

queries and concepts described in this chapter.

a. Retrieve the names of all employees who work in the department that has the employee with 

the highest salary among all employees.

b. Retrieve the names of all employees whose supervisor’s supervisor has ‘888665555’ for Ssn.

c. Retrieve the names of employees who make at least $10,000 more than the employee who is paid 

the least in the company.

5. Specify the following views in SQL on the COMPANY database schema

shown in Figure 3.5.

a. A view that has the department name, manager name, and manager salary for every 

department.

b. A view that has the employee name, supervisor name, and employee salary for each employee 

who works in the ‘Research’ department.

c. A view that has the project name, controlling department name, number of employees, and 

total hours worked per week on the project for each project.

d. A view that has the project name, controlling department name, number of employees, and 

total hours worked per week on the project for each project with more than one employee 

working on it.

e. Retrieve the names of all employees in department 5 who work more than

   10 hours per week on the ProductX project.

f. List the names of all employees who have a dependent with the same first name as  

themselves.

g. Find the names of all employees who are directly supervised by ‘Franklin

Wong’.

2.Write SQL statements to create a table EMPLOYEE_BACKUP to back up the EMPLOYEE 

table shown in Figure 3.6.

3.Find the names of employees who work on all the projects controlled by department number 5.

4:

a. For each project, list the project name and the total hours per week (by all

employees) spent on that project.

b. Retrieve the names of all employees who work on every project.

c. Retrieve the names of all employees who do not work on any project.

d. Retrieve the average salary of all female employees.

e. Find the names and addresses of all employees who work on at least one

   project located in Houston but whose department has no location in

   Houston.

f. List the last names of all department managers who have no dependents.

g. Display employee names (e’’) who are supervised by an e’ who is immediately supervised by 

an employee with lname “XYZ”.

h. Display names of all employees who work on some project controlled by department number 

10. 

i. Display all female employee names who also have dependents along with their dependent 
*/







/*Query 1*/                                                                                                             
    SELECT D.Dname, COUNT(*)                                                                                             
    FROM DEPARTMENT D, EMPLOYEE F                                                                                                
    WHERE ( SELECT AVG(E.Salary) FROM EMPLOYEE E WHERE E.Dno = D.Dnumber) > 30000 AND F.Dno = D.Dnumber
    GROUP BY Dnumber;


/*Query 2*/                                                                                                             
    SELECT D.Dname, COUNT(*)                                                                                             
    FROM DEPARTMENT D, EMPLOYEE F                                                                                                
    WHERE F.Dno = D.Dnumber AND F.Salary > 30000
    GROUP BY Dnumber;


/*Query 4a*/                                                                                                             
    SELECT E.Fname, E.Lname                                                                                            
    FROM EMPLOYEE E                                                                                               
    WHERE E.Dno = ( SELECT D.Dnumber
                    FROM DEPARTMENT D
                    WHERE EXISTS(SELECT *
                                 FROM EMPLOYEE M
                                 WHERE M.Dno = D.Dnumber AND M.Salary = ( SELECT MAX(F.Salary)
                                                                        FROM EMPLOYEE F
                                                                        )
                                )
                    );
                    
                  
                                     
/*Query 4b*/                                                                                                             
    SELECT E.Fname, E.Lname                                                                                            
    FROM EMPLOYEE E, EMPLOYEE S                                                                                              
    WHERE E.Super_ssn = S.Ssn AND S.Super_ssn = '888665555';



/*Query 4c*/                                                                                                             
	SELECT E.Fname, E.Lname                                                                                            
	FROM EMPLOYEE E                                                                                             
	WHERE E.Salary > ((SELECT MIN(F.Salary) FROM EMPLOYEE F) + 10000);



/*

Query 5a
A view that has the department name, manager name, and manager salary for every 
department.

*/
	CREATE VIEW DEPT_MGR
	AS
	SELECT D.Dname, M.Fname, M.Lname, M.Salary
	FROM DEPARTMENT D, EMPLOYEE M
	WHERE M.Ssn = D.Mgr_ssn;

/*

Query 5b
A view that has the employee name, supervisor name, and employee salary for each employee 
who works in the ‘Research’ department

*/
	CREATE VIEW EMP_IN_RESEARCH_DEPT
	AS
	SELECT E.Fname, E.Lname, E.Salary, S.Fname AS Supervisor_Fname, S.Lname AS Supervisor_Lname
	FROM EMPLOYEE E, EMPLOYEE S, DEPARTMENT D
	WHERE D.Dname = 'Research' AND D.Dnumber = E.Dno AND E.Super_ssn = S.Ssn;

c. A view that has the project name, controlling department name, number of employees, and 
total hours worked per week on the project for each project.

/*

Query 5c
A view that has the project name, controlling department name, number of employees, and 
total hours worked per week on the project for each project.


*/

    CREATE VIEW PROJECT_VIEW
	AS
	SELECT P.Pname, D.Dname, count(*) AS Num_empl, SUM(W.Hours) AS Total_hrs
	FROM PROJECT P, DEPARTMENT D, WORKS_ON W
	WHERE P.Dnum = D.Dnumber AND W.Pno = P.Pnumber
	GROUP BY P.Pnumber;


/*

Query 5d
A view that has the project name, controlling department name, number of employees, and 
total hours worked per week on the project for each project with more than one employee 
working on it.

*/

    CREATE VIEW PROJECT_VIEW_NUM_EMP_GT1
	AS
	SELECT P.Pname, D.Dname, count(*) AS Num_empl, SUM(W.Hours) AS Total_hrs
	FROM PROJECT P, DEPARTMENT D, WORKS_ON W
	WHERE P.Dnum = D.Dnumber AND W.Pno = P.Pnumber AND ( SELECT COUNT(*) FROM WORKS_ON W1 WHERE P.Pnumber = W1.Pno) > 1
	GROUP BY P.Pnumber;

/*

Query 5e
Retrieve the names of all employees in department 5 who work more than 10 hours per week on the ProductX project

*/

	SELECT  E.Fname, E.Lname
	FROM EMPLOYEE E, WORKS_ON W, PROJECT P
	WHERE E.Ssn = W.Essn AND W.Pno = P.Pnumber AND E.Dno = 5 AND P.Pname = 'ProductX' AND W.Hours > 10;


/*

Query 5f
List the names of all employees who have a dependent with the same first name as themselves.

*/

	SELECT  E.Fname, E.Lname, D.Dependent_name
	FROM EMPLOYEE E, DEPENDENT D
	WHERE E.Ssn = D.Essn AND E.Fname = D.Dependent_name;


/*

Query 5g
Find the names of all employees who are directly supervised by ‘Franklin Wong’.

*/


SELECT  E.Fname, E.Lname
FROM EMPLOYEE E, EMPLOYEE S
WHERE E.Super_ssn = S.Ssn AND S.Fname = 'Franklin' AND S.Lname = 'Wong';

/*
Query 2
Write SQL statements to create a table EMPLOYEE_BACKUP to back up the EMPLOYEE 
table shown in Figure 3.6.
*/

CREATE TABLE `EMPLOYEE_BACKUP` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int(11) NOT NULL,
  PRIMARY KEY (`Ssn`)
);

INSERT INTO EMPLOYEE_BACKUP
SELECT * FROM EMPLOYEE;


/*
Query 3
Find the names of employees who work on all the projects controlled by department number 5
*/

SELECT E.Fname, E.Lname
FROM  EMPLOYEE E
WHERE NOT EXISTS
	(SELECT *
	FROM PROJECT P
	WHERE P.Dno = 5 AND NOT EXISTS
		(SELECT *
		FROM WORKS_ON W
		WHERE W.Essn = E.Ssn AND W.Pno = P.Pnumber));


/*

Query 4a
For each project, list the project name and the total hours per week (by all employees) spent on that project.

*/

SELECT P.Pname, SUM(W.Hours)
FROM PROJECT P, WORKS_ON W
WHERE P.Pnumber = W.Pno
GROUP BY P.Pnumber;

/*

Query 4b
Retrieve the names of all employees who work on every project.

*/

SELECT E.Fname, E.Lname
FROM  EMPLOYEE E
WHERE NOT EXISTS
(SELECT * FROM PROJECT P WHERE NOT EXISTS
    (SELECT *
    FROM WORKS_ON W
    WHERE W.Essn = E.Ssn AND W.Pno = P.Pnumber));


/*

Query 4C
Retrieve the names of all employees who do not work on any project.

*/

SELECT E.Fname, E.Lname
FROM  EMPLOYEE E
WHERE NOT EXISTS (
    SELECT *
    FROM WORKS_ON W
    WHERE W.Essn = E.Ssn);

/*

Query 4d
Retrieve the average salary of all female employees.

*/

SELECT AVG(E.Salary)
FROM  EMPLOYEE E
WHERE E.Sex = 'F';

/*

Query 4e
Find the names and addresses of all employees who work on at least one project located in Houston but
whose department has no location in Houston.

*/

SELECT E.Fname, E.Lname, E.Address
FROM  EMPLOYEE E
WHERE 
EXISTS (
    SELECT * 
    FROM PROJECT P, WORKS_ON W
    WHERE P.Pnumber = W.Pno AND E.Ssn = W.Essn AND P.Plocation = 'Houston'
)

AND

NOT EXISTS (
    SELECT *
    FROM DEPARTMENT D, DEPT_LOCATIONS L
    WHERE D.Dnumber = E.Dno AND D.Dnumber = L.Dnumber AND L.Dlocation = 'Houston'
);



/*

Query 4f
List the last names of all department managers who have no dependents.

*/

SELECT M.Fname, M.Lname
FROM EMPLOYEE M
WHERE 

EXISTS (
    SELECT *
    FROM DEPARTMENT D
    WHERE D.Mgr_ssn = M.Ssn
)

AND

NOT EXISTS (
    SELECT *
    FROM DEPENDENT DN
    WHERE DN.Essn = M.Ssn
);

/*
Query 4g
Display employee names (e’’) who are supervised by an e’ who is immediately supervised by 
an employee with lname “XYZ”.*/

SELECT E.Fname, E.Lname
FROM EMPLOYEE E
WHERE
EXISTS (
    SELECT *
    FROM EMPLOYEE S, EMPLOYEE SS
    WHERE E.Super_ssn = S.Ssn AND SS.Ssn = S.Super_ssn AND SS.Lname = 'XYZ'
);

/*
Query 4h
Display names of all employees who work on some project controlled by department number 10.
*/

SELECT E.Fname, E.Lname
FROM EMPLOYEE E
WHERE
EXISTS (
    SELECT *
    FROM WORKS_ON W, PROJECT P
    WHERE W.Essn = E.Ssn AND W.Pno = P.Pnumber AND P.Dnum = 10
);

/*
Query 10
Display all female employee names who also have dependents along with their dependent 
*/

SELECT  E.Fname, E.Lname, DN.Dependent_name
FROM EMPLOYEE E, DEPENDENT DN
WHERE E.Sex = 'F' AND DN.Essn = E.Ssn;