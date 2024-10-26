Data-Warehouse-OLAP-Projects
│
├── NorthwindDW-ETL-OLAP
│   ├── Scripts
│   │   ├── Create_Fact_Tables.sql
│   │   ├── Create_Dimension_Tables.sql
│   │   ├── Populate_Dimensions.sql
│   │   └── Populate_Facts.sql
│   ├── SSIS_Package
│   ├── PowerBI_Dashboard
│   │   └── Dashboard_Screenshot.png
│   └── README.md
│
└── DW_Sample_OLAP
    ├── Scripts
    │   ├── Create_Cube.sql
    │   └── Create_Measures.sql
    ├── PowerBI_Dashboard
    │   └── Dashboard_Screenshot.png
    └── README.md



# NorthwindDW ETL & OLAP Project

## 📌 Overview
This project is focused on creating a data warehouse (NorthwindDW) for the **Northwind_Custom** database. We extract data from the OLTP source, transform it using **ETL** processes, and load it into a **star schema** for efficient analytical querying.

The key deliverables include:
- Creating **Fact** and **Dimension** tables in NorthwindDW.
- Using **SSIS** for ETL processes.
- Building an **OLAP Cube** to support business measures.

## 📂 Folder Structure
- `Scripts`: Contains T-SQL scripts for creating and populating Fact and Dimension tables.
- `SSIS_Package`: Includes the SSIS package for loading data into the data warehouse.
- `PowerBI_Dashboard`: Contains Power BI dashboard screenshot.

## 📑 Steps

1. **Setup**
   - Restore `Northwind_Custom` and `NorthwindDW` databases from backups.
   - Verify OLTP structure in Northwind_Custom.

2. **Data Warehouse Design**
   - Create `DimCustomer`, `DimProduct`, `DimEmployee`, and `DimOrder` tables based on OLTP structure.
   - Create the `FactSales` table and establish relationships with dimensions.

3. **ETL Process with SSIS**
   - Design SSIS packages for extracting data from OLTP and populating Dimension tables.
   - Ensure that SSIS package loads only new records to preserve historical data.

4. **Creating OLAP Cube**
   - Build OLAP Database in SSAS.
   - Define Measures: 
     - Total Sales Amount
     - Discount Amount
     - Total Products Sold
     - Total Orders Count

5. **Dashboard Creation in Power BI**
   - Connect Power BI to the OLAP Database.
   - Design a dashboard for visualizing key metrics and trends.

## 📊 Example Queries

### Create Dimension Tables
```sql
-- Sample code to create DimCustomer
CREATE TABLE DimCustomer (
    CustomerKey INT PRIMARY KEY IDENTITY(1,1),
    CustomerID NCHAR(5),
    CustomerName NVARCHAR(50),
    Country NVARCHAR(50)
);

Populate Fact Table with ETL
INSERT INTO FactSales (OrderID, CustomerKey, EmployeeKey, ProductKey, Quantity, SalesAmount)
SELECT o.OrderID, dc.CustomerKey, de.EmployeeKey, dp.ProductKey, od.Quantity, od.UnitPrice * od.Quantity
FROM Northwind_Custom.dbo.Orders AS o
JOIN DimCustomer AS dc ON o.CustomerID = dc.CustomerID
JOIN DimEmployee AS de ON o.EmployeeID = de.EmployeeID
JOIN DimProduct AS dp ON od.ProductID = dp.ProductID;

Measures in Power BI
TotalSalesAmount = SUM(FactSales[SalesAmount])
TotalOrders = COUNT(FactSales[OrderID])
TotalDiscount = SUM(FactSales[DiscountAmount])


#### DW_Sample_OLAP

```markdown
# DW_Sample OLAP Database Project

## 📌 Overview
This project evaluates OLAP database skills by building a cube for a sample database (`DW_Sample`) that includes `FactInternetSales` and `DimDate` tables.

## 📂 Folder Structure
- `Scripts`: Contains scripts for creating the cube and defining measures.
- `PowerBI_Dashboard`: Screenshot of the Power BI dashboard.

## 📑 Steps

1. **Setup and Analysis**
   - Verify table structure in `DW_Sample`.
   - Focus on `FactInternetSales` and `DimDate` only as per requirements.

2. **OLAP Database Creation**
   - Use SSAS to create an OLAP database with `FactInternetSales` and `DimDate`.
   - Define Cube measures: 
     - Total Products Sold
     - Total Invoices Count
     - Total Sales
     - Total Discount

3. **Creating the Cube in SSAS**
   - In SSAS, create a Data Source View (DSV) with `FactInternetSales` and `DimDate`.
   - Add Dimensions and define the measures mentioned above.

4. **Dashboard in Power BI**
   - Design a Power BI report to visualize the measures across various dimensions, such as customer demographics and product categories.

## 📊 Example Queries

### Measures in DAX
```DAX
ProductsSold = COUNTROWS(FactInternetSales)
InvoicesCount = DISTINCTCOUNT(FactInternetSales[SalesOrderNumber])
TotalSales = SUM(FactInternetSales[SalesAmount])
TotalDiscount = SUM(FactInternetSales[DiscountAmount])



