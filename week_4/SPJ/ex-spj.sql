mysql> -- 1) Get supplier numbers of suppliers who supply project P5.
mysql> 
mysql> SELECT COUNT(DISTINCT sno)
    -> FROM Spj
    -> WHERE pno = 5;
+---------------------+
| COUNT(DISTINCT sno) |
+---------------------+
|                   2 |
+---------------------+
1 row in set (0.00 sec)

mysql> -- 2) Get all part-color/part-city pairs. Note: Here and subsequently, the term “all” means “all 
mysql> --    currently represented in the database,” not “all possible.”
mysql> 
mysql> SELECT color, city
    -> FROM Part
    -> ;
+-------+--------+
| color | city   |
+-------+--------+
| Red   | London |
| Green | Paris  |
| Blue  | Oslo   |
| Red   | London |
| Blue  | Paris  |
| Red   | London |
+-------+--------+
6 rows in set (0.01 sec)

mysql> -- 3) Get all supplier-number/part-number/project-number triples such that the indicated 
mysql> --    supplier, part, and project are not all co-located.
mysql> 
mysql> 
mysql> SELECT S.sno, P.pno, J.jno
    -> FROM Supplier S, Part P, Project J
    -> WHERE NOT(S.city = P.city AND P.city = J.city);
+-----+-----+-----+
| sno | pno | jno |
+-----+-----+-----+
|   1 |   1 |   1 |
|   2 |   1 |   1 |
|   3 |   1 |   1 |
|   4 |   1 |   1 |
|   5 |   1 |   1 |
|   1 |   2 |   1 |
|   4 |   2 |   1 |
|   5 |   2 |   1 |
|   1 |   3 |   1 |
|   2 |   3 |   1 |
|   3 |   3 |   1 |
|   4 |   3 |   1 |
|   5 |   3 |   1 |
|   1 |   4 |   1 |
|   2 |   4 |   1 |
|   3 |   4 |   1 |
|   4 |   4 |   1 |
|   5 |   4 |   1 |
|   1 |   5 |   1 |
|   4 |   5 |   1 |
|   5 |   5 |   1 |
|   1 |   6 |   1 |
|   2 |   6 |   1 |
|   3 |   6 |   1 |
|   4 |   6 |   1 |
|   5 |   6 |   1 |
|   1 |   1 |   2 |
|   2 |   1 |   2 |
|   3 |   1 |   2 |
|   4 |   1 |   2 |
|   5 |   1 |   2 |
|   1 |   2 |   2 |
|   2 |   2 |   2 |
|   3 |   2 |   2 |
|   4 |   2 |   2 |
|   5 |   2 |   2 |
|   1 |   3 |   2 |
|   2 |   3 |   2 |
|   3 |   3 |   2 |
|   4 |   3 |   2 |
|   5 |   3 |   2 |
|   1 |   4 |   2 |
|   2 |   4 |   2 |
|   3 |   4 |   2 |
|   4 |   4 |   2 |
|   5 |   4 |   2 |
|   1 |   5 |   2 |
|   2 |   5 |   2 |
|   3 |   5 |   2 |
|   4 |   5 |   2 |
|   5 |   5 |   2 |
|   1 |   6 |   2 |
|   2 |   6 |   2 |
|   3 |   6 |   2 |
|   4 |   6 |   2 |
|   5 |   6 |   2 |
|   1 |   1 |   3 |
|   2 |   1 |   3 |
|   3 |   1 |   3 |
|   4 |   1 |   3 |
|   5 |   1 |   3 |
|   1 |   2 |   3 |
|   2 |   2 |   3 |
|   3 |   2 |   3 |
|   4 |   2 |   3 |
|   5 |   2 |   3 |
|   1 |   3 |   3 |
|   2 |   3 |   3 |
|   3 |   3 |   3 |
|   4 |   3 |   3 |
|   5 |   3 |   3 |
|   1 |   4 |   3 |
|   2 |   4 |   3 |
|   3 |   4 |   3 |
|   4 |   4 |   3 |
|   5 |   4 |   3 |
|   1 |   5 |   3 |
|   2 |   5 |   3 |
|   3 |   5 |   3 |
|   4 |   5 |   3 |
|   5 |   5 |   3 |
|   1 |   6 |   3 |
|   2 |   6 |   3 |
|   3 |   6 |   3 |
|   4 |   6 |   3 |
|   5 |   6 |   3 |
|   1 |   1 |   4 |
|   2 |   1 |   4 |
|   3 |   1 |   4 |
|   4 |   1 |   4 |
|   5 |   1 |   4 |
|   1 |   2 |   4 |
|   2 |   2 |   4 |
|   3 |   2 |   4 |
|   4 |   2 |   4 |
|   5 |   2 |   4 |
|   1 |   3 |   4 |
|   2 |   3 |   4 |
|   3 |   3 |   4 |
|   4 |   3 |   4 |
|   5 |   3 |   4 |
|   1 |   4 |   4 |
|   2 |   4 |   4 |
|   3 |   4 |   4 |
|   4 |   4 |   4 |
|   5 |   4 |   4 |
|   1 |   5 |   4 |
|   2 |   5 |   4 |
|   3 |   5 |   4 |
|   4 |   5 |   4 |
|   5 |   5 |   4 |
|   1 |   6 |   4 |
|   2 |   6 |   4 |
|   3 |   6 |   4 |
|   4 |   6 |   4 |
|   5 |   6 |   4 |
|   2 |   1 |   5 |
|   3 |   1 |   5 |
|   5 |   1 |   5 |
|   1 |   2 |   5 |
|   2 |   2 |   5 |
|   3 |   2 |   5 |
|   4 |   2 |   5 |
|   5 |   2 |   5 |
|   1 |   3 |   5 |
|   2 |   3 |   5 |
|   3 |   3 |   5 |
|   4 |   3 |   5 |
|   5 |   3 |   5 |
|   2 |   4 |   5 |
|   3 |   4 |   5 |
|   5 |   4 |   5 |
|   1 |   5 |   5 |
|   2 |   5 |   5 |
|   3 |   5 |   5 |
|   4 |   5 |   5 |
|   5 |   5 |   5 |
|   2 |   6 |   5 |
|   3 |   6 |   5 |
|   5 |   6 |   5 |
|   1 |   1 |   6 |
|   2 |   1 |   6 |
|   3 |   1 |   6 |
|   4 |   1 |   6 |
|   5 |   1 |   6 |
|   1 |   2 |   6 |
|   2 |   2 |   6 |
|   3 |   2 |   6 |
|   4 |   2 |   6 |
|   5 |   2 |   6 |
|   1 |   3 |   6 |
|   2 |   3 |   6 |
|   3 |   3 |   6 |
|   4 |   3 |   6 |
|   5 |   3 |   6 |
|   1 |   4 |   6 |
|   2 |   4 |   6 |
|   3 |   4 |   6 |
|   4 |   4 |   6 |
|   5 |   4 |   6 |
|   1 |   5 |   6 |
|   2 |   5 |   6 |
|   3 |   5 |   6 |
|   4 |   5 |   6 |
|   5 |   5 |   6 |
|   1 |   6 |   6 |
|   2 |   6 |   6 |
|   3 |   6 |   6 |
|   4 |   6 |   6 |
|   5 |   6 |   6 |
|   2 |   1 |   7 |
|   3 |   1 |   7 |
|   5 |   1 |   7 |
|   1 |   2 |   7 |
|   2 |   2 |   7 |
|   3 |   2 |   7 |
|   4 |   2 |   7 |
|   5 |   2 |   7 |
|   1 |   3 |   7 |
|   2 |   3 |   7 |
|   3 |   3 |   7 |
|   4 |   3 |   7 |
|   5 |   3 |   7 |
|   2 |   4 |   7 |
|   3 |   4 |   7 |
|   5 |   4 |   7 |
|   1 |   5 |   7 |
|   2 |   5 |   7 |
|   3 |   5 |   7 |
|   4 |   5 |   7 |
|   5 |   5 |   7 |
|   2 |   6 |   7 |
|   3 |   6 |   7 |
|   5 |   6 |   7 |
+-----+-----+-----+
194 rows in set (0.00 sec)


