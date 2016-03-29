mysql> -- SEC-5.1.1
mysql> 
mysql> 
mysql> 
mysql> /*
   /*> Query 18. Retrieve the names of all employees who do not have supervisors.
   /*> */
mysql> SELECT Fname , Lname
    -> FROM EMPLOYEE
    -> WHERE Super_ssn IS NULL ;
+-------+--------+
| Fname | Lname  |
+-------+--------+
| Jared | James  |
| Evan  | Wallis |
| Kim   | Grace  |
| Alex  | Freed  |
| John  | James  |
| Bob   | Bender |
| James | Borg   |
+-------+--------+
7 rows in set (0.00 sec)



mysql>--  SEC 5.1.2


mysql> -- Q4A
mysql> SELECT DISTINCT Pnumber
    -> FROM PROJECT
    -> WHERE 
    -> Pnumber IN
    ->     (   
    ->         SELECT
    ->         Pnumber
    ->         FROM
    ->         PROJECT , DEPARTMENT , EMPLOYEE
    ->         WHERE
    ->         Dnum = Dnumber AND
    ->         Mgr_ssn = Ssn AND Lname ='Smith' 
    ->     )
    -> OR
    -> 
    -> Pnumber IN
    ->     (   SELECT
    ->         Pno
    ->         FROM
    ->         WORKS_ON , EMPLOYEE
    ->         WHERE
    ->         Essn = Ssn AND Lname = 'Smith'
    ->     );
+---------+
| Pnumber |
+---------+
|       1 |
|       2 |
+---------+
2 rows in set (0.00 sec)

mysql> /*
   /*> Query 16. Retrieve the name of each employee who has a dependent with the
   /*> same first name and is the same sex as the employee.
   /*> */
mysql> 
mysql> SELECT E.Fname , E.Lname
    -> FROM EMPLOYEE AS E
    -> WHERE E.Ssn IN 
    -> (   
    ->     SELECT Essn
    ->     FROM DEPENDENT AS D
    ->     WHERE E.Fname = D.Dependent_name
    ->     AND E.Sex = D.Sex 
    -> );
Empty set (0.00 sec)

mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
-- SEC 5.1.3
mysql> 
mysql> 
mysql> -- SEC 5.1.3
mysql> 
mysql> 
mysql> 
mysql> -- Q16A:
mysql> SELECT E.Fname , E.Lname
    -> FROM EMPLOYEE AS E , DEPENDENT AS D
    -> WHERE E.Ssn = D.Essn AND E.Sex = D.Sex
    -> AND E.Fname = D.Dependent_name ;
Empty set (0.00 sec)

mysql> 
mysql> 
mysql> 
mysql> 
-- 5.1.4
mysql> 
mysql> 
mysql> -- 5.1.4
mysql> 
mysql> 
mysql> -- Q16B:
mysql> SELECT E.Fname , E.Lname
    -> FROM EMPLOYEE AS E
    -> WHERE EXISTS 
    -> (
    ->     SELECT *
    ->     FROM DEPENDENT AS D
    ->     WHERE E.Ssn = D.Essn AND E.Sex = D.Sex
    ->     AND E.Fname = D.Dependent_name 
    -> );
Empty set (0.00 sec)


mysql> -- Query 6. Retrieve the names of employees who have no dependents.
mysql> SELECT Fname , Lname
    -> FROM EMPLOYEE
    -> WHERE NOT EXISTS (
    ->     SELECT *
    ->     FROM DEPENDENT
    ->     WHERE Ssn = Essn
    -> );
+---------+---------+
| Fname   | Lname   |
+---------+---------+
| Jared   | James   |
| Jon     | Jones   |
| Justin  | Mark    |
| Brad    | Knight  |
| Evan    | Wallis  |
| Josh    | Zell    |
| Andy    | Vile    |
| Tom     | Brand   |
| Jenny   | Vos     |
| Chris   | Carter  |
| Kim     | Grace   |
| Jeff    | Chase   |
| Sam     | Snedden |
| Joyce   | English |
| John    | James   |
| Nandita | Ball    |
| Bob     | Bender  |
| Jill    | Jarvis  |
| Kate    | King    |
| Lyle    | Leslie  |
| Billie  | King    |
| Jon     | Kramer  |
| Ray     | King    |
| Gerald  | Small   |
| Arnold  | Head    |
| Helga   | Pataki  |
| Naveen  | Drew    |
| Carl    | Reedy   |
| Sammy   | Hall    |
| Red     | Bacher  |
| Ramesh  | Narayan |
| James   | Borg    |
| Ahmad   | Jabbar  |
| Alicia  | Zelaya  |
+---------+---------+
34 rows in set (0.00 sec)

