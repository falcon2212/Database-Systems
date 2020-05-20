SELECT fname,minit,lname,ssn,bdate,address,sex,salary,super_ssn,dno FROM employee ORDER BY ssn;
SELECT fname AS 'First Name',lname AS 'Last Name' FROM employee ORDER BY fname; 

SELECT ssn AS SSN , fname AS 'First Name' , bdate AS 'Date of Birth' FROM employee  ORDER BY ssn; 
SELECT essn FROM works_on WHERE pno = 2 ORDER BY essn;
SELECT DISTINCT essn, pno FROM works_on ORDER BY pno;





11 
SELECT * FROM dependent WHERE sex = 'M' AND essn = '333445555';
12
SELECT concat(fname,' ',minit,' ',lname) AS 'full name' FROM employee WHERE dno IN (5,1) ORDER BY fname;
13
select ssn, salary from employee where salary between 30000 and 50000 order by ssn;
14
select ssn, salary/12 from employee where salary/12 between 3000 and 4000 order by ssn;
15
select ssn from employee where super_ssn in (333445555, 987654321) order by ssn;


17
select pname from project where pname like 'Product%' order by pname;
18
select ssn from employee where super_ssn is NULL order by ssn;
19
select essn from works_on where hours is null and pno = 20 order by essn;
20
select ssn from employee where super_ssn is not null order by ssn;
21
SELECT ssn, concat(fname,' ',minit,' ',lname) AS 'Full Name' FROM employee ORDER BY salary desc;
22
select ssn, dno, salary/12 from employee order by dno,salary/12 desc;
23
select max(salary), min(salary), count(salary), avg(salary), sum(salary) from employee;
24
select count(distinct pno) from works_on;
25
select sum(hours) from works_on;
30
select count(*), sum(salary), avg(salary) from employee;

select sum(hours) from works_on group by pno;

select essn,count(dependent_name) from dependent group by essn;

select min(hours) from works_on;

--select dnumber as dno, avg(salary) from department group by dnumber having avg(salary)>35000;
select dno, avg(salary) from employee group by dno having avg(salary)>35000;

select pno from works_on group by pno having sum(hours)>=10;

select distinct essn from works_on group by pno,essn having sum(hours)>=10;

select pno from works_on where sum(hours)>10;

select essn from works_on,project where pname = 'ProductX' and pno = pnumber order by essn; 

select essn,pno from works_on group by pno having sum(hours)>=10;

select 
select distinct fname from employee where ssn in (select distinct essn from works_on group by pno,essn having sum(hours)>=10) order by fname;

select ssn from employee where ssn in (select distinct essn from works_on group by essn having sum(hours)>=10) order by ssn;


select essn from works_on where pno in (select pnumber from project where pname like 'Product%') order by essn;

select dnumber from department group by dnumber;

select dno,avg(salary) as averageSalary from employee group by dno order by dno;

select fname from employee e,(select dno,avg(salary) as averageSalary from employee group by dno order by dno) vt where e.dno = vt.dno and salary>vt.averageSalary order by e.fname; 

select d.dnumber, d.dname, dt.dlocation from department d, dept_locations dt;

select * from employee e ,dependent d, dept_locations dl where e.ssn = d.essn and e.dno = dl.dnumber order by e.ssn;

select * from employee e ,department d, dept_locations dl where e.dno = d.dnumber and e.dno = dl.dnumber order by e.ssn;

select * from employee e, works_on w, project p where e.ssn = w.essn and w.pno = p.pnumber order by e.ssn;
select dlocation from (select dlocation from dept_locations d order by d.dlocation) union all (select plocation as dlocation from project p) t group by dlocation order by dlocation;
select 

1)
a. SELECT * FROM employee;
b. 
c. SELECT fname,lname,bdate,sex AS personalinfo FROM employee;
d. SELECT fname,lname,bdate,sex AS personalinfo FROM employee e;
2)
a. SELECT essn from works_on;
b. SELECT[DISTINCT] essn FROM works_on;
c. SELECT[DISTINCT] essn,pno FROM works_on;
3)
a. SELECT ssn,salary/12 AS montly_salary FROM employee;
b. SELECT ssn,concat(fname,minit,lname) AS full_name,bdate AS date_of_birth FROM employee;
4)
a. SELECT essn,pno FROM work_on WHERE pno = 2;
b. SELECT * FROM dependent WHERE sex = 1 and essn = 333445555;
c. SELECT concat(fname,minit,lname) AS full_name FROM employee WHERE dno = 5 or dno = 1;
5)
a. SELECT ssn,salary from employee where salary>=30000 and salary<=50000;
b. SELECT ssn, salary/12 as monthly_salary from employee where salary/12>=3000 and salary/12<=4000;

   select ssn from employee where super_ssn =333445555 or super_ssn = 987654321;
   SELECT ssn,salary from employee where salary in (30000,40000);   
   
   
   select concat(fname,' ',minit,' ',lname) as full_name from employee where ssn in (select essn as avg_hours from works_on where (select AVG(hours)>=10 from works_on));
   select concat(fname,' ',minit,' ',lname) as full_name from employee where ssn in (select essn from works_on where hours >= 10.0);
   
   select fname from left join employee e,dependent d where e.ssn = d.essn;
  
  
  
6)
a. SELECT ssn,super_ssn
   FROM employee
   WHERE super_ssn IN (333445555, 987654321);
b. SELECT ssn, super_ssn
   FROM employee
   WHERE super_ssn NOT IN (333445555, 987654321);

7)
   SELECT pname
   FROM projects
   WHERE pname LIKE 'Product%';
8)
a. SELECT ssn, super_ssn
   FROM employee
   WHERE super_ssn IS NULL;
      
a. 
        SELECT * 
        FROM works_on
        WHERE pno = 20 AND hours IS NULL;


SELECT * FROM employee ORDER BY ssn ASEC;   