mysql> -- 4) Get full details for parts supplied by a supplier in London.
mysql> 
mysql> SELECT DISTINCT S.Sno, S.sname, P.pno, P.pname, P.color, P.weight, P.city
    -> FROM Part P, Supplier S, Spj J
    -> WHERE P.pno = J.pno AND S.sno = J.sno AND S.city = 'London';
+-----+-------+-----+-------+-------+--------+--------+
| Sno | sname | pno | pname | color | weight | city   |
+-----+-------+-----+-------+-------+--------+--------+
|   1 | Smith |   1 | Nut   | Red   |     12 | London |
|   4 | Clark |   6 | Cog   | Red   |     19 | London |
+-----+-------+-----+-------+-------+--------+--------+
2 rows in set (0.01 sec)

mysql> /*
   /*> 5) Get all pairs of city names such that a supplier in the first city supplier in the first city
   /*> supplies a project in the second city.
   /*> */
mysql> 
mysql> SELECT DISTINCT S.city AS supp_city, J.city AS proj_city
    -> FROM Supplier S, Project J, Spj
    -> WHERE S.sno = Spj.sno AND J.jno = Spj.jno;
+-----------+-----------+
| supp_city | proj_city |
+-----------+-----------+
| London    | Paris     |
| London    | Athens    |
| Paris     | Paris     |
| Paris     | Rome      |
| Paris     | Athens    |
| Paris     | London    |
| Paris     | Oslo      |
| London    | London    |
| Athens    | Athens    |
| Athens    | Rome      |
| Athens    | London    |
+-----------+-----------+
11 rows in set (0.00 sec)