mysql> 
mysql> -- Query 7. List the names of managers who have at least one dependent.
mysql> 
mysql> SELECT Fname , Lname
    -> FROM EMPLOYEE
    -> WHERE
    -> EXISTS (
    ->     SELECT *
    ->     FROM DEPENDENT
    ->     WHERE Ssn = Essn
    ->     AND
    ->     EXISTS (
    ->         SELECT *
    ->         FROM DEPARTMENT
    ->         WHERE Ssn = Mgr_ssn 
    -> 
    ->     )
    -> );
+----------+---------+
| Fname    | Lname   |
+----------+---------+
| Franklin | Wong    |
| Alex     | Freed   |
| Jennifer | Wallace |
+----------+---------+
3 rows in set (0.00 sec)

mysql> -- Q3B:
mysql> SELECT Lname , Fname
    -> FROM EMPLOYEE
    -> WHERE NOT EXISTS (
    ->     SELECT *
    ->     FROM WORKS_ON B
    ->     WHERE ( B.Pno IN (
    ->             SELECT Pnumber
    ->             FROM PROJECT
    ->             WHERE Dnum =5
    ->         )
    -> 
    ->         AND
    -> 
    ->         NOT EXISTS (
    ->             SELECT *
    ->             FROM WORKS_ON C
    ->             WHERE C.Essn = Ssn
    ->             AND
    ->             C.Pno = B.Pno 
    ->         )
    ->     )
    -> );
Empty set (0.00 sec)

mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> -- 5.1.5
mysql> 
mysql> 
mysql> 
mysql> /*
   /*> Query 17. Retrieve the Social Security numbers of all employees who work on
   /*> project numbers 1, 2, or 3.
   /*> */
mysql> SELECT DISTINCT Essn
    -> FROM WORKS_ON
    -> WHERE Pno IN (1, 2, 3);
+-----------+
| Essn      |
+-----------+
| 123456789 |
| 453453453 |
| 333445555 |
| 666884444 |
+-----------+
4 rows in set (0.00 sec)

mysql> -- Q8A:
mysql> SELECT E.Lname AS Employee_name , S.Lname AS Supervisor_name
    -> FROM EMPLOYEE AS E , EMPLOYEE AS S
    -> WHERE E.Super_ssn = S.Ssn ;
+---------------+-----------------+
| Employee_name | Supervisor_name |
+---------------+-----------------+
| Jones         | James           |
| Mark          | James           |
| Knight        | James           |
| Smith         | Wong            |
| Zell          | Wallis          |
| Vile          | Wallis          |
| Brand         | Wallis          |
| Vos           | Zell            |
| Carter        | Zell            |
| Chase         | Grace           |
| Wong          | Borg            |
| Bays          | Freed           |
| Best          | Freed           |
| Snedden       | Freed           |
| English       | Wong            |
| Ball          | James           |
| Jarvis        | Bender          |
| King          | Bender          |
| Leslie        | Jarvis          |
| King          | Leslie          |
| Kramer        | Leslie          |
| King          | King            |
| Small         | King            |
| Head          | King            |
| Pataki        | King            |
| Drew          | Small           |
| Reedy         | Drew            |
| Hall          | Reedy           |
| Bacher        | Hall            |
| Narayan       | Wong            |
| Wallace       | Borg            |
| Jabbar        | Wallace         |
| Zelaya        | Wallace         |
+---------------+-----------------+
33 rows in set (0.00 sec)

mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> --5.1.6
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> \c
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 

mysql> -- Q1A:
mysql> SELECT Fname , Lname , Address
    -> FROM ( EMPLOYEE JOIN DEPARTMENT ON Dno = Dnumber )
    -> WHERE Dname ='Research';
+----------+---------+--------------------------+
| Fname    | Lname   | Address                  |
+----------+---------+--------------------------+
| John     | Smith   | 731 Fondren, Houston, TX |
| Franklin | Wong    | 638 Voss, Houston, TX    |
| Joyce    | English | 5631 Rice, Houston, TX   |
| Ramesh   | Narayan | 971 Fire Oak, Humble, TX |
+----------+---------+--------------------------+
4 rows in set (0.00 sec)

mysql> -- Q8B:
mysql> SELECT E.Lname AS Employee_name, S.Lname AS Supervisor_name
    -> FROM( EMPLOYEE AS E LEFT OUTER JOIN EMPLOYEE AS S ON E.Super_ssn = S.Ssn );
