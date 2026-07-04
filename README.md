# Warehouse-Supply-Chain-Analytics-Dashboard

### Dashboard Link : *(To be updated after Power BI Service publication)*

## Problem Statement

This dashboard provides a comprehensive analytical overview of warehouse
inventory and supply chain operations by monitoring inventory
utilization, warehouse performance, operational costs, profitability,
supplier efficiency, logistics performance and inventory risks. The
objective is to transform raw warehouse operational data into actionable
business intelligence through interactive visualizations and KPI-driven
reporting.

The dashboard enables stakeholders to evaluate warehouse efficiency,
inventory movement, financial performance and supply chain reliability.
By analyzing warehouse locations, suppliers, product categories and
operational metrics, the organization can identify high-performing
warehouses, inventory shortages, cost-intensive operations and
opportunities for process optimization.

Through dynamic filtering and visual analytics, the report supports
data-driven strategic decision-making, operational monitoring and
continuous supply chain improvement.

## Dataset Overview

The dataset used for this dashboard contains structured warehouse and
supply chain records with the following attributes:

-   Warehouse ID
-   Location
-   Current Stock
-   Demand Forecast
-   Lead Time Days
-   Shipping Time Days
-   Stockout Risk
-   Operational Cost
-   Supplier ID
-   Product Category
-   Monthly Sales
-   Order Processing Time
-   Return Rate
-   Customer Rating
-   Warehouse Capacity
-   Storage Cost
-   Transportation Cost
-   Backorder Quantity
-   Damaged Goods
-   Employee Count

Additional calculated metrics include:

-   Inventory Turnover
-   Delivery Efficiency
-   Total Cost
-   Estimated Profit
-   Stock Utilization
-   Demand Gap
-   Risk Score
-   Sales per Employee
-   Stock Status

The data was imported into **Power BI Desktop**, transformed using
**Power Query** and modeled using **DAX** measures and calculated
columns.

## Steps Followed

### Data Preparation

-   Step 1 : Imported warehouse inventory dataset into Power BI
    Desktop.
-   Step 2 : Opened Power Query Editor and enabled Column Quality,
    Column Distribution and Column Profile.
-   Step 3 : Enabled profiling for the entire dataset.
-   Step 4 : Corrected data types for numerical and categorical columns.
-   Step 5 : Removed duplicate records and validated missing values.

### Data Modeling

-   Step 6 : Created calculated columns including Inventory Turnover,
    Delivery Efficiency, Total Cost, Estimated Profit, Demand Gap, Risk
    Score and Stock Status.
-   Step 7 : Developed DAX measures for KPI calculations and business
    metrics.

### Visualization Development

-   Step 8 : Designed a professional five-page dashboard using a
    consistent theme.
-   Step 9 : Added slicers for Warehouse ID, Location, Supplier ID and
    Product Category.
-   Step 10 : Created KPI cards for Monthly Sales, Total Cost, Estimated
    Profit, Inventory Turnover, Customer Rating and Average Delivery
    Time.
-   Step 11 : Built bar charts, line charts, scatter charts, treemaps,
    gauge charts, donut charts and tables.
-   Step 12 : Added drill-down and cross-filtering for interactive
    analysis.

### Deployment

-   Step 13 : Published the report to Power BI Service for business
    users.

## Key Performance Indicators (KPIs)

-   **Monthly Sales** -- Total sales generated across warehouses.
-   **Total Cost** -- Combined operational, storage and transportation
    cost.
-   **Estimated Profit** -- Difference between Monthly Sales and Total
    Cost.
-   **Inventory Turnover** -- Measures inventory movement efficiency.
-   **Average Delivery Time** -- Average shipping duration.
-   **Customer Rating** -- Average customer satisfaction score.
-   **Risk Score** -- Indicates operational risk.
-   **Stock Utilization** -- Warehouse capacity utilization.

## Executive Dashboard

The executive dashboard provides a high-level overview of the supply chain by summarizing warehouse operations, inventory performance, supplier efficiency, and customer satisfaction using KPI cards and analytical visuals.

Key observations:
-  Displays key business KPIs including Total Cost (42M), Total Monthly Sales (3M), Average Delivery Days (7), Average Customer Rating (3), Average Inventory Turnover (2), and Average Risk Score (45).
-  Compares Average Total Cost and Average Monthly Sales across the top-performing warehouses.
-  Analyzes supplier performance by comparing Lead Time Days with Stockout Risk.
-  Monitors Average Stock Utilization against the target utilization of 80% using a gauge chart.
-  Identifies the Top 5 Warehouses based on Sales per Employee.
-  Shows the percentage contribution of Operational, Storage, and Transportation Costs for each product category.
-  Compares customer ratings across different product categories.