mysql> -- 6) Get part numbers for parts supplied to any project by a supplier in the same city as that project.
mysql> 
mysql> SELECT DISTINCT Spj.pno
    -> FROM Supplier S, Project J,  Spj
    -> WHERE S.sno = Spj.sno AND J.jno = Spj.jno
    ->     AND S.city = J.city;
+-----+
| pno |
+-----+
|   3 |
|   6 |
|   1 |
|   2 |
|   4 |
|   5 |
+-----+
6 rows in set (0.00 sec)

mysql> QUIT
mysql> 
mysql> 
mysql> -- 7) Get the total number of projects supplied by supplier S1.
mysql> 
mysql> SELECT COUNT(DISTINCT Spj.jno)
    -> FROM Spj
    -> WHERE Spj.sno = 1;
+-------------------------+
| COUNT(DISTINCT Spj.jno) |
+-------------------------+
|                       2 |
+-------------------------+
1 row in set (0.01 sec)




mysql> 
mysql> -- 8) Get part numbers of parts supplied to some project in an average quantity of more than 350.
mysql> 
mysql> 
mysql> SELECT DISTINCT P.pno
    -> FROM Part P
    -> WHERE
    -> 
    -> EXISTS (
    -> 
    ->     SELECT J.jno
    ->     FROM Project J
    ->     WHERE (
    ->             SELECT AVG(Spj.qty)
    ->             FROM Spj
    ->             WHERE pno = P.pno AND jno = J.jno
    ->         ) > 350
    -> );
+-----+
| pno |
+-----+
|   1 |
|   3 |
|   4 |
|   5 |
|   6 |
+-----+
5 rows in set (0.00 sec)

mysql> -- 9) Get colors of parts supplied by supplied S1.
mysql> 
mysql> SELECT DISTINCT P.color
    -> FROM Part P, Spj
    -> WHERE P.pno = Spj.pno AND Spj.sno = 1;
+-------+
| color |
+-------+
| Red   |
+-------+
1 row in set (0.00 sec)

mysql> -- 10) Get project numbers for projects using at least one part available form supplier S1.
mysql> 
mysql> SELECT J.jno
    -> FROM Project J
    -> WHERE
    -> EXISTS (
    ->     SELECT *
    ->     FROM Spj
    ->     WHERE Spj.jno = J.jno AND Spj.sno = 1
    -> );
+-----+
| jno |
+-----+
|   1 |
|   4 |
+-----+
2 rows in set (0.09 sec)

mysql> -- 11) Get supplier numbers for suppliers with a status lower than that of supplier S1.
mysql> 
mysql> SELECT S.sno
    -> FROM Supplier S, Supplier S1
    -> WHERE S1.sno = 1 AND S.status < S1.status;
+-----+
| sno |
+-----+
|   2 |
+-----+
1 row in set (0.36 sec)

