mysql> /*Query 1'*/
mysql> SELECT EMPLOYEE.Fname, EMPLOYEE.LName, EMPLOYEE.Address
    -> FROM EMPLOYEE, DEPARTMENT
    -> WHERE DEPARTMENT.DName = 'Research' AND
    -> DEPARTMENT.Dnumber = EMPLOYEE.Dno;
ERROR 1046 (3D000): No database selected
mysql> use COMPANY;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> /*Query 1'*/
mysql> SELECT EMPLOYEE.Fname, EMPLOYEE.LName, EMPLOYEE.Address
    -> FROM EMPLOYEE, DEPARTMENT
    -> WHERE DEPARTMENT.DName = 'Research' AND
    -> DEPARTMENT.Dnumber = EMPLOYEE.Dno;
+----------+---------+--------------------------+
| Fname    | LName   | Address                  |
+----------+---------+--------------------------+
| John     | Smith   | 731 Fondren, Houston, TX |
| Franklin | Wong    | 638 Voss, Houston, TX    |
| Joyce    | English | 5631 Rice, Houston, TX   |
| Ramesh   | Narayan | 971 Fire Oak, Humble, TX |
+----------+---------+--------------------------+
4 rows in set (0.00 sec)

mysql> /*Query 8*/
mysql> SELECT E.Fname, E.Lname, S.Fname, S.Lname
    -> FROM EMPLOYEE AS E , EMPLOYEE AS S
    -> WHERE E.Super_ssn = S.Ssn;
+----------+---------+----------+---------+
| Fname    | Lname   | Fname    | Lname   |
+----------+---------+----------+---------+
| Jon      | Jones   | Jared    | James   |
| Justin   | Mark    | Jared    | James   |
| Brad     | Knight  | Jared    | James   |
| John     | Smith   | Franklin | Wong    |
| Josh     | Zell    | Evan     | Wallis  |
| Andy     | Vile    | Evan     | Wallis  |
| Tom      | Brand   | Evan     | Wallis  |
| Jenny    | Vos     | Josh     | Zell    |
| Chris    | Carter  | Josh     | Zell    |
| Jeff     | Chase   | Kim      | Grace   |
| Franklin | Wong    | James    | Borg    |
| Bonnie   | Bays    | Alex     | Freed   |
| Alec     | Best    | Alex     | Freed   |
| Sam      | Snedden | Alex     | Freed   |
| Joyce    | English | Franklin | Wong    |
| Nandita  | Ball    | John     | James   |
| Jill     | Jarvis  | Bob      | Bender  |
| Kate     | King    | Bob      | Bender  |
| Lyle     | Leslie  | Jill     | Jarvis  |
| Billie   | King    | Lyle     | Leslie  |
| Jon      | Kramer  | Lyle     | Leslie  |
| Ray      | King    | Billie   | King    |
| Gerald   | Small   | Kate     | King    |
| Arnold   | Head    | Kate     | King    |
| Helga    | Pataki  | Kate     | King    |
| Naveen   | Drew    | Gerald   | Small   |
| Carl     | Reedy   | Naveen   | Drew    |
| Sammy    | Hall    | Carl     | Reedy   |
| Red      | Bacher  | Sammy    | Hall    |
| Ramesh   | Narayan | Franklin | Wong    |
| Jennifer | Wallace | James    | Borg    |
| Ahmad    | Jabbar  | Jennifer | Wallace |
| Alicia   | Zelaya  | Jennifer | Wallace |
+----------+---------+----------+---------+
33 rows in set (0.01 sec)

mysql> /*Query 1B*/
mysql> SELECT E.Fname, E.LName, E.Address
    -> FROM EMPLOYEE E, DEPARTMENT D
    -> WHERE D.DName = 'Research' AND D.Dnumber = E.Dno;
+----------+---------+--------------------------+
| Fname    | LName   | Address                  |
+----------+---------+--------------------------+
| John     | Smith   | 731 Fondren, Houston, TX |
| Franklin | Wong    | 638 Voss, Houston, TX    |
| Joyce    | English | 5631 Rice, Houston, TX   |
| Ramesh   | Narayan | 971 Fire Oak, Humble, TX |
+----------+---------+--------------------------+
4 rows in set (0.00 sec)

mysql> QUIT
