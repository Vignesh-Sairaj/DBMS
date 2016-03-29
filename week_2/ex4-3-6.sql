mysql> /*
   /*> Query 15. Retrieve a list of employees and the projects they are working on,
   /*> ordered by department and, within each department, ordered alphabetically by
   /*> last name, then first name.
   /*> */
mysql> SELECT D.Dname , E.Lname , E.Fname , P.Pname
    -> FROM DEPARTMENT D , EMPLOYEE E , WORKS_ON W , PROJECT P
    -> WHERE D.Dnumber = E.Dno AND E.Ssn = W.Essn AND W.Pno = P.Pnumber
    -> ORDER BY D.Dname , E.Lname , E.Fname ;
+----------------+---------+----------+-----------------+
| Dname          | Lname   | Fname    | Pname           |
+----------------+---------+----------+-----------------+
| Administration | Jabbar  | Ahmad    | Computerization |
| Administration | Jabbar  | Ahmad    | Newbenefits     |
| Administration | Wallace | Jennifer | Newbenefits     |
| Administration | Wallace | Jennifer | Reorganization  |
| Administration | Zelaya  | Alicia   | Newbenefits     |
| Administration | Zelaya  | Alicia   | Computerization |
| Hardware       | Bays    | Bonnie   | InkjetPrinters  |
| Hardware       | Best    | Alec     | InkjetPrinters  |
| Hardware       | Brand   | Tom      | DatabaseSystems |
| Hardware       | Carter  | Chris    | DatabaseSystems |
| Hardware       | Freed   | Alex     | InkjetPrinters  |
| Hardware       | Snedden | Sam      | InkjetPrinters  |
| Hardware       | Vile    | Andy     | DatabaseSystems |
| Hardware       | Vos     | Jenny    | DatabaseSystems |
| Hardware       | Wallis  | Evan     | DatabaseSystems |
| Hardware       | Zell    | Josh     | DatabaseSystems |
| Headquarters   | Borg    | James    | Reorganization  |
| Research       | English | Joyce    | ProductX        |
| Research       | English | Joyce    | ProductY        |
| Research       | Narayan | Ramesh   | ProductZ        |
| Research       | Smith   | John     | ProductX        |
| Research       | Smith   | John     | ProductY        |
| Research       | Wong    | Franklin | ProductY        |
| Research       | Wong    | Franklin | ProductZ        |
| Research       | Wong    | Franklin | Computerization |
| Research       | Wong    | Franklin | Reorganization  |
| Sales          | Bacher  | Red      | OperatingSystem |
| Sales          | Bacher  | Red      | DatabaseSystems |
| Sales          | Bacher  | Red      | Middleware      |
| Sales          | Drew    | Naveen   | OperatingSystem |
| Sales          | Hall    | Sammy    | OperatingSystem |
| Sales          | Head    | Arnold   | DatabaseSystems |
| Sales          | Jarvis  | Jill     | InkjetPrinters  |
| Sales          | King    | Billie   | InkjetPrinters  |
| Sales          | King    | Ray      | InkjetPrinters  |
| Sales          | Kramer  | Jon      | LaserPrinters   |
| Sales          | Leslie  | Lyle     | InkjetPrinters  |
| Sales          | Pataki  | Helga    | Middleware      |
| Sales          | Reedy   | Carl     | OperatingSystem |
| Sales          | Small   | Gerald   | OperatingSystem |
| Software       | Ball    | Nandita  | LaserPrinters   |
| Software       | Chase   | Jeff     | Middleware      |
| Software       | Grace   | Kim      | Middleware      |
| Software       | James   | Jared    | OperatingSystem |
| Software       | James   | John     | LaserPrinters   |
| Software       | Jones   | Jon      | OperatingSystem |
| Software       | Knight  | Brad     | OperatingSystem |
| Software       | Mark    | Justin   | OperatingSystem |
+----------------+---------+----------+-----------------+
48 rows in set (0.00 sec)

mysql> tee ex5.sql