mysql> -- 12) Get project numbers for projets not supplied with any red part by any London supplier. 
mysql> 
mysql> SELECT J.jno
    -> FROM Project J
    -> WHERE 
    -> NOT EXISTS (
    -> 
    ->     SELECT P.pno, S.sno
    ->     FROM Part P, Supplier S, Spj
    ->     WHERE Spj.pno = P.pno AND Spj.sno = S.sno AND Spj.jno = J.jno
    ->     AND P.color = 'Red' AND S.city = 'London'
    -> );
+-----+
| jno |
+-----+
|   2 |
|   5 |
|   6 |
+-----+
3 rows in set (0.09 sec)

mysql> -- 13) Get part numbers for parts supplied to all projects in London.
mysql> 
mysql> SELECT P.pno
    -> FROM Part P
    -> WHERE
    -> NOT EXISTS (
    -> 
    ->     SELECT J.jno
    ->     FROM Project J
    ->     WHERE J.city = 'London' AND
    ->     NOT EXISTS (
    -> 
    ->         SELECT * FROM Spj
    ->         WHERE Spj.jno = J.jno AND Spj.pno = P.pno
    ->     )
    -> );
+-----+
| pno |
+-----+
|   3 |
|   5 |
+-----+
2 rows in set (0.00 sec)

mysql> -- 15) Get part numbers for parts that are supplied either by a London supplier or to a London project.
mysql> 
mysql> SELECT P.pno
    -> FROM Part P
    -> WHERE 
    -> 
    -> EXISTS (
    ->     SELECT * FROM Spj, Supplier S
    ->     WHERE Spj.sno = S.sno AND Spj.pno = P.pno AND S.city = 'London'
    -> )
    -> 
    -> OR
    -> 
    -> EXISTS (
    ->     SELECT * FROM Spj, Project J
    ->     WHERE Spj.jno = J.jno AND Spj.pno = P.pno AND J.city = 'London'
    -> );
+-----+
| pno |
+-----+
|   1 |
|   3 |
|   5 |
|   6 |
+-----+
4 rows in set (0.01 sec)

mysql> /*
   /*> 16) Get all paris of supplier numbers, Sx and Sy say, such that Sx and Sy supply exactly the 
   /*> same set of parts each. Note: For simplicity, you might want to use the original suppliers-
   /*> */
mysql> 
mysql> SELECT S1.sno, S2.sno
    -> FROM Supplier S1, Supplier S2
    -> WHERE 
    -> 
    -> NOT EXISTS (
    -> 
    ->     SELECT P.pno
    ->     FROM Part P
    ->     WHERE
    -> 
    ->     EXISTS (
    ->         SELECT *
    ->         FROM Spj
    ->         WHERE Spj.pno = P.pno AND Spj.sno = S1.sno
    ->     )
    -> 
    ->     AND
    -> 
    ->     NOT EXISTS (
    ->         SELECT *
    ->         FROM Spj
    ->         WHERE Spj.pno = P.pno AND Spj.sno = S2.sno
    ->     )
    -> ) AND
    -> 
    -> NOT EXISTS (
    -> 
    ->     SELECT P.pno
    ->     FROM Part P
    ->     WHERE
    -> 
    ->     NOT EXISTS (
    ->         SELECT *
    ->         FROM Spj
    ->         WHERE Spj.pno = P.pno AND Spj.sno = S1.sno
    ->     )
    -> 
    ->     AND
    -> 
    ->     EXISTS (
    ->         SELECT *
    ->         FROM Spj
    ->         WHERE Spj.pno = P.pno AND Spj.sno = S2.sno
    ->     )
    -> );
+-----+-----+
| sno | sno |
+-----+-----+
|   1 |   1 |
|   2 |   2 |
|   3 |   3 |
|   4 |   4 |
|   5 |   5 |
+-----+-----+
5 rows in set (1.12 sec)

mysql> -- 17) Get an “ungrouped” version of the relation produced in question 36.
mysql> -- ^I'm not exactly sure what this question means
mysql> 
mysql> 
mysql> 
mysql> 
mysql> -- 18) Get supplier numbers and status for suppliers in Paris with status > 20.
mysql> 
mysql> SELECT sno, status
    -> FROM Supplier
    -> WHERE city = 'Paris' AND status > 20;
+-----+--------+
| sno | status |
+-----+--------+
|   3 |     30 |
+-----+--------+
1 row in set (0.00 sec)

