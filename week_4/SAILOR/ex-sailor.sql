mysql> /*
   /*> 1. Find the sids of sailors who have reserved a red boat
   /*> */
mysql> 
mysql> SELECT S.sid
    -> FROM Sailors S, Reserves R, Boats B
    -> WHERE S.sid =  R.sid AND R.bid = B.bid AND B.color = 'red';
+-----+
| sid |
+-----+
|  31 |
|  64 |
|  22 |
|  31 |
+-----+
4 rows in set (0.00 sec)

mysql> /*
   /*> 2. Write SQL queries to compute the average rating using AVG, the sum of the ratings using SUM;
   /*> and the number of ratings, using COUNT.
   /*> */
mysql> 
mysql> SELECT AVG(rating), SUM(rating), COUNT(rating)
    -> FROM Sailors;
+-------------+-------------+---------------+
| AVG(rating) | SUM(rating) | COUNT(rating) |
+-------------+-------------+---------------+
|      6.6000 |          66 |            10 |
+-------------+-------------+---------------+
1 row in set (0.00 sec)

mysql> QUIT
mysql> /*
   /*> 3. Count the numbers of sailors.
   /*> */
mysql> 
mysql> SELECT COUNT(*)
    -> FROM Sailors;
+----------+
| COUNT(*) |
+----------+
|       10 |
+----------+
1 row in set (0.00 sec)

mysql> /*
   /*> 4. Count the number of different sailor names.
   /*> */

mysql> SELECT COUNT(DISTINCT sname)
    -> FROM Sailors;
+-----------------------+
| COUNT(DISTINCT sname) |
+-----------------------+
|                     9 |
+-----------------------+
1 row in set (0.02 sec)


mysql> SELECT sname FROM Sailors;
+---------+
| sname   |
+---------+
| Dustin  |
| Brutus  |
| Lubber  |
| Andy    |
| Rusty   |
| Horatio |
| Zorba   |
| Horatio |
| Art     |
| Bob     |
+---------+
10 rows in set (0.00 sec)

mysql> /*
   /*> 5. Find the names of sailors who have reserved at least two boats.
   /*> */
mysql> 
mysql> SELECT S.sid, S.sname
    -> FROM Sailors S
    -> WHERE
    -> (
    ->     SELECT COUNT(DISTINCT bid)
    ->     FROM Reserves R
    ->     WHERE R.sid = S.sid
    -> ) > 2;
+-----+--------+
| sid | sname  |
+-----+--------+
|  22 | Dustin |
|  31 | Lubber |
+-----+--------+
2 rows in set (0.00 sec)

mysql> -- 6. Find the names of sailors who have reserved all red boats.
mysql> 
mysql> SELECT S.sid, S.sname
    -> FROM Sailors S
    -> WHERE
    -> NOT EXISTS (
    -> 
    ->     SELECT *
    ->     FROM Boats B
    ->     WHERE B.color = 'red'
    ->     AND
    ->     NOT EXISTS (
    -> 
    ->         SELECT *
    ->         FROM Reserves R
    ->         WHERE R.bid = B.bid AND R.sid = S.sid
    ->     )
    -> );
+-----+--------+
| sid | sname  |
+-----+--------+
|  31 | Lubber |
+-----+--------+
1 row in set (0.00 sec)


mysql> -- 7. Find all sids of sailors who have a rating of 10 or reserved boat 104.
mysql> 
mysql> SELECT S.sid, S.sname
    -> FROM Sailors S
    -> WHERE S.rating = 10 OR
    -> 
    -> EXISTS (
    -> 
    ->     SELECT *
    ->     FROM Reserves R
    ->     WHERE R.sid = S.sid AND R.bid = 104
    -> );
+-----+--------+
| sid | sname  |
+-----+--------+
|  22 | Dustin |
|  31 | Lubber |
|  58 | Rusty  |
|  71 | Zorba  |
+-----+--------+
4 rows in set (0.00 sec)

mysql> -- 8. Find the names of sailors who have reserved at least two boats.
mysql> 
mysql> SELECT S.sid, S.sname
    -> FROM Sailors S
    -> WHERE
    -> (
    ->     SELECT COUNT(DISTINCT bid)
    ->     FROM Reserves R
    ->     WHERE R.sid = S.sid
    -> ) > 2;
+-----+--------+
| sid | sname  |
+-----+--------+
|  22 | Dustin |
|  31 | Lubber |
+-----+--------+
2 rows in set (0.00 sec)

mysql> -- 9. Find the names of sailors who have reserved boat 103.
mysql> 
mysql> SELECT DISTINCT S.sid, S.sname
    -> FROM Sailors S, Reserves R
    -> WHERE S.sid = R.sid AND R.bid = 103;
+-----+---------+
| sid | sname   |
+-----+---------+
|  22 | Dustin  |
|  31 | Lubber  |
|  74 | Horatio |
+-----+---------+
3 rows in set (0.00 sec)

