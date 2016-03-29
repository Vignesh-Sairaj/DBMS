mysql> USE COMPANY
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> /*Query 9*/
mysql> SELECT Ssn
    -> FROM EMPLOYEE;
+-----------+
| Ssn       |
+-----------+
| 888665555 |
| 987654321 |
| 987987987 |
| 999887777 |
| 123456789 |
| 333445555 |
| 453453453 |
| 666884444 |
| 111111100 |
| 111111101 |
| 111111102 |
| 111111103 |
| 333333300 |
| 333333301 |
| 555555500 |
| 555555501 |
| 222222200 |
| 222222201 |
| 222222202 |
| 222222203 |
| 222222204 |
| 222222205 |
| 444444400 |
| 444444401 |
| 444444402 |
| 444444403 |
| 666666600 |
| 666666601 |
| 666666602 |
| 666666603 |
| 666666604 |
| 666666605 |
| 666666606 |
| 666666607 |
| 666666608 |
| 666666609 |
| 666666610 |
| 666666611 |
| 666666612 |
| 666666613 |
+-----------+
40 rows in set (0.00 sec)

mysql> /*Query 10*/
mysql> SELECT Ssn, Dname
    -> FROM EMPLOYEE, DEPARTMENT;
+-----------+----------------+
| Ssn       | Dname          |
+-----------+----------------+
| 111111100 | Administration |
| 111111100 | Hardware       |
| 111111100 | Headquarters   |
| 111111100 | Research       |
| 111111100 | Sales          |
| 111111100 | Software       |
| 111111101 | Administration |
| 111111101 | Hardware       |
| 111111101 | Headquarters   |
| 111111101 | Research       |
| 111111101 | Sales          |
| 111111101 | Software       |
| 111111102 | Administration |
| 111111102 | Hardware       |
| 111111102 | Headquarters   |
| 111111102 | Research       |
| 111111102 | Sales          |
| 111111102 | Software       |
| 111111103 | Administration |
| 111111103 | Hardware       |
| 111111103 | Headquarters   |
| 111111103 | Research       |
| 111111103 | Sales          |
| 111111103 | Software       |
| 123456789 | Administration |
| 123456789 | Hardware       |
| 123456789 | Headquarters   |
| 123456789 | Research       |
| 123456789 | Sales          |
| 123456789 | Software       |
| 222222200 | Administration |
| 222222200 | Hardware       |
| 222222200 | Headquarters   |
| 222222200 | Research       |
| 222222200 | Sales          |
| 222222200 | Software       |
| 222222201 | Administration |
| 222222201 | Hardware       |
| 222222201 | Headquarters   |
| 222222201 | Research       |
| 222222201 | Sales          |
| 222222201 | Software       |
| 222222202 | Administration |
| 222222202 | Hardware       |
| 222222202 | Headquarters   |
| 222222202 | Research       |
| 222222202 | Sales          |
| 222222202 | Software       |
| 222222203 | Administration |
| 222222203 | Hardware       |
| 222222203 | Headquarters   |
| 222222203 | Research       |
| 222222203 | Sales          |
| 222222203 | Software       |
| 222222204 | Administration |
| 222222204 | Hardware       |
| 222222204 | Headquarters   |
| 222222204 | Research       |
| 222222204 | Sales          |
| 222222204 | Software       |
| 222222205 | Administration |
| 222222205 | Hardware       |
| 222222205 | Headquarters   |
| 222222205 | Research       |
| 222222205 | Sales          |
| 222222205 | Software       |
| 333333300 | Administration |
| 333333300 | Hardware       |
| 333333300 | Headquarters   |
| 333333300 | Research       |
| 333333300 | Sales          |
| 333333300 | Software       |
| 333333301 | Administration |
| 333333301 | Hardware       |
| 333333301 | Headquarters   |
| 333333301 | Research       |
| 333333301 | Sales          |
| 333333301 | Software       |
| 333445555 | Administration |
| 333445555 | Hardware       |
| 333445555 | Headquarters   |
| 333445555 | Research       |
| 333445555 | Sales          |
| 333445555 | Software       |
| 444444400 | Administration |
| 444444400 | Hardware       |
| 444444400 | Headquarters   |
| 444444400 | Research       |
| 444444400 | Sales          |
| 444444400 | Software       |
| 444444401 | Administration |
| 444444401 | Hardware       |
| 444444401 | Headquarters   |
| 444444401 | Research       |
| 444444401 | Sales          |
| 444444401 | Software       |
| 444444402 | Administration |
| 444444402 | Hardware       |
| 444444402 | Headquarters   |
| 444444402 | Research       |
| 444444402 | Sales          |
| 444444402 | Software       |
| 444444403 | Administration |
| 444444403 | Hardware       |
| 444444403 | Headquarters   |
| 444444403 | Research       |
| 444444403 | Sales          |
| 444444403 | Software       |
| 453453453 | Administration |
| 453453453 | Hardware       |
| 453453453 | Headquarters   |
| 453453453 | Research       |
| 453453453 | Sales          |
| 453453453 | Software       |
| 555555500 | Administration |
| 555555500 | Hardware       |
| 555555500 | Headquarters   |
| 555555500 | Research       |
| 555555500 | Sales          |
| 555555500 | Software       |
| 555555501 | Administration |
| 555555501 | Hardware       |
| 555555501 | Headquarters   |
| 555555501 | Research       |
| 555555501 | Sales          |
| 555555501 | Software       |
| 666666600 | Administration |
| 666666600 | Hardware       |
| 666666600 | Headquarters   |
| 666666600 | Research       |
| 666666600 | Sales          |
| 666666600 | Software       |
| 666666601 | Administration |
| 666666601 | Hardware       |
| 666666601 | Headquarters   |
| 666666601 | Research       |
| 666666601 | Sales          |
| 666666601 | Software       |
| 666666602 | Administration |
| 666666602 | Hardware       |
| 666666602 | Headquarters   |
| 666666602 | Research       |
| 666666602 | Sales          |
| 666666602 | Software       |
| 666666603 | Administration |
| 666666603 | Hardware       |
| 666666603 | Headquarters   |
| 666666603 | Research       |
| 666666603 | Sales          |
| 666666603 | Software       |
| 666666604 | Administration |
| 666666604 | Hardware       |
| 666666604 | Headquarters   |
| 666666604 | Research       |
| 666666604 | Sales          |
| 666666604 | Software       |
| 666666605 | Administration |
| 666666605 | Hardware       |
| 666666605 | Headquarters   |
| 666666605 | Research       |
| 666666605 | Sales          |
| 666666605 | Software       |
| 666666606 | Administration |
| 666666606 | Hardware       |
| 666666606 | Headquarters   |
| 666666606 | Research       |
| 666666606 | Sales          |
| 666666606 | Software       |
| 666666607 | Administration |
| 666666607 | Hardware       |
| 666666607 | Headquarters   |
| 666666607 | Research       |
| 666666607 | Sales          |
| 666666607 | Software       |
| 666666608 | Administration |
| 666666608 | Hardware       |
| 666666608 | Headquarters   |
| 666666608 | Research       |
| 666666608 | Sales          |
| 666666608 | Software       |
| 666666609 | Administration |
| 666666609 | Hardware       |
| 666666609 | Headquarters   |
| 666666609 | Research       |
| 666666609 | Sales          |
| 666666609 | Software       |
| 666666610 | Administration |
| 666666610 | Hardware       |
| 666666610 | Headquarters   |
| 666666610 | Research       |
| 666666610 | Sales          |
| 666666610 | Software       |
| 666666611 | Administration |
| 666666611 | Hardware       |
| 666666611 | Headquarters   |
| 666666611 | Research       |
| 666666611 | Sales          |
| 666666611 | Software       |
| 666666612 | Administration |
| 666666612 | Hardware       |
| 666666612 | Headquarters   |
| 666666612 | Research       |
| 666666612 | Sales          |
| 666666612 | Software       |
| 666666613 | Administration |
| 666666613 | Hardware       |
| 666666613 | Headquarters   |
| 666666613 | Research       |
| 666666613 | Sales          |
| 666666613 | Software       |
| 666884444 | Administration |
| 666884444 | Hardware       |
| 666884444 | Headquarters   |
| 666884444 | Research       |
| 666884444 | Sales          |
| 666884444 | Software       |
| 888665555 | Administration |
| 888665555 | Hardware       |
| 888665555 | Headquarters   |
| 888665555 | Research       |
| 888665555 | Sales          |
| 888665555 | Software       |
| 987654321 | Administration |
| 987654321 | Hardware       |
| 987654321 | Headquarters   |
| 987654321 | Research       |
| 987654321 | Sales          |
| 987654321 | Software       |
| 987987987 | Administration |
| 987987987 | Hardware       |
| 987987987 | Headquarters   |
| 987987987 | Research       |
| 987987987 | Sales          |
| 987987987 | Software       |
| 999887777 | Administration |
| 999887777 | Hardware       |
| 999887777 | Headquarters   |
| 999887777 | Research       |
| 999887777 | Sales          |
| 999887777 | Software       |
+-----------+----------------+
240 rows in set (0.00 sec)

