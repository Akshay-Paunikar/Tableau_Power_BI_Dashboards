CREATE DATABASE Car_Sales;
USE Car_Sales;
SELECT * FROM car_sales;
SELECT COUNT(*) FROM car_sales;

/* SALES OVERVIEW */ - /*912269047123*/

-- 1. Total Sales of Cars --
SELECT SUM(Price) AS Total_Sales FROM car_sales;

-- No of Total Cars sold --
SELECT COUNT(*) AS total_cars_sold FROM car_sales;

-- Average Price of the cars --
SELECT AVG(Price) AS avg_car_price FROM car_sales;

-- 2. Count of Male and Females in the data --
SELECT Gender, COUNT(*) FROM car_sales
GROUP BY Gender;

-- Total Sales by Gender --
SELECT Gender, SUM(Price) AS Total_Sales FROM car_sales
GROUP BY Gender;

-- Average Sales by Gender --
SELECT Gender, AVG(Price) AS Avg_Sales FROM car_sales
GROUP BY Gender;

-- 3. Total Sales by Dealer Name (Top 10) --
SELECT Dealer_Name, SUM(Price) AS Total_Sales FROM car_sales
GROUP BY Dealer_Name
ORDER BY Total_Sales DESC LIMIT 10;

-- No of cars sold by Dealer name -- 
SELECT Dealer_Name, COUNT(*) AS total_cars_sold FROM car_sales
GROUP BY Dealer_Name
ORDER BY total_cars_sold DESC LIMIT 10;

-- Average Sales by Dealer Name (Top 10) --
SELECT Dealer_Name, AVG(Price) AS Avg_Sales FROM car_sales
GROUP BY Dealer_Name
ORDER BY Avg_Sales DESC LIMIT 10;

-- 4. Total Sales by Car Company (Top 10) --
SELECT Company, SUM(Price) AS Total_Sales FROM car_sales
GROUP BY Company
ORDER BY Total_Sales DESC LIMIT 10;

-- Total Sales by Car Company and Model --
SELECT Company, Model, SUM(Price) AS Total_Sales FROM car_sales
GROUP BY Company, Model
Order BY Company ASC, Total_Sales DESC;

-- Average Sales by Car Company and Model --
SELECT Company, Model, AVG(Price) AS Avg_Sales FROM car_sales
GROUP BY Company, Model
Order BY Company ASC, Avg_Sales DESC;

-- No of cars sold by Car Company and Model --
SELECT Company, Model, COUNT(*) AS num_cars_sold FROM car_sales
GROUP BY Company, Model
ORDER BY Company ASC, num_cars_sold DESC;

-- 5. Total Sales by Engine --
SELECT Engine, SUM(Price) AS Total_Sales FROM car_sales
GROUP BY Engine;

-- No of cars sold by engine type --


-- Total Sales by Transmission --
SELECT Transmission, SUM(Price) AS Total_Sales FROM car_sales
GROUP BY Transmission;

-- Total Sales by Color --
SELECT Color, SUM(Price) AS Total_Sales FROM car_sales
GROUP BY Color
ORDER BY Total_Sales DESC;

-- Total Sales by Body_Style --
SELECT Body_Style, SUM(Price) AS Total_Sales FROM car_sales
GROUP BY Body_Style
ORDER BY Total_Sales DESC;

-- Total Sales by Dealer_Region --
SELECT Dealer_Region, SUM(Price) AS Total_Sales FROM car_sales
GROUP BY Dealer_Region
ORDER BY Total_Sales DESC;