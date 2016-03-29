-- Query 12. Retrieve all employees whose address is in Houston, Texas.
SELECT Fname , Lname
FROM EMPLOYEE
WHERE Address LIKE '%Houston,TX%';



-- Query 12A. Find all employees who were born during the 1950s.
SELECT Fname , Lname
FROM EMPLOYEE
WHERE Bdate LIKE '__5_______';


/*
Query 13. Show the resulting salaries if every employee working on the
‘ProductX’ project is given a 10 percent raise.
*/

SELECT E.Fname , E.Lname , 1.1 * E.Salary AS Increased_sal
FROM EMPLOYEE AS E , WORKS_ON AS W , PROJECT AS P
WHERE E.Ssn = W.Essn AND W.Pno = P.Pnumber AND
P.Pname ='ProductX';


/*Query 14. Retrieve all employees in department 5 whose salary is between
$30,000 and $40,000.
*/

SELECT *
FROM EMPLOYEE
WHERE (Salary BETWEEN 30000 AND 40000 ) AND Dno = 5;