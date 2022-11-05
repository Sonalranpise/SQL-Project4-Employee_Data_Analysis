-- Employee Data Analysis project - sonal ranpise
-- DESCRIPTION:
-- An HR of the company wants to extract, update, and delete employee details to maintain their records.
-- Objective:
-- The database design helps to calculate the monthly payroll of each employee efficiently.

-- Task to be performed: 
-- TASK:01
-- Write a query to create an employee table with the fields employee id, first name, last name, job id, salary, manager id, and department id.
CREATE DATABASE employee_datasets;
USE employee_datasets;
CREATE TABLE IF NOT EXISTS employee_datasets.employee_table
(
emp_id INT PRIMARY KEY NOT NULL,
f_name VARCHAR (100) NOT NULL,
l_name VARCHAR (100) NOT NULL,
job_id VARCHAR (100) NOT NULL,
salary INT NOT NULL,
manager_id VARCHAR (100) NOT NULL,
dept_id VARCHAR (100) NOT NULL
)
ENGINE = INNODB;
DESCRIBE employee_datasets.employee_table;

-- TASK:02
-- Write a query to insert values into the employee table.
INSERT INTO employee_datasets.employee_table (emp_id,f_name,l_name,job_id,salary,manager_id,dept_id)
VALUES
("101","ankit","jain","HP124","200000","2","24"),
("102","sarvesh","patel","HP123","150000","2","24"),
("103","krishna","gee","HP125","500000","5","44"),
("104","rana","gee","HP122","250000","3","54"),
("105","soniya","jain","HP121","400000","1","22"),
("106","nithin","kumar","HP120","300000","4","34"),
("107","karan","patel","HP126","300001","2","34"),
("108","shilpa","jain","HP127","300001","5","24"),
("109","mukesh","singh","HP128","300001","4","44");
SELECT * FROM employee_datasets.employee_table;

-- TASK:03
-- Write a query to find the first name and salary of the employee whose salary is higher than the employee with the last name Kumar from the employee table.
SELECT f_name, l_name FROM  employee_datasets.employee_table WHERE salary > ( SELECT salary FROM employee_datasets.employee_table WHERE l_name = "Kumar");

-- TASK:04
-- Write a query to display the employee id and last name of the employee whose salary is greater than the average salary from the employee table.
SELECT emp_id, l_name, salary FROM employee_datasets.employee_table WHERE salary > (SELECT AVG(salary) FROM employee_datasets.employee_table);

-- TASK:05
-- Write a query to display the employee id, first name, and salary of the employees who earn a salary that is higher than the salary of all the shipping clerks (JOB_ID = HP122). 
-- Sort the results of the salary in ascending order.
SELECT emp_id, f_name, salary FROM employee_datasets.employee_table WHERE salary > ( SELECT salary FROM employee_datasets.employee_table WHERE job_id = "HP122")  ORDER BY salary;

-- TASK:06
-- Write a query to display the first name, employee id, and salary of the first three employees with highest salaries.
SELECT DISTINCT emp_id ,f_name,salary FROM employee_datasets.employee_table a WHERE 3>=
(SELECT COUNT(DISTINCT salary) FROM employee_datasets.employee_table b WHERE b.salary >= a.salary) ORDER BY a.salary DESC;
-- OR
SELECT DISTINCT emp_id , f_name,salary FROM employee_datasets.employee_table ORDER BY salary asc LIMIT 3 OFFSET 6 ;

DROP DATABASE employee_datasets;


