alter table employee
	add constraint fk_super_ssn FOREIGN KEY (super_ssn) REFERENCES employee(ssn);
alter table employee
	add constraint fk_Dno FOREIGN KEY (Dno) REFERENCES department(Dnumber);
alter table department
	add constraint fk_Mgr_ssn FOREIGN KEY (Mgr_ssn) REFERENCES employee(ssn);
alter table dept_locations
 	add constraint fk_Dnumber_dept_loc FOREIGN KEY (Dnumber_dept_loc) REFERENCES department(Dnumber);
alter table project
	add constraint fk_Dnum FOREIGN KEY (Dnum) REFERENCES department(Dnumber); 	
alter table works_on
	add constraint fk_Essn FOREIGN KEY (Essn) REFERENCES employee(ssn);
alter table works_on
	add constraint fk_Pno FOREIGN KEY (Pno) REFERENCES project(Pnumber);
alter table dependent
	add constraint fk_dependent_Essn FOREIGN KEY (Essn) REFERENCES employee(ssn);
