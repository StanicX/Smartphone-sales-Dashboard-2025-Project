create table Employee(
Name varchar(30),
Address varchar(30),
Salary int,
Age int);

-- alter command
alter table employee
add gender varchar(2);

desc employee;

insert into employee
values ('Franklin','MP',100000,20,'M');

insert into employee
values
('Suresh','Ghaziabad',30000,21,'M'),
('Rinki','Delhi',40000,21,'F'),
('Micheal','Mumbai',70000,21,'M'),
('Suhani','Indore',20000,21,'F'),
('Suresh','Pune',90000,21,'M');


select * from employee

update employee
set Address = 'mp'
where name = 'Franklin';

SET SQL_SAFE_UPDATES = 0;

show binlog events;

-- count case
select
count(case when Salary >= (select avg(Salary) from employeedata) then Employee end) as good_sal
from employeedata;

-- subquery
-- show all the distinct departments
select distinct Department from employeedata;

# Find out the total employees who work in Finance departmnet
select count(Employee) as EmployeeCount
from employeedata
where Department='Finance';

-- show all employees from Calfornia
select Employee from employeedata
where Location = 'California';

-- get the employees name in descending order salary wise 
select Employee, Salary from employeedata
order by Salary desc;

-- select top 5 earner of Technlogy Department
select Employee, Salary
from employeedata
where Department = 'Technology'
order by Salary desc
limit 5;

select
count(case when salary >= (select avg(Salary) from employeedata) then Employee end) as good_sal
from employeedata;

-- To Retrieve the lowest salary in the company Employeedata
select Employee , Department , Salary
from employeedata
where salary = (select min(Salary) as lowest_salary from employeedata);

select Employee
from employeedata
where salary = (select max(Salary) as lowest_salary from employeedata);

-- count the number of employee who are earning more than 60000 dollers
SELECT COUNT(employee) 
FROM employeedata
WHERE salary > 60000;

-- count the number of epmloyee hired after 2010

SELECT COUNT(*) AS employees_hired_after_2010
FROM employeedata
WHERE 'Datehired' > '2010-12-31';

-- Grouping
-- calculate the average salary of male and female employees
select sex, avg(salary) as average_salary
from employeedata
group by sex;

--  get the location of the highest number of employees
select location, count(*) as Employee_count
from employeedata
group by location
order by employee_count DESC;

-- Show the total salary of the employees for each location
select location, sum(salary) as salary_count
from employeedata
group by location;


-- Calculate the diference between highest and lowest salaries
select max(salary) - min(salary) AS salary_difference
FROM employeedata;


-- Retrieve employees with salaries in top 10%
SELECT *
FROM employeedata
WHERE salary >= (
    SELECT salary
    FROM employeedata
    ORDER BY salary DESC
    LIMIT 1 OFFSET (SELECT FLOOR(COUNT(*) * 0.1) FROM employeedata)
);




-- Find the Department with Highest average salary
select department, avg(salary) as average_salary
from employeedata
group by department
order by average_salary DESC
LIMIT 1;

-- select the departments whose average salary is greater than the marketing departmnet
select department, avg(salary) as avg_salary
from employeedata
group by department
having avg_salary > (
    select avg(salary) FROM employeedata
    WHERE department = 'Marketing'
);


-- count if then case