+---------------+-----------------+
| Employee_name | Supervisor_name |
+---------------+-----------------+
| James         | NULL            |
| Jones         | James           |
| Mark          | James           |
| Knight        | James           |
| Smith         | Wong            |
| Wallis        | NULL            |
| Zell          | Wallis          |
| Vile          | Wallis          |
| Brand         | Wallis          |
| Vos           | Zell            |
| Carter        | Zell            |
| Grace         | NULL            |
| Chase         | Grace           |
| Wong          | Borg            |
| Freed         | NULL            |
| Bays          | Freed           |
| Best          | Freed           |
| Snedden       | Freed           |
| English       | Wong            |
| James         | NULL            |
| Ball          | James           |
| Bender        | NULL            |
| Jarvis        | Bender          |
| King          | Bender          |
| Leslie        | Jarvis          |
| King          | Leslie          |
| Kramer        | Leslie          |
| King          | King            |
| Small         | King            |
| Head          | King            |
| Pataki        | King            |
| Drew          | Small           |
| Reedy         | Drew            |
| Hall          | Reedy           |
| Bacher        | Hall            |
| Narayan       | Wong            |
| Borg          | NULL            |
| Wallace       | Borg            |
| Jabbar        | Wallace         |
| Zelaya        | Wallace         |
+---------------+-----------------+
40 rows in set (0.00 sec)

mysql> SELECT Pnumber , Dnum , Lname , Address , Bdate
    -> FROM (( PROJECT JOIN DEPARTMENT ON Dnum = Dnumber ) JOIN EMPLOYEE ON Mgr_ssn = Ssn )
    -> WHERE Plocation ='Stafford';
+---------+------+---------+-------------------------+------------+
| Pnumber | Dnum | Lname   | Address                 | Bdate      |
+---------+------+---------+-------------------------+------------+
|      10 |    4 | Wallace | 291 Berry, Bellaire, TX | 1931-06-20 |
|      30 |    4 | Wallace | 291 Berry, Bellaire, TX | 1931-06-20 |
+---------+------+---------+-------------------------+------------+
2 rows in set (0.01 sec)

mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> -- 5.1.7
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> /*Query 19. Find the sum of the salaries of all employees, the maximum salary,
   /*> the minimum salary, and the average salary.
   /*> Q19:*/
mysql> SELECT SUM( Salary ), MAX( Salary ), MIN( Salary ), AVG( Salary )
    -> FROM EMPLOYEE ;
+---------------+---------------+---------------+---------------+
| SUM( Salary ) | MAX( Salary ) | MIN( Salary ) | AVG( Salary ) |
+---------------+---------------+---------------+---------------+
|    1967000.00 |      96000.00 |      25000.00 |  49175.000000 |
+---------------+---------------+---------------+---------------+
1 row in set (0.00 sec)

mysql> /*Query 20. Find the sum of the salaries of all employees of the ‘Research’
   /*> department, as well as the maximum salary, the minimum salary, and the aver-
   /*> age salary in this department.*/
mysql> SELECT SUM( Salary ), MAX( Salary ), MIN( Salary ), AVG( Salary )
    -> FROM ( EMPLOYEE JOIN DEPARTMENT ON Dno = Dnumber )
    -> WHERE Dname ='Research';
+---------------+---------------+---------------+---------------+
| SUM( Salary ) | MAX( Salary ) | MIN( Salary ) | AVG( Salary ) |
+---------------+---------------+---------------+---------------+
|     133000.00 |      40000.00 |      25000.00 |  33250.000000 |
+---------------+---------------+---------------+---------------+
1 row in set (0.00 sec)

mysql> 
mysql> 
mysql> /*Queries 21 and 22. Retrieve the total number of employees in the company
   /*> ( Q21 ) and the number of employees in the ‘Research’ department ( Q22 ).
   /*> */
mysql> SELECT COUNT( * )
    -> FROM EMPLOYEE ;
+------------+
| COUNT( * ) |
+------------+
|         40 |
+------------+
1 row in set (0.00 sec)

mysql> 
mysql> -- Q22:
mysql> SELECT COUNT( * )
    -> FROM EMPLOYEE , DEPARTMENT
    -> WHERE DNO = DNUMBER AND DNAME ='Research';
+------------+
| COUNT( * ) |
+------------+
|          4 |
+------------+
1 row in set (0.00 sec)

mysql> /*Query 23. Count the number of distinct salary values in the database.
   /*> */
mysql> SELECT COUNT( DISTINCT Salary )
    -> FROM EMPLOYEE ;
+--------------------------+
| COUNT( DISTINCT Salary ) |
+--------------------------+
|                       32 |
+--------------------------+
1 row in set (0.05 sec)

mysql> -- Q5:
mysql> SELECT Lname , Fname
    -> FROM EMPLOYEE
    -> WHERE
    -> ( SELECT COUNT( * )
    -> FROM DEPENDENT
    -> WHERE
    -> Ssn = Essn ) >= 2;
