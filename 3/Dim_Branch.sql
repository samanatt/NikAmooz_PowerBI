CREATE TABLE Dim_Branch (
    Branch_ID INT PRIMARY KEY IDENTITY(1,1), -- شناسه شعبه
    Branch_Name VARCHAR(50) NOT NULL,      -- نام شعبه
    Location VARCHAR(100) NOT NULL           -- آدرس شعبه
);
