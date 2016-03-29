DROP TABLE DEPARTMENT;
CREATE TABLE DEPARTMENT (
  Dname        varchar(15) not null,
  Dnumber      int NOT NULL,
  Mgr_ssn       char(9) not null, 
  Mgr_start_date date,  
  
  CONSTRAINT DEPTPK
    PRIMARY KEY(Dnumber)
  CONSTRAINT DEPTSK
    UNIQUE (Dname)
);
