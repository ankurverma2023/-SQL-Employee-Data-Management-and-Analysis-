Create Database Emp
use Emp
--Department Table Create
Create table Department
(
PKDeptid int primary key,
DeptName Varchar(14) not null,
Location Varchar(13) not null
)
INSERT into Department Values(101, 'Production', 'Uttar Pradesh')
INSERT into Department Values(102, 'Admin', 'Delhi'),
(103, 'IT', 'Noida'),
(104, 'Marketing', 'Greater Noida'),
(105, 'Purchasing', 'Gurgaon'),
(106, 'Sales', 'Mansear'),
(107, 'Shipping', 'Dadri'),
(108, 'HR', 'Delhi'),
(109, 'Corporate Tax', 'Gurgaon'),
(110, 'Executive', 'Noida')

Select * from Department

--------------------------------------------------------------------------------------------------------------------------------

--Employee Table Create
Create table Employee
(
PKEMPID int primary key,
EmpName Varchar(10) Not null,
Job Varchar(9) Not null,
Manager Integer Null,
HireDate DateTime Not Null,
Salary Decimal(7,2) Not Null,
Commission Decimal(7,2) Null,
PKDeptid Integer References Department(PKDeptid)
)

-- Modify the Employee table to increase the lenght of the job column
ALTER TABLE Employee
ALTER COLUMN JOB VARCHAR(25) NOT NULL

-- Inserting data into Employee table
INSERT INTO Employee VALUES (1, 'John doe', 'Production', NULL, '2024-01-01', 50000, NULL, 101)
INSERT INTO Employee VALUES (2, 'Rocky', 'Admin', NULL, '2023-12-15', 35000, NULL, 102),
(3, 'Pollard', 'IT', NULL, '2023-11-14', 45000, NULL, 103),
(4, 'Smith', 'Marketing', NULL, '2024-01-15', 42500, NULL, 104),
(5, 'Rohit', 'Purchasing', NULL, '2022-06-25', 48900, NULL, 105),
(6, 'Vikas', 'Sales', NULL, '2022-08-13', 28700, NULL, 106),
(7, 'Suraj', 'Shipping', NULL, '2024-02-19', 36890, NULL, 107),
(8, 'Vivek', 'HR', NULL, '2023-09-08', 49700, NULL, 108),
(9, 'Lokesh', 'Corporate Tax', NULL, '2023-05-03', 32490, NULL, 109),
(10, 'Sonu', 'Executive', NULL, '2024-03-01', 23549, NULL, 110)

-- Displaying all records from Employee table
 Select * from Employee

----------------------------------------------------------------------------------------------------------------

-- The SQL SELECT DISTINCT Statement
-- The SELECT DISTINCT statement is used to return only distinct (different) values.

SELECT DISTINCT PKDeptid, Job
from Employee

------------------------------------------------------------------------------------------------------------------

-- SQL WHERE CLAUSE
-- THE WHERE CLAUSE IS USED TO FILTER RECORDS
-- It is used to extract only those records that fulfill a specified condition.

SELECT * FROM Employee
WHERE Job = 'IT'

SELECT * FROM Employee
WHERE Job = 'IT'
AND Salary > 40000

----------------------------------------------------------------------------------------------------------------

-- The SQL ORDER BY
-- The ORDER BY keyword is used to sort the result-set in ascending or descending order.

SELECT * FROM Employee
ORDER BY Salary DESC

SELECT * FROM Employee
ORDER BY PKDeptid ASC, HireDate DESC

---------------------------------------------------------------------------------------------------------------

-- SQL AND OPERATOR
-- The AND operator is used to combine multiple conditions in a SQL statement.
-- It retrieves records where all the specified conditions are true.

SELECT * FROM Employee
WHERE Job = 'Marketing' and Salary > 40000

SELECT * FROM Employee
WHERE Job = 'Executive' and Salary < 40000

-- OR Operator:
-- The OR operator is used to retrieve records that meet at least one of the specified conditions in a SQL statement.

SELECT * FROM Employee
WHERE Job = 'IT' OR Salary > 40000

SELECT * FROM Employee
WHERE Job = 'Shipping' OR Salary < 40000

--  NOT Operator:
-- The NOT operator is used to negate a condition in a SQL statement. 
-- It retrieves records that do not meet the specified condition.

SELECT * FROM Employee
WHERE NOT Job = 'IT'