mysql> /*Query 1C*/
mysql> SELECT *
    -> FROM EMPLOYEE
    -> WHERE Dno =5;
+----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+-----+
| Fname    | Minit | Lname   | Ssn       | Bdate      | Address                  | Sex  | Salary   | Super_ssn | Dno |
+----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+-----+
| John     | B     | Smith   | 123456789 | 1955-01-09 | 731 Fondren, Houston, TX | M    | 30000.00 | 333445555 |   5 |
| Franklin | T     | Wong    | 333445555 | 1945-12-08 | 638 Voss, Houston, TX    | M    | 40000.00 | 888665555 |   5 |
| Joyce    | A     | English | 453453453 | 1962-07-31 | 5631 Rice, Houston, TX   | F    | 25000.00 | 333445555 |   5 |
| Ramesh   | K     | Narayan | 666884444 | 1952-09-15 | 971 Fire Oak, Humble, TX | M    | 38000.00 | 333445555 |   5 |
+----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+-----+
4 rows in set (0.00 sec)

mysql> /*Query 1D*/
mysql> SELECT *
    -> FROM EMPLOYEE, DEPARTMENT
    -> WHERE Dname = 'Research' AND Dno = Dnumber;
+----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+-----+----------+---------+-----------+----------------+
| Fname    | Minit | Lname   | Ssn       | Bdate      | Address                  | Sex  | Salary   | Super_ssn | Dno | Dname    | Dnumber | Mgr_ssn   | Mgr_start_date |
+----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+-----+----------+---------+-----------+----------------+
| John     | B     | Smith   | 123456789 | 1955-01-09 | 731 Fondren, Houston, TX | M    | 30000.00 | 333445555 |   5 | Research |       5 | 333445555 | 1978-05-22     |
| Franklin | T     | Wong    | 333445555 | 1945-12-08 | 638 Voss, Houston, TX    | M    | 40000.00 | 888665555 |   5 | Research |       5 | 333445555 | 1978-05-22     |
| Joyce    | A     | English | 453453453 | 1962-07-31 | 5631 Rice, Houston, TX   | F    | 25000.00 | 333445555 |   5 | Research |       5 | 333445555 | 1978-05-22     |
| Ramesh   | K     | Narayan | 666884444 | 1952-09-15 | 971 Fire Oak, Humble, TX | M    | 38000.00 | 333445555 |   5 | Research |       5 | 333445555 | 1978-05-22     |
+----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+-----+----------+---------+-----------+----------------+
4 rows in set (0.00 sec)

mysql> /*QUERY10A*/
mysql> SELECT *
    -> FROM EMPLOYEE , DEPARTMENT ;
