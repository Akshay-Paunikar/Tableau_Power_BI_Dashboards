-- PIZZA SALES TABLEAU & SQL COMBINED PROJECT --

CREATE DATABASE pizza_sales;
USE pizza_sales;
SELECT * FROM pizzasales;

/* Q1. Find out the total revenue */
SELECT ROUND(SUM(total_price),2) AS total_revenue FROM pizzasales;
-- ANSWER -- '817860.05'

/* Q2. What is the average order value ? */
SELECT ROUND((SUM(total_price)/COUNT(DISTINCT(order_id))),2) AS average_order_value FROM pizzasales;
-- ANSWER -- '38.31'

/* Q3. Find out the total number of pizza's sold */
SELECT SUM(quantity) AS total_pizza_sold FROM pizzasales;
-- ANSWER -- '49574'

/* Q4. Find out the total number of orders placed */
SELECT COUNT(DISTINCT(order_id)) AS total_orders_placed FROM pizzasales;
-- ANSWER -- '21350'

/* Q5. Find out the average number of pizza's sold per order placed */
SELECT ROUND((SUM(quantity) / COUNT(DISTINCT(order_id))),2) AS avg_num_pizza_sold_per_order FROM pizzasales;
-- ANSWER -- '2.32'

-- KPI's QUERY COMPLETED --

