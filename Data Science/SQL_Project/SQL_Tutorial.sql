--/* ------------ BEGINNER SQL TUTORIAL ----------*/

--CREATE 
--TABLE
--int
--varchar


CREATE TABLE EmployeeDemographics
( EmployeeID int,
FirstName varchar (50),
LastName varchar (50),
Age int,
Gender varchar (50)
)

CREATE TABLE EmployeeSalary (
EmployeeID int,
JobTitle varchar (50),
Salary int
)

INSERT INTO EmployeeDemographics VALUES
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male')
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly','Flax', NULL, 'Male'),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

INSERT INTO EmployeeSalary VALUES
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)
(1010, NULL, 47000),
(NULL, 'Salesman', 43000)




--/*
--Select Statement:
--* = All Data
--Top = to find the top from the row of data
--Distinct = to select a spesific colomn
--Count = to count/calculate amount of data
--As = make another colomn as alternative (mean temporary colomn)
--Max = to find the max data
--Min = to find the min data
--Avg = to find the mean of data 
--*/

SELECT *
 FROM EmployeeDemographics 

SELECT TOP 5 *
FROM EmployeeDemographics

SELECT DISTINCT (FirstName)
FROM EmployeeDemographics

SELECT COUNT(LastName)
FROM EmployeeDemographics

SELECT COUNT (LastName) AS LastNameCount
FROM EmployeeDemographics

SELECT MAX(Salary)
FROM EmployeeSalary

SELECT MIN (Salary)
FROM EmployeeSalary

SELECT AVG (Salary)
FROM EmployeeSalary

SELECT *
FROM [SQL Tutorial].dbo.EmployeeSalary /* if move from master branch */




--/* Where Statement
--  =, <>, <, >, And, Or, Like, Null, Not Null, In
--*/

SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Michael'

SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Michael'

SELECT *
FROM EmployeeDemographics
WHERE Age > 30

SELECT *
FROM EmployeeDemographics
WHERE Age < 30

SELECT *
FROM EmployeeDemographics
WHERE Age > 30 AND Gender = 'Male'

SELECT *
FROM EmployeeDemographics
WHERE Age > 30 OR Gender = 'Male'


SELECT *
FROM EmployeeDemographics
WHERE LastName Like '%S%' ----- > % (Wild Card) Mean if we dont know exactly the colomn/row content that we try find, 
--                                      /* but we only know that that content have spesific characther (example "S%" mean that column have S value inside as first elements)) */

SELECT *
FROM EmployeeDemographics
WHERE FirstName is NOT NULL

select *
from EmployeeDemographics
where FirstName IN ('Jim', 'Michael')




--/*
--Group By, Order By
--DESC = Descending
--ASC = Ascending
--*/

SELECT * 
FROM EmployeeDemographics
ORDER BY Age DESC, Gender DESC 

