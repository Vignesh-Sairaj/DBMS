DROP TABLE EMPLOYEE;
CREATE TABLE EMPLOYEE (
  Fname    varchar(15) not null,
  Minit    char,
  Lname    varchar(15) not null,
  Ssn      char(9) NOT NULL,
  Bdate    date,
  Address  varchar(30),
  Sex      char,
  Salary   decimal(10,2),
  Super_ssn char(9),
  Dno      int NOT NULL,
  
  CONSTRAINT EMPPK
    PRIMARY KEY (Ssn)
);
