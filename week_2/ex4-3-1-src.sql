/*Query 0*/
SELECT Bdate, Address
FROM EMPLOYEE
WHERE Fname ='John' AND Minit ='B' AND Lname = 'Smith';

/*Query 1*/
SELECT Fname, Lname, Address
FROM EMPLOYEE, DEPARTMENT
WHERE Dname ='Research' AND Dnumber = Dno;

/*Query 2*/
SELECT Pnumber, Dnum, Lname, Address, Bdate
FROM PROJECT, DEPARTMENT, EMPLOYEE
WHERE Dnum = Dnumber AND Mgr_ssn = Ssn AND Plocation ='Stafford';



