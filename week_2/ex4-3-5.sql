mysql> -- Query 12. Retrieve all employees whose address is in Houston, Texas.
mysql> SELECT Fname , Lname
    -> FROM EMPLOYEE
    -> WHERE Address LIKE '%Houston, TX%';

+----------+---------+
| Fname    | Lname   |
+----------+---------+
| John     | Smith   |
| Franklin | Wong    |
| Joyce    | English |
| James    | Borg    |
| Ahmad    | Jabbar  |
+----------+---------+
5 rows in set (0.00 sec)

mysql> -- Query 12A. Find all employees who were born during the 1950s.
mysql> SELECT Fname , Lname
    -> FROM EMPLOYEE
    -> WHERE Bdate LIKE '__5_______';
+--------+---------+
| Fname  | Lname   |
+--------+---------+
| John   | Smith   |
| Evan   | Wallis  |
| Josh   | Zell    |
| Alex   | Freed   |
| Bonnie | Bays    |
| Ramesh | Narayan |
| Ahmad  | Jabbar  |
| Alicia | Zelaya  |
+--------+---------+
8 rows in set, 1 warning (0.00 sec)

mysql> /*
   /*> Query 13. Show the resulting salaries if every employee working on the
   /*> ‘ProductX’ project is given a 10 percent raise.
   /*> */
mysql> 
mysql> SELECT E.Fname , E.Lname , 1.1 * E.Salary AS Increased_sal
    -> FROM EMPLOYEE AS E , WORKS_ON AS W , PROJECT AS P
    -> WHERE E.Ssn = W.Essn AND W.Pno = P.Pnumber AND
    -> P.Pname ='ProductX';
+-------+---------+---------------+
| Fname | Lname   | Increased_sal |
+-------+---------+---------------+
| John  | Smith   |     33000.000 |
| Joyce | English |     27500.000 |
+-------+---------+---------------+
2 rows in set (0.00 sec)

mysql> /*Query 14. Retrieve all employees in department 5 whose salary is between
   /*> $30,000 and $40,000.
   /*> */
mysql> 
mysql> SELECT *
    -> FROM EMPLOYEE
    -> WHERE (Salary BETWEEN 30000 AND 40000 ) AND Dno = 5;
+----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+-----+
| Fname    | Minit | Lname   | Ssn       | Bdate      | Address                  | Sex  | Salary   | Super_ssn | Dno |
+----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+-----+
| John     | B     | Smith   | 123456789 | 1955-01-09 | 731 Fondren, Houston, TX | M    | 30000.00 | 333445555 |   5 |
| Franklin | T     | Wong    | 333445555 | 1945-12-08 | 638 Voss, Houston, TX    | M    | 40000.00 | 888665555 |   5 |
| Ramesh   | K     | Narayan | 666884444 | 1952-09-15 | 971 Fire Oak, Humble, TX | M    | 38000.00 | 333445555 |   5 |
+----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+-----+
3 rows in set (0.00 sec)

mysql> tee ex4-3-6-src.sql