mysql> -- 10. Find the names of sailors who have not reserved a red boat.
mysql> 
mysql>  SELECT S.sid, S.sname
    ->  FROM Sailors S
    ->  WHERE NOT EXISTS (
    -> 
    ->         SELECT *
    ->         FROM Reserves R, Boats B
    ->         WHERE R.sid = S.sid AND R.bid = B.bid  AND B.color = 'red'
    ->     );
+-----+---------+
| sid | sname   |
+-----+---------+
|  29 | Brutus  |
|  32 | Andy    |
|  58 | Rusty   |
|  71 | Zorba   |
|  74 | Horatio |
|  85 | Art     |
|  95 | Bob     |
+-----+---------+
7 rows in set (0.00 sec)

mysql>  -- 11. Find the names of sailors who have reserved all boats called Interlake.
mysql> 
mysql> SELECT S.sid, S.sname
    -> FROM Sailors S
    -> WHERE 
    -> 
    -> NOT EXISTS (
    ->     SELECT *
    ->     FROM Boats B
    ->     WHERE B.bname = 'Interlake'
    ->     AND NOT EXISTS (
    -> 
    ->         SELECT *
    ->         FROM Reserves R
    ->         WHERE R.sid = S.sid AND R.bid = B.bid
    ->     )
    -> );
+-----+---------+
| sid | sname   |
+-----+---------+
|  64 | Horatio |
+-----+---------+
1 row in set (0.00 sec)


mysql> 
mysql> -- 12. Find the names of sailors who have reserved both a red and a green boat.
mysql> SELECT S.sid, S.sname 
    -> FROM Sailors S
    -> WHERE
    -> 
    -> EXISTS (
    ->     SELECT * FROM Boats B, Reserves R
    ->     WHERE B.bid = R.bid AND S.sid = R.sid AND B.color = 'green'
    -> )
    -> 
    -> AND
    -> 
    -> EXISTS (
    ->     SELECT * FROM Boats B,  Reserves R
    ->     WHERE B.bid = R.bid AND S.sid = R.sid AND B.color = 'red'
    -> );
+-----+--------+
| sid | sname  |
+-----+--------+
|  22 | Dustin |
|  31 | Lubber |
+-----+--------+
2 rows in set (0.00 sec)




mysql> 
mysql> -- 13. Find the names of sailors who have reserved all boats.
mysql>  
mysql> SELECT S.sid, S.sname
    -> FROM Sailors S
    -> WHERE
    -> NOT EXISTS (
    -> 
    ->     SELECT *
    ->     FROM Boats B
    ->     WHERE 
    ->     NOT EXISTS (
    -> 
    ->      SELECT *
    ->      FROM Reserves R
    ->      WHERE R.bid = B.bid AND R.sid = S.sid
    ->     )
    -> );
Empty set (0.00 sec)

mysql> -- 14. Find the average age of sailors with a rating of 10.
mysql> 
mysql> SELECT  AVG(age)
    -> FROM Sailors
    -> WHERE rating = 10;
+----------+
| AVG(age) |
+----------+
|     25.5 |
+----------+
1 row in set (0.00 sec)


mysql> -- 15. Find the name and age of the oldest sailor.
mysql> SELECT  S.sid, S.sname
    -> FROM Sailors S
    -> WHERE  S.age = (SELECT MAX(M.age) FROM Sailors M);
+-----+-------+
| sid | sname |
+-----+-------+
|  95 | Bob   |
+-----+-------+
1 row in set (0.00 sec)

mysql> -- 15. Find the name and age of the oldest sailor.
mysql> SELECT  S.sid, S.sname, S.age
    -> FROM Sailors S
    -> WHERE  S.age = (SELECT MAX(M.age) FROM Sailors M);
+-----+-------+------+
| sid | sname | age  |
+-----+-------+------+
|  95 | Bob   | 63.5 |
+-----+-------+------+
1 row in set (0.00 sec)


mysql> -- 16. Find the age of the youngest sailor for each rating level.
mysql> 
mysql> SELECT  S.rating, MIN(S.age)
    -> FROM Sailors S
    -> GROUP BY S.rating;
+--------+------------+
| rating | MIN(S.age) |
+--------+------------+
|      1 |         33 |
|      3 |       25.5 |
|      7 |         35 |
|      8 |       25.5 |
|      9 |         40 |
|     10 |         16 |
+--------+------------+
6 rows in set (0.00 sec)

mysql> -- 17. Find sailors whose rating is better than some sailor called Horatio.
mysql> 
mysql> SELECT  S.sid, S.sname
    -> FROM Sailors S
    -> WHERE
    -> 
    -> EXISTS(
    -> 
    ->     SELECT *
    ->     FROM Sailors H
    ->     WHERE H.sname = 'Horatio' AND S.rating > H.rating
    -> );
