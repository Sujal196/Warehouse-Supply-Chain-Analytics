

-- SwiftOps: Smart Operations & Decision Intelligence System


--SECTION 1: SQL Analysis Tasks (with Data Preprocessing & Cleaning Steps)


Use TASK


--1.  Checking count of missing/NULL values across key columns

SELECT 
    COUNT(*) - COUNT(Warehouse_ID) as Null_Warehouse_ID,
    COUNT(*) - COUNT(Location) as Null_Location,
    COUNT(*) - COUNT(Current_Stock) as Null_Current_Stock,
    COUNT(*) - COUNT(Demand_Forecast) as Null_Demand_Forecast,
    COUNT(*) - COUNT(Monthly_Sales) as Null_Monthly_Sales,
    COUNT(*) - COUNT(Product_Category) as Null_Product_Category,
    COUNT(*) - COUNT(Warehouse_Capacity) as Null_Warehouse_Capacity
FROM [dbo].[Business_Operations_Analyst_data]



--2.  Detecting duplicate combinations


SELECT Warehouse_ID, LOCATION,PRODUCT_CATEGORY, SUPPLIER_ID, COUNT(*) as Row_Count FROM [dbo].[Business_Operations_Analyst_data] GROUP BY Warehouse_ID, LOCATION,PRODUCT_CATEGORY, SUPPLIER_ID HAVING COUNT(*) >1 


--3. Data Standardization, Deduplication, & Feature Engineering View


select column_name, data_type from information_schema.columns where table_name = 'Business_Operations_Analyst_data'

CREATE OR ALTER VIEW vw_cleaned_operations_data
AS
WITH DeduplicatedData AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY
                   TRIM(Warehouse_ID),
                   TRIM(Location),
                   TRIM(Product_Category),
                   TRIM(Supplier_ID)
               ORDER BY Monthly_Sales DESC
           ) AS row_num
    FROM dbo.Business_Operations_Analyst_data
)
SELECT 
    -- A. Text Standardization
    TRIM(Warehouse_ID) as Warehouse_ID,
    TRIM(Location) as Location,
    TRIM(Supplier_ID) as Supplier_ID,
    TRIM(Product_Category) as Product_Category,
    
    -- B. Metric Validation & Bounds Truncation (handling unexpected negatives/invalid data)
    CASE WHEN Current_Stock < 0 THEN 0 ELSE Current_Stock END as Current_Stock,
    CASE WHEN Demand_Forecast < 0 THEN 0 ELSE Demand_Forecast END as Demand_Forecast,
    CASE WHEN Lead_Time_Days < 0 THEN 0 ELSE Lead_Time_Days END as Lead_Time_Days,
    CASE WHEN Shipping_Time_Days < 0 THEN 0 ELSE Shipping_Time_Days END as Shipping_Time_Days,
    CASE WHEN Stockout_Risk < 0 THEN 0 ELSE Stockout_Risk END as Stockout_Risk,
    CASE WHEN Operational_Cost < 0 THEN 0 ELSE Operational_Cost END as Operational_Cost,
    CASE WHEN Monthly_Sales < 0 THEN 0 ELSE Monthly_Sales END as Monthly_Sales,
    CASE WHEN Order_Processing_Time < 0.0 THEN 0.0 ELSE Order_Processing_Time END as Order_Processing_Time,
    CASE WHEN Return_Rate < 0.0 THEN 0.0 ELSE Return_Rate END as Return_Rate,
    CASE WHEN Customer_Rating < 1.0 THEN 1.0 WHEN Customer_Rating > 5.0 THEN 5.0 ELSE Customer_Rating END as Customer_Rating,
    CASE WHEN Warehouse_Capacity < 0 THEN 0 ELSE Warehouse_Capacity END as Warehouse_Capacity,
    CASE WHEN Storage_Cost < 0 THEN 0 ELSE Storage_Cost END as Storage_Cost,
    CASE WHEN Transportation_Cost < 0 THEN 0 ELSE Transportation_Cost END as Transportation_Cost,
    CASE WHEN Backorder_Quantity < 0 THEN 0 ELSE Backorder_Quantity END as Backorder_Quantity,
    CASE WHEN Damaged_Goods < 0 THEN 0 ELSE Damaged_Goods END as Damaged_Goods,
    Employee_Count,

    -- C. Feature Engineering Calculations
    -- 1. Inventory_Turnover = Monthly_Sales / Current_Stock (Handling potential division by zero)
    CASE 
        WHEN Current_Stock = 0 THEN 0.0 
        ELSE CAST(Monthly_Sales AS REAL) / Current_Stock 
    END as Inventory_Turnover,

    -- 2. Delivery_Efficiency = Shipping_Time_Days + Order_Processing_Time
    (Shipping_Time_Days + Order_Processing_Time) as Delivery_Efficiency,

    -- 3. Total_Cost = Operational_Cost + Storage_Cost + Transportation_Cost
    (Operational_Cost + Storage_Cost + Transportation_Cost) as Total_Cost,

    -- 4. Estimated_Profit = Monthly_Sales - Total_Cost
    (Monthly_Sales - (Operational_Cost + Storage_Cost + Transportation_Cost)) as Estimated_Profit,

    -- 5. Stock_Utilization = Current_Stock / Warehouse_Capacity (Handling potential division by zero)
    CASE 
        WHEN Warehouse_Capacity = 0 THEN 0.0 
        ELSE CAST(Current_Stock AS REAL) / Warehouse_Capacity 
    END as Stock_Utilization,

    -- 6. Demand_Gap = Demand_Forecast - Current_Stock
    (Demand_Forecast - Current_Stock) as Demand_Gap,

    -- 7. Risk_Score = Stockout_Risk + Return_Rate + Damaged_Goods
    (Stockout_Risk + Return_Rate + Damaged_Goods) as Risk_Score