SELECT * FROM Employee
WHERE NOT Job = 'Admin'

-----------------------------------------------------------------------------------------
-- SQL SELECT TOP CLAUSE
-- The SELECT TOP clause is used to specify the number of records to return.

SELECT TOP 5 * FROM Employee

-- Usage with ORDER BY: To retrieve a specific number of rows from a result set based on certain criteria, 
-- you can combine SELECT TOP with ORDER BY.

SELECT TOP 3 * FROM Employee
ORDER BY Salary DESC	

-- Percentage Usage: You can also use the SELECT TOP clause to retrieve a percentage of rows from a result set.

SELECT TOP 10 PERCENT * FROM Employee
ORDER BY HireDate DESC

---------------------------------------------------------------------------------------------------------------
-- SQL Aggregate Functions , MIN, Max, Avg, Count, Sum
-- An aggregate function is a function that performs a calculation on a set of values, and returns a single value

--COUNT(): Counts the number of rows in a specified column or the number of rows that meet a certain condition

SELECT COUNT(*) FROM Employee

--SUM(): Calculates the sum of values in a specified column.

SELECT SUM(SALARY) FROM Employee

-- AVG(): Calculates the average of values in a specified column

SELECT AVG(Salary) from Employee

-- MIN(): Finds the minimum value in a specified column.

select MIN(SALARY) FROM Employee

-- MAX(): Finds the maximum value in a specified column

SELECT MAX(SALARY) FROM Employee
----------------------------------------------------------------------------------------------------------------------------
-- GROUP BY: Groups rows that have the same values into summary rows, such as "find the total sales by department"
-- he Group By statement is used to group together any rows of a column with the same value stored in them, 
-- Based on a function specified in the statement

SELECT DeptName, SUM(Salary) AS TotalSalary
from Employee
join Department ON Employee.PKDeptid = Department.PKDeptid
Group by DeptName

-- HAVING: Filters groups based on specified conditions. 
-- It's similar to the WHERE clause but applies to groups defined by GROUP BY

SELECT DeptName, AVG(Salary) AS AVGSalary
from Employee
join Department ON Employee.PKDeptid = Department.PKDeptid
Group by DeptName 
Having AVG(SALARY) > 40000

----------------------------------------------------------------------------------------------------------
-- IN OPERATOR
-- The IN operator allows you to specify multiple values in a WHERE clause

SELECT * FROM Employee
WHERE Job IN ('IT', 'ADMIN', 'HR')

SELECT * FROM Employee
WHERE Salary IN (SELECT Salary FROM Employee WHERE Job = 'Marketing')

-----------------------------------------------------------------------------------------------------------
-- Range OPERATOR
-- BETWEEN and NOT BETWEEN operators are used to filter results based on a specified range of values.
-- These operators are commonly used with numerical, date, or timestamp data types.

--Between
SELECT * FROM Employee
WHERE HireDate BETWEEN '2023-01-01' AND '2023-12-31'

SELECT * FROM Employee
WHERE Salary Between 40000 AND 50000

--Not Between
SELECT * FROM Employee
WHERE HireDate NOT BETWEEN '2023-01-01' AND '2023-12-31'

SELECT * FROM Employee
WHERE Salary NOT BETWEEN 30000 AND 60000
-------------------------------------------------------------------------------------------------------------
-- The Comparison - relational operators > (greater than) and < (less than) are used to compare values in a WHERE clause.
-- These operators allow you to filter rows based on whether a certain condition is true or false

-- GREATER THEN >
SELECT * FROM Employee
WHERE Salary > 50000

SELECT * FROM Employee
WHERE HireDate > '2023-01-01'

--LESS THEN <
SELECT * FROM Employee
WHERE Salary < 40000

SELECT * FROM Employee
WHERE HireDate < '2023-01-01'
-----------------------------------------------------------------------------------------------------------
--  logical operators AND, OR, and NOT are used to combine multiple conditions,
--  in a WHERE clause to filter rows from a table. 

-- AND OPERATOR
SELECT * FROM Employee
WHERE Salary > 40000
AND HireDate > '2023-01-01'

-- OR OPERATOR
SELECT * FROM Employee
WHERE JOB = 'IT'
OR JOB  = 'ADMIN'

-- NOT OPERATOR
SELECT * FROM Employee
WHERE NOT Job < 'IT'

