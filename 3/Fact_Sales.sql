CREATE TABLE Fact_Sales (
    Sales_ID INT PRIMARY KEY IDENTITY(1,1),   -- شناسه فروش
    DateTime_ID INT NOT NULL,                  -- شناسه تاریخ و زمان
    Branch_ID INT NOT NULL,                    -- شناسه شعبه
    Product_ID INT NOT NULL,                   -- شناسه کالا
    Weight FLOAT NOT NULL,                     -- وزن کالا
    Price_Per_Unit FLOAT NOT NULL,            -- قیمت هر واحد کالا
    Total_Amount FLOAT NOT NULL,               -- مجموع مبلغ
    Invoice_Number VARCHAR(50) NOT NULL,      -- شماره فاکتور
    Quantity INT NOT NULL,                     -- تعداد کالا

    FOREIGN KEY (DateTime_ID) REFERENCES Dim_DateTime(DateTime_ID),
    FOREIGN KEY (Branch_ID) REFERENCES Dim_Branch(Branch_ID),
    FOREIGN KEY (Product_ID) REFERENCES Dim_Product(Product_ID)
);
