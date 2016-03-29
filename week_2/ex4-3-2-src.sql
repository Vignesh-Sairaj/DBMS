/*Query 8*/
SELECT E.Fname, E.Lname, S.Fname, S.Lname
FROM EMPLOYEE AS E , EMPLOYEE AS S
WHERE E.Super_ssn = S.Ssn;

/*Query 1'*/
SELECT EMPLOYEE.Fname, EMPLOYEE.LName, EMPLOYEE.Address
FROM EMPLOYEE, DEPARTMENT
WHERE DEPARTMENT.DName = 'Research' AND
DEPARTMENT.Dnumber = EMPLOYEE.Dno;


/*Query 1B*/
SELECT E.Fname, E.LName, E.Address
FROM EMPLOYEE E, DEPARTMENT D
WHERE D.DName = 'Research' AND D.Dnumber = E.Dno;