-- This query retrieves all employees with salaries less than 40000 or those hired before January 1, 2023.
SELECT * FROM Employee
WHERE Salary < 40000
OR HireDate < '2023-01-01'
-----------------------------------------------------------------------------------------------------------------

-- SQL aliases are used to give a table, or a column in a table, a temporary name.
-- Aliases are often used to make column names more readable.
-- An alias is created with the AS keyword.

SELECT EmpName AS EmployeeName, Salary AS MonthlySalary
FROM Employee

-- Table Alias
-- Retrieve employee names and their department names, using table aliases

SELECT e.EmpName, d.DeptName
FROM Employee e
JOIN Department d ON e.PKDeptid = d.PKDeptid

-- Alias in Aggregiate Functions
SELECT AVG(SALARY) AS AverageSalary
FROM Employee

-- Alias With Calculated columns
SELECT EmpName, Salary * 12 AS AnnualSalary
FROM Employee
-------------------------------------------------------------------------------------------------------
-- Joins In SQL Queries
-- A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
-- The INNER JOIN keyword selects records that have matching values in both tables.

SELECT e.EmpName, d.DeptName
FROM Employee e
INNER JOIN Department d ON e.pkdeptid = d.PKDeptid

-- LEFT JOIN
-- The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2). 
-- The result is 0 records from the right side, if there is no match.

SELECT e.EmpName, d.DeptName
FROM Employee e
LEFT JOIN Department d ON e.pkdeptid = d.PKDeptid

-- RIGHT JOIN
-- The RIGHT JOIN keyword returns all records from the right table (table2), 
-- and the matching records from the left table (table1). The result is 0 records from the left side, if there is no match.

SELECT e.EmpName, d.DeptName
FROM Employee e
RIGHT JOIN Department d ON e.pkdeptid = d.PKDeptid


-- FULL JOIN
-- The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.
-- FULL OUTER JOIN and FULL JOIN are the same

SELECT e.EmpName, d.DeptName
FROM Employee e
FULL JOIN Department d ON e.pkdeptid = d.PKDeptid
----------------------------------------------------------------------------------------------------------------------------

-- UNION OPERATOR
-- The UNION operator is used to combine the result sets of two or more SELECT statements into a single result set.
-- The UNION operator removes duplicate rows by default. If you want to include duplicate rows, 
-- you can use the UNION ALL operator

SELECT EmpName, NULL AS PKEMPID, 'Employee' AS Type
FROM Employee

UNION

SELECT DeptName AS EmpName, PKDeptid, 'Manager' AS Type
FROM Department
---------------------------------------------------------------------------------------------------------------------------

-- GROUP BY
-- The GROUP BY clause is used to group the same values and return a summary result
-- The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()),
--  to group the result-set by one or more columns

SELECT d.DeptName, COUNT(e.PKEMPID) AS EmployeeCount
FROM Employee e
JOIN Department d ON e.PKDeptid = d.PKDeptid
GROUP BY d.DeptName

SELECT d.DeptName, MAX(e.PKEMPID) AS EmployeeCount
FROM Employee e
JOIN Department d ON e.PKDeptid = d.PKDeptid
GROUP BY d.DeptName

SELECT d.DeptName, MIN(e.PKEMPID) AS EmployeeCount
FROM Employee e
JOIN Department d ON e.PKDeptid = d.PKDeptid
GROUP BY d.DeptName

SELECT d.DeptName, AVG(e.PKEMPID) AS EmployeeCount
FROM Employee e
JOIN Department d ON e.PKDeptid = d.PKDeptid
GROUP BY d.DeptName

SELECT d.DeptName, SUM(e.PKEMPID) AS EmployeeCount
FROM Employee e
JOIN Department d ON e.PKDeptid = d.PKDeptid
GROUP BY d.DeptName
----------------------------------------------------------------------------------------------------------------

-- The SQL HAVING Clause
-- The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
-- HAVING in SQL is used to filter groups of rows based on specified conditions after the GROUP BY clause has been applied.

SELECT PKDeptid, AVG(Salary) AS AVG_SALARY
FROM Employee
GROUP BY PKDeptid
HAVING AVG(SALARY) > 27000
------------------------------------------------------------------------------------------------------------------------

-- The SQL ALL Operator
-- The SQL ALL operator is used to compare a value with all values returned by a subquery.

