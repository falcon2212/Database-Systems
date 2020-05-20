alter table employee
	drop FOREIGN KEY fk_super_ssn;
alter table employee
	drop FOREIGN KEY fk_Dno;
alter table department
	drop FOREIGN KEY fk_Mgr_ssn;
alter table dept_locations
 	drop FOREIGN KEY fk_Dnumber_dept_loc; 
alter table project
	drop FOREIGN KEY fk_Dnum; 	
alter table works_on
	drop FOREIGN KEY fk_Essn;
alter table works_on
	drop FOREIGN KEY fk_Pno;
alter table dependent
	drop FOREIGN KEY fk_dependent_Essn; 
drop table employee;
drop table department;
drop table dept_locations;
drop table project;
drop table works_on;
drop table dependent;
