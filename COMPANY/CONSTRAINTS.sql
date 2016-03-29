  CONSTRAINT EMPSUPERFK
    FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
   
  CONSTRAINT EMPDEPTFK
    FOREIGN KEY(Dno) REFERENCES DEPARTMENT(Dnumber)
    ON DELETE SET DEFAULT
    ON UPDATE CASCADE
    
##############################

    

    
  CONSTRAINT DEPTMGRFK
    FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn)
    ON DELETE SET DEFAULT ON UPDATE CASCADE

#############################

##Dept_Locations
  FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber)
    ON DELETE CASCADE
    ON UPDATE CASCADE

###########
## Dependent
  foreign key (Essn) references EMPLOYEE(Ssn)

############
## Works on
  foreign key (Essn) references EMPLOYEE(Ssn),
  foreign key (Pno) references PROJECT(Pnumber)

