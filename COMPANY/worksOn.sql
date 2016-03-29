DROP TABLE WORKS_ON;
CREATE TABLE WORKS_ON (
  Essn   char(9) NOT NULL,
  Pno    int NOT NULL,
  Hours  decimal(3,1) NOT NULL,
  primary key (Essn,Pno)
);
