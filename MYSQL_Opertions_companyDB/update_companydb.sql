/*
--updatind fk constaints in department table
*/
UPDATE department SET Mgr_ssn = 333445555 WHERE Dnumber = 5;
UPDATE department SET Mgr_ssn = 987654321 WHERE Dnumber = 4;
UPDATE department SET Mgr_ssn = 888665555 WHERE Dnumber = 1;
/*
--updatind fk constaints in employee table
*/
UPDATE employee SET Super_ssn = 333445555, Dno = 5 WHERE Ssn = 123456789; 
UPDATE employee SET Super_ssn = 888665555, Dno = 5 WHERE Ssn = 333445555; 
UPDATE employee SET Super_ssn = 987654321, Dno = 4 WHERE Ssn = 999887777; 
UPDATE employee SET Super_ssn = 888665555, Dno = 4 WHERE Ssn = 987654321; 
UPDATE employee SET Super_ssn = 333445555, Dno = 5 WHERE Ssn = 666884444; 
UPDATE employee SET Super_ssn = 333445555, Dno = 5 WHERE Ssn = 453453453; 
UPDATE employee SET Super_ssn = 987654321, Dno = 4 WHERE Ssn = 987987987; 
UPDATE employee SET Super_ssn = NULL, Dno = 1 WHERE Ssn = 888665555; 
/*
--updatind fk constaints in project table
*/
UPDATE project SET Dnum = 5 WHERE Pnumber = 1;
UPDATE project SET Dnum = 5 WHERE Pnumber = 2;
UPDATE project SET Dnum = 5 WHERE Pnumber = 3;
UPDATE project SET Dnum = 4 WHERE Pnumber = 10;
UPDATE project SET Dnum = 1 WHERE Pnumber = 20;
UPDATE project SET Dnum = 4 WHERE Pnumber = 30;