FROM DeduplicatedData
WHERE row_num = 1;

SELECT * FROM vw_cleaned_operations_data


-- =========================================================================


-- SECTION 2: SQL ANALYSIS TASKS

--1.  Top Delayed Warehouses

-- Identifies warehouses with the longest total delivery times (Shipping + Order Processing).

SELECT 
    Warehouse_ID, 
    Location, 
    AVG(Shipping_Time_Days) as Avg_Shipping_Time_Days, 
    AVG(Order_Processing_Time) as Avg_Order_Processing_Time,
    AVG(Delivery_Efficiency) as Avg_Total_Delivery_Time
FROM 
    vw_cleaned_operations_data
GROUP BY 
    Warehouse_ID, 
    Location
ORDER BY 
    Avg_Total_Delivery_Time DESC;


--2.  High Stockout Risk Locations

-- Evaluates stockout risk, backorder volumes, and stockout frequency by city location.

SELECT 
    Location, 
    AVG(Stockout_Risk) as Avg_Stockout_Risk, 
    SUM(Backorder_Quantity) as Total_Backorder_Quantity,
    AVG(Current_Stock) as Avg_Current_Stock,
    SUM(CASE WHEN Current_Stock < Demand_Forecast THEN 1 ELSE 0 END) as Stockout_Instances
FROM 
    vw_cleaned_operations_data
GROUP BY 
    Location
ORDER BY 
    Avg_Stockout_Risk DESC;


--3.  Product-wise Sales Performance

-- Aggregates monthly sales and transaction counts per product category.

SELECT 
    Product_Category, 
    SUM(Monthly_Sales) as Total_Sales, 
    AVG(Monthly_Sales) as Avg_Sales_Per_Record,
    MIN(Monthly_Sales) as Min_Sales_Per_Record,
    MAX(Monthly_Sales) as Max_Sales_Per_Record,
    COUNT(*) as Total_Transaction_Count
FROM 
    vw_cleaned_operations_data
GROUP BY 
    Product_Category
ORDER BY 
    Total_Sales DESC;


--4.  Cost vs Profit Analysis

-- Computes the breakdown of operational, storage, and transportation expenses
-- to evaluate net estimated profit margins.

SELECT 
    Product_Category,
    SUM(Operational_Cost) as Total_Operational_Cost,
    SUM(Storage_Cost) as Total_Storage_Cost,
    SUM(Transportation_Cost) as Total_Transportation_Cost,
    SUM(Total_Cost) as Total_Cost,
    SUM(Monthly_Sales) as Total_Sales,
    SUM(Estimated_Profit) as Estimated_Profit,
    ROUND((SUM(Estimated_Profit) / SUM(Monthly_Sales)) * 100, 2) as Profit_Margin_Percent
FROM 
    vw_cleaned_operations_data
GROUP BY 
    Product_Category
ORDER BY 
    Estimated_Profit DESC;


--5: Demand vs Stock Comparison

-- Compares forecasted demand with current stock to find supply gaps and capacity utilization.

SELECT 
    Location, 
    Product_Category, 
    SUM(Demand_Forecast) as Total_Demand_Forecast, 
    SUM(Current_Stock) as Total_Stock, 
    SUM(Demand_Gap) as Net_Demand_Gap,
    AVG(Stock_Utilization) as Avg_Stock_Utilization
FROM 
    vw_cleaned_operations_data
GROUP BY 
    Location, 
    Product_Category
ORDER BY 
    Net_Demand_Gap DESC;