SELECT EmpName, Salary
FROM Employee
WHERE Salary > All (SELECT Salary FROM Employee WHERE PKDeptid = 104)
---------------------------------------------------------------------------------------------------------------

-- The SQL CASE Expression
-- The SQL CASE expression is used to evaluate conditions and return a value based on those conditions.
-- It works similar to the IF...ELSE statement in other programming languages

SELECT EmpName,
       Salary,
	   CASE
	       WHEN Salary >= 40000 Then 'High'
		   WHEN Salary >= 25000 AND Salary < 50000 Then 'Medium'
		   ELSE 'LOW'
		END AS SalaryCategory
FROM Employee


SELECT EmpName,
       HireDate,
	   CASE
	       WHEN DATEDIFF(Year, HireDate, GETDATE()) >= 5 Then 'Long Term'
		   WHEN DATEDIFF(Year, HireDate, GETDATE()) >= 2 Then 'Mid Term'
		   ELSE 'Short Trem'
		END AS Tenure
FROM Employee
--------------------------------------------------------------------------------------------------------------------

-- The SQL INSERT INTO SELECT Statement
-- The SQL INSERT INTO SELECT statement is used to copy data from one table and insert it into another table.
-- It allows you to select data from one or more tables and insert it into another table in a single statement

INSERT INTO Employee(PKEMPID, EmpName, Salary, Job)
SELECT PKEMPID, EmpName, Salary, 'Job'
FROM Employee
WHERE Salary > 40000

ALTER TABLE Employee
ALTER COLUMN Job VARCHAR(25) Null

Select * From Employee
------------------------------------------------------------------------------------------------------------------------
-- SQL NULL Functions
-- SQL IFNULL(), ISNULL(), COALESCE(), and NVL() Functions

-- IS NULL: This function checks whether a value is NULL.

SELECT * FROM EMPLOYEE WHERE Manager IS NULL

-- IS NOT NULL: This function checks whether a value is not NULL.

SELECT * FROM Employee WHERE Manager IS NOT NULL

-- COALESCE: This function returns the first non-NULL value in a list of expressions.

SELECT COALESCE(Commission, 0) from Employee

-- NULLIF: This function compares two expressions,
-- If they are equal, it returns NULL. Otherwise, it returns the first expression

SELECT NULLIF(Salary, 0) from Employee

-------------------------------------------------------------------------------------------------------------
-- How to create View
use Emp
SELECT * FROM Employee

-- How to create View
Create View Msbi
as
  SELECT * FROM Employee

SELECT * FROM Msbi


Create View Msbi1
as
 select EmpName, Salary
 from Employee

 -- How to Alter the View
 Alter View Msbi1
 as
 Select PKEMPID, EmpName, Salary
 from Employee

 SELECT * FROM Msbi1

 -- How to Drop View
 drop view Msbi1
 --------------------------------------------------------------------------
 -- How to Create Schema
 -- Schema is One kind of container which store Database object like  (dbo.employee)
 -- Here is dbo is schema name and employee is table name

Create Schema MSBI

Create table MSBI.DEMODBA
(
ID INT PRIMARY KEY,
Name char(22)
)

SELECT * FROM MSBI.DEMODBA
INSERT INTO MSBI.DEMODBA Values(501, 'Akon'),
(502, 'Peterson'),
(503, 'Jacob'),
(504, 'Smith'),
(505, 'Pollard')


Create table MSBI.Ankur_Verma
(
E_ID int primary key,
E_Name char(22),
E_Salary money not null
)
INSERT INTO MSBI.Ankur_Verma Values(101, 'Rakesh', 23800),
(102, 'Vinay', 29500),
(103, 'Mahesh', 32700),
(104, 'Monu', 35950),
(105, 'Ashish', 38850)

SELECT * FROM MSBI.Ankur_Verma


-- How to create schemabinding
Create view Msbi3
With schemabinding
as
Select EmpName, Salary
from dbo.Employee

alter table Employee
drop column EmpName
--------------------------------------------------------------------------------------------------------
-- Script and Batches
Create Database DemoDB1
Go
use DemoDb1

Create table demotable
(
E_Id int primary key,
E_name char(20) 
)
INSERT INTO demotable Values(201, 'Rakesh'),
(202, 'Dishant'),
(203, 'Vivek'),
(204, 'Rosy'),
(205, 'Lorean')
SELECT * FROM demotable

