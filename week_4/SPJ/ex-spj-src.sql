/*
1) Get supplier numbers of suppliers who supply project P5.

2) Get all part-color/part-city pairs. Note: Here and subsequently, the term “all” means “all 

currently represented in the database,” not “all possible.”

3) Get all supplier-number/part-number/project-number triples such that the indicated 

supplier, part, and project are not all co-located.

4) Get full details for parts supplied by a supplier in London.

5) Get all pairs of city names such that a supplier in the first city supplier in the first city 

supplies a project in the second city.

6) Get part numbers for parts supplied to any project by a supplier in the same city as that 

project.

7) Get the total number of projects supplied by supplier S1.

8) Get part numbers of parts supplied to some project in an average quantity of more than 

350.

9) Get colors of parts supplied by supplied S1.

10) Get project numbers for projects using at least one part available form supplier S1.

11) Get supplier numbers for suppliers with a status lower than that of supplier S1.

12) Get project numbers for projets not supplied with any red part by any London supplier. 

13) Get part numbers for parts supplied to all projects in London.

14) Get project numbers for projects supplied with at least all parts available from supplier 

S1.

15) Get part numbers for parts that are supplied either by a London supplier or to a London 

project.

16) Get all paris of supplier numbers, Sx and Sy say, such that Sx and Sy supply exactly the 

same set of parts each. Note: For simplicity, you might want to use the original suppliers-

10

and-parts database for this exercise, instead of the expanded suppliers-prat-projects 

databse. 

17) Get an “ungrouped” version of the relation produced in question 36.

18) Get supplier numbers and status for suppliers in Paris with status > 20.

19) Get supplier names for suppliers who supply at least one parts supplied by supplier S2.

20) Get supplier names for suppliers who do not supply part P2.

21) Get part numbers for parts that either weigh more than 16 pounds or are supplied by 

supplier S2, or both.

22) Get all suppliers and tag each one with the literal value “Supplier.”
{Sx, ‘Supplier’ AS TAG}

23) For each part, get the part number and the total shipment quantity.

24) Get part cities that store more than five red parts. 

25) Get color and city for “nonParis” parts with weight greater than 10 pounds.

26) Get all combinations of supplier and part information such that the supplier and part in 

question are co-located.

27) Get all pairs of supplier numbers such that the suppliers concerned are co-located.

28) Get the maximum and minimum quantity for part P2.

29) Get supplier names for suppliers who supply part P2 using ‘In” operator.

30) Get supplier names for suppliers who supply part P2 using ‘exists’ operator. 

31) Get part numbers for parts that either weigh more than 16 pounds or are supplied by 

supplier S2, or both.

32) For each part supplied, get the part number and the total shipment quantity. 

33) Get the total quantity of part P2 supplied.
*/

-- 1) Get supplier numbers of suppliers who supply project P5.

SELECT COUNT(DISTINCT sno)
FROM Spj
WHERE pno = 5;

-- 2) Get all part-color/part-city pairs. Note: Here and subsequently, the term “all” means “all 
--    currently represented in the database,” not “all possible.”

SELECT color, city
FROM Part;

-- 3) Get all supplier-number/part-number/project-number triples such that the indicated 
--    supplier, part, and project are not all co-located.


SELECT S.sno, P.pno, J.jno
FROM Supplier S, Part P, Project J
WHERE NOT(S.city = P.city AND P.city = J.city);



-- 4) Get full details for parts supplied by a supplier in London.

SELECT DISTINCT S.Sno, S.sname, P.pno, P.pname, P.color, P.weight, P.city
FROM Part P, Supplier S, Spj J
WHERE P.pno = J.pno AND S.sno = J.sno AND S.city = 'London';



/*
5) Get all pairs of city names such that a supplier in the first city supplier in the first city
supplies a project in the second city.
*/

SELECT DISTINCT S.city AS supp_city, J.city AS proj_city
FROM Supplier S, Project J, Spj
WHERE S.sno = Spj.sno AND J.jno = Spj.jno;




-- 6) Get part numbers for parts supplied to any project by a supplier in the same city as that project.

