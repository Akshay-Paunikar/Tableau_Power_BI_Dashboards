-- PIZZA SALES TABLEAU & SQL COMBINED PROJECT --

CREATE DATABASE pizza_sales;
USE pizza_sales;
SELECT * FROM pizzasales;

/* Q1. Find out the total revenue */
SELECT ROUND(SUM(total_price),2) AS total_revenue FROM pizzasales;

/* Q2. */

