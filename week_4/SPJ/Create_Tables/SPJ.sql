/*
Supplier(sno: integer, sname:string, status:integer, city: string)

Part(pno:integer,  pname:string, color: string, weight:integer, city:string)

Project(jno:integer, jname:string, city:string)

Spj(sno, pno, jno:integer, qty:number)
*/

DROP TABLE Supplier;
CREATE TABLE Supplier (
  sno     integer not null,
  sname   varchar(15),
  status  integer,
  city    varchar(15),
  
  CONSTRAINT PK_Supplier
    PRIMARY KEY (sno)
);

DROP TABLE Part;
CREATE TABLE Part (
  pno     integer not null,
  pname   varchar(15),
  color   varchar(10),
  weight  integer,
  city    varchar(15),
  
  CONSTRAINT PK_Part
    PRIMARY KEY (pno)
);

DROP TABLE Project;
CREATE TABLE Project (
  jno     integer not null,
  jname   varchar(15),
  city    varchar(15),
  
  CONSTRAINT PK_Project
    PRIMARY KEY (jno)
);

DROP TABLE Spj;
CREATE TABLE Spj (
  sno INTEGER,       
  pno INTEGER,
  jno INTEGER,

  qty INTEGER,

  CONSTRAINT PK_Spj
    PRIMARY KEY (sno, pno, jno),

  FOREIGN KEY (sno) REFERENCES Supplier(sno), 
  FOREIGN KEY (pno) REFERENCES Part(pno),
  FOREIGN KEY (jno) REFERENCES Project(jno)
);


LOAD DATA LOCAL INFILE 'Supplier.csv'
INTO TABLE Supplier
FIELDS ENCLOSED BY '\"' TERMINATED BY ',';


LOAD DATA LOCAL INFILE 'Part.csv'
INTO TABLE Part
FIELDS ENCLOSED BY '\"' TERMINATED BY ',';


LOAD DATA LOCAL INFILE 'Project.csv'
INTO TABLE Project
FIELDS ENCLOSED BY '\"' TERMINATED BY ',';


LOAD DATA LOCAL INFILE 'Spj.csv'
INTO TABLE Spj
FIELDS ENCLOSED BY '\"' TERMINATED BY ',';