SELECT DISTINCT Spj.pno
FROM Supplier S, Project J,  Spj
WHERE S.sno = Spj.sno AND J.jno = Spj.jno
    AND S.city = J.city;

-- 7) Get the total number of projects supplied by supplier S1.

SELECT COUNT(DISTINCT Spj.jno)
FROM Spj
WHERE Spj.sno = 1;



-- 8) Get part numbers of parts supplied to some project in an average quantity of more than 350.


SELECT DISTINCT P.pno
FROM Part P
WHERE

EXISTS (

    SELECT J.jno
    FROM Project J
    WHERE (
            SELECT AVG(Spj.qty)
            FROM Spj
            WHERE pno = P.pno AND jno = J.jno
        ) > 350
);



-- 9) Get colors of parts supplied by supplied S1.

SELECT DISTINCT P.color
FROM Part P, Spj
WHERE P.pno = Spj.pno AND Spj.sno = 1;



-- 10) Get project numbers for projects using at least one part available form supplier S1.

SELECT J.jno
FROM Project J
WHERE
EXISTS (
    SELECT *
    FROM Spj
    WHERE Spj.jno = J.jno AND Spj.sno = 1
);



-- 11) Get supplier numbers for suppliers with a status lower than that of supplier S1.

SELECT S.sno
FROM Supplier S, Supplier S1
WHERE S1.sno = 1 AND S.status < S1.status;



-- 12) Get project numbers for projets not supplied with any red part by any London supplier. 

SELECT J.jno
FROM Project J
WHERE 
NOT EXISTS (

    SELECT P.pno, S.sno
    FROM Part P, Supplier S, Spj
    WHERE Spj.pno = P.pno AND Spj.sno = S.sno AND Spj.jno = J.jno
    AND P.color = 'Red' AND S.city = 'London'
);



-- 13) Get part numbers for parts supplied to all projects in London.

SELECT P.pno
FROM Part P
WHERE
NOT EXISTS (

    SELECT J.jno
    FROM Project J
    WHERE J.city = 'London' AND
    NOT EXISTS (

        SELECT * FROM Spj
        WHERE Spj.jno = J.jno AND Spj.pno = P.pno
    )
);

--14) Get project numbers for projects supplied with at least all parts available from supplier
-- S1.

SELECT J.pno
FROM Project J
WHERE
NOT EXISTS (

    SELECT P.pno
    FROM Part P
    WHERE

    EXISTS (
        SELECT *
        FROM Spj
        WHERE Spj.pno = P.pno AND Spj.sno = 1
    )

    AND

    NOT EXISTS (

        SELECT * FROM Spj
        WHERE Spj.jno = J.jno AND Spj.pno = P.pno
    )
);



-- 15) Get part numbers for parts that are supplied either by a London supplier or to a London project.

SELECT P.pno
FROM Part P
WHERE 

EXISTS (
    SELECT * FROM Spj, Supplier S
    WHERE Spj.sno = S.sno AND Spj.pno = P.pno AND S.city = 'London'
)

OR

EXISTS (
    SELECT * FROM Spj, Project J
    WHERE Spj.jno = J.jno AND Spj.pno = P.pno AND J.city = 'London'
);


/*
16) Get all paris of supplier numbers, Sx and Sy say, such that Sx and Sy supply exactly the 
same set of parts each. Note: For simplicity, you might want to use the original suppliers-
*/

SELECT S1.sno, S2.sno
FROM Supplier S1, Supplier S2
WHERE 

NOT EXISTS (

    SELECT P.pno
    FROM Part P
    WHERE

    EXISTS (
        SELECT *
        FROM Spj
        WHERE Spj.pno = P.pno AND Spj.sno = S1.sno
    )

    AND

    NOT EXISTS (
        SELECT *
        FROM Spj
        WHERE Spj.pno = P.pno AND Spj.sno = S2.sno
    )
) AND

NOT EXISTS (

    SELECT P.pno
    FROM Part P
    WHERE

    NOT EXISTS (
        SELECT *
        FROM Spj
        WHERE Spj.pno = P.pno AND Spj.sno = S1.sno
    )

    AND

    EXISTS (
        SELECT *
        FROM Spj
        WHERE Spj.pno = P.pno AND Spj.sno = S2.sno
    )
);

