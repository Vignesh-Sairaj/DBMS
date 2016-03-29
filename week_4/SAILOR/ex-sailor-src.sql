/*1. Find the sids of sailors who have reserved a red boat.

2. Write SQL queries to compute the average rating, using AVG the sum of the ratings, using 

SUM; and the number of ratings, using COUNT.

3. Count the numbers of sailors.

4. Count the number of different sailor names.

5. Find the names of sailors who have reserved at least two boats.

6. Find the names of sailors who have reserved all red boats.

7. Find all sids of sailors who have a rating of 10 or reserved boat 104.

8. Find the names of sailors who have reserved at least two boats.

9. Find the names of sailors who have reserved boat 103.

10. Find the names of sailors who have not reserved a red boat.

11. Find the names of sailors who have reserved all boats called Interlake.

12. Find the names of sailors who have reserved both a red and a green boat.

13. Find the names of sailors who have reserved all boats.

14. Find the average age of sailors with a rating of 10.

15. Find the name and age of the oldest sailor.

16. Find the age of the youngest sailor for each rating level.

17. Find sailors whose rating is better than some sailor called Horatio.

18. Find sailors whose rating is better than every sailor called Horatio.

19. Consider the instance of Sailors shown in the below Figure. Let us define instance Sl of 

Sailors to consist of the first two tuples, instance S2 to be the last two tuples, and S to be the 

given instance.

20. Find those ratings for which the average age of sailors is the mimimum

over all ratings.

21. Find the names of sailors who are older than the oldest sailor with a

rating of 10.

22. Consider the following query: Find the names of sailors with a higher rating than all

sailors with age < 21.

The following two SQL queries attempt to obtain the answer

to this question. Do they both compute the result? If not, explain why. Under what

conditions would they compute the same result?
*/

/*
1. Find the sids of sailors who have reserved a red boat
*/

SELECT S.sid
FROM Sailors S, Reserves R, Boats B
WHERE S.sid =  R.sid AND R.bid = B.bid AND B.color = 'red';

/*
2. Write SQL queries to compute the average rating using AVG, the sum of the ratings using SUM;
and the number of ratings, using COUNT.
*/

SELECT AVG(rating), SUM(rating), COUNT(rating)
FROM Sailors;

/*
3. Count the numbers of sailors.
*/

SELECT COUNT(*)
FROM Sailors;

/*
4. Count the number of different sailor names.
*/

SELECT COUNT(DISTINCT sname)
FROM Sailors;


/*
5. Find the names of sailors who have reserved at least two boats.
*/

SELECT S.sid, S.sname
FROM Sailors S
WHERE
(
    SELECT COUNT(DISTINCT bid)
    FROM Reserves R
    WHERE R.sid = S.sid
) > 2;

-- 6. Find the names of sailors who have reserved all red boats.

SELECT S.sid, S.sname
FROM Sailors S
WHERE
NOT EXISTS (

    SELECT *
    FROM Boats B
    WHERE B.color = 'red'
    AND
    NOT EXISTS (

        SELECT *
        FROM Reserves R
        WHERE R.bid = B.bid AND R.sid = S.sid
    )
);

-- 7. Find all sids of sailors who have a rating of 10 or reserved boat 104.

SELECT S.sid, S.sname
FROM Sailors S
WHERE S.rating = 10 OR

EXISTS (

    SELECT *
    FROM Reserves R
    WHERE R.sid = S.sid AND R.bid = 104
);

-- 8. Find the names of sailors who have reserved at least two boats.

SELECT S.sid, S.sname
FROM Sailors S
WHERE
(
    SELECT COUNT(DISTINCT bid)
    FROM Reserves R
    WHERE R.sid = S.sid
) > 2;

-- 9. Find the names of sailors who have reserved boat 103.

SELECT DISTINCT S.sid, S.sname
FROM Sailors S, Reserves R
WHERE S.sid = R.sid AND R.bid = 103;

-- 10. Find the names of sailors who have not reserved a red boat.

 SELECT S.sid, S.sname
 FROM Sailors S
 WHERE NOT EXISTS (

        SELECT *
        FROM Reserves R, Boats B
        WHERE R.sid = S.sid AND R.bid = B.bid  AND B.color = 'red'
    );

 -- 11. Find the names of sailors who have reserved all boats called Interlake.

SELECT S.sid, S.sname
FROM Sailors S
WHERE 

NOT EXISTS (
    SELECT *
    FROM Boats B
    WHERE B.bname = 'Interlake'
    AND NOT EXISTS (

        SELECT *
        FROM Reserves R
        WHERE R.sid = S.sid AND R.bid = B.bid
    )
);

-- 12. Find the names of sailors who have reserved both a red and a green boat.
SELECT S.sid, S.sname 
FROM Sailors S
WHERE

EXISTS (
    SELECT * FROM Boats B, Reserves R
    WHERE B.bid = R.bid AND S.sid = R.sid AND B.color = 'green'
)

AND

EXISTS (
    SELECT * FROM Boats B,  Reserves R
    WHERE B.bid = R.bid AND S.sid = R.sid AND B.color = 'red'
);


-- 13. Find the names of sailors who have reserved all boats.
 
SELECT S.sid, S.sname
FROM Sailors S
WHERE
NOT EXISTS (

    SELECT *
    FROM Boats B
    WHERE 
    NOT EXISTS (

     SELECT *
     FROM Reserves R
     WHERE R.bid = B.bid AND R.sid = S.sid
    )
);



-- 14. Find the average age of sailors with a rating of 10.

SELECT  AVG(age)
FROM Sailors
WHERE rating = 10;




-- 15. Find the name and age of the oldest sailor.
SELECT  S.sid, S.sname, S.age
FROM Sailors S
WHERE  S.age = (SELECT MAX(M.age) FROM Sailors M);




-- 16. Find the age of the youngest sailor for each rating level.

SELECT  S.rating, MIN(S.age)
FROM Sailors S
GROUP BY S.rating;



-- 17. Find sailors whose rating is better than some sailor called Horatio.

SELECT  S.sid, S.sname
FROM Sailors S
WHERE

EXISTS(

    SELECT *
    FROM Sailors H
    WHERE H.sname = 'Horatio' AND S.rating > H.rating
);



-- 18. Find sailors whose rating is better than every sailor called Horatio.

SELECT  S.sid, S.sname
FROM Sailors S
WHERE

S.rating > ALL (

    SELECT H.rating
    FROM Sailors H
    WHERE H.sname = 'Horatio'
);

-- 20. Find those ratings for which the average age of sailors is the mimimum over all ratings.

SELECT S.rating, AVG(S.age) AS avg_age
FROM Sailors S
GROUP BY S.rating
HAVING avg_age = (

    SELECT MIN(T.min_avg_age)
    FROM (
        SELECT AVG(M.age) AS min_avg_age
        FROM Sailors M
        GROUP BY M.rating
    ) AS T
);

-- 21. Find the names of sailors who are older than the oldest sailor with a rating of 10.

SELECT  S.sid, S.sname
FROM Sailors S
WHERE

S.age > (

    SELECT MAX(O.age)
    FROM Sailors O
    WHERE O.rating = 10
);



-- 22. Consider the following query: Find the names of sailors with a higher rating than all sailors with age < 21.

SELECT  S.sid, S.sname
FROM Sailors S
WHERE

S.rating > (

    SELECT MAX(C.rating)
    FROM Sailors C
    WHERE C.age < 21
);











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
