--Dim_Employee

CREATE TABLE Dim_Employees(

EmployeeID  Int NOT NULL  PRIMARY KEY,
LastName nvarchar (20) NOT NULL ,
FirstName nvarchar (10) NOT NULL ,
City nvarchar (15) NULL ,
Country nvarchar (15) NULL 
)
INSERT INTO Dim_Employees
SELECT [EmployeeID]
      ,[FirstName]
      ,[LastName]
      ,[Country]
      ,[City]
FROM [Northwind_Custom].[dbo].[Employees]
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Dim_Employees);