----There are two types of batches 
--1-Anonymous 
--A collection of sql statement without any name is called anonymous batch

--2 Named Batches 
--A)Store Procedures B)User Define Function  C)Triggers

-- 1-Anonymous batch example
declare @id int
declare @name varchar(20) 
select @id=10, @name='Ankur'
/*set @id=10
set @name='DKStu'*/
print @id
print @name

declare @id int
declare @name varchar(20) 
select @id=10, @name='Verma'
/*set @id=10
set @name='DKStu'*/
print @id
print @name

-- IF ELSE
declare @E_id int
set @E_ID=1
if @E_ID is null
begin
select * from Employee

END
ELSE
BEGIN
    SELECT * FROM Employee 
	WHERE E_ID = @E_id
END

------------------------------------------------------------------------------------------------------
use Emp
Select * FROM Employee

-- Store procedure is procompile
-- Store Procedure In SQL
-- How to create procedure in SQL
-- Parametrized AND ParameterLess
create procedure AVSP
AS
   SELECT * FROM Employee
exec AVSP

sp_helptext AVSP

-- How to create parameter stored procedure
create procedure SPAnkur(@deptid int)
AS
Select * from Employee
Where PKEMPID=@deptid
-------------------------------------------------------------------------------------------------------------------
-- New Table Create for Customer
use Emp

Create table Customer
(
C_ID INT PRIMARY KEY,
C_Name VARCHAR (25),
C_ountry CHAR(25),
C_City VARCHAR(25)
)
INSERT INTO Customer Values(1, 'John Doe', 'United State', 'New York'),
(2, 'Alice Smith', 'Canada', 'Toronto'),
(3, 'Bob Johnson', 'United Kingdom', 'London'),
(4, 'Emma Lee', 'Australia', 'Sydney'),
(5, 'Rohit Sharma', 'India', 'Mumbai'),
(6,'Shubhman Gill', 'India', 'Punjab'),
(7, 'Virender Sehwag', 'India', 'Delhi'),
(8, 'Virat Kohli', 'India', 'Delhi'),
(9, 'Shami', 'India', 'UP'),
(10,'Yuvraj','India','Gurgaon')

SELECT * FROM Customer

-- Adding a New column for customer table
ALTER TABLE Customer
ADD Salary Decimal(10,2)
UPDATE Customer SET Salary=27890
where c_id=10

UPDATE Customer SET Salary=22500
where C_ID=1

UPDATE Customer SET Salary=32500
where C_ID=3

UPDATE Customer SET Salary=35450
where C_ID=6

UPDATE Customer SET Salary=40000
where C_ID=8

-- Salary Column to Allow Null Values

ALTER Table Customer
ADD Salary DECIMAL(10,2) Null

-------------------------------------------------------------------------------------------------------------------
-- Trigger 
-- A trigger is a special type of stored procedure that automatically runs when an event occurs in the database server.
-- 3 Types of Trigger 
-- DML - triggers are automatically fired when an INSERT, UPDATE or DELETE event occurs on a table.
-- DDL - triggers are automatically invoked when a CREATE, ALTER, or DROP event occurs in a database
-- Logon triggers is invoked when a LOGON event is raised when a user session is established

use Emp
SELECT * FROM Customer

-- How to create trigger -- -- Message print
Create Trigger Tri_Cust_Insert2
ON Customer
For Insert
as
    Print('Inside Insert Customer') 

Insert Into Customer Values(11,'Monu', 'India', 'Haryana', 33000)

Select * from Customer
Delete from Customer
	
-- Trigger After Delete
Create Trigger Tri_Cust_Delete1
ON Customer
For Delete
as
    Print('Inside Insert Customer') -- Message print

Delete from Customer where C_ID=2

---------------------------------------------------------------------------------------------------------------

-- Deleting a row from the customer table
DELETE FROM Customer WHERE C_ID = 1

UPDATE Customer set C_Name= 'Peterson'
where C_ID=2
------------------------------------------------------------------------------------------
USE Emp

SELECT * FROM CUSTOMER

select UPPER(C_Name) as 'Cust Name'
from customer

select Lower(C_Name) as 'Cust Name'
from customer

update customer set C_Name='Ankur'
where C_ID=3

UPDATE customer set C_Name='Ankur', Salary=35000

SELECT * FROM Customer

where C_ID=4




























































































