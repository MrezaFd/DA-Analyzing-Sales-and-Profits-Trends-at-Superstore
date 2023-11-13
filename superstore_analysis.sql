-- Query 1: Total Sales and Profits of Each Year
SELECT DATE_TRUNC('year', order_date) AS year,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit,
       SUM(quantity) AS total_quantity
FROM superstore
GROUP BY year
ORDER BY year ASC;

-- Query 2: Best Selling and Most Profitable Category
SELECT category,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit,
       SUM(quantity) AS total_quantity,
       ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM superstore
GROUP BY category;

-- Query 3: Top Selling Sub-Category
SELECT sub_category,
       SUM(sales) AS total_sales,
       SUM(quantity) AS total_quantity,
       SUM(profit) AS total_profit,
       ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM superstore
GROUP BY sub_category
ORDER BY profit_margin DESC;

-- Query 4: Most Profitable Customer Segment
SELECT segment,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit,
       ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM superstore
GROUP BY segment
ORDER BY profit_margin DESC;

-- Query 5: Preferred Ship Mode
SELECT ship_mode, COUNT(ship_mode) AS ship_type
FROM superstore
GROUP BY ship_mode
ORDER BY ship_type DESC;

-- Query 6: Most Profitable Region
SELECT region,
       SUM(sales) AS total_sales,
       SUM(quantity) AS total_quantity,
       SUM(profit) AS total_profit,
       ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;

-- Query 7: Top and Bottom 10 Cities by Sales
-- Top 10 Cities
SELECT city,
       SUM(sales) AS total_sales,
       SUM(quantity) AS total_quantity
FROM superstore
GROUP BY city
ORDER BY total_sales DESC
LIMIT 10;

-- Bottom 10 Cities
SELECT city,
       SUM(sales) AS total_sales,
       SUM(quantity) AS total_quantity
FROM superstore
GROUP BY city
ORDER BY total_sales ASC
LIMIT 10;

-- Query 8: Most and Least Profitable Products
SELECT product_name,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit
FROM superstore
WHERE product_name NOT IN ('Imation Secure+ Hardware Encrypted USB 2.0 Flash Drive')
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;