+-------+----------+
| Lname | Fname    |
+-------+----------+
| Smith | John     |
| Wong  | Franklin |
| Freed | Alex     |
+-------+----------+
3 rows in set (0.00 sec)

mysql> 
mysql> 
mysql> 
mysql> 
mysql> -- 5.1.8
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> /*Query 24. For each department, retrieve the department number, the number
   /*> of employees in the department, and their average salary.
   /*> Q24:*/
mysql> SELECT Dno , COUNT( * ), AVG( Salary )
    -> FROM EMPLOYEE
    -> GROUP BY Dno ;
+-----+------------+---------------+
| Dno | COUNT( * ) | AVG( Salary ) |
+-----+------------+---------------+
|   1 |          1 |  55000.000000 |
|   4 |          3 |  31000.000000 |
|   5 |          4 |  33250.000000 |
|   6 |          8 |  60000.000000 |
|   7 |         10 |  63450.000000 |
|   8 |         14 |  40821.428571 |
+-----+------------+---------------+
6 rows in set (0.00 sec)

mysql> /*Query 25. For each project, retrieve the project number, the project name, and
   /*> the number of employees who work on that project.
   /*> Q25:*/
mysql> SELECT Pnumber , Pname , COUNT( * )
    -> FROM PROJECT , WORKS_ON
    -> WHERE Pnumber = Pno
    -> GROUP BY Pnumber , Pname ;
+---------+-----------------+------------+
| Pnumber | Pname           | COUNT( * ) |
+---------+-----------------+------------+
|       1 | ProductX        |          2 |
|       2 | ProductY        |          3 |
|       3 | ProductZ        |          2 |
|      10 | Computerization |          3 |
|      20 | Reorganization  |          3 |
|      30 | Newbenefits     |          3 |
|      61 | OperatingSystem |          9 |
|      62 | DatabaseSystems |          8 |
|      63 | Middleware      |          4 |
|      91 | InkjetPrinters  |          8 |
|      92 | LaserPrinters   |          3 |
+---------+-----------------+------------+
11 rows in set (0.01 sec)

mysql> 
mysql> 
mysql> /*Query 26. For each project on which more than two employees work, retrieve
   /*> the project number, the project name, and the number of employees who work
   /*> on the project.
   /*> Q26:*/
mysql> SELECT Pnumber , Pname , COUNT( * )
    -> FROM PROJECT , WORKS_ON
    -> WHERE Pnumber = Pno
    -> GROUP BY Pnumber , Pname
    -> HAVING COUNT( * ) > 2 ;
+---------+-----------------+------------+
| Pnumber | Pname           | COUNT( * ) |
+---------+-----------------+------------+
|       2 | ProductY        |          3 |
|      10 | Computerization |          3 |
|      20 | Reorganization  |          3 |
|      30 | Newbenefits     |          3 |
|      61 | OperatingSystem |          9 |
|      62 | DatabaseSystems |          8 |
|      63 | Middleware      |          4 |
|      91 | InkjetPrinters  |          8 |
|      92 | LaserPrinters   |          3 |
+---------+-----------------+------------+
9 rows in set (0.00 sec)

mysql> 
mysql> 
mysql> /*Query 27. For each project, retrieve the project number, the project name, and
   /*> the number of employees from department 5 who work on the project.
   /*> Q27:*/
mysql> SELECT Pnumber , Pname , COUNT( * )
    -> FROM PROJECT , WORKS_ON , EMPLOYEE
    -> WHERE Pnumber = Pno AND Ssn = Essn AND Dno = 5
    -> GROUP BY Pnumber , Pname ;
+---------+-----------------+------------+
| Pnumber | Pname           | COUNT( * ) |
+---------+-----------------+------------+
|       1 | ProductX        |          2 |
|       2 | ProductY        |          3 |
|       3 | ProductZ        |          2 |
|      10 | Computerization |          1 |
|      20 | Reorganization  |          1 |
+---------+-----------------+------------+
5 rows in set (0.00 sec)


mysql> 
mysql> /*query, as shown in Query 28.
   /*> Query 28. For each department that has more than five employees, retrieve
   /*> the department number and the number of its employees who are making
   /*> more than $40,000.*/
mysql> SELECT Dnumber , COUNT( * )
    -> FROM DEPARTMENT , EMPLOYEE
    -> WHERE
    -> Dnumber = Dno AND Salary > 40000 AND
    -> EXISTS (   
    ->     SELECT
    ->     Dno
    ->     FROM
    ->     EMPLOYEE
    ->     GROUP BY Dno
    ->     HAVING COUNT(*) > 5
    -> );
+---------+------------+
| Dnumber | COUNT( * ) |
+---------+------------+
|       6 |         24 |
+---------+------------+
1 row in set (0.00 sec)