+----------+-------+---------+-----------+------------+--------------------------------+------+----------+-----------+-----+----------------+---------+-----------+----------------+
| Fname    | Minit | Lname   | Ssn       | Bdate      | Address                        | Sex  | Salary   | Super_ssn | Dno | Dname          | Dnumber | Mgr_ssn   | Mgr_start_date |
+----------+-------+---------+-----------+------------+--------------------------------+------+----------+-----------+-----+----------------+---------+-----------+----------------+
| Jared    | D     | James   | 111111100 | 1966-10-10 | 123 Peachtree, Atlanta, GA     | M    | 85000.00 | NULL      |   6 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Jared    | D     | James   | 111111100 | 1966-10-10 | 123 Peachtree, Atlanta, GA     | M    | 85000.00 | NULL      |   6 | Administration |       4 | 987654321 | 1985-01-01     |
| Jared    | D     | James   | 111111100 | 1966-10-10 | 123 Peachtree, Atlanta, GA     | M    | 85000.00 | NULL      |   6 | Research       |       5 | 333445555 | 1978-05-22     |
| Jared    | D     | James   | 111111100 | 1966-10-10 | 123 Peachtree, Atlanta, GA     | M    | 85000.00 | NULL      |   6 | Software       |       6 | 111111100 | 1999-05-15     |
| Jared    | D     | James   | 111111100 | 1966-10-10 | 123 Peachtree, Atlanta, GA     | M    | 85000.00 | NULL      |   6 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Jared    | D     | James   | 111111100 | 1966-10-10 | 123 Peachtree, Atlanta, GA     | M    | 85000.00 | NULL      |   6 | Sales          |       8 | 555555500 | 1997-01-01     |
| Jon      | C     | Jones   | 111111101 | 1967-11-14 | 111 Allgood, Atlanta, GA       | M    | 45000.00 | 111111100 |   6 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Jon      | C     | Jones   | 111111101 | 1967-11-14 | 111 Allgood, Atlanta, GA       | M    | 45000.00 | 111111100 |   6 | Administration |       4 | 987654321 | 1985-01-01     |
| Jon      | C     | Jones   | 111111101 | 1967-11-14 | 111 Allgood, Atlanta, GA       | M    | 45000.00 | 111111100 |   6 | Research       |       5 | 333445555 | 1978-05-22     |
| Jon      | C     | Jones   | 111111101 | 1967-11-14 | 111 Allgood, Atlanta, GA       | M    | 45000.00 | 111111100 |   6 | Software       |       6 | 111111100 | 1999-05-15     |
| Jon      | C     | Jones   | 111111101 | 1967-11-14 | 111 Allgood, Atlanta, GA       | M    | 45000.00 | 111111100 |   6 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Jon      | C     | Jones   | 111111101 | 1967-11-14 | 111 Allgood, Atlanta, GA       | M    | 45000.00 | 111111100 |   6 | Sales          |       8 | 555555500 | 1997-01-01     |
| Justin   | n     | Mark    | 111111102 | 1966-01-12 | 2342 May, Atlanta, GA          | M    | 40000.00 | 111111100 |   6 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Justin   | n     | Mark    | 111111102 | 1966-01-12 | 2342 May, Atlanta, GA          | M    | 40000.00 | 111111100 |   6 | Administration |       4 | 987654321 | 1985-01-01     |
| Justin   | n     | Mark    | 111111102 | 1966-01-12 | 2342 May, Atlanta, GA          | M    | 40000.00 | 111111100 |   6 | Research       |       5 | 333445555 | 1978-05-22     |
| Justin   | n     | Mark    | 111111102 | 1966-01-12 | 2342 May, Atlanta, GA          | M    | 40000.00 | 111111100 |   6 | Software       |       6 | 111111100 | 1999-05-15     |
| Justin   | n     | Mark    | 111111102 | 1966-01-12 | 2342 May, Atlanta, GA          | M    | 40000.00 | 111111100 |   6 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Justin   | n     | Mark    | 111111102 | 1966-01-12 | 2342 May, Atlanta, GA          | M    | 40000.00 | 111111100 |   6 | Sales          |       8 | 555555500 | 1997-01-01     |
| Brad     | C     | Knight  | 111111103 | 1968-02-13 | 176 Main St., Atlanta, GA      | M    | 44000.00 | 111111100 |   6 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Brad     | C     | Knight  | 111111103 | 1968-02-13 | 176 Main St., Atlanta, GA      | M    | 44000.00 | 111111100 |   6 | Administration |       4 | 987654321 | 1985-01-01     |
| Brad     | C     | Knight  | 111111103 | 1968-02-13 | 176 Main St., Atlanta, GA      | M    | 44000.00 | 111111100 |   6 | Research       |       5 | 333445555 | 1978-05-22     |
| Brad     | C     | Knight  | 111111103 | 1968-02-13 | 176 Main St., Atlanta, GA      | M    | 44000.00 | 111111100 |   6 | Software       |       6 | 111111100 | 1999-05-15     |
| Brad     | C     | Knight  | 111111103 | 1968-02-13 | 176 Main St., Atlanta, GA      | M    | 44000.00 | 111111100 |   6 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Brad     | C     | Knight  | 111111103 | 1968-02-13 | 176 Main St., Atlanta, GA      | M    | 44000.00 | 111111100 |   6 | Sales          |       8 | 555555500 | 1997-01-01     |
| John     | B     | Smith   | 123456789 | 1955-01-09 | 731 Fondren, Houston, TX       | M    | 30000.00 | 333445555 |   5 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| John     | B     | Smith   | 123456789 | 1955-01-09 | 731 Fondren, Houston, TX       | M    | 30000.00 | 333445555 |   5 | Administration |       4 | 987654321 | 1985-01-01     |
| John     | B     | Smith   | 123456789 | 1955-01-09 | 731 Fondren, Houston, TX       | M    | 30000.00 | 333445555 |   5 | Research       |       5 | 333445555 | 1978-05-22     |
| John     | B     | Smith   | 123456789 | 1955-01-09 | 731 Fondren, Houston, TX       | M    | 30000.00 | 333445555 |   5 | Software       |       6 | 111111100 | 1999-05-15     |
| John     | B     | Smith   | 123456789 | 1955-01-09 | 731 Fondren, Houston, TX       | M    | 30000.00 | 333445555 |   5 | Hardware       |       7 | 444444400 | 1998-05-15     |
| John     | B     | Smith   | 123456789 | 1955-01-09 | 731 Fondren, Houston, TX       | M    | 30000.00 | 333445555 |   5 | Sales          |       8 | 555555500 | 1997-01-01     |
| Evan     | E     | Wallis  | 222222200 | 1958-01-16 | 134 Pelham, Milwaukee, WI      | M    | 92000.00 | NULL      |   7 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Evan     | E     | Wallis  | 222222200 | 1958-01-16 | 134 Pelham, Milwaukee, WI      | M    | 92000.00 | NULL      |   7 | Administration |       4 | 987654321 | 1985-01-01     |
| Evan     | E     | Wallis  | 222222200 | 1958-01-16 | 134 Pelham, Milwaukee, WI      | M    | 92000.00 | NULL      |   7 | Research       |       5 | 333445555 | 1978-05-22     |
| Evan     | E     | Wallis  | 222222200 | 1958-01-16 | 134 Pelham, Milwaukee, WI      | M    | 92000.00 | NULL      |   7 | Software       |       6 | 111111100 | 1999-05-15     |
| Evan     | E     | Wallis  | 222222200 | 1958-01-16 | 134 Pelham, Milwaukee, WI      | M    | 92000.00 | NULL      |   7 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Evan     | E     | Wallis  | 222222200 | 1958-01-16 | 134 Pelham, Milwaukee, WI      | M    | 92000.00 | NULL      |   7 | Sales          |       8 | 555555500 | 1997-01-01     |
| Josh     | U     | Zell    | 222222201 | 1954-05-22 | 266 McGrady, Milwaukee, WI     | M    | 56000.00 | 222222200 |   7 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Josh     | U     | Zell    | 222222201 | 1954-05-22 | 266 McGrady, Milwaukee, WI     | M    | 56000.00 | 222222200 |   7 | Administration |       4 | 987654321 | 1985-01-01     |
| Josh     | U     | Zell    | 222222201 | 1954-05-22 | 266 McGrady, Milwaukee, WI     | M    | 56000.00 | 222222200 |   7 | Research       |       5 | 333445555 | 1978-05-22     |
| Josh     | U     | Zell    | 222222201 | 1954-05-22 | 266 McGrady, Milwaukee, WI     | M    | 56000.00 | 222222200 |   7 | Software       |       6 | 111111100 | 1999-05-15     |
| Josh     | U     | Zell    | 222222201 | 1954-05-22 | 266 McGrady, Milwaukee, WI     | M    | 56000.00 | 222222200 |   7 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Josh     | U     | Zell    | 222222201 | 1954-05-22 | 266 McGrady, Milwaukee, WI     | M    | 56000.00 | 222222200 |   7 | Sales          |       8 | 555555500 | 1997-01-01     |
| Andy     | C     | Vile    | 222222202 | 1944-06-21 | 1967 Jordan, Milwaukee, WI     | M    | 53000.00 | 222222200 |   7 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Andy     | C     | Vile    | 222222202 | 1944-06-21 | 1967 Jordan, Milwaukee, WI     | M    | 53000.00 | 222222200 |   7 | Administration |       4 | 987654321 | 1985-01-01     |
| Andy     | C     | Vile    | 222222202 | 1944-06-21 | 1967 Jordan, Milwaukee, WI     | M    | 53000.00 | 222222200 |   7 | Research       |       5 | 333445555 | 1978-05-22     |
| Andy     | C     | Vile    | 222222202 | 1944-06-21 | 1967 Jordan, Milwaukee, WI     | M    | 53000.00 | 222222200 |   7 | Software       |       6 | 111111100 | 1999-05-15     |
| Andy     | C     | Vile    | 222222202 | 1944-06-21 | 1967 Jordan, Milwaukee, WI     | M    | 53000.00 | 222222200 |   7 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Andy     | C     | Vile    | 222222202 | 1944-06-21 | 1967 Jordan, Milwaukee, WI     | M    | 53000.00 | 222222200 |   7 | Sales          |       8 | 555555500 | 1997-01-01     |
| Tom      | G     | Brand   | 222222203 | 1966-12-16 | 112 Third St, Milwaukee, WI    | M    | 62500.00 | 222222200 |   7 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Tom      | G     | Brand   | 222222203 | 1966-12-16 | 112 Third St, Milwaukee, WI    | M    | 62500.00 | 222222200 |   7 | Administration |       4 | 987654321 | 1985-01-01     |
| Tom      | G     | Brand   | 222222203 | 1966-12-16 | 112 Third St, Milwaukee, WI    | M    | 62500.00 | 222222200 |   7 | Research       |       5 | 333445555 | 1978-05-22     |
| Tom      | G     | Brand   | 222222203 | 1966-12-16 | 112 Third St, Milwaukee, WI    | M    | 62500.00 | 222222200 |   7 | Software       |       6 | 111111100 | 1999-05-15     |
| Tom      | G     | Brand   | 222222203 | 1966-12-16 | 112 Third St, Milwaukee, WI    | M    | 62500.00 | 222222200 |   7 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Tom      | G     | Brand   | 222222203 | 1966-12-16 | 112 Third St, Milwaukee, WI    | M    | 62500.00 | 222222200 |   7 | Sales          |       8 | 555555500 | 1997-01-01     |
| Jenny    | F     | Vos     | 222222204 | 1967-11-11 | 263 Mayberry, Milwaukee, WI    | F    | 61000.00 | 222222201 |   7 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Jenny    | F     | Vos     | 222222204 | 1967-11-11 | 263 Mayberry, Milwaukee, WI    | F    | 61000.00 | 222222201 |   7 | Administration |       4 | 987654321 | 1985-01-01     |
| Jenny    | F     | Vos     | 222222204 | 1967-11-11 | 263 Mayberry, Milwaukee, WI    | F    | 61000.00 | 222222201 |   7 | Research       |       5 | 333445555 | 1978-05-22     |
| Jenny    | F     | Vos     | 222222204 | 1967-11-11 | 263 Mayberry, Milwaukee, WI    | F    | 61000.00 | 222222201 |   7 | Software       |       6 | 111111100 | 1999-05-15     |
| Jenny    | F     | Vos     | 222222204 | 1967-11-11 | 263 Mayberry, Milwaukee, WI    | F    | 61000.00 | 222222201 |   7 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Jenny    | F     | Vos     | 222222204 | 1967-11-11 | 263 Mayberry, Milwaukee, WI    | F    | 61000.00 | 222222201 |   7 | Sales          |       8 | 555555500 | 1997-01-01     |
| Chris    | A     | Carter  | 222222205 | 1960-03-21 | 565 Jordan, Milwaukee, WI      | F    | 43000.00 | 222222201 |   7 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Chris    | A     | Carter  | 222222205 | 1960-03-21 | 565 Jordan, Milwaukee, WI      | F    | 43000.00 | 222222201 |   7 | Administration |       4 | 987654321 | 1985-01-01     |
| Chris    | A     | Carter  | 222222205 | 1960-03-21 | 565 Jordan, Milwaukee, WI      | F    | 43000.00 | 222222201 |   7 | Research       |       5 | 333445555 | 1978-05-22     |
| Chris    | A     | Carter  | 222222205 | 1960-03-21 | 565 Jordan, Milwaukee, WI      | F    | 43000.00 | 222222201 |   7 | Software       |       6 | 111111100 | 1999-05-15     |
| Chris    | A     | Carter  | 222222205 | 1960-03-21 | 565 Jordan, Milwaukee, WI      | F    | 43000.00 | 222222201 |   7 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Chris    | A     | Carter  | 222222205 | 1960-03-21 | 565 Jordan, Milwaukee, WI      | F    | 43000.00 | 222222201 |   7 | Sales          |       8 | 555555500 | 1997-01-01     |
| Kim      | C     | Grace   | 333333300 | 1970-10-23 | 6677 Mills Ave, Sacramento, CA | F    | 79000.00 | NULL      |   6 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Kim      | C     | Grace   | 333333300 | 1970-10-23 | 6677 Mills Ave, Sacramento, CA | F    | 79000.00 | NULL      |   6 | Administration |       4 | 987654321 | 1985-01-01     |
| Kim      | C     | Grace   | 333333300 | 1970-10-23 | 6677 Mills Ave, Sacramento, CA | F    | 79000.00 | NULL      |   6 | Research       |       5 | 333445555 | 1978-05-22     |
| Kim      | C     | Grace   | 333333300 | 1970-10-23 | 6677 Mills Ave, Sacramento, CA | F    | 79000.00 | NULL      |   6 | Software       |       6 | 111111100 | 1999-05-15     |
| Kim      | C     | Grace   | 333333300 | 1970-10-23 | 6677 Mills Ave, Sacramento, CA | F    | 79000.00 | NULL      |   6 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Kim      | C     | Grace   | 333333300 | 1970-10-23 | 6677 Mills Ave, Sacramento, CA | F    | 79000.00 | NULL      |   6 | Sales          |       8 | 555555500 | 1997-01-01     |
| Jeff     | H     | Chase   | 333333301 | 1970-01-07 | 145 Bradbury, Sacramento, CA   | M    | 44000.00 | 333333300 |   6 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Jeff     | H     | Chase   | 333333301 | 1970-01-07 | 145 Bradbury, Sacramento, CA   | M    | 44000.00 | 333333300 |   6 | Administration |       4 | 987654321 | 1985-01-01     |
| Jeff     | H     | Chase   | 333333301 | 1970-01-07 | 145 Bradbury, Sacramento, CA   | M    | 44000.00 | 333333300 |   6 | Research       |       5 | 333445555 | 1978-05-22     |
| Jeff     | H     | Chase   | 333333301 | 1970-01-07 | 145 Bradbury, Sacramento, CA   | M    | 44000.00 | 333333300 |   6 | Software       |       6 | 111111100 | 1999-05-15     |
| Jeff     | H     | Chase   | 333333301 | 1970-01-07 | 145 Bradbury, Sacramento, CA   | M    | 44000.00 | 333333300 |   6 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Jeff     | H     | Chase   | 333333301 | 1970-01-07 | 145 Bradbury, Sacramento, CA   | M    | 44000.00 | 333333300 |   6 | Sales          |       8 | 555555500 | 1997-01-01     |
| Franklin | T     | Wong    | 333445555 | 1945-12-08 | 638 Voss, Houston, TX          | M    | 40000.00 | 888665555 |   5 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Franklin | T     | Wong    | 333445555 | 1945-12-08 | 638 Voss, Houston, TX          | M    | 40000.00 | 888665555 |   5 | Administration |       4 | 987654321 | 1985-01-01     |
| Franklin | T     | Wong    | 333445555 | 1945-12-08 | 638 Voss, Houston, TX          | M    | 40000.00 | 888665555 |   5 | Research       |       5 | 333445555 | 1978-05-22     |
| Franklin | T     | Wong    | 333445555 | 1945-12-08 | 638 Voss, Houston, TX          | M    | 40000.00 | 888665555 |   5 | Software       |       6 | 111111100 | 1999-05-15     |
| Franklin | T     | Wong    | 333445555 | 1945-12-08 | 638 Voss, Houston, TX          | M    | 40000.00 | 888665555 |   5 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Franklin | T     | Wong    | 333445555 | 1945-12-08 | 638 Voss, Houston, TX          | M    | 40000.00 | 888665555 |   5 | Sales          |       8 | 555555500 | 1997-01-01     |
| Alex     | D     | Freed   | 444444400 | 1950-10-09 | 4333 Pillsbury, Milwaukee, WI  | M    | 89000.00 | NULL      |   7 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Alex     | D     | Freed   | 444444400 | 1950-10-09 | 4333 Pillsbury, Milwaukee, WI  | M    | 89000.00 | NULL      |   7 | Administration |       4 | 987654321 | 1985-01-01     |
| Alex     | D     | Freed   | 444444400 | 1950-10-09 | 4333 Pillsbury, Milwaukee, WI  | M    | 89000.00 | NULL      |   7 | Research       |       5 | 333445555 | 1978-05-22     |
| Alex     | D     | Freed   | 444444400 | 1950-10-09 | 4333 Pillsbury, Milwaukee, WI  | M    | 89000.00 | NULL      |   7 | Software       |       6 | 111111100 | 1999-05-15     |
| Alex     | D     | Freed   | 444444400 | 1950-10-09 | 4333 Pillsbury, Milwaukee, WI  | M    | 89000.00 | NULL      |   7 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Alex     | D     | Freed   | 444444400 | 1950-10-09 | 4333 Pillsbury, Milwaukee, WI  | M    | 89000.00 | NULL      |   7 | Sales          |       8 | 555555500 | 1997-01-01     |
| Bonnie   | S     | Bays    | 444444401 | 1956-06-19 | 111 Hollow, Milwaukee, WI      | F    | 70000.00 | 444444400 |   7 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Bonnie   | S     | Bays    | 444444401 | 1956-06-19 | 111 Hollow, Milwaukee, WI      | F    | 70000.00 | 444444400 |   7 | Administration |       4 | 987654321 | 1985-01-01     |
| Bonnie   | S     | Bays    | 444444401 | 1956-06-19 | 111 Hollow, Milwaukee, WI      | F    | 70000.00 | 444444400 |   7 | Research       |       5 | 333445555 | 1978-05-22     |
| Bonnie   | S     | Bays    | 444444401 | 1956-06-19 | 111 Hollow, Milwaukee, WI      | F    | 70000.00 | 444444400 |   7 | Software       |       6 | 111111100 | 1999-05-15     |
| Bonnie   | S     | Bays    | 444444401 | 1956-06-19 | 111 Hollow, Milwaukee, WI      | F    | 70000.00 | 444444400 |   7 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Bonnie   | S     | Bays    | 444444401 | 1956-06-19 | 111 Hollow, Milwaukee, WI      | F    | 70000.00 | 444444400 |   7 | Sales          |       8 | 555555500 | 1997-01-01     |
| Alec     | C     | Best    | 444444402 | 1966-06-18 | 233 Solid, Milwaukee, WI       | M    | 60000.00 | 444444400 |   7 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Alec     | C     | Best    | 444444402 | 1966-06-18 | 233 Solid, Milwaukee, WI       | M    | 60000.00 | 444444400 |   7 | Administration |       4 | 987654321 | 1985-01-01     |
| Alec     | C     | Best    | 444444402 | 1966-06-18 | 233 Solid, Milwaukee, WI       | M    | 60000.00 | 444444400 |   7 | Research       |       5 | 333445555 | 1978-05-22     |
| Alec     | C     | Best    | 444444402 | 1966-06-18 | 233 Solid, Milwaukee, WI       | M    | 60000.00 | 444444400 |   7 | Software       |       6 | 111111100 | 1999-05-15     |
| Alec     | C     | Best    | 444444402 | 1966-06-18 | 233 Solid, Milwaukee, WI       | M    | 60000.00 | 444444400 |   7 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Alec     | C     | Best    | 444444402 | 1966-06-18 | 233 Solid, Milwaukee, WI       | M    | 60000.00 | 444444400 |   7 | Sales          |       8 | 555555500 | 1997-01-01     |
| Sam      | S     | Snedden | 444444403 | 1977-07-31 | 987 Windy St, Milwaukee, WI    | M    | 48000.00 | 444444400 |   7 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Sam      | S     | Snedden | 444444403 | 1977-07-31 | 987 Windy St, Milwaukee, WI    | M    | 48000.00 | 444444400 |   7 | Administration |       4 | 987654321 | 1985-01-01     |
| Sam      | S     | Snedden | 444444403 | 1977-07-31 | 987 Windy St, Milwaukee, WI    | M    | 48000.00 | 444444400 |   7 | Research       |       5 | 333445555 | 1978-05-22     |
| Sam      | S     | Snedden | 444444403 | 1977-07-31 | 987 Windy St, Milwaukee, WI    | M    | 48000.00 | 444444400 |   7 | Software       |       6 | 111111100 | 1999-05-15     |
| Sam      | S     | Snedden | 444444403 | 1977-07-31 | 987 Windy St, Milwaukee, WI    | M    | 48000.00 | 444444400 |   7 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Sam      | S     | Snedden | 444444403 | 1977-07-31 | 987 Windy St, Milwaukee, WI    | M    | 48000.00 | 444444400 |   7 | Sales          |       8 | 555555500 | 1997-01-01     |
| Joyce    | A     | English | 453453453 | 1962-07-31 | 5631 Rice, Houston, TX         | F    | 25000.00 | 333445555 |   5 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Joyce    | A     | English | 453453453 | 1962-07-31 | 5631 Rice, Houston, TX         | F    | 25000.00 | 333445555 |   5 | Administration |       4 | 987654321 | 1985-01-01     |
| Joyce    | A     | English | 453453453 | 1962-07-31 | 5631 Rice, Houston, TX         | F    | 25000.00 | 333445555 |   5 | Research       |       5 | 333445555 | 1978-05-22     |
| Joyce    | A     | English | 453453453 | 1962-07-31 | 5631 Rice, Houston, TX         | F    | 25000.00 | 333445555 |   5 | Software       |       6 | 111111100 | 1999-05-15     |
| Joyce    | A     | English | 453453453 | 1962-07-31 | 5631 Rice, Houston, TX         | F    | 25000.00 | 333445555 |   5 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Joyce    | A     | English | 453453453 | 1962-07-31 | 5631 Rice, Houston, TX         | F    | 25000.00 | 333445555 |   5 | Sales          |       8 | 555555500 | 1997-01-01     |
| John     | C     | James   | 555555500 | 1975-06-30 | 7676 Bloomington, Sacramento,  | M    | 81000.00 | NULL      |   6 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| John     | C     | James   | 555555500 | 1975-06-30 | 7676 Bloomington, Sacramento,  | M    | 81000.00 | NULL      |   6 | Administration |       4 | 987654321 | 1985-01-01     |
| John     | C     | James   | 555555500 | 1975-06-30 | 7676 Bloomington, Sacramento,  | M    | 81000.00 | NULL      |   6 | Research       |       5 | 333445555 | 1978-05-22     |
| John     | C     | James   | 555555500 | 1975-06-30 | 7676 Bloomington, Sacramento,  | M    | 81000.00 | NULL      |   6 | Software       |       6 | 111111100 | 1999-05-15     |
| John     | C     | James   | 555555500 | 1975-06-30 | 7676 Bloomington, Sacramento,  | M    | 81000.00 | NULL      |   6 | Hardware       |       7 | 444444400 | 1998-05-15     |
| John     | C     | James   | 555555500 | 1975-06-30 | 7676 Bloomington, Sacramento,  | M    | 81000.00 | NULL      |   6 | Sales          |       8 | 555555500 | 1997-01-01     |
| Nandita  | K     | Ball    | 555555501 | 1969-04-16 | 222 Howard, Sacramento, CA     | M    | 62000.00 | 555555500 |   6 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Nandita  | K     | Ball    | 555555501 | 1969-04-16 | 222 Howard, Sacramento, CA     | M    | 62000.00 | 555555500 |   6 | Administration |       4 | 987654321 | 1985-01-01     |
| Nandita  | K     | Ball    | 555555501 | 1969-04-16 | 222 Howard, Sacramento, CA     | M    | 62000.00 | 555555500 |   6 | Research       |       5 | 333445555 | 1978-05-22     |
| Nandita  | K     | Ball    | 555555501 | 1969-04-16 | 222 Howard, Sacramento, CA     | M    | 62000.00 | 555555500 |   6 | Software       |       6 | 111111100 | 1999-05-15     |
| Nandita  | K     | Ball    | 555555501 | 1969-04-16 | 222 Howard, Sacramento, CA     | M    | 62000.00 | 555555500 |   6 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Nandita  | K     | Ball    | 555555501 | 1969-04-16 | 222 Howard, Sacramento, CA     | M    | 62000.00 | 555555500 |   6 | Sales          |       8 | 555555500 | 1997-01-01     |
| Bob      | B     | Bender  | 666666600 | 1968-04-17 | 8794 Garfield, Chicago, IL     | M    | 96000.00 | NULL      |   8 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Bob      | B     | Bender  | 666666600 | 1968-04-17 | 8794 Garfield, Chicago, IL     | M    | 96000.00 | NULL      |   8 | Administration |       4 | 987654321 | 1985-01-01     |
| Bob      | B     | Bender  | 666666600 | 1968-04-17 | 8794 Garfield, Chicago, IL     | M    | 96000.00 | NULL      |   8 | Research       |       5 | 333445555 | 1978-05-22     |
| Bob      | B     | Bender  | 666666600 | 1968-04-17 | 8794 Garfield, Chicago, IL     | M    | 96000.00 | NULL      |   8 | Software       |       6 | 111111100 | 1999-05-15     |
| Bob      | B     | Bender  | 666666600 | 1968-04-17 | 8794 Garfield, Chicago, IL     | M    | 96000.00 | NULL      |   8 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Bob      | B     | Bender  | 666666600 | 1968-04-17 | 8794 Garfield, Chicago, IL     | M    | 96000.00 | NULL      |   8 | Sales          |       8 | 555555500 | 1997-01-01     |
| Jill     | J     | Jarvis  | 666666601 | 1966-01-14 | 6234 Lincoln, Chicago, IL      | F    | 36000.00 | 666666600 |   8 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Jill     | J     | Jarvis  | 666666601 | 1966-01-14 | 6234 Lincoln, Chicago, IL      | F    | 36000.00 | 666666600 |   8 | Administration |       4 | 987654321 | 1985-01-01     |
| Jill     | J     | Jarvis  | 666666601 | 1966-01-14 | 6234 Lincoln, Chicago, IL      | F    | 36000.00 | 666666600 |   8 | Research       |       5 | 333445555 | 1978-05-22     |
| Jill     | J     | Jarvis  | 666666601 | 1966-01-14 | 6234 Lincoln, Chicago, IL      | F    | 36000.00 | 666666600 |   8 | Software       |       6 | 111111100 | 1999-05-15     |
| Jill     | J     | Jarvis  | 666666601 | 1966-01-14 | 6234 Lincoln, Chicago, IL      | F    | 36000.00 | 666666600 |   8 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Jill     | J     | Jarvis  | 666666601 | 1966-01-14 | 6234 Lincoln, Chicago, IL      | F    | 36000.00 | 666666600 |   8 | Sales          |       8 | 555555500 | 1997-01-01     |
| Kate     | W     | King    | 666666602 | 1966-04-16 | 1976 Boone Trace, Chicago, IL  | F    | 44000.00 | 666666600 |   8 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Kate     | W     | King    | 666666602 | 1966-04-16 | 1976 Boone Trace, Chicago, IL  | F    | 44000.00 | 666666600 |   8 | Administration |       4 | 987654321 | 1985-01-01     |
| Kate     | W     | King    | 666666602 | 1966-04-16 | 1976 Boone Trace, Chicago, IL  | F    | 44000.00 | 666666600 |   8 | Research       |       5 | 333445555 | 1978-05-22     |
| Kate     | W     | King    | 666666602 | 1966-04-16 | 1976 Boone Trace, Chicago, IL  | F    | 44000.00 | 666666600 |   8 | Software       |       6 | 111111100 | 1999-05-15     |
| Kate     | W     | King    | 666666602 | 1966-04-16 | 1976 Boone Trace, Chicago, IL  | F    | 44000.00 | 666666600 |   8 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Kate     | W     | King    | 666666602 | 1966-04-16 | 1976 Boone Trace, Chicago, IL  | F    | 44000.00 | 666666600 |   8 | Sales          |       8 | 555555500 | 1997-01-01     |
| Lyle     | G     | Leslie  | 666666603 | 1963-06-09 | 417 Hancock Ave, Chicago, IL   | M    | 41000.00 | 666666601 |   8 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Lyle     | G     | Leslie  | 666666603 | 1963-06-09 | 417 Hancock Ave, Chicago, IL   | M    | 41000.00 | 666666601 |   8 | Administration |       4 | 987654321 | 1985-01-01     |
| Lyle     | G     | Leslie  | 666666603 | 1963-06-09 | 417 Hancock Ave, Chicago, IL   | M    | 41000.00 | 666666601 |   8 | Research       |       5 | 333445555 | 1978-05-22     |
| Lyle     | G     | Leslie  | 666666603 | 1963-06-09 | 417 Hancock Ave, Chicago, IL   | M    | 41000.00 | 666666601 |   8 | Software       |       6 | 111111100 | 1999-05-15     |
| Lyle     | G     | Leslie  | 666666603 | 1963-06-09 | 417 Hancock Ave, Chicago, IL   | M    | 41000.00 | 666666601 |   8 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Lyle     | G     | Leslie  | 666666603 | 1963-06-09 | 417 Hancock Ave, Chicago, IL   | M    | 41000.00 | 666666601 |   8 | Sales          |       8 | 555555500 | 1997-01-01     |
| Billie   | J     | King    | 666666604 | 1960-01-01 | 556 Washington, Chicago, IL    | F    | 38000.00 | 666666603 |   8 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Billie   | J     | King    | 666666604 | 1960-01-01 | 556 Washington, Chicago, IL    | F    | 38000.00 | 666666603 |   8 | Administration |       4 | 987654321 | 1985-01-01     |
| Billie   | J     | King    | 666666604 | 1960-01-01 | 556 Washington, Chicago, IL    | F    | 38000.00 | 666666603 |   8 | Research       |       5 | 333445555 | 1978-05-22     |
| Billie   | J     | King    | 666666604 | 1960-01-01 | 556 Washington, Chicago, IL    | F    | 38000.00 | 666666603 |   8 | Software       |       6 | 111111100 | 1999-05-15     |
| Billie   | J     | King    | 666666604 | 1960-01-01 | 556 Washington, Chicago, IL    | F    | 38000.00 | 666666603 |   8 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Billie   | J     | King    | 666666604 | 1960-01-01 | 556 Washington, Chicago, IL    | F    | 38000.00 | 666666603 |   8 | Sales          |       8 | 555555500 | 1997-01-01     |
| Jon      | A     | Kramer  | 666666605 | 1964-08-22 | 1988 Windy Creek, Seattle, WA  | M    | 41500.00 | 666666603 |   8 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Jon      | A     | Kramer  | 666666605 | 1964-08-22 | 1988 Windy Creek, Seattle, WA  | M    | 41500.00 | 666666603 |   8 | Administration |       4 | 987654321 | 1985-01-01     |
| Jon      | A     | Kramer  | 666666605 | 1964-08-22 | 1988 Windy Creek, Seattle, WA  | M    | 41500.00 | 666666603 |   8 | Research       |       5 | 333445555 | 1978-05-22     |
| Jon      | A     | Kramer  | 666666605 | 1964-08-22 | 1988 Windy Creek, Seattle, WA  | M    | 41500.00 | 666666603 |   8 | Software       |       6 | 111111100 | 1999-05-15     |
| Jon      | A     | Kramer  | 666666605 | 1964-08-22 | 1988 Windy Creek, Seattle, WA  | M    | 41500.00 | 666666603 |   8 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Jon      | A     | Kramer  | 666666605 | 1964-08-22 | 1988 Windy Creek, Seattle, WA  | M    | 41500.00 | 666666603 |   8 | Sales          |       8 | 555555500 | 1997-01-01     |
| Ray      | H     | King    | 666666606 | 1949-08-16 | 213 Delk Road, Seattle, WA     | M    | 44500.00 | 666666604 |   8 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Ray      | H     | King    | 666666606 | 1949-08-16 | 213 Delk Road, Seattle, WA     | M    | 44500.00 | 666666604 |   8 | Administration |       4 | 987654321 | 1985-01-01     |
| Ray      | H     | King    | 666666606 | 1949-08-16 | 213 Delk Road, Seattle, WA     | M    | 44500.00 | 666666604 |   8 | Research       |       5 | 333445555 | 1978-05-22     |
| Ray      | H     | King    | 666666606 | 1949-08-16 | 213 Delk Road, Seattle, WA     | M    | 44500.00 | 666666604 |   8 | Software       |       6 | 111111100 | 1999-05-15     |
| Ray      | H     | King    | 666666606 | 1949-08-16 | 213 Delk Road, Seattle, WA     | M    | 44500.00 | 666666604 |   8 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Ray      | H     | King    | 666666606 | 1949-08-16 | 213 Delk Road, Seattle, WA     | M    | 44500.00 | 666666604 |   8 | Sales          |       8 | 555555500 | 1997-01-01     |
| Gerald   | D     | Small   | 666666607 | 1962-05-15 | 122 Ball Street, Dallas, TX    | M    | 29000.00 | 666666602 |   8 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Gerald   | D     | Small   | 666666607 | 1962-05-15 | 122 Ball Street, Dallas, TX    | M    | 29000.00 | 666666602 |   8 | Administration |       4 | 987654321 | 1985-01-01     |
| Gerald   | D     | Small   | 666666607 | 1962-05-15 | 122 Ball Street, Dallas, TX    | M    | 29000.00 | 666666602 |   8 | Research       |       5 | 333445555 | 1978-05-22     |
| Gerald   | D     | Small   | 666666607 | 1962-05-15 | 122 Ball Street, Dallas, TX    | M    | 29000.00 | 666666602 |   8 | Software       |       6 | 111111100 | 1999-05-15     |
| Gerald   | D     | Small   | 666666607 | 1962-05-15 | 122 Ball Street, Dallas, TX    | M    | 29000.00 | 666666602 |   8 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Gerald   | D     | Small   | 666666607 | 1962-05-15 | 122 Ball Street, Dallas, TX    | M    | 29000.00 | 666666602 |   8 | Sales          |       8 | 555555500 | 1997-01-01     |
| Arnold   | A     | Head    | 666666608 | 1967-05-19 | 233 Spring St, Dallas, TX      | M    | 33000.00 | 666666602 |   8 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Arnold   | A     | Head    | 666666608 | 1967-05-19 | 233 Spring St, Dallas, TX      | M    | 33000.00 | 666666602 |   8 | Administration |       4 | 987654321 | 1985-01-01     |
| Arnold   | A     | Head    | 666666608 | 1967-05-19 | 233 Spring St, Dallas, TX      | M    | 33000.00 | 666666602 |   8 | Research       |       5 | 333445555 | 1978-05-22     |
| Arnold   | A     | Head    | 666666608 | 1967-05-19 | 233 Spring St, Dallas, TX      | M    | 33000.00 | 666666602 |   8 | Software       |       6 | 111111100 | 1999-05-15     |
| Arnold   | A     | Head    | 666666608 | 1967-05-19 | 233 Spring St, Dallas, TX      | M    | 33000.00 | 666666602 |   8 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Arnold   | A     | Head    | 666666608 | 1967-05-19 | 233 Spring St, Dallas, TX      | M    | 33000.00 | 666666602 |   8 | Sales          |       8 | 555555500 | 1997-01-01     |
| Helga    | C     | Pataki  | 666666609 | 1969-03-11 | 101 Holyoke St, Dallas, TX     | F    | 32000.00 | 666666602 |   8 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Helga    | C     | Pataki  | 666666609 | 1969-03-11 | 101 Holyoke St, Dallas, TX     | F    | 32000.00 | 666666602 |   8 | Administration |       4 | 987654321 | 1985-01-01     |
| Helga    | C     | Pataki  | 666666609 | 1969-03-11 | 101 Holyoke St, Dallas, TX     | F    | 32000.00 | 666666602 |   8 | Research       |       5 | 333445555 | 1978-05-22     |
| Helga    | C     | Pataki  | 666666609 | 1969-03-11 | 101 Holyoke St, Dallas, TX     | F    | 32000.00 | 666666602 |   8 | Software       |       6 | 111111100 | 1999-05-15     |
| Helga    | C     | Pataki  | 666666609 | 1969-03-11 | 101 Holyoke St, Dallas, TX     | F    | 32000.00 | 666666602 |   8 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Helga    | C     | Pataki  | 666666609 | 1969-03-11 | 101 Holyoke St, Dallas, TX     | F    | 32000.00 | 666666602 |   8 | Sales          |       8 | 555555500 | 1997-01-01     |
| Naveen   | B     | Drew    | 666666610 | 1970-05-23 | 198 Elm St, Philadelphia, PA   | M    | 34000.00 | 666666607 |   8 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Naveen   | B     | Drew    | 666666610 | 1970-05-23 | 198 Elm St, Philadelphia, PA   | M    | 34000.00 | 666666607 |   8 | Administration |       4 | 987654321 | 1985-01-01     |
| Naveen   | B     | Drew    | 666666610 | 1970-05-23 | 198 Elm St, Philadelphia, PA   | M    | 34000.00 | 666666607 |   8 | Research       |       5 | 333445555 | 1978-05-22     |
| Naveen   | B     | Drew    | 666666610 | 1970-05-23 | 198 Elm St, Philadelphia, PA   | M    | 34000.00 | 666666607 |   8 | Software       |       6 | 111111100 | 1999-05-15     |
| Naveen   | B     | Drew    | 666666610 | 1970-05-23 | 198 Elm St, Philadelphia, PA   | M    | 34000.00 | 666666607 |   8 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Naveen   | B     | Drew    | 666666610 | 1970-05-23 | 198 Elm St, Philadelphia, PA   | M    | 34000.00 | 666666607 |   8 | Sales          |       8 | 555555500 | 1997-01-01     |
| Carl     | E     | Reedy   | 666666611 | 1977-06-21 | 213 Ball St, Philadelphia, PA  | M    | 32000.00 | 666666610 |   8 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Carl     | E     | Reedy   | 666666611 | 1977-06-21 | 213 Ball St, Philadelphia, PA  | M    | 32000.00 | 666666610 |   8 | Administration |       4 | 987654321 | 1985-01-01     |
| Carl     | E     | Reedy   | 666666611 | 1977-06-21 | 213 Ball St, Philadelphia, PA  | M    | 32000.00 | 666666610 |   8 | Research       |       5 | 333445555 | 1978-05-22     |
| Carl     | E     | Reedy   | 666666611 | 1977-06-21 | 213 Ball St, Philadelphia, PA  | M    | 32000.00 | 666666610 |   8 | Software       |       6 | 111111100 | 1999-05-15     |
| Carl     | E     | Reedy   | 666666611 | 1977-06-21 | 213 Ball St, Philadelphia, PA  | M    | 32000.00 | 666666610 |   8 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Carl     | E     | Reedy   | 666666611 | 1977-06-21 | 213 Ball St, Philadelphia, PA  | M    | 32000.00 | 666666610 |   8 | Sales          |       8 | 555555500 | 1997-01-01     |
| Sammy    | G     | Hall    | 666666612 | 1970-01-11 | 433 Main Street, Miami, FL     | M    | 37000.00 | 666666611 |   8 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Sammy    | G     | Hall    | 666666612 | 1970-01-11 | 433 Main Street, Miami, FL     | M    | 37000.00 | 666666611 |   8 | Administration |       4 | 987654321 | 1985-01-01     |
| Sammy    | G     | Hall    | 666666612 | 1970-01-11 | 433 Main Street, Miami, FL     | M    | 37000.00 | 666666611 |   8 | Research       |       5 | 333445555 | 1978-05-22     |
| Sammy    | G     | Hall    | 666666612 | 1970-01-11 | 433 Main Street, Miami, FL     | M    | 37000.00 | 666666611 |   8 | Software       |       6 | 111111100 | 1999-05-15     |
| Sammy    | G     | Hall    | 666666612 | 1970-01-11 | 433 Main Street, Miami, FL     | M    | 37000.00 | 666666611 |   8 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Sammy    | G     | Hall    | 666666612 | 1970-01-11 | 433 Main Street, Miami, FL     | M    | 37000.00 | 666666611 |   8 | Sales          |       8 | 555555500 | 1997-01-01     |
| Red      | A     | Bacher  | 666666613 | 1980-05-21 | 196 Elm Street, Miami, FL      | M    | 33500.00 | 666666612 |   8 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Red      | A     | Bacher  | 666666613 | 1980-05-21 | 196 Elm Street, Miami, FL      | M    | 33500.00 | 666666612 |   8 | Administration |       4 | 987654321 | 1985-01-01     |
| Red      | A     | Bacher  | 666666613 | 1980-05-21 | 196 Elm Street, Miami, FL      | M    | 33500.00 | 666666612 |   8 | Research       |       5 | 333445555 | 1978-05-22     |
| Red      | A     | Bacher  | 666666613 | 1980-05-21 | 196 Elm Street, Miami, FL      | M    | 33500.00 | 666666612 |   8 | Software       |       6 | 111111100 | 1999-05-15     |
| Red      | A     | Bacher  | 666666613 | 1980-05-21 | 196 Elm Street, Miami, FL      | M    | 33500.00 | 666666612 |   8 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Red      | A     | Bacher  | 666666613 | 1980-05-21 | 196 Elm Street, Miami, FL      | M    | 33500.00 | 666666612 |   8 | Sales          |       8 | 555555500 | 1997-01-01     |
| Ramesh   | K     | Narayan | 666884444 | 1952-09-15 | 971 Fire Oak, Humble, TX       | M    | 38000.00 | 333445555 |   5 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Ramesh   | K     | Narayan | 666884444 | 1952-09-15 | 971 Fire Oak, Humble, TX       | M    | 38000.00 | 333445555 |   5 | Administration |       4 | 987654321 | 1985-01-01     |
| Ramesh   | K     | Narayan | 666884444 | 1952-09-15 | 971 Fire Oak, Humble, TX       | M    | 38000.00 | 333445555 |   5 | Research       |       5 | 333445555 | 1978-05-22     |
| Ramesh   | K     | Narayan | 666884444 | 1952-09-15 | 971 Fire Oak, Humble, TX       | M    | 38000.00 | 333445555 |   5 | Software       |       6 | 111111100 | 1999-05-15     |
| Ramesh   | K     | Narayan | 666884444 | 1952-09-15 | 971 Fire Oak, Humble, TX       | M    | 38000.00 | 333445555 |   5 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Ramesh   | K     | Narayan | 666884444 | 1952-09-15 | 971 Fire Oak, Humble, TX       | M    | 38000.00 | 333445555 |   5 | Sales          |       8 | 555555500 | 1997-01-01     |
| James    | E     | Borg    | 888665555 | 1927-11-10 | 450 Stone, Houston, TX         | M    | 55000.00 | NULL      |   1 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| James    | E     | Borg    | 888665555 | 1927-11-10 | 450 Stone, Houston, TX         | M    | 55000.00 | NULL      |   1 | Administration |       4 | 987654321 | 1985-01-01     |
| James    | E     | Borg    | 888665555 | 1927-11-10 | 450 Stone, Houston, TX         | M    | 55000.00 | NULL      |   1 | Research       |       5 | 333445555 | 1978-05-22     |
| James    | E     | Borg    | 888665555 | 1927-11-10 | 450 Stone, Houston, TX         | M    | 55000.00 | NULL      |   1 | Software       |       6 | 111111100 | 1999-05-15     |
| James    | E     | Borg    | 888665555 | 1927-11-10 | 450 Stone, Houston, TX         | M    | 55000.00 | NULL      |   1 | Hardware       |       7 | 444444400 | 1998-05-15     |
| James    | E     | Borg    | 888665555 | 1927-11-10 | 450 Stone, Houston, TX         | M    | 55000.00 | NULL      |   1 | Sales          |       8 | 555555500 | 1997-01-01     |
| Jennifer | S     | Wallace | 987654321 | 1931-06-20 | 291 Berry, Bellaire, TX        | F    | 43000.00 | 888665555 |   4 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Jennifer | S     | Wallace | 987654321 | 1931-06-20 | 291 Berry, Bellaire, TX        | F    | 43000.00 | 888665555 |   4 | Administration |       4 | 987654321 | 1985-01-01     |
| Jennifer | S     | Wallace | 987654321 | 1931-06-20 | 291 Berry, Bellaire, TX        | F    | 43000.00 | 888665555 |   4 | Research       |       5 | 333445555 | 1978-05-22     |
| Jennifer | S     | Wallace | 987654321 | 1931-06-20 | 291 Berry, Bellaire, TX        | F    | 43000.00 | 888665555 |   4 | Software       |       6 | 111111100 | 1999-05-15     |
| Jennifer | S     | Wallace | 987654321 | 1931-06-20 | 291 Berry, Bellaire, TX        | F    | 43000.00 | 888665555 |   4 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Jennifer | S     | Wallace | 987654321 | 1931-06-20 | 291 Berry, Bellaire, TX        | F    | 43000.00 | 888665555 |   4 | Sales          |       8 | 555555500 | 1997-01-01     |
| Ahmad    | V     | Jabbar  | 987987987 | 1959-03-29 | 980 Dallas, Houston, TX        | M    | 25000.00 | 987654321 |   4 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Ahmad    | V     | Jabbar  | 987987987 | 1959-03-29 | 980 Dallas, Houston, TX        | M    | 25000.00 | 987654321 |   4 | Administration |       4 | 987654321 | 1985-01-01     |
| Ahmad    | V     | Jabbar  | 987987987 | 1959-03-29 | 980 Dallas, Houston, TX        | M    | 25000.00 | 987654321 |   4 | Research       |       5 | 333445555 | 1978-05-22     |
| Ahmad    | V     | Jabbar  | 987987987 | 1959-03-29 | 980 Dallas, Houston, TX        | M    | 25000.00 | 987654321 |   4 | Software       |       6 | 111111100 | 1999-05-15     |
| Ahmad    | V     | Jabbar  | 987987987 | 1959-03-29 | 980 Dallas, Houston, TX        | M    | 25000.00 | 987654321 |   4 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Ahmad    | V     | Jabbar  | 987987987 | 1959-03-29 | 980 Dallas, Houston, TX        | M    | 25000.00 | 987654321 |   4 | Sales          |       8 | 555555500 | 1997-01-01     |
| Alicia   | J     | Zelaya  | 999887777 | 1958-07-19 | 3321 Castle, Spring, TX        | F    | 25000.00 | 987654321 |   4 | Headquarters   |       1 | 888665555 | 1971-06-19     |
| Alicia   | J     | Zelaya  | 999887777 | 1958-07-19 | 3321 Castle, Spring, TX        | F    | 25000.00 | 987654321 |   4 | Administration |       4 | 987654321 | 1985-01-01     |
| Alicia   | J     | Zelaya  | 999887777 | 1958-07-19 | 3321 Castle, Spring, TX        | F    | 25000.00 | 987654321 |   4 | Research       |       5 | 333445555 | 1978-05-22     |
| Alicia   | J     | Zelaya  | 999887777 | 1958-07-19 | 3321 Castle, Spring, TX        | F    | 25000.00 | 987654321 |   4 | Software       |       6 | 111111100 | 1999-05-15     |
| Alicia   | J     | Zelaya  | 999887777 | 1958-07-19 | 3321 Castle, Spring, TX        | F    | 25000.00 | 987654321 |   4 | Hardware       |       7 | 444444400 | 1998-05-15     |
| Alicia   | J     | Zelaya  | 999887777 | 1958-07-19 | 3321 Castle, Spring, TX        | F    | 25000.00 | 987654321 |   4 | Sales          |       8 | 555555500 | 1997-01-01     |
+----------+-------+---------+-----------+------------+--------------------------------+------+----------+-----------+-----+----------------+---------+-----------+----------------+
240 rows in set (0.00 sec)

mysql> QUIT
