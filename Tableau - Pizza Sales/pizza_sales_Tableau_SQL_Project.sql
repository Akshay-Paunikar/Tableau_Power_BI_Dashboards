-- PIZZA SALES TABLEAU & SQL COMBINED PROJECT --

CREATE DATABASE pizza_sales;
USE pizza_sales;
SELECT * FROM pizzasales;

/* Q1. Find out the total revenue */
SELECT ROUND(SUM(total_price),2) AS total_revenue FROM pizzasales;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q2. What is the average order value ? */
SELECT ROUND((SUM(total_price)/COUNT(DISTINCT(order_id))),2) AS average_order_value FROM pizzasales;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q3. Find out the total number of pizza's sold */
SELECT SUM(quantity) AS total_pizza_sold FROM pizzasales;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q4. Find out the total number of orders placed */
SELECT COUNT(DISTINCT(order_id)) AS total_orders_placed FROM pizzasales;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q5. Find out the average number of pizza's sold per order placed */
SELECT ROUND((SUM(quantity) / COUNT(DISTINCT(order_id))),2) AS avg_num_pizza_sold_per_order FROM pizzasales;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

-- KPI's QUERY COMPLETED --

-- QUERIES REQUIRED FOR CHART CREATIONS --

/* Q1. What is the hourly trend of the total pizza's sold, total orders placed & total revenue generated */
SELECT HOUR(STR_TO_DATE(order_time,'%T')) AS order_hours, 
	SUM(quantity) AS total_pizza_sold,
    COUNT(DISTINCT(order_id)) AS total_orders_placed,
    ROUND(SUM(total_price),2) AS total_revenue
FROM pizzasales
GROUP BY order_hours
ORDER BY order_hours ASC;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q2. What is the daily trend of the total pizza's sold, total orders placed & total revenue generated - day name */
SELECT WEEKDAY(STR_TO_DATE(order_date,'%d-%m-%Y')) AS order_day_number,
	DAYNAME(STR_TO_DATE(order_date,'%d-%m-%Y')) AS order_day_name,
	SUM(quantity) AS total_pizza_sold,
    COUNT(DISTINCT(order_id)) AS total_orders_placed,
    ROUND(SUM(total_price),2) AS total_revenue
FROM pizzasales
GROUP BY order_day_number
ORDER BY order_day_number;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q3. What is the daily trend of the total pizza's sold, total orders placed & total revenue generated - day of month */
SELECT DAYOFMONTH(STR_TO_DATE(order_date,'%d-%m-%Y')) AS order_day_of_month,
	SUM(quantity) AS total_pizza_sold,
    COUNT(DISTINCT(order_id)) AS total_orders_placed,
    ROUND(SUM(total_price),2) AS total_revenue
FROM pizzasales
GROUP BY order_day_of_month
ORDER BY order_day_of_month;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q4. What is the weekly trend of the total pizza's sold, total orders placed & total revenue generated */
SELECT WEEKOFYEAR(STR_TO_DATE(order_date,'%d-%m-%Y')) AS order_week,
	YEAR(STR_TO_DATE(order_date,'%d-%m-%Y')) AS order_year,
    SUM(quantity) AS total_pizza_sold,
	COUNT(DISTINCT(order_id)) as total_orders_placed,
    ROUND(SUM(total_price),2) AS total_revenue
FROM pizzasales
GROUP BY order_week, order_year
ORDER BY order_week, order_year ASC;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q5. What is the monthly trend of the total pizza's sold, total orders placed & total revenue generated */
SELECT MONTH(STR_TO_DATE(order_date,'%d-%m-%Y')) AS order_month_number,
	MONTHNAME(STR_TO_DATE(order_date,'%d-%m-%Y')) AS order_month_name,
	YEAR(STR_TO_DATE(order_date,'%d-%m-%Y')) AS order_year,
    SUM(quantity) AS total_pizza_sold,
	COUNT(DISTINCT(order_id)) as total_orders_placed,
    ROUND(SUM(total_price),2) AS total_revenue
FROM pizzasales
GROUP BY order_month_number, order_month_name, order_year
ORDER BY order_month_number, order_month_name, order_year ASC;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q6. What is the quarterly trend of the total pizza's sold, total orders placed & total revenue generated */
SELECT QUARTER(STR_TO_DATE(order_date,'%d-%m-%Y')) AS order_quarter_number,
	YEAR(STR_TO_DATE(order_date,'%d-%m-%Y')) AS order_year,
    SUM(quantity) AS total_pizza_sold,
	COUNT(DISTINCT(order_id)) as total_orders_placed,
    ROUND(SUM(total_price),2) AS total_revenue
FROM pizzasales
GROUP BY order_quarter_number, order_year
ORDER BY order_quarter_number, order_year ASC;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q7. What is the total orders, total quantity sold, total revenue generated & percentage of pizza sales by pizza category */
SELECT pizza_category,
    COUNT(DISTINCT(order_id)) AS total_orders_placed,
    SUM(quantity) AS total_pizza_sold,
    ROUND(SUM(total_price),2) AS total_revenue,
    ROUND((SUM(total_price) * 100)/ (SELECT SUM(total_price) FROM pizzasales),2) AS percent_pizza_sales
