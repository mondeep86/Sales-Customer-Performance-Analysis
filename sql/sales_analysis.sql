
-- Project: Sales & Customer Performance Analytics
-- Dataset: Tableau Sample Superstore
-- Database: SQLite
-- Table: superstore

-- 1. Overall business performance
SELECT
    ROUND(SUM("Sales"), 2) AS Total_Sales,
    ROUND(SUM("Profit"), 2) AS Total_Profit,
    COUNT(DISTINCT "Order ID") AS Total_Orders,
    SUM("Quantity") AS Total_Quantity
FROM superstore;

-- 2. Sales and profit by category
SELECT
    "Category",
    ROUND(SUM("Sales"), 2) AS Total_Sales,
    ROUND(SUM("Profit"), 2) AS Total_Profit
FROM superstore
GROUP BY "Category"
ORDER BY Total_Sales DESC;

-- 3. Sales and profit by region
SELECT
    "Region",
    ROUND(SUM("Sales"), 2) AS Total_Sales,
    ROUND(SUM("Profit"), 2) AS Total_Profit
FROM superstore
GROUP BY "Region"
ORDER BY Total_Profit DESC;

-- 4. Top 10 customers
SELECT
    "Customer Name",
    ROUND(SUM("Sales"), 2) AS Total_Sales
FROM superstore
GROUP BY "Customer Name"
ORDER BY Total_Sales DESC
LIMIT 10;

-- 5. Top 10 products
SELECT
    "Product Name",
    ROUND(SUM("Sales"), 2) AS Total_Sales
FROM superstore
GROUP BY "Product Name"
ORDER BY Total_Sales DESC
LIMIT 10;

-- 6. Profit by sub-category
SELECT
    "Sub-Category",
    ROUND(SUM("Profit"), 2) AS Total_Profit
FROM superstore
GROUP BY "Sub-Category"
ORDER BY Total_Profit DESC;

-- 7. Monthly sales trend
SELECT
    strftime('%Y-%m', "Order Date") AS Sales_Month,
    ROUND(SUM("Sales"), 2) AS Monthly_Sales
FROM superstore
GROUP BY Sales_Month
ORDER BY Sales_Month;

-- 8. Loss-making products
SELECT
    "Product Name",
    ROUND(SUM("Sales"), 2) AS Total_Sales,
    ROUND(SUM("Profit"), 2) AS Total_Profit
FROM superstore
GROUP BY "Product Name"
HAVING SUM("Profit") < 0
ORDER BY Total_Profit ASC;
