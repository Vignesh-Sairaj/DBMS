/*Query 9*/
SELECT Ssn
FROM EMPLOYEE;

/*Query 10*/
SELECT Ssn, Dname
FROM EMPLOYEE, DEPARTMENT;

/*Query 1C*/
SELECT *
FROM EMPLOYEE
WHERE Dno =5;

/*Query 1D*/
SELECT *
FROM EMPLOYEE, DEPARTMENT
WHERE Dname = 'Research' AND Dno = Dnumber;

/*QUERY10A*/
SELECT *
FROM EMPLOYEE , DEPARTMENT ;