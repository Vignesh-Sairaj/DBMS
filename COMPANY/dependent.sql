DROP TABLE DEPENDENT;
CREATE TABLE DEPENDENT (
  Essn           char(9) NOT NULL,
  Dependent_name varchar(15) NOT NULL,
  Sex            char,
  Bdate          date,
  Relationship   varchar(8),
  primary key (Essn,Dependent_name)
);
