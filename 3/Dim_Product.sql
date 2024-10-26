CREATE TABLE Dim_Product (
    Product_ID INT PRIMARY KEY,              -- شناسه کالا (کد یکتا)
    Product_Name VARCHAR(100) NOT NULL,     -- نام کالا
    Unit VARCHAR(20) NOT NULL                 -- واحد کالا
);