mysql> -- 19) Get supplier names for suppliers who supply at least one parts supplied by supplier S2.
mysql> 
mysql> SELECT S.sno
    -> FROM Supplier S
    -> WHERE
    -> 
    -> EXISTS (
    ->     SELECT P.pno
    ->     FROM Part P
    ->     WHERE 
    -> 
    ->     EXISTS (
    ->         SELECT * FROM Spj
    ->         WHERE Spj.pno = P.pno AND Spj.sno = S.sno
    ->     ) AND
    -> 
    ->     EXISTS (
    ->         SELECT * FROM Spj
    ->         WHERE Spj.pno = P.pno AND Spj.sno = 2      
    ->     )
    -> );
+-----+
| sno |
+-----+
|   2 |
|   3 |
|   5 |
+-----+
3 rows in set (0.00 sec)

mysql> -- 20) Get supplier names for suppliers who do not supply part P2.
mysql> 
mysql> SELECT S.sno, S.sname
    -> FROM Supplier S
    -> WHERE
    -> NOT EXISTS (
    -> 
    ->     SELECT * FROM Spj
    ->     WHERE Spj.sno = S.sno AnD Spj.pno = 2
    -> );
+-----+-------+
| sno | sname |
+-----+-------+
|   1 | Smith |
|   2 | Jones |
|   3 | Blake |
|   4 | Clark |
+-----+-------+
4 rows in set (0.00 sec)




mysql> -- 21) Get part numbers for parts that either weigh more than 16 pounds or are supplied by supplier S2, or both.
mysql> 
mysql> 
mysql> SELECT P.pno, P.pname
    -> FROM Part P
    -> WHERE P.weight > 16 OR
    -> EXISTS (
    ->     SELECT * FROM Spj
    ->     WHERE Spj.pno = P.pno AND Spj.sno = 2
    -> );
+-----+-------+
| pno | pname |
+-----+-------+
|   2 | Bolt  |
|   3 | Screw |
|   5 | Cam   |
|   6 | Cog   |
+-----+-------+
4 rows in set (0.00 sec)

mysql> --22) Get all suppliers and tag each one with the literal value “Supplier.”
    -> -- {Sx, ‘Supplier’ AS TAG}
    -> -- I'm not sure of what to do
    -> 
    -> \c
mysql> 
mysql> 
mysql> -- 23) For each part, get the part number and the total shipment quantity.
mysql> SELECT pno, count(*)
    -> FROM Spj
    -> GROUP BY pno;
+-----+----------+
| pno | count(*) |
+-----+----------+
|   1 |        3 |
|   2 |        2 |
|   3 |        9 |
|   4 |        2 |
|   5 |        4 |
|   6 |        4 |
+-----+----------+
6 rows in set (0.20 sec)

mysql> -- 24) Get part cities that store more than five red parts. 
mysql> SELECT P.city
    -> FROM Part P
    -> 
    -> WHERE (
    ->     SELECT COUNT(*)
    ->     FROM Part P1
    ->     WHERE P1.city = P.city AND P1.color = 'Red'
    -> ) > 5;
Empty set (0.03 sec)



mysql> -- 25) Get color and city for “nonParis” parts with weight greater than 10 pounds.
mysql> SELECT P.pno, P.color, P.city
    -> FROM Part P
    -> WHERE P.city <> 'Paris' AND P.weight > 10;
+-----+-------+--------+
| pno | color | city   |
+-----+-------+--------+
|   1 | Red   | London |
|   3 | Blue  | Oslo   |
|   4 | Red   | London |
|   6 | Red   | London |
+-----+-------+--------+
4 rows in set (0.00 sec)

mysql> -- 26) Get all combinations of supplier and part information such that the supplier and part in question are co-located.
mysql> SELECT *
    -> FROM Supplier S, Part P
    -> WHERE S.city = P.city;
