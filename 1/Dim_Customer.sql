﻿-- Dim_Customer  CREATE TABLE Dim_Customer(  CustomerID nchar (5) NOT NULL  PRIMARY KEY , CompanyName nvarchar (40) NOT NULL , Country nvarchar (15) NULL , City nvarchar (15) NULL , ) INSERT INTO Dim_Customer ([CustomerID],[CompanyName],[Country],[City]) SELECT [CustomerID]       ,[CompanyName]       ,[Country]       ,[City] FROM [Northwind_Custom].[dbo].[Customers];  -- جدول OLTP WHERE CustomerID NOT IN (SELECT CustomerID FROM Dim_Customer);  