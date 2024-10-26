--Dim_Product

CREATE TABLE Dim_Product (
    ProductID INT PRIMARY KEY,       -- ID 
    ProductName NVARCHAR(40),
    CategoryID INT,     -- کلید کتگوری
);

INSERT INTO Dim_Product (ProductID, ProductName)
SELECT 
    p.ProductID,         -- ProductID از OLTP
    p.ProductName
FROM [Northwind_Custom].[dbo].[Products] p  -- جدول محصولات OLTP
JOIN  [dbo].[Dim_Category] dc ON p.CategoryID = dc.CategoryID; 