SELECT Gender, COUNT (Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age >30
GROUP BY Gender 
ORDER BY CountGender DESC



--/* ------------ INTERMEDIATE SQL TUTORIAL ----------*/

--/*
--Inner Joins, Full/Left/Right Outer Joins
--*/

SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics

SELECT *
FROM [SQL Tutorial].dbo.EmployeeSalary

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM [SQL Tutorial].dbo.EmployeeDemographics
Inner Join [SQL Tutorial].dbo.EmployeeSalary
 ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

WHERE FirstName <> 'Michael'
Order By Salary Desc

Select JobTitle, Avg(Salary) as SalesmanSalaryAvg
From [SQL Tutorial].dbo.EmployeeDemographics
Inner Join [SQL Tutorial].dbo.EmployeeSalary
On EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

where JobTitle = 'Salesman'
group by JobTitle




--/*
--Union, Union All
--*/

create table WareHouseEmployeeDemographics
( EmployeeID int,
FirstName varchar (50),
LastName varchar (50),
Age int,
Gender varchar (50)
)

Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

select *
from [SQL Tutorial].dbo.EmployeeDemographics
--union  /* combines the results of two result sets and removes duplicates*/
union all /*L doesn't remove duplicate rows*/
select *
from [SQL Tutorial].dbo.WareHouseEmployeeDemographics
order by EmployeeID




--/* 
--Case Statement
--*/

select FirstName, LastName, Age, 
case 
	when Age = 38 then 'Stanley'
	when Age > 30 then 'Old'
	when Age between 28 and 30 then 'Young'
	else 'Baby'
end
from [SQL Tutorial].dbo.EmployeeDemographics
where Age is not null
order by Age

select FirstName, LastName, JobTitle, Salary,
case
	when JobTitle = 'Salesman' then Salary + (Salary*.10)
	when JobTitle = 'Accountant' then Salary + (Salary*.05)
	when JobTitle = 'HR' then Salary + (Salary*.001)
	else Salary + (Salary*.03)
end as SalaryAfterRaise

from [SQL Tutorial].dbo.EmployeeDemographics
join [SQL Tutorial].dbo.EmployeeSalary
	on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID




/*
Having Clause


Having is a very generally used clause in SQL. 
Similar to WHERE it helps to apply conditions, 
but HAVING works with groups. 
If you wish to filter a group, the HAVING clause comes into action. 
Having clause is used to filter data according to the conditions provided. 
Having clause is generally used in reports of large data.
*/

select JobTitle, count (JobTitle)
from [SQL Tutorial].dbo.EmployeeDemographics
join [SQL Tutorial].dbo.EmployeeSalary
	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
group by JobTitle
having count (JobTitle) > 1

select JobTitle, avg (Salary)
from [SQL Tutorial].dbo.EmployeeDemographics
join [SQL Tutorial].dbo.EmployeeSalary
	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
group by JobTitle
--having avg (Salary ) > 45000
order by avg(Salary)




--/*
--Updating and Deleting Data
--*/

select * 
from [SQL Tutorial].dbo.EmployeeDemographics

update [SQL Tutorial].dbo.EmployeeDemographics
set EmployeeID = 1012
where FirstName = 'Holly' and LastName = 'Flax'

update [SQL Tutorial].dbo.EmployeeDemographics
set Age= 31, Gender = 'Female'
where FirstName = 'Holly' and LastName = 'Flax'


select * -----> to trick delete, because its delete forever !!!!!!
delete from [SQL Tutorial].dbo.EmployeeDemographics
where EmployeeID = 1013





--/*
--Aliasing
--*/

select Demo.FirstName, Sal.Salary
from [SQL Tutorial].dbo.EmployeeDemographics as Demo
join [SQL Tutorial].dbo.EmployeeSalary as Sal
	on Demo.EmployeeID = Sal.EmployeeID

select Demo.EmployeeID, Demo.FirstName, Sal.JobTitle, Ware.EmployeeID
from [SQL Tutorial].dbo.EmployeeDemographics as Demo
left join [SQL Tutorial].dbo.EmployeeSalary as Sal
	on Demo.EmployeeID = Sal.EmployeeID
left join [SQL Tutorial].dbo.WareHouseEmployeeDemographics as Ware
	on Demo.EmployeeID = Ware.EmployeeID






--/*
--Partition By
--*/

select * 
from [SQL Tutorial].dbo.EmployeeDemographics

select *
from [SQL Tutorial].dbo.EmployeeSalary

select FirstName, LastName, Gender, Salary, 
count (Gender) over (partition by Gender) as TotalGender
from [SQL Tutorial].dbo.EmployeeDemographics as Demo
join [SQL Tutorial].dbo.EmployeeSalary as Sal
	on Demo.EmployeeID = Sal.EmployeeID

select Gender, 
count (Gender) as TotalGender
from [SQL Tutorial].dbo.EmployeeDemographics as Demo
join [SQL Tutorial].dbo.EmployeeSalary as Sal
	on Demo.EmployeeID = Sal.EmployeeID
group by Gender 





--/*
--CTes (Common Table Expression)
--*/

with CTE_Employee as (
select FirstName, LastName, Gender, Salary, 
count (Gender) over (partition by Gender) as TotalGender, 
avg (Salary) over (partition by Gender) as AvgSalary
from [SQL Tutorial].dbo.EmployeeDemographics as Demo
join [SQL Tutorial].dbo.EmployeeSalary as Sal
	on Demo.EmployeeID = Sal.EmployeeID
where Salary > '45000'
)
select * 
from CTE_Employee






--/*
--Temp Tables
--*/

create table #temp_Employee (
EmployeeID int,
JobTitle varchar (100),
Salary int
)

select *
from #temp_Employee

insert into #temp_Employee 
values 
( 1000, 'HR' , 45000)

