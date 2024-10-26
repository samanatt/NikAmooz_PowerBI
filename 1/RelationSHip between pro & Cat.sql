ALTER TABLE Dim_Product
ADD CONSTRAINT FK_Product_Category 
FOREIGN KEY (CategoryKey) REFERENCES Dim_Category(CategoryKey);

