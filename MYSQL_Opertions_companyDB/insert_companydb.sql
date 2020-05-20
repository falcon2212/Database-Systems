/*
--Populating employee table
*/
INSERT INTO employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) 
VALUES('John', 'B', 'Smith',123456789, '1965-01-09', '731 Fondren, Huston, TX', 'M', 30000, NULL, NULL);

INSERT INTO employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) 
VALUES('Franklin', 'T', 'Wong',333445555, '1955-12-08', '638 Voss, Huston, TX', 'M', 40000, NULL, NULL);

INSERT INTO employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) 
VALUES('John', 'B', 'Smith',999887777, '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, NULL, NULL);

INSERT INTO employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) 
VALUES('John', 'B', 'Smith',987654321, '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, NULL, NULL);

INSERT INTO employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) 
VALUES('John', 'B', 'Smith',666884444, '1962-09-15', '975 Fire Oak, Huston, TX', 'M', 38000, NULL, NULL);

INSERT INTO employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) 
VALUES('John', 'B', 'Smith',453453453, '1972-07-31', '5631 Rice, Huston, TX', 'F', 25000, NULL, NULL);

INSERT INTO employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) 
VALUES('John', 'B', 'Smith',987987987, '1969-03-29', '980 Dallas, Huston, TX', 'M', 25000, NULL, NULL);

INSERT INTO employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) 
VALUES('John', 'B', 'Smith',888665555, '1937-11-10', '450 Stone, Huston, TX', 'M', 55000, NULL, NULL);
/*
--Populating department table
*/
INSERT INTO department (Dname,Dnumber,Mgr_ssn,Mgr_start_date) VALUES ('Research',5,NULL,'1988-05-22');
INSERT INTO department (Dname,Dnumber,Mgr_ssn,Mgr_start_date) VALUES ('Administration',4,NULL,'1995-01-01');
INSERT INTO department (Dname,Dnumber,Mgr_ssn,Mgr_start_date) VALUES ('Headquarters',1,NULL,'1981-06-19');
/*
--Populating dept_locations table
*/
INSERT INTO dept_locations(Dnumber_dept_loc, Dlocation) VALUES(1, 'Huston');
INSERT INTO dept_locations(Dnumber_dept_loc, Dlocation) VALUES(4, 'Stafford');
INSERT INTO dept_locations(Dnumber_dept_loc, Dlocation) VALUES(5, 'Bellaire');
INSERT INTO dept_locations(Dnumber_dept_loc, Dlocation) VALUES(5, 'Sugarland');
INSERT INTO dept_locations(Dnumber_dept_loc, Dlocation) VALUES(5, 'Huston');
/*
--Populating project table
*/
INSERT INTO project (Pname, Pnumber, Plocation, Dnum) VALUES('ProductX', 1, 'Bellaire', NULL);
INSERT INTO project (Pname, Pnumber, Plocation, Dnum) VALUES('ProductY', 2, 'Sugarland', NULL);
INSERT INTO project (Pname, Pnumber, Plocation, Dnum) VALUES('ProductZ', 3, 'Huston', NULL);
INSERT INTO project (Pname, Pnumber, Plocation, Dnum) VALUES('Computerization', 10, 'Stafford', NULL);
INSERT INTO project (Pname, Pnumber, Plocation, Dnum) VALUES('Reorganization', 20, 'Huston', NULL);
INSERT INTO project (Pname, Pnumber, Plocation, Dnum) VALUES('Newbenifits', 30, 'Stafford', NULL);
/*
--Populating works_on table
*/
INSERT INTO works_on (Essn, Pno, Hours) VALUES(123456789, 1, 32.5);
INSERT INTO works_on (Essn, Pno, Hours) VALUES(123456789, 2, 7.5);
INSERT INTO works_on (Essn, Pno, Hours) VALUES(666884444, 3, 40.0);
INSERT INTO works_on (Essn, Pno, Hours) VALUES(453453453, 1, 20.0);
INSERT INTO works_on (Essn, Pno, Hours) VALUES(453453453, 2, 20.0);
INSERT INTO works_on (Essn, Pno, Hours) VALUES(333445555, 2, 10.0);
INSERT INTO works_on (Essn, Pno, Hours) VALUES(333445555, 3, 10.0);
INSERT INTO works_on (Essn, Pno, Hours) VALUES(333445555, 10, 10.0);
INSERT INTO works_on (Essn, Pno, Hours) VALUES(333445555, 20, 10.0);
INSERT INTO works_on (Essn, Pno, Hours) VALUES(999887777, 30, 30.0);
INSERT INTO works_on (Essn, Pno, Hours) VALUES(999887777, 10, 10.0);
INSERT INTO works_on (Essn, Pno, Hours) VALUES(987987987, 10, 35.0);
INSERT INTO works_on (Essn, Pno, Hours) VALUES(987987987, 30, 5.0);
INSERT INTO works_on (Essn, Pno, Hours) VALUES(987654321, 30, 20.0);
INSERT INTO works_on (Essn, Pno, Hours) VALUES(987654321, 20, 15.0);
INSERT INTO works_on (Essn, Pno, Hours) VALUES(888665555, 20, NULL);
/*
--Populating dependent table
*/
INSERT INTO dependent (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES(333445555, 'Alice', 'F', '1986-04-05', 'Daughter');
INSERT INTO dependent (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES(333445555, 'Theodore', 'M', '1983-10-25', 'Son');
INSERT INTO dependent (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES(333445555, 'Joy', 'F', '1958-05-03', 'Spouse');
INSERT INTO dependent (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES(987654321, 'Abner', 'M', '1942-02-28', 'Spouse');
INSERT INTO dependent (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES(123456789, 'Michael', 'M', '1988-08-04', 'Son');
INSERT INTO dependent (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES(123456789, 'Alice', 'F', '1988-12-30', 'Daughter');
INSERT INTO dependent (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES(123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');