insert into #temp_Employee
select *
from [SQL Tutorial].dbo.EmployeeSalary


drop table if exists #temp_Employee2
create table #temp_Employee2 (
JobTitle varchar (50),
EmployeesPerJob int,
AvgAge int, 
AvgSalary int
)

select *
from #temp_Employee2


insert into #temp_Employee2
select JobTitle, Count(JobTitle), avg(Age), avg(Salary)
from [SQL Tutorial].dbo.EmployeeDemographics as emp
join [SQL Tutorial].dbo.EmployeeSalary as sal
	on emp.EmployeeID=sal.EmployeeID
group by JobTitle

select *
from #temp_Employee2







--/*
--String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower
--*/

--Drop Table EmployeeErrors


create table EmployeeErrors (
EmployeeID varchar(50),
FirstName varchar (50),
LastName varchar (50)
)

insert into EmployeeErrors values
('1001', 'Jimbo', 'Halbert'),
('1002', 'Pamela', 'Beasely'),
('1005', 'Toby', 'Flenderson-Fired')

select *
--from EmployeeErrors

----Using TRIM, LTRIM (Left TRIM), RTRIM (Right TRIM)

select EmployeeID, TRIM (EmployeeID) as IDTRIM
from EmployeeErrors

select EmployeeID, LTRIM (EmployeeID) as IDTRIM
from EmployeeErrors

select EmployeeID, RTRIM (EmployeeID) as IDTRIM
from EmployeeErrors

----Using Replace

select LastName, REPLACE (LastName, '-Fired', ' ') as LastNameFixed
from EmployeeErrors

----Using Substring
select Substring(FirstName, 1, 3) as First3Name
from EmployeeErrors

select EmError.FirstName, substring(EmError.FirstName, 1, 3), EmDem.FirstName, substring(EmDem.FirstName, 1, 3) 
from EmployeeErrors as EmError
join [SQL Tutorial].dbo.EmployeeDemographics as EmDem
	on substring(EmError.FirstName, 1, 3) = substring(EmDem.FirstName, 1, 3)

--/* Fuzzy Matching (pencocokan kabur)
-- Gender
-- LastName
-- Age
--Date of Birth */

---- Using UPPER and lower
select FirstName, UPPER(FirstName)
from EmployeeErrors

select FirstName, LOWER(FirstName)
from EmployeeErrors





--/*
--Stored Procedures
--*/

create procedure TEST
as
select *
from EmployeeDemographics

exec TEST


create procedure Temp_Employee
as 
create table #temp_Employee3 (
JobTitle varchar (100),
EmployeesPerJob int,
AvgAge int, 
AvgSalary int
)

insert into #temp_Employee3
select JobTitle, Count(JobTitle), avg(Age), avg(Salary)
from [SQL Tutorial].dbo.EmployeeDemographics as emp
join [SQL Tutorial].dbo.EmployeeSalary as sal
	on emp.EmployeeID=sal.EmployeeID
group by JobTitle


select *
from #temp_Employee3

exec Temp_Employee @JobTitle = 'Salesman'





/*
Subqueries (in the Select, From, and Where Statement)
*/

select *
from [SQL Tutorial].dbo.EmployeeSalary

-- Subquery in Select
select EmployeeID, Salary, (select avg (Salary) from [SQL Tutorial].dbo.EmployeeSalary) as AllAvgSalary
from [SQL Tutorial].dbo.EmployeeSalary

-- How to do it with Partition By
select EmployeeID, Salary,  avg (Salary) over() as AllAvgSalary
from [SQL Tutorial].dbo.EmployeeSalary

-- Why group By doesn't work
select EmployeeID, Salary,  avg (Salary) as AllAvgSalary
from [SQL Tutorial].dbo.EmployeeSalary
group by EmployeeID, Salary
order by 1,2

-- Subquery in From
select a.EmployeeID, AllAvgSalary
from (	select EmployeeID, Salary,  avg (Salary) over() as AllAvgSalary
		from [SQL Tutorial].dbo.EmployeeSalary
		) as a

-- Subquery in Where
select EmployeeID, JobTitle, Salary
from [SQL Tutorial].dbo.EmployeeSalary
where EmployeeID in (
	select EmployeeID
	from [SQL Tutorial].dbo.EmployeeDemographics
	where Age > '30')