![Executive Dashboard](https://github.com/user-attachments/assets/264747bf-2c94-4b1d-abb7-b69f0ddc1084)

## Warehouse Operations Dashboard

The warehouse operations dashboard provides a detailed operational view of individual warehouses through an interactive data table for monitoring inventory, logistics, suppliers, and warehouse performance.

Key observations:
-  Displays warehouse-wise operational details including Warehouse ID, Location, Warehouse Capacity, and Current Stock.
-  Tracks logistics metrics such as Lead Time Days, Order Processing Time, Shipping Time, and Delivery Efficiency.
-  Provides supplier and product information for every warehouse.
-  Displays Monthly Sales and Stockout Risk to evaluate operational performance.
-  Supports detailed warehouse-level analysis using interactive slicers for Warehouse, Location, Supplier, and Product Category.

![Warehouse Operations Dashboard](https://github.com/user-attachments/assets/bb2f1d1b-04b7-4507-b452-b86e65b19a80)


## Proudct Performance Dashboard

The product performance dashboard visualizes product sales distribution across warehouse locations using a treemap, enabling quick identification of high-performing locations and product categories.

Key observations:
-  Displays the highest monthly sales for each product category across different warehouse locations.
-  Sales performance among locations including Atlanta, Miami, Chicago, San Francisco, New York, Dallas, Denver, Houston, Los Angeles, and Seattle.
-  Highlights the contribution of Furniture, Electronics, Groceries, Apparel, and Automotive within each location.
-  Makes it easy to identify dominant products and regional demand patterns through proportional treemap blocks.
  
![Executive Dashboard](https://github.com/user-attachments/assets/47448725-03a4-4d6f-8301-faa6232f1357)


## Financial Performance Dashboard

The financial performance dashboard analyzes the relationship between operational cost, monthly sales, and estimated profit across warehouse locations using an interactive bubble chart.

Key observations:
-  Compares Total Cost, Monthly Sales, and Estimated Profit for different warehouse locations.
-  Represents warehouse performance using bubble size and position to visualize financial relationships.
-  Enables comparison among locations including Atlanta, Chicago, Dallas, Denver, Houston, Los Angeles, Miami, New York, San Francisco, and Seattle.
-  Helps identify locations with higher profitability and operational costs.
-  Supports financial decision-making by highlighting cost-efficient and high-performing warehouse locations.

![Executive Dashboard](https://github.com/user-attachments/assets/5c27fce2-6870-4e64-b33b-fec8ff963225)


## Cost & Risk Analysis Dashboard

The Cost & Risk Analysis dashboard provides a high-level overview of product cost distribution and inventory risk levels by summarizing financial performance and operational risk using KPI cards and analytical visuals.

Key observations:
-  Compares the Total Cost contribution across different product categories using a pie chart.
-  Analyzes the distribution of Low Risk, Medium Risk, and High Risk inventory through a donut chart.
-  Enables dynamic analysis using Warehouse ID, Location, Supplier ID, and Product Category slicers.
-  Provides quick navigation between Monthly Sales, Total Cost, Stock Status, and Risk Level report pages.
-  Helps identify cost-intensive product categories and monitor overall inventory risk for better decision-making.

  ![Executive Dashboard](https://github.com/user-attachments/assets/a4176a4c-cfa4-46eb-bf45-df719efa6e8c)

  
### Slicers

-   Warehouse ID
-   Location
-   Supplier ID
-   Product Category

## Key Business Insights

-   Top-performing warehouses generate higher sales with better
    inventory utilization.
-   Longer supplier lead times increase stockout risk.
-   Higher inventory turnover is associated with improved sales
    performance.
-   Customer satisfaction improves with better delivery efficiency.
-   Product category analysis helps identify major cost contributors.
-   Cost analysis supports profitability improvement and operational
    optimization.

## Conclusion

The **Warehouse Supply Chain Analytics Dashboard** provides
a comprehensive business intelligence solution for monitoring warehouse
operations, inventory performance and financial outcomes. By integrating
DAX measures, interactive visualizations and operational KPIs, the
dashboard enables stakeholders to optimize inventory planning, reduce
costs, improve supplier performance and make data-driven business
decisions.