FROM pizzasales
GROUP BY pizza_category
ORDER BY percent_pizza_sales DESC;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q8. What is the total orders, total quantity sold, total revenue generated & percentage of pizza sales by pizza size */
SELECT pizza_size,
    COUNT(DISTINCT(order_id)) AS total_orders_placed,
    SUM(quantity) AS total_pizza_sold,
    ROUND(SUM(total_price),2) AS total_revenue,
    ROUND((SUM(total_price) * 100)/ (SELECT SUM(total_price) FROM pizzasales),2) AS percent_pizza_sales
FROM pizzasales
GROUP BY pizza_size
ORDER BY percent_pizza_sales DESC;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q9. What is the total orders, total quantity sold, total revenue generated & percentage of pizza sales by pizza category & pizza size */
SELECT pizza_category,
	pizza_size,
    COUNT(DISTINCT(order_id)) AS total_orders_placed,
    SUM(quantity) AS total_pizza_sold,
    ROUND(SUM(total_price),2) AS total_revenue,
    ROUND((SUM(total_price) * 100)/ (SELECT SUM(total_price) FROM pizzasales),2) AS percent_pizza_sales
FROM pizzasales
GROUP BY pizza_category, pizza_size;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/*NOTE: We can use WHERE clause in above three queries to get monthly, quarterly, daily, hourly data also if required 
in order to do that add the same WHERE clause to the SELECT statement in the parenthesis also 
Below is one example of above query 7 for January Month */
SELECT pizza_category,
    COUNT(DISTINCT(order_id)) AS total_orders_placed,
    SUM(quantity) AS total_pizza_sold,
    ROUND(SUM(total_price),2) AS total_revenue,
    ROUND((SUM(total_price) * 100)/ (SELECT SUM(total_price) FROM pizzasales
		WHERE MONTH(STR_TO_DATE(order_date,'%d-%m-%Y')) = 1),2) AS percent_pizza_sales
FROM pizzasales
WHERE MONTH(STR_TO_DATE(order_date,'%d-%m-%Y')) = 1
GROUP BY pizza_category;

/* Q10. What is the total orders, total quantity sold, total revenue generated categorized by pizza name - Top 5 by total revenue */
SELECT pizza_name,
	COUNT(DISTINCT(order_id)) AS total_orders_placed,
    SUM(quantity) AS total_pizza_sold,
    ROUND(SUM(total_price),2) AS total_revenue
FROM pizzasales
GROUP BY pizza_name
ORDER BY total_revenue DESC LIMIT 5;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q11. What is the total orders, total quantity sold, total revenue generated categorized by pizza name - Bottom 5 by total revenue */
SELECT pizza_name,
	COUNT(DISTINCT(order_id)) AS total_orders_placed,
    SUM(quantity) AS total_pizza_sold,
    ROUND(SUM(total_price),2) AS total_revenue
FROM pizzasales
GROUP BY pizza_name
ORDER BY total_revenue ASC LIMIT 5;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q12. What is the total orders, total quantity sold, total revenue generated categorized by pizza name - Top 5 by quantity sold */
SELECT pizza_name,
	COUNT(DISTINCT(order_id)) AS total_orders_placed,
    SUM(quantity) AS total_pizza_sold,
    ROUND(SUM(total_price),2) AS total_revenue
FROM pizzasales
GROUP BY pizza_name
ORDER BY total_pizza_sold DESC LIMIT 5;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q13. What is the total orders, total quantity sold, total revenue generated categorized by pizza name - Bottom 5 by quantity sold */
SELECT pizza_name,
	COUNT(DISTINCT(order_id)) AS total_orders_placed,
    SUM(quantity) AS total_pizza_sold,
    ROUND(SUM(total_price),2) AS total_revenue
FROM pizzasales
GROUP BY pizza_name
ORDER BY total_pizza_sold ASC LIMIT 5;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q14. What is the total orders, total quantity sold, total revenue generated categorized by pizza name - TOP 5 by orders placed */
SELECT pizza_name,
	COUNT(DISTINCT(order_id)) AS total_orders_placed,
    SUM(quantity) AS total_pizza_sold,
    ROUND(SUM(total_price),2) AS total_revenue
FROM pizzasales
GROUP BY pizza_name
ORDER BY total_orders_placed DESC LIMIT 5;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"

/* Q15. What is the total orders, total quantity sold, total revenue generated categorized by pizza name - Bottom 5 by orders placed */
SELECT pizza_name,
	COUNT(DISTINCT(order_id)) AS total_orders_placed,
    SUM(quantity) AS total_pizza_sold,
    ROUND(SUM(total_price),2) AS total_revenue
FROM pizzasales
GROUP BY pizza_name
ORDER BY total_orders_placed ASC LIMIT 5;
-- ANSWER -- exported to a MICROSOFT WORD file with name "Pizza_Sales_MySQL_Query_results.docx"