-- 17) Get an “ungrouped” version of the relation produced in question 36.
-- ^I'm not exactly sure what this question means



-- 18) Get supplier numbers and status for suppliers in Paris with status > 20.

SELECT sno, status
FROM Supplier
WHERE city = 'Paris' AND status > 20;



-- 19) Get supplier names for suppliers who supply at least one parts supplied by supplier S2.

SELECT S.sno
FROM Supplier S
WHERE

EXISTS (
    SELECT P.pno
    FROM Part P
    WHERE 

    EXISTS (
        SELECT * FROM Spj
        WHERE Spj.pno = P.pno AND Spj.sno = S.sno
    ) AND

    EXISTS (
        SELECT * FROM Spj
        WHERE Spj.pno = P.pno AND Spj.sno = 2      
    )
);

-- 20) Get supplier names for suppliers who do not supply part P2.

SELECT S.sno, S.sname
FROM Supplier S
WHERE
NOT EXISTS (

    SELECT * FROM Spj
    WHERE Spj.sno = S.sno AnD Spj.pno = 2
);



-- 21) Get part numbers for parts that either weigh more than 16 pounds or are supplied by supplier S2, or both.
SELECT P.pno, P.pname
FROM Part P
WHERE P.weight > 16 OR
EXISTS (
    SELECT * FROM Spj
    WHERE Spj.pno = P.pno AND Spj.sno = 2
);

--22) Get all suppliers and tag each one with the literal value “Supplier.”
-- {Sx, ‘Supplier’ AS TAG}
-- I'm not sure of what to do


-- 23) For each part, get the part number and the total shipment quantity.
SELECT pno, count(*)
FROM Spj
GROUP BY pno;


-- 24) Get part cities that store more than five red parts. 
SELECT P.city
FROM Part P

WHERE (
    SELECT COUNT(*)
    FROM Part P1
    WHERE P1.city = P.city AND P1.color = 'Red'
) > 5;



-- 25) Get color and city for “nonParis” parts with weight greater than 10 pounds.
SELECT P.pno, P.color, P.city
FROM Part P
WHERE P.city <> 'Paris' AND P.weight > 10;



-- 26) Get all combinations of supplier and part information such that the supplier and part in question are co-located.
SELECT *
FROM Supplier S, Part P
WHERE S.city = P.city;



-- 27) Get all pairs of supplier numbers such that the suppliers concerned are co-located.
SELECT S1.sno as S1_sno, S2.sno as S2_sno
FROM Supplier S1, Supplier S2
WHERE S1.city = S2.city;


-- 28) Get the maximum and minimum quantity for part P2.
SELECT MAX(Spj.qty), MIN(Spj.qty)
FROM Spj
WHERE Spj.pno = 2;


-- 29) Get supplier names for suppliers who supply part P2 using ‘In” operator.
SELECT S.sno, S.sname
FROM Supplier S
WHERE S.sno IN (
    SELECT Spj.sno
    FROM Spj
    WHERE Spj.pno = 2
);

-- 30) Get supplier names for suppliers who supply part P2 using ‘exists’ operator. 
SELECT S.sno, S.sname
FROM Supplier S
WHERE EXISTS (
    SELECT *
    FROM Spj
    WHERE Spj.sno = S.sno AND Spj.pno = 2
);


-- 31) Get part numbers for parts that either weigh more than 16 pounds or are supplied by supplier S2, or both.
SELECT P.pno, P.pname
FROM Part P
WHERE P.weight > 16 OR
EXISTS (
    SELECT * FROM Spj
    WHERE Spj.pno = P.pno AND Spj.sno = 2
);


-- 32) For each part supplied, get the part number and the total shipment quantity. 
SELECT pno, SUM(qty)
FROM Spj
GROUP BY pno;


-- 33) Get the total quantity of part P2 supplied.
SELECT SUM(qty)
FROM Spj
WHERE pno = 2;