+-----+-------+--------+--------+-----+-------+-------+--------+--------+
| sno | sname | status | city   | pno | pname | color | weight | city   |
+-----+-------+--------+--------+-----+-------+-------+--------+--------+
|   1 | Smith |     20 | London |   1 | Nut   | Red   |     12 | London |
|   4 | Clark |     20 | London |   1 | Nut   | Red   |     12 | London |
|   2 | Jones |     10 | Paris  |   2 | Bolt  | Green |     17 | Paris  |
|   3 | Blake |     30 | Paris  |   2 | Bolt  | Green |     17 | Paris  |
|   1 | Smith |     20 | London |   4 | Screw | Red   |     14 | London |
|   4 | Clark |     20 | London |   4 | Screw | Red   |     14 | London |
|   2 | Jones |     10 | Paris  |   5 | Cam   | Blue  |     12 | Paris  |
|   3 | Blake |     30 | Paris  |   5 | Cam   | Blue  |     12 | Paris  |
|   1 | Smith |     20 | London |   6 | Cog   | Red   |     19 | London |
|   4 | Clark |     20 | London |   6 | Cog   | Red   |     19 | London |
+-----+-------+--------+--------+-----+-------+-------+--------+--------+
10 rows in set (0.00 sec)

mysql> -- 27) Get all pairs of supplier numbers such that the suppliers concerned are co-located.
mysql> SELECT S1.sno as S1_sno, S2.sno as S2_sno
    -> FROM Supplier S1, Supplier S2
    -> WHERE S1.city = S2.city;
+--------+--------+
| S1_sno | S2_sno |
+--------+--------+
|      1 |      1 |
|      4 |      1 |
|      2 |      2 |
|      3 |      2 |
|      2 |      3 |
|      3 |      3 |
|      1 |      4 |
|      4 |      4 |
|      5 |      5 |
+--------+--------+
9 rows in set (0.00 sec)

mysql> -- 28) Get the maximum and minimum quantity for part P2.
mysql> SELECT MAX(Spj.qty), MIN(Spj.qty)
    -> FROM Spj
    -> WHERE Spj.pno = 2;
+--------------+--------------+
| MAX(Spj.qty) | MIN(Spj.qty) |
+--------------+--------------+
|          200 |          100 |
+--------------+--------------+
1 row in set (0.04 sec)

mysql> -- 29) Get supplier names for suppliers who supply part P2 using ‘In” operator.
mysql> SELECT S.sno, S.sname
    -> FROM Supplier S
    -> WHERE S.sno IN (
    ->     SELECT Spj.sno
    ->     FROM Spj
    ->     WHERE Spj.pno = 2
    -> );
+-----+-------+
| sno | sname |
+-----+-------+
|   5 | Adams |
+-----+-------+
1 row in set (0.01 sec)

mysql> -- 30) Get supplier names for suppliers who supply part P2 using ‘exists’ operator. 
mysql> SELECT S.sno, S.sname
    -> FROM Supplier S
    -> WHERE EXISTS (
    ->     SELECT *
    ->     FROM Spj
    ->     WHERE Spj.sno = S.sno AND Spj.pno = 2
    -> );
+-----+-------+
| sno | sname |
+-----+-------+
|   5 | Adams |
+-----+-------+
1 row in set (0.00 sec)

mysql> -- 31) Get part numbers for parts that either weigh more than 16 pounds or are supplied by supplier S2, or both.
mysql> SELECT P.pno, P.pname
    -> FROM Part P
    -> WHERE P.weight > 16 OR
    -> EXISTS (
    ->     SELECT * FROM Spj
    ->     WHERE Spj.pno = P.pno AND Spj.sno = 2
    -> );
+-----+-------+
| pno | pname |
+-----+-------+
|   2 | Bolt  |
|   3 | Screw |
|   5 | Cam   |
|   6 | Cog   |
+-----+-------+
4 rows in set (0.00 sec)

mysql> -- 32) For each part supplied, get the part number and the total shipment quantity. 
mysql> SELECT pno, SUM(qty)
    -> FROM Spj
    -> GROUP BY pno;
+-----+----------+
| pno | SUM(qty) |
+-----+----------+
|   1 |     1000 |
|   2 |      300 |
|   3 |     3500 |
|   4 |     1300 |
|   5 |     1100 |
|   6 |     1300 |
+-----+----------+
6 rows in set (0.00 sec)

mysql> -- 33) Get the total quantity of part P2 supplied.
mysql> SELECT SUM(qty)
    -> FROM Spj
    -> WHERE pno = 2;
+----------+
| SUM(qty) |
+----------+
|      300 |
+----------+
1 row in set (0.00 sec)

mysql> QUIT
