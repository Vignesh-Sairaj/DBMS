mysql> USE COMPANY;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> /*Query 1*/                                                                                                             
mysql>     SELECT D.Dname, COUNT(*)                                                                                             
    ->     FROM DEPARTMENT D, EMPLOYEE F                                                                                                
    ->     WHERE ( SELECT AVG(E.Salary) FROM EMPLOYEE E WHERE E.Dno = D.Dnumber) > 30000 AND F.Dno = D.Dnumber
    ->     GROUP BY Dnumber;
+----------------+----------+
| Dname          | COUNT(*) |
+----------------+----------+
| Headquarters   |        1 |
| Administration |        3 |
| Research       |        4 |
| Software       |        8 |
| Hardware       |       10 |
| Sales          |       14 |
+----------------+----------+
6 rows in set (0.00 sec)

mysql> /*Query 2*/                                                                                                             
mysql>     SELECT D.Dname, COUNT(*)                                                                                             
    ->     FROM DEPARTMENT D, EMPLOYEE F                                                                                                
    ->     WHERE F.Dno = D.Dnumber AND F.Salary > 30000
    ->     GROUP BY Dnumber;
+----------------+----------+
| Dname          | COUNT(*) |
+----------------+----------+
| Headquarters   |        1 |
| Administration |        1 |
| Research       |        2 |
| Software       |        8 |
| Hardware       |       10 |
| Sales          |       13 |
+----------------+----------+
6 rows in set (0.00 sec)

mysql> /*Query 4a*/                                                                                                             
mysql>     SELECT E.Fname, E.Lname                                                                                            
    ->     FROM EMPLOYEE E                                                                                               
    ->     WHERE E.Dno = ( SELECT D.Dnumber
    ->                     FROM DEPARTMENT D
    ->                     WHERE EXISTS(SELECT *
    ->                                  FROM EMPLOYEE M
    ->                                  WHERE M.Dno = D.Dnumber AND M.Salary = ( SELECT MAX(F.Salary)
    ->                                                                         FROM EMPLOYEE F
    ->                                                                         )
    ->                                 )
    ->                     );
+--------+--------+
| Fname  | Lname  |
+--------+--------+
| Bob    | Bender |
| Jill   | Jarvis |
| Kate   | King   |
| Lyle   | Leslie |
| Billie | King   |
| Jon    | Kramer |
| Ray    | King   |
| Gerald | Small  |
| Arnold | Head   |
| Helga  | Pataki |
| Naveen | Drew   |
| Carl   | Reedy  |
| Sammy  | Hall   |
| Red    | Bacher |
+--------+--------+
14 rows in set (0.00 sec)

mysql> DESC EMPLOYEE;
+-----------+---------------+------+-----+---------+-------+
| Field     | Type          | Null | Key | Default | Extra |
+-----------+---------------+------+-----+---------+-------+
| Fname     | varchar(15)   | NO   |     | NULL    |       |
| Minit     | char(1)       | YES  |     | NULL    |       |
| Lname     | varchar(15)   | NO   |     | NULL    |       |
| Ssn       | char(9)       | NO   | PRI | NULL    |       |
| Bdate     | date          | YES  |     | NULL    |       |
| Address   | varchar(30)   | YES  |     | NULL    |       |
| Sex       | char(1)       | YES  |     | NULL    |       |
| Salary    | decimal(10,2) | YES  |     | NULL    |       |
| Super_ssn | char(9)       | YES  | MUL | NULL    |       |
| Dno       | int(11)       | NO   | MUL | NULL    |       |
+-----------+---------------+------+-----+---------+-------+
10 rows in set (0.00 sec)


mysql> USE COMPANY;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> /*Query 4b*/                                                                                                             
mysql>     SELECT E.Fname, E.Lname                                                                                            
    ->     FROM EMPLOYEE E, EMPLOYEE S                                                                                              
    ->     WHERE E.Super_ssn = S.Ssn AND S.Super_Ssn = '888665555';
+--------+---------+
| Fname  | Lname   |
+--------+---------+
| John   | Smith   |
| Joyce  | English |
| Ramesh | Narayan |
| Ahmad  | Jabbar  |
| Alicia | Zelaya  |
+--------+---------+
5 rows in set (0.00 sec)

