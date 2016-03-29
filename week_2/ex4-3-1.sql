mysql> USE COMPANY;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> /*Query 0*/
mysql> SELECT Bdate, Address
    -> FROM EMPLOYEE
    -> WHERE Fname ='John' AND Minit ='B' AND Lname = 'Smith';
+------------+--------------------------+
| Bdate      | Address                  |
+------------+--------------------------+
| 1955-01-09 | 731 Fondren, Houston, TX |
+------------+--------------------------+
1 row in set (0.00 sec)

mysql> /*Query 1*/
mysql> SELECT Fname, Lname, Address
    -> FROM EMPLOYEE, DEPARTMENT
    -> WHERE Dname ='Research' AND Dnumber = Dno;
+----------+---------+--------------------------+
| Fname    | Lname   | Address                  |
+----------+---------+--------------------------+
| John     | Smith   | 731 Fondren, Houston, TX |
| Franklin | Wong    | 638 Voss, Houston, TX    |
| Joyce    | English | 5631 Rice, Houston, TX   |
| Ramesh   | Narayan | 971 Fire Oak, Humble, TX |
+----------+---------+--------------------------+
4 rows in set (0.00 sec)

mysql> /*Query 2*/
mysql> SELECT Pnumber, Dnum, Lname, Address, Bdate
    -> FROM PROJECT, DEPARTMENT, EMPLOYEE
    -> WHERE Dnum = Dnumber AND Mgr_ssn = Ssn AND Plocation ='Stafford';
+---------+------+---------+-------------------------+------------+
| Pnumber | Dnum | Lname   | Address                 | Bdate      |
+---------+------+---------+-------------------------+------------+
|      10 |    4 | Wallace | 291 Berry, Bellaire, TX | 1931-06-20 |
|      30 |    4 | Wallace | 291 Berry, Bellaire, TX | 1931-06-20 |
+---------+------+---------+-------------------------+------------+
2 rows in set (0.00 sec)

mysql> QUIT
