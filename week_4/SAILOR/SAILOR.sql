DROP TABLE Sailors;
CREATE TABLE Sailors (
  sid    integer not null,
  sname   varchar(20),
  rating integer,
  age real,
  
  CONSTRAINT PK_Sailors
    PRIMARY KEY (sid)
);

DROP TABLE Boats;
CREATE TABLE Boats (
  bid INTEGER NOT NULL,
  bname VARCHAR (20),
  color VARCHAR(10),

  CONSTRAINT PK_Boats
    PRIMARY KEY (bid)
);

DROP TABLE Reserves;
CREATE TABLE Reserves (
  sid INTEGER,       
  bid INTEGER,
  day DATE,

  CONSTRAINT PK_Boats
    PRIMARY KEY (sid, bid, day),

  FOREIGN KEY (sid) REFERENCES Sailors(sid), 
  FOREIGN KEY (bid) REFERENCES Boats(bid)
);


INSERT INTO Sailors ( sid, sname, rating, age )
VALUES (22, 'Dustin', 7, 45.0);

INSERT INTO Sailors ( sid, sname, rating, age )
VALUES (29, 'Brutus', 1, 33.0);

INSERT INTO Sailors ( sid, sname, rating, age )
VALUES (31, 'Lubber', 8, 55.5);

INSERT INTO Sailors ( sid, sname, rating, age )
VALUES (32, 'Andy', 8, 25.5);

INSERT INTO Sailors ( sid, sname, rating, age )
VALUES (58, 'Rusty', 10, 35.0);

INSERT INTO Sailors ( sid, sname, rating, age )
VALUES (64, 'Horatio', 7, 35.0);

INSERT INTO Sailors ( sid, sname, rating, age )
VALUES (71, 'Zorba', 10, 16.0);

INSERT INTO Sailors ( sid, sname, rating, age )
VALUES (74, 'Horatio', 9, 40.0);

INSERT INTO Sailors ( sid, sname, rating, age )
VALUES (85, 'Art', 3, 25.5);

INSERT INTO Sailors ( sid, sname, rating, age )
VALUES (95, 'Bob', 3, 63.5);

/*22, 'Dustin', 7, 45.0
29, 'Brutus', 1, 33.0
31, 'Lubber', 8, 55.5
32, 'Andy', 8, 25.5
58, 'Rusty', 10, 35.0
64, 'Horatio', 7, 35.0
71, 'Zorba', 10, 16.0
74, 'Horatio', 9, 40.0
85, 'Art', 3, 25.5
95, 'Bob', 3, 63.5*/


INSERT INTO Boats ( bid, bname, color)
VALUES (101, 'Interlake', 'blue');

INSERT INTO Boats ( bid, bname, color)
VALUES (102, 'Interlake', 'red');

INSERT INTO Boats ( bid, bname, color)
VALUES (103, 'Clipper', 'green');

INSERT INTO Boats ( bid, bname, color)
VALUES (104, 'Marine', 'red');

/*101, 'Interlake', 'blue'
102, 'Interlake', 'red'
103, 'Clipper', 'green'
104, 'Marine', 'red'*/

INSERT INTO Reserves ( sid, bid, day )
VALUES ( 22, 101, '1998-10-10');

INSERT INTO Reserves ( sid, bid, day )
VALUES (22, 103, '1998-10-8');

INSERT INTO Reserves ( sid, bid, day )
VALUES (22, 104, '1998-10-7');

INSERT INTO Reserves ( sid, bid, day )
VALUES (31, 102, '1998-11-10');

INSERT INTO Reserves ( sid, bid, day )
VALUES (31, 103, '1998-11-6');

INSERT INTO Reserves ( sid, bid, day )
VALUES (31, 104, '1998-11-12');

INSERT INTO Reserves ( sid, bid, day )
VALUES (64, 101, '1998-9-5');

INSERT INTO Reserves ( sid, bid, day )
VALUES (64, 102, '1998-9-8');

INSERT INTO Reserves ( sid, bid, day )
VALUES (74, 103, '1998-9-8');

/*22, 102, '1998-10-10'
22, 103, '1998-10-8'
22, 104, '1998-10-7'
31, 102, '1998-11-10'
31, 103, '1998-11-6'
31, 104, '1998-11-12'
64, 101, '1998-9-5'
64, 102, '1998-9-8'
74, 103, '1998-9-8'*/