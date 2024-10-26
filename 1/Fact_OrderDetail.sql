CREATE TABLE Fact_OrderDetail (
    OrderID INT not null,                  -- کلید خارجی به Fact_Order
    ProductID INT not null,                -- کلید خارجی به Dim_Product
	UnitPrice money NOT NULL CONSTRAINT DF_Order_Details_UnitPrice DEFAULT (0),
	Quantity smallint NOT NULL CONSTRAINT DF_Order_Details_Quantity DEFAULT (1),
	Discount real NOT NULL CONSTRAINT DF_Order_Details_Discount DEFAULT (0),

	--PRIMARY KEY (OrderID, ProductID),  -- کلید اصلی مرکب
   -- FOREIGN KEY (OrderID) REFERENCES Fact_Order([OrderKey]), -- اتصال به Fact_Order
    --FOREIGN KEY (ProductID) REFERENCES Dim_Product(ProductKey) -- اتصال به Dim_Product
);

INSERT INTO [dbo].[Fact_OrderDetail] (OrderID, ProductID, UnitPrice, Quantity, Discount)
SELECT 
    od.OrderID,                 -- OrderID از جدول OrderDetails
    od.ProductID,               -- ProductID از جدول OrderDetails
    od.UnitPrice,               -- قیمت واحد
    od.Quantity,                -- تعداد محصول
    od.Discount                 -- درصد تخفیف
FROM  [Northwind_Custom].[dbo].[Order Details] od
JOIN Fact_Order fo ON od.OrderID = fo.OrderID           -- اتصال به جدول Fact_Order
JOIN Dim_Product dp ON od.ProductID = dp.ProductID;     -- اتصال به جدول Dim_Product