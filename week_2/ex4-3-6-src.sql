/*
Query 15. Retrieve a list of employees and the projects they are working on,
ordered by department and, within each department, ordered alphabetically by
last name, then first name.
*/
SELECT D.Dname , E.Lname , E.Fname , P.Pname
FROM DEPARTMENT D , EMPLOYEE E , WORKS_ON W , PROJECT P
WHERE D.Dnumber = E.Dno AND E.Ssn = W.Essn AND W.Pno = P.Pnumber
ORDER BY D.Dname , E.Lname , E.Fname ;