+-----+---------+
| sid | sname   |
+-----+---------+
|  31 | Lubber  |
|  32 | Andy    |
|  58 | Rusty   |
|  71 | Zorba   |
|  74 | Horatio |
+-----+---------+
5 rows in set (0.00 sec)

mysql> -- 18. Find sailors whose rating is better than every sailor called Horatio.
mysql> 
mysql> SELECT  S.sid, S.sname
    -> FROM Sailors S
    -> WHERE
    -> 
    -> S.rating > ALL (
    -> 
    ->     SELECT H.rating
    ->     FROM Sailors H
    ->     WHERE H.sname = 'Horatio'
    -> );
+-----+-------+
| sid | sname |
+-----+-------+
|  58 | Rusty |
|  71 | Zorba |
+-----+-------+
2 rows in set (0.00 sec)

mysql> -- 20. Find those ratings for which the average age of sailors is the mimimum over all ratings.
mysql> 
mysql> SELECT S.rating, AVG(S.age) AS avg_age
    -> FROM Sailors S
    -> GROUP BY S.rating
    -> HAVING avg_age = MIN(SELECT AVG(M.age) FROM Sailors M GROUP BY M.rating);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT AVG(M.age) FROM Sailors M GROUP BY M.rating)' at line 4
mysql> 
mysql> 
mysql> -- 20. Find those ratings for which the average age of sailors is the mimimum over all ratings.
mysql> 
mysql> SELECT S.rating, AVG(S.age) AS avg_age
    -> FROM Sailors S
    -> GROUP BY S.rating
    -> HAVING avg_age = (
    -> 
    ->     SELECT MIN(T.min_avg_age)
    ->     FROM (
    ->         SELECT AVG(M.age) AS min_avg_age
    ->         FROM Sailors M
    ->         GROUP BY M.rating
    ->     ) AS T
    -> );
+--------+---------+
| rating | avg_age |
+--------+---------+
|     10 |    25.5 |
+--------+---------+
1 row in set (0.00 sec)

mysql> -- 21. Find the names of sailors who are older than the oldest sailor with a rating of 10.
mysql> 
mysql> SELECT  S.sid, S.sname
    -> FROM Sailors S
    -> WHERE
    -> 
    -> S.age > (
    -> 
    ->     SELECT MAX(O.age)
    ->     FROM Sailors O
    ->     WHERE O.rating = 10
    -> );
+-----+---------+
| sid | sname   |
+-----+---------+
|  22 | Dustin  |
|  31 | Lubber  |
|  74 | Horatio |
|  95 | Bob     |
+-----+---------+
4 rows in set (0.00 sec)

mysql> -- 22. Consider the following query: Find the names of sailors with a higher rating than all sailors with age < 21.
mysql> 
mysql> SELECT  S.sid, S.sname
    -> FROM Sailors S
    -> WHERE
    -> 
    -> S.rating > (
    -> 
    ->     SELECT MAX(C.rating)
    ->     FROM Sailors C
    ->     WHERE C.age < 21
    -> );
Empty set (0.00 sec)

mysql> quit


/*

Note: 

22) The first query works as intended. The second query is wrong, the 'ANY' must be changed to 'ALL'.
    It would work only when no. of such tuples is 0 or 1 or all tuples either satisfy the condition or all of them do not.


19)


CARTESIAN PRODUCT

S1.sids S1.sname    S1.rating   S1.Age      S2.sids S2.sname    S2.rating   S2.Age

18      Jones       3           30.0        18      Jones       3           30.0 

41      Jonah       6           56.0        41      Jonah       6           56.0

22      Priscilla   7           44.0        22      Priscilla   7           44.0 

63      Preetham    Null        15.0        63      Preetham    Null        15.0 



a) LEFT OUTER JOIN

S1.sids S1.sname    S1.rating   S1.Age      S2.sids S2.sname    S2.rating   S2.Age

18      Jones       3           30.0        NULL    NULL        NULL        NULL 

41      Jonah       6           56.0        NULL    NULL        NULL        NULL


b) RIGHT OUTER JOIN

S1.sids S1.sname    S1.rating   S1.Age      S2.sids S2.sname    S2.rating   S2.Age

NULL    NULL        NULL        NULL        22      Priscilla   7           44.0 

NULL    NULL        NULL        NULL        63      Preetham    NULL        15.0 




c) FULL OUTER JOIN

S1.sids S1.sname    S1.rating   S1.Age      S2.sids S2.sname    S2.rating   S2.Age

18      Jones       3           30.0        NULL    NULL        NULL        NULL 

41      Jonah       6           56.0        NULL    NULL        NULL        NULL

NULL    NULL        NULL        NULL        22      Priscilla   7           44.0 

NULL    NULL        NULL        NULL        63      Preetham    NULL        15.0 

*/
