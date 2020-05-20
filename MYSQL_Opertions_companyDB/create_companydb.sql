drop database company_db;
create database company_db;
use company_db;

create table department(
Dname varchar(30),
Dnumber integer NOT NULL, 
Mgr_ssn integer,
Mgr_start_date DATE,
constraint pk_department PRIMARY KEY (Dnumber)
);

create table works_on(
 Essn integer NOT NULL,
 Pno integer NOT NULL,
 Hours float,
 constraint pk_works_on PRIMARY KEY (Essn, Pno)
 );

create table dependent(
 Essn integer NOT NULL,
 Dependent_name varchar(30) NOT NULL,
 Sex varchar(1),
 Bdate date,
 Relationship varchar(30),
 constraint pk_dependent PRIMARY KEY (Essn, Dependent_name)
);

create table dept_locations(
	-- dept_loc_ID integer NOT NULL,
	Dnumber_dept_loc integer NOT NULL,
	Dlocation varchar(30) NOT NULL,
	constraint pk_dept_locations PRIMARY KEY (Dnumber_dept_loc, Dlocation)
	);
create table project(
	Pname varchar(30),
	Pnumber integer NOT NULL,
	Plocation varchar(30),
	Dnum integer,
	constraint pk_pnumber PRIMARY KEY (Pnumber)
	); 

create table employee(
	Fname varchar(30),
	Minit varchar(1),
	Lname varchar(30),
	Ssn integer NOT NULL,
	Bdate date,
	Address varchar(100),
	Sex varchar(1),
	Salary integer,
	Super_ssn integer,
	Dno integer,
	constraint pk_employee PRIMARY KEY (Ssn)
);

-- insert into dept_locations values(1,"NewYork");
