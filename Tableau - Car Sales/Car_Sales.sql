CREATE DATABASE Car_Sales;
USE Car_Sales;
SELECT * FROM car_sales;
SELECT COUNT(*) FROM car_sales;

/* SALES OVERVIEW */ - /*912269047123*/

-- 1. Total Sales of Cars --
SELECT SUM(Price) AS Total_Sales FROM car_sales;

-- Count of Male and Females in the data --
SELECT Gender, COUNT(*) FROM car_sales
GROUP BY Gender;

-- Total Sales by Gender --
SELECT Gender, SUM(Price) AS Total_Sales FROM car_sales
GROUP BY Gender;

-- Average Sales by Gender --
SELECT Gender, AVG(Price) AS Avg_Sales FROM car_sales
GROUP BY Gender;

-- Total Sales by Dealer Name (Top 10) --
SELECT Dealer_Name, SUM(Price) AS Total_Sales FROM car_sales
GROUP BY Dealer_Name
ORDER BY Total_Sales DESC LIMIT 10;

-- Total Sales by Car Company (Top 10) --
SELECT Company, SUM(Price) AS Total_Sales FROM car_sales
GROUP BY Company
ORDER BY Total_Sales DESC LIMIT 10;

-- Total Sales by Car Company and Model --
SELECT Company, Model, SUM(Price) AS Total_Sales FROM car_sales
GROUP BY Company, Model
Order BY Company ASC, Total_Sales DESC;

-- Total Sales by Engine --
SELECT Engine, SUM(Price) AS Total_Sales FROM car_sales
GROUP BY Engine;

-- 


