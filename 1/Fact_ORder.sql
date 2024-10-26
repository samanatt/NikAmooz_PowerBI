CREATE TABLE Fact_Order (
    OrderID INT,                            -- ID اصلی سفارش از سیستم OLTP
    CustomerID NCHAR(5) NULL,               -- شناسه مشتری
    EmployeeID INT NULL,                    -- شناسه کارمند
    OrderDate DATETIME NULL,                -- تاریخ ثبت سفارش
    RequiredDate DATETIME NULL,             -- تاریخ نیاز به ارسال
    ShippedDate DATETIME NULL,              -- تاریخ ارسال
    ShipCountry NVARCHAR(15) NULL,          -- کشور مقصد برای ارسال
	[ShipCity] NVARCHAR(15) NULL
)

INSERT INTO Fact_Order (OrderID, Customerid, EmployeeID, OrderDate,RequiredDate,ShippedDate,ShipCountry,[ShipCity])
SELECT 
    o.OrderID,                 -- OrderID اصلی از سیستم OLTP
    dc.CustomerID,            -- CustomerKey از جدول Dimension_Customer
    de.Employeeid,            -- EmployeeKey از جدول Dimension_Employee
    o.OrderDate ,                 -- تاریخ سفارش
	o.RequiredDate,
	o.ShippedDate,
	ShipCountry,
	[ShipCity]
FROM [Northwind_Custom].[dbo].[Orders] o                  -- جدول OLTP سفارشات
JOIN Dim_Customer dc 
    ON o.CustomerID = dc.CustomerID    -- اتصال به جدول Dimension_Customer
JOIN Dim_Employees de 
    ON o.EmployeeID = de.EmployeeID;   -- اتصال به جدول Dimension_Employee


