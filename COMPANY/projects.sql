DROP TABLE PROJECT;
CREATE TABLE PROJECT (
  Pname      varchar(15) not null,
  Pnumber    int NOT NULL,
  Plocation  varchar(15),
  Dnum       int not null,
  PRIMARY KEY (Pnumber),
  UNIQUE (Pname),
  FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber)
);
