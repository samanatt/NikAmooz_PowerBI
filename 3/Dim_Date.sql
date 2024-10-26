CREATE TABLE Dim_DateTime (
    DateTime_ID INT PRIMARY KEY IDENTITY(1,1),  -- شناسه تاریخ و زمان
    Date DATE NOT NULL,                          -- تاریخ
    Time TIME NOT NULL,                          -- زمان
    Day INT NOT NULL,                            -- روز
    Month INT NOT NULL,                          -- ماه
    Year INT NOT NULL,                           -- سال
    Day_of_Week VARCHAR(20) NOT NULL,           -- روز هفته
    Hour INT NOT NULL,                           -- ساعت
    Minute INT NOT NULL                          -- دقیقه
);
