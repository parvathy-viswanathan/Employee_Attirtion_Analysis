create database Employee_attrition;
describe employee_attirtion_new;
select * from employee_attirtion_new;
set sql_safe_updates=0;
use Employee_attrition;
SELECT * FROM Employee_attrition.employee_attirtion_new;
select EmployeeID,Age,Gender,MaritalStatus from employee_attirtion_new where MaritalStatus="Single";
select count(Age) from employee_attirtion_new where Age between 20 and 30; 
select EmployeeID,MonthlyIncome,BusinessTravel from employee_attirtion_new where Department='Neurology' and Age>='20';
SELECT * FROM employee_attirtion_new WHERE Gender = "Female" AND MonthlyIncome >= 5000 ORDER BY age;
select count(EmployeeID) from employee_attirtion_new where Department="Cardiology";

select avg(age) from employee_attirtion_new where Attrition="yes";

select EmployeeID,Age,Attrition,case when Age < 30 then 'Young' when Age >= 30 and Age < 50 then 'Middle-aged' when Age >= 50 then 'Senior'
    end as Age_Category from employee_attirtion_new;    
alter table employee_attirtion_new add column Age_Category varchar(20) first;
update employee_attirtion_new set Age_Category=case when Age < 30 then 'Young' when Age >= 30 and Age < 50 then 'Middle-aged' 
when Age >= 50 then 'Senior' end;

SELECT Department, AVG(MonthlyIncome) AS AverageIncome FROM employee_attirtion_new GROUP BY Department
ORDER BY AverageIncome DESC;

select count(JobRole) as count_Nurse from employee_attirtion_new where JobRole="Nurse" and Gender="Female";
SELECT AVG(JobSatisfaction) AS avg_job_satisfaction
FROM employee_attirtion_new
WHERE Department = 'Maternity';

CREATE VIEW Cardiology_Employees AS
SELECT EmployeeID, Age, Department
FROM employee_attirtion_new
WHERE Department = 'Cardiology';

CREATE VIEW Maternity_Employees AS
SELECT EmployeeID, Age, Department
FROM employee_attirtion_new
WHERE Department = 'Maternity';

SELECT * FROM Cardiology_Employees
UNION
SELECT * FROM Maternity_Employees;
alter table employee_attirtion_new drop column `?`;    