mysql> QUIT
mysql> USE COMPANY;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> /*Query 4c*/                                                                                                             
mysql>     SELECT E.Fname, E.Lname                                                                                            
    ->     FROM EMPLOYEE E                                                                                             
    ->     WHERE E.Salary > ((SELECT MIN(F.Salary) FROM EMPLOYEE F) + 10000);
+----------+---------+
| Fname    | Lname   |
+----------+---------+
| Jared    | James   |
| Jon      | Jones   |
| Justin   | Mark    |
| Brad     | Knight  |
| Evan     | Wallis  |
| Josh     | Zell    |
| Andy     | Vile    |
| Tom      | Brand   |
| Jenny    | Vos     |
| Chris    | Carter  |
| Kim      | Grace   |
| Jeff     | Chase   |
| Franklin | Wong    |
| Alex     | Freed   |
| Bonnie   | Bays    |
| Alec     | Best    |
| Sam      | Snedden |
| John     | James   |
| Nandita  | Ball    |
| Bob      | Bender  |
| Jill     | Jarvis  |
| Kate     | King    |
| Lyle     | Leslie  |
| Billie   | King    |
| Jon      | Kramer  |
| Ray      | King    |
| Sammy    | Hall    |
| Ramesh   | Narayan |
| James    | Borg    |
| Jennifer | Wallace |
+----------+---------+
30 rows in set (0.00 sec)

mysql> USE COMPANY;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> /*
   /*> 
   /*> Query 5a
   /*> A view that has the department name, manager name, and manager salary for every 
   /*> department.
   /*> 
   /*> */
mysql> CREATE VIEW DEPT_MGR
    -> AS
    -> SELECT D.Dname, M.Fname, M.Lname, M.Salary
    -> FROM DEPARTMENT D, EMPLOYEE M
    -> WHERE M.Ssn = D.Mgr_ssn;
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT * FROM DEPT_MGR;
+----------------+----------+---------+----------+
| Dname          | Fname    | Lname   | Salary   |
+----------------+----------+---------+----------+
| Headquarters   | James    | Borg    | 55000.00 |
| Administration | Jennifer | Wallace | 43000.00 |
| Research       | Franklin | Wong    | 40000.00 |
| Software       | Jared    | James   | 85000.00 |
| Hardware       | Alex     | Freed   | 89000.00 |
| Sales          | John     | James   | 81000.00 |
+----------------+----------+---------+----------+
6 rows in set (0.01 sec)

mysql> /*
   /*> 
   /*> Query 5b
   /*> A view that has the employee name, supervisor name, and employee salary for each employee 
   /*> who works in the ‘Research’ department
   /*> 
   /*> */
mysql> CREATE VIEW EMP_IN_RESEARCH_DEPT
    -> AS
    -> SELECT E.Fname, E.Lname, E.Salary, S.Fname AS Supervisor_Fname, S.Lname AS Supervisor_Lname
    -> FROM EMPLOYEE E, EMPLOYEE S, DEPARTMENT D
    -> WHERE D.Dname = 'Research' AND D.Dnumber = E.Dno AND E.Super_ssn = S.Ssn;
Query OK, 0 rows affected (0.13 sec)

mysql> SELECT * FROM EMP_IN_RESEARCH_DEPT;
+----------+---------+----------+------------------+------------------+
| Fname    | Lname   | Salary   | Supervisor_Fname | Supervisor_Lname |
+----------+---------+----------+------------------+------------------+
| John     | Smith   | 30000.00 | Franklin         | Wong             |
| Franklin | Wong    | 40000.00 | James            | Borg             |
| Joyce    | English | 25000.00 | Franklin         | Wong             |
| Ramesh   | Narayan | 38000.00 | Franklin         | Wong             |
+----------+---------+----------+------------------+------------------+
4 rows in set (0.00 sec)



mysql> /*
   /*> 
   /*> Query 5c
   /*> A view that has the project name, controlling department name, number of employees, and 
   /*> total hours worked per week on the project for each project.
   /*> 
   /*> 
   /*> */
mysql> 
mysql>     CREATE VIEW PROJECT_VIEW
    -> AS
    -> SELECT P.Pname, D.Dname, count(*) AS Num_empl, SUM(W.Hours) AS Total_hrs
    -> FROM PROJECT P, DEPARTMENT D, WORKS_ON W
    -> WHERE P.DNum = D.Dnumber AND W.Pno = P.Pnumber
    -> GROUP BY P.Pnumber;
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM PROJECT_VIEW;
+-----------------+----------------+----------+-----------+
| Pname           | Dname          | Num_empl | Total_hrs |
+-----------------+----------------+----------+-----------+
| ProductX        | Research       |        2 |      52.5 |
| ProductY        | Research       |        3 |      37.5 |
| ProductZ        | Research       |        2 |      50.0 |
| Computerization | Administration |        3 |      55.0 |
| Reorganization  | Headquarters   |        3 |      25.0 |
| Newbenefits     | Administration |        3 |      55.0 |
| OperatingSystem | Software       |        9 |     350.0 |
| DatabaseSystems | Software       |        8 |     298.0 |
| Middleware      | Software       |        4 |     136.0 |
| InkjetPrinters  | Hardware       |        8 |     320.0 |
| LaserPrinters   | Hardware       |        3 |     124.0 |
+-----------------+----------------+----------+-----------+
11 rows in set (0.00 sec)

mysql> /*
   /*> 
   /*> Query 5d
   /*> A view that has the project name, controlling department name, number of employees, and 
   /*> total hours worked per week on the project for each project with more than one employee 
   /*> working on it.
   /*> 
   /*> */
mysql> CREATE VIEW PROJECT_VIEW_NUM_EMP_GT1
    -> AS
    -> SELECT P.Pname, D.Dname, count(*) AS Num_empl, SUM(W.Hours) AS Total_hrs
    -> FROM PROJECT P, DEPARTMENT D, WORKS_ON W
    -> WHERE P.Dnum = D.Dnumber AND W.Pno = P.Pnumber AND ( SELECT COUNT(*) FROM WORKS_ON W1 WHERE P.Pnumber = W1.Pno) > 1
    -> GROUP BY P.Pnumber;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from PROJECT_VIEW_NUM_EMP_GT1
    -> ;
+-----------------+----------------+----------+-----------+
| Pname           | Dname          | Num_empl | Total_hrs |
+-----------------+----------------+----------+-----------+
| ProductX        | Research       |        2 |      52.5 |
| ProductY        | Research       |        3 |      37.5 |
| ProductZ        | Research       |        2 |      50.0 |
| Computerization | Administration |        3 |      55.0 |
| Reorganization  | Headquarters   |        3 |      25.0 |
| Newbenefits     | Administration |        3 |      55.0 |
| OperatingSystem | Software       |        9 |     350.0 |
| DatabaseSystems | Software       |        8 |     298.0 |
| Middleware      | Software       |        4 |     136.0 |
| InkjetPrinters  | Hardware       |        8 |     320.0 |
| LaserPrinters   | Hardware       |        3 |     124.0 |
+-----------------+----------------+----------+-----------+
11 rows in set (0.01 sec)


mysql> /*
   /*> 
   /*> Query 5e
   /*> Retrieve the names of all employees in department 5 who work more than 10 hours per week on the ProductX project
   /*> 
   /*> */
mysql> 
mysql> SELECT  E.Fname, E.Lname
    -> FROM EMPLOYEE E, WORKS_ON W, PROJECT P
    -> WHERE E.Ssn = W.Essn AND W.Pno = P.Pnumber AND E.Dno = 5 AND P.Pname = 'ProductX'AND W.Hours > 10;
+-------+---------+
| Fname | Lname   |
+-------+---------+
| John  | Smith   |
| Joyce | English |
+-------+---------+
2 rows in set (0.00 sec)

mysql> /*
   /*> 
   /*> Query 5f
   /*> List the names of all employees who have a dependent with the same first name as themselves.
   /*> 
   /*> */
mysql> 
mysql> SELECT  E.Fname, E.Lname, D.Dependent_name
    -> FROM EMPLOYEE E, DEPENDENT D
    -> WHERE E.Ssn = D.Essn AND E.Fname = D.Dependent_name;
Empty set (0.00 sec)

mysql> 
mysql> 
mysql> /*
   /*> 
   /*> Query 5g
   /*> Find the names of all employees who are directly supervised by ‘Franklin Wong’.
   /*> 
   /*> */
mysql> 
mysql> 
mysql> SELECT  E.Fname, E.Lname
    -> FROM EMPLOYEE E, EMPLOYEE S
    -> WHERE E.Super_ssn = S.Ssn AND S.Fname = 'Franklin' AND S.Lname = 'Wong';
+--------+---------+
| Fname  | Lname   |
+--------+---------+
| John   | Smith   |
| Joyce  | English |
| Ramesh | Narayan |
+--------+---------+
3 rows in set (0.00 sec)

mysql> /*
   /*> Query 2
   /*> Write SQL statements to create a table EMPLOYEE_BACKUP to back up the EMPLOYEE 
   /*> table shown in Figure 3.6.
   /*> */

mysql> CREATE TABLE `EMPLOYEE_BACKUP` (
    ->   `Fname` varchar(15) NOT NULL,
    ->   `Minit` char(1) DEFAULT NULL,
    ->   `Lname` varchar(15) NOT NULL,
    ->   `Ssn` char(9) NOT NULL,
    ->   `Bdate` date DEFAULT NULL,
    ->   `Address` varchar(30) DEFAULT NULL,
    ->   `Sex` char(1) DEFAULT NULL,
    ->   `Salary` decimal(10,2) DEFAULT NULL,
    ->   `Super_ssn` char(9) DEFAULT NULL,
    ->   `Dno` int(11) NOT NULL,
    ->   PRIMARY KEY (`Ssn`)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> INSERT INTO EMPLOYEE_BACKUP
    -> SELECT * FROM EMPLOYEE;
Query OK, 40 rows affected (0.01 sec)
Records: 40  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM EMPLOYEE_BACKUP;
+----------+-------+---------+-----------+------------+--------------------------------+------+----------+-----------+-----+
| Fname    | Minit | Lname   | Ssn       | Bdate      | Address                        | Sex  | Salary   | Super_ssn | Dno |
+----------+-------+---------+-----------+------------+--------------------------------+------+----------+-----------+-----+
| Jared    | D     | James   | 111111100 | 1966-10-10 | 123 Peachtree, Atlanta, GA     | M    | 85000.00 | NULL      |   6 |
| Jon      | C     | Jones   | 111111101 | 1967-11-14 | 111 Allgood, Atlanta, GA       | M    | 45000.00 | 111111100 |   6 |
| Justin   | n     | Mark    | 111111102 | 1966-01-12 | 2342 May, Atlanta, GA          | M    | 40000.00 | 111111100 |   6 |
| Brad     | C     | Knight  | 111111103 | 1968-02-13 | 176 Main St., Atlanta, GA      | M    | 44000.00 | 111111100 |   6 |
| John     | B     | Smith   | 123456789 | 1955-01-09 | 731 Fondren, Houston, TX       | M    | 30000.00 | 333445555 |   5 |
| Evan     | E     | Wallis  | 222222200 | 1958-01-16 | 134 Pelham, Milwaukee, WI      | M    | 92000.00 | NULL      |   7 |
| Josh     | U     | Zell    | 222222201 | 1954-05-22 | 266 McGrady, Milwaukee, WI     | M    | 56000.00 | 222222200 |   7 |
| Andy     | C     | Vile    | 222222202 | 1944-06-21 | 1967 Jordan, Milwaukee, WI     | M    | 53000.00 | 222222200 |   7 |
| Tom      | G     | Brand   | 222222203 | 1966-12-16 | 112 Third St, Milwaukee, WI    | M    | 62500.00 | 222222200 |   7 |
| Jenny    | F     | Vos     | 222222204 | 1967-11-11 | 263 Mayberry, Milwaukee, WI    | F    | 61000.00 | 222222201 |   7 |
| Chris    | A     | Carter  | 222222205 | 1960-03-21 | 565 Jordan, Milwaukee, WI      | F    | 43000.00 | 222222201 |   7 |
| Kim      | C     | Grace   | 333333300 | 1970-10-23 | 6677 Mills Ave, Sacramento, CA | F    | 79000.00 | NULL      |   6 |
| Jeff     | H     | Chase   | 333333301 | 1970-01-07 | 145 Bradbury, Sacramento, CA   | M    | 44000.00 | 333333300 |   6 |
| Franklin | T     | Wong    | 333445555 | 1945-12-08 | 638 Voss, Houston, TX          | M    | 40000.00 | 888665555 |   5 |
| Alex     | D     | Freed   | 444444400 | 1950-10-09 | 4333 Pillsbury, Milwaukee, WI  | M    | 89000.00 | NULL      |   7 |
| Bonnie   | S     | Bays    | 444444401 | 1956-06-19 | 111 Hollow, Milwaukee, WI      | F    | 70000.00 | 444444400 |   7 |
| Alec     | C     | Best    | 444444402 | 1966-06-18 | 233 Solid, Milwaukee, WI       | M    | 60000.00 | 444444400 |   7 |
| Sam      | S     | Snedden | 444444403 | 1977-07-31 | 987 Windy St, Milwaukee, WI    | M    | 48000.00 | 444444400 |   7 |
| Joyce    | A     | English | 453453453 | 1962-07-31 | 5631 Rice, Houston, TX         | F    | 25000.00 | 333445555 |   5 |
| John     | C     | James   | 555555500 | 1975-06-30 | 7676 Bloomington, Sacramento,  | M    | 81000.00 | NULL      |   6 |
| Nandita  | K     | Ball    | 555555501 | 1969-04-16 | 222 Howard, Sacramento, CA     | M    | 62000.00 | 555555500 |   6 |
| Bob      | B     | Bender  | 666666600 | 1968-04-17 | 8794 Garfield, Chicago, IL     | M    | 96000.00 | NULL      |   8 |
| Jill     | J     | Jarvis  | 666666601 | 1966-01-14 | 6234 Lincoln, Chicago, IL      | F    | 36000.00 | 666666600 |   8 |
| Kate     | W     | King    | 666666602 | 1966-04-16 | 1976 Boone Trace, Chicago, IL  | F    | 44000.00 | 666666600 |   8 |
| Lyle     | G     | Leslie  | 666666603 | 1963-06-09 | 417 Hancock Ave, Chicago, IL   | M    | 41000.00 | 666666601 |   8 |
| Billie   | J     | King    | 666666604 | 1960-01-01 | 556 Washington, Chicago, IL    | F    | 38000.00 | 666666603 |   8 |
| Jon      | A     | Kramer  | 666666605 | 1964-08-22 | 1988 Windy Creek, Seattle, WA  | M    | 41500.00 | 666666603 |   8 |
| Ray      | H     | King    | 666666606 | 1949-08-16 | 213 Delk Road, Seattle, WA     | M    | 44500.00 | 666666604 |   8 |
| Gerald   | D     | Small   | 666666607 | 1962-05-15 | 122 Ball Street, Dallas, TX    | M    | 29000.00 | 666666602 |   8 |
| Arnold   | A     | Head    | 666666608 | 1967-05-19 | 233 Spring St, Dallas, TX      | M    | 33000.00 | 666666602 |   8 |
| Helga    | C     | Pataki  | 666666609 | 1969-03-11 | 101 Holyoke St, Dallas, TX     | F    | 32000.00 | 666666602 |   8 |
| Naveen   | B     | Drew    | 666666610 | 1970-05-23 | 198 Elm St, Philadelphia, PA   | M    | 34000.00 | 666666607 |   8 |
| Carl     | E     | Reedy   | 666666611 | 1977-06-21 | 213 Ball St, Philadelphia, PA  | M    | 32000.00 | 666666610 |   8 |
| Sammy    | G     | Hall    | 666666612 | 1970-01-11 | 433 Main Street, Miami, FL     | M    | 37000.00 | 666666611 |   8 |
| Red      | A     | Bacher  | 666666613 | 1980-05-21 | 196 Elm Street, Miami, FL      | M    | 33500.00 | 666666612 |   8 |
| Ramesh   | K     | Narayan | 666884444 | 1952-09-15 | 971 Fire Oak, Humble, TX       | M    | 38000.00 | 333445555 |   5 |
| James    | E     | Borg    | 888665555 | 1927-11-10 | 450 Stone, Houston, TX         | M    | 55000.00 | NULL      |   1 |
| Jennifer | S     | Wallace | 987654321 | 1931-06-20 | 291 Berry, Bellaire, TX        | F    | 43000.00 | 888665555 |   4 |
| Ahmad    | V     | Jabbar  | 987987987 | 1959-03-29 | 980 Dallas, Houston, TX        | M    | 25000.00 | 987654321 |   4 |
| Alicia   | J     | Zelaya  | 999887777 | 1958-07-19 | 3321 Castle, Spring, TX        | F    | 25000.00 | 987654321 |   4 |
+----------+-------+---------+-----------+------------+--------------------------------+------+----------+-----------+-----+
40 rows in set (0.01 sec)

mysql> /*
   /*> Query 3
   /*> Find the names of employees who work on all the projects controlled by department number 5
   /*> */
mysql> 
mysql> SELECT E.Fname, E.Lname
    -> FROM  EMPLOYEE E
    -> WHERE NOT EXISTS
    -> (SELECT *
    -> FROM PROJECT P
    -> WHERE P.Dnum = 5 AND NOT EXISTS
    -> (SELECT *
    -> FROM WORKS_ON W
    -> WHERE W.Essn = E.Ssn AND W.Pno = P.Pnumber));
Empty set (0.00 sec)

mysql> /*
   /*> 
   /*> Query 4a
   /*> For each project, list the project name and the total hours per week (by all employees) spent on that project.
   /*> 
   /*> */
mysql> 
mysql> SELECT P.Pname, SUM(W.Hours)
    -> FROM PROJECT P, WORKS_ON W
    -> WHERE P.Pnumber = W.Pno
    -> GROUP BY P.Pnumber;
+-----------------+--------------+
| Pname           | SUM(W.Hours) |
+-----------------+--------------+
| ProductX        |         52.5 |
| ProductY        |         37.5 |
| ProductZ        |         50.0 |
| Computerization |         55.0 |
| Reorganization  |         25.0 |
| Newbenefits     |         55.0 |
| OperatingSystem |        350.0 |
| DatabaseSystems |        298.0 |
| Middleware      |        136.0 |
| InkjetPrinters  |        320.0 |
| LaserPrinters   |        124.0 |
+-----------------+--------------+
11 rows in set (0.00 sec)

mysql> /*
   /*> 
   /*> Query 4b
   /*> Retrieve the names of all employees who work on every project.
   /*> 
   /*> */
mysql> 
mysql> SELECT E.Fname, E.Lname
    -> FROM  EMPLOYEE E
    -> WHERE NOT EXISTS
    -> (SELECT * FROM PROJECT P WHERE NOT EXISTS
    ->     (SELECT *
    ->     FROM WORKS_ON W
    ->     WHERE W.Essn = E.Ssn AND W.Pno = P.Pnumber));
Empty set (0.00 sec)

mysql> 
   /*> 
   /*> Query 4C
   /*> Retrieve the names of all employees who do not work on any project.
   /*> 
   /*> */
mysql> 
mysql> SELECT E.Fname, E.Lname
    -> FROM  EMPLOYEE E
    -> WHERE NOT EXISTS (
    ->     SELECT *
    ->     FROM WORKS_ON W
    ->     WHERE W.Essn = E.Ssn);
+-------+--------+
| Fname | Lname  |
+-------+--------+
| Bob   | Bender |
| Kate  | King   |
+-------+--------+
2 rows in set (0.00 sec)

mysql> 
mysql> /*
   /*> 
   /*> Query 4d
   /*> Retrieve the average salary of all female employees.
   /*> 
   /*> */
mysql> 
mysql> SELECT AVG(E.Salary)
    -> FROM  EMPLOYEE E
    -> WHERE E.Sex = 'F';
+---------------+
| AVG(E.Salary) |
+---------------+
|  45090.909091 |
+---------------+
1 row in set (0.00 sec)

mysql> /*
   /*> 
   /*> Query 4e
   /*> Find the names and addresses of all employees who work on at least one project located in Houston but
   /*> whose department has no location in Houston.
   /*> 
   /*> */
mysql> SELECT E.Fname, E.Lname, E.Address
    -> FROM  EMPLOYEE E
    -> WHERE 
    -> EXISTS (
    ->     SELECT * 
    ->     FROM PROJECT P, WORKS_ON W
    ->     WHERE P.Pnumber = W.Pno AND E.Ssn = W.Essn AND P.Plocation = 'Houston'
    -> )
    -> 
    -> AND
    -> 
    -> NOT EXISTS (
    ->     SELECT *
    ->     FROM DEPARTMENT D, DEPT_LOCATIONS L
    ->     WHERE D.Dnumber = E.Dno AND D.Dnumber = L.Dnumber AND L.Dlocation = 'Houston'
    -> );
+----------+---------+-------------------------+
| Fname    | Lname   | Address                 |
+----------+---------+-------------------------+
| Jennifer | Wallace | 291 Berry, Bellaire, TX |
+----------+---------+-------------------------+
1 row in set (0.00 sec)


mysql> /*
   /*> 
   /*> Query 4f
   /*> List the last names of all department managers who have no dependents.
   /*> 
   /*> */
mysql> 
mysql> SELECT M.Fname, M.Lname
    -> FROM EMPLOYEE M
    -> WHERE 
    -> 
    -> EXISTS (
    ->     SELECT *
    ->     FROM DEPARTMENT D
    ->     WHERE D.Mgr_ssn = M.Ssn
    -> )
    -> 
    -> AND
    -> 
    -> NOT EXISTS (
    ->     SELECT *
    ->     FROM DEPENDENT DN
    ->     WHERE DN.Essn = M.Ssn
    -> );
+-------+-------+
| Fname | Lname |
+-------+-------+
| Jared | James |
| John  | James |
| James | Borg  |
+-------+-------+
3 rows in set (0.00 sec)

mysql> /*
   /*> Query 4g
   /*> Display employee names (e’’) who are supervised by an e’ who is immediately supervised by 
   /*> an employee with lname “XYZ”.*/
mysql> 
mysql> SELECT E.Fname, E.Lname
    -> FROM EMPLOYEE E
    -> WHERE
    -> EXISTS (
    ->     SELECT *
    ->     FROM EMPLOYEE S, EMPLOYEE SS
    ->     WHERE E.Super_ssn = S.Ssn AND SS.Ssn = S.Super_ssn AND SS.Lname = 'XYZ'
    -> );
Empty set (0.00 sec)

mysql> 
mysql> /*
   /*> Query 4h
   /*> Display names of all employees who work on some project controlled by department number 10.
   /*> */
mysql> 
mysql> SELECT E.Fname, E.Lname
    -> FROM EMPLOYEE E
    -> WHERE
    -> EXISTS (
    ->     SELECT *
    ->     FROM WORKS_ON W, PROJECT P
    ->     WHERE W.Essn = E.Ssn AND W.Pno = P.Pnumber AND P.Dnum = 10
    -> );
Empty set (0.01 sec)

mysql> /*
   /*> Query 10
   /*> Display all female employee names who also have dependents along with their dependent 
   /*> */
mysql> 
mysql> SELECT  E.Fname, E.Lname, DN.Dependent_name
    -> FROM EMPLOYEE E, DEPENDENT DN
    -> WHERE E.Sex = 'F' AND DN.Essn = E.Ssn;
+----------+---------+----------------+
| Fname    | Lname   | Dependent_name |
+----------+---------+----------------+
| Bonnie   | Bays    | Chris          |
| Jennifer | Wallace | Abner          |
+----------+---------+----------------+
2 rows in set (0.00 sec)

mysql> quit
