DROP TABLE DEPT_LOCATIONS;
CREATE TABLE DEPT_LOCATIONS (
  Dnumber   int NOT NULL,
  Dlocation varchar(15) NOT NULL, 

  PRIMARY KEY (Dnumber, Dlocation)
);
