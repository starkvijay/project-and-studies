create database project;
use project;
create table emp_table2( emp_id int not null primary key, emp_name varchar(20), job varchar(10), MGR int null, 
hire_date date , salary int not null, commission int null , dept_no int not null);
describe emp_table2;
insert into emp_table2(emp_id, emp_name, job, MGR, hire_date, salary, commission, dept_no) values
(7369,	'SMITH',	'CLERK',	7902,	1980-12-17,	800,	Null,	20),
(7499,	'ALLEN',	'SALESMAN',	7698,	1981-02-20,	1600,	300,	30),
(7521,	'WARD',	'SALESMAN',	7698,	1981-02-22,	1250,	500,	30),
(7566,	'JONES',	'MANAGER',	7839,	1981-04-02,	2975,	Null,	20),
(7654,	'MARTIN',	'SALESMAN',	7698,	1981-09-28,	1250,	Null,	30),
(7698,	'BLAKE',	'MANAGER',	7839,	1981-05-01,	2850,	1400,	30),
(7782,	'CLARK',	'MANAGER',	7839,	1981-06-09,	2450,	Null,	10),
(7788,	'SCOTT',	'ANALYST',	7566,	1982-12-09,	3000,	Null,	20),
(7839,	'KING',	'PRESIDENT',	Null,	1981-11-17,	5000,	Null,	10),
(7844,	'TURNER',	'SALESMAN',	7698,	1981-09-08,	1500,	0,	30),
(7876,	'ADAMS',	'CLERK',	7788,	1983-01-12,	1100,	Null,	20),
(7900,	'JAMES',	'CLERK',	7698,	1981-12-03,	950,	Null,	30),
(7902,	'FORD',	'ANALYST',	7566,	1981-12-03,	3000,	Null,	20),
(7934,	'MILLER',	'CLERK',	7782,	1982-01-23,	1300,	Null,	10);
select * from emp_table2;
-- 1. List the Enames those are starting with ‘S’ and with five characters.
select emp_name from emp_table2 where char_length(emp_name)=5 and emp_name like 's%';
-- 2 .List the Five character names starting with ‘S’ and ending with ‘H’.
select * from emp_table2 where char_length(emp_name)=5 and  emp_name like 's%H';
-- 3. List the emps who joined in January.
select * from emp_table2 emp_name where hire_date=1982-01-23 ;
-- 4. List the count of salary
select count(salary) as total_count from emp_table2;
-- 5. List the Average of salary
select avg(salary) as salary_avg from emp_table2;
-- 6. List the Minimum of salary
select min(salary) as min_sal from emp_table2;
-- 7. List employee name and MGR from employe table
select emp_name, MGR from emp_table2;
-- 8. List the count of MGR and job and using group by
select count(MGR), job from emp_table2 group by job;
-- 9. List the Maximum of salary,job using group by and salary in asc order
select max(salary), job from emp_table2 group by job order by count(salary) asc;
-- 10. List the count of salary and salary range must be less than 3000
select count(salary), emp_name, salary from emp_table2 group by emp_name,salary, salary > 3000 ;
-- 11. List the emps whose Sal is four digit number ending with Zero?
select * from emp_table2 where char_length(salary)=4 and salary like "%0";
-- 12. List the emps who does not belong to Deptno 20?
select * from emp_table2 where dept_no not like "20";
-- 13. List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries?
select * from emp_table2 where job = "president" or MGR order by salary asc;
-- 14. . List the emps who are working under ‘MGR’
select emp_name, MGR from emp_table2 where  MGR;
-- 15. List all the Clerks of Deptno 20?
select * from emp_table2 where dept_no ="20" and job like'clerk';
-- 16. Display the details of SMITH?
select * from emp_table2 where emp_name like "smith";

create table dep_table (dep_no int not null, dep_name varchar(10), Location varchar(15));
insert into dep_table (dep_no, dep_name, Location) values
(10, "Accounting", "Newyork"),
(20, "RESEARCH", "Dallas"),
(30, "SALES", "Chicago"),
(40, "OPERATORS", "Boston");

select * from dep_table;
-- 17. join the two tables of employee table and dept table
select emp_table2.emp_id, emp_table2.emp_name, emp_table2.job, emp_table2.MGR, emp_table2.Hire_date, emp_table2.salary, 
emp_table2.commission, emp_table2.dept_no, dep_table.dep_no, dep_table.dep_name, dep_table.Location
from emp_table2 join dep_table on emp_table2.dept_no=dep_table.dep_no; 
/* 18. List the total information of EMP table along with 
DNAME and Loc of all the emps Working Under 
‘ACCOUNTING’ & ‘RESEARCH’ in the asc Deptno?*/
 
 select emp_table2.emp_id, emp_table2.emp_name, emp_table2.job, emp_table2.MGR, emp_table2.Hire_date, emp_table2.salary, 
emp_table2.commission, emp_table2.dept_no, dep_table.dep_no, dep_table.dep_name, dep_table.Location
from emp_table2 inner join dep_table on emp_table2.dept_no=dep_table.dep_no where dep_name not like "'sales','operators'" order by dep_no asc;






