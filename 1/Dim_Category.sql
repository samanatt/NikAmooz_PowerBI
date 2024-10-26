--Dim_Category

CREATE TABLE Dim_Category (
    CategoryID INT PRIMARY KEY,       -- ID دسته‌بندی در سیستم OLTP
    CategoryName NVARCHAR(100)
);
INSERT INTO Dim_Category (CategoryID, CategoryName)
SELECT CategoryID, CategoryName
FROM [Northwind_Custom].[dbo].[Categories];  -- جدول OLTP

