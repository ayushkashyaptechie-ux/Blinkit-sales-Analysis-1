select *from blinkit_data;


--Data cleaning
UPDATE blinkit_data
SET `Item Fat Content` =
CASE
    WHEN `Item Fat Content` IN ('LF', 'low fat') THEN 'Low Fat'
    WHEN `Item Fat Content` = 'reg' THEN 'Regular'
    ELSE `Item Fat Content`
END;

SELECT `Item Fat Content`
FROM blinkit_data
LIMIT 5	;


--The overall revenue generated from all items sold.
SELECT CAST(SUM(Sales)/100000 AS DECIMAL(10,2)) AS Total_Sales_in_Millions
from blinkit_data;

--The average revenue per sale
SELECT CAST(AVG(Sales) AS DECIMAL(10,2)) AS Average_Sales
FROM blinkit_data;

--The total count of different items sold.
SELECT COUNT(*) AS No_of_items
FROM blinkit_data;

--The average customer rating for items sold. 
SELECT CAST(AVG(Rating) AS DECIMAL(10,2)) AS Average_ratings 
from blinkit_data;


--Total Sales by Fat content                                       
SELECT 
     `Item Fat Content`,
     sum(Sales) as total_sales,
     avg(Sales) as average_sales,
     count(*) as number_of_items,
     avg(Rating) as average_ratings
FROM blinkit_data
GROUP BY `Item Fat Content`;


--2)Total sales by Item type
SELECT 
     `Item Type`,
     sum(Sales) as total_sales,
     avg(Sales) as average_sales,
     count(*) as number_of_items,
     avg(Rating) as average_ratings
FROM blinkit_data
GROUP BY `Item Type`;

--Fat content by outlet for total sales
SELECT
    `Outlet Identifier`,
    `Item Fat Content`,
    SUM(Sales) AS total_sales,
    AVG(Sales) AS average_sales,
    COUNT(*) AS number_of_items,
AVG(Rating) AS average_rating
FROM blinkit_data
GROUP BY
    `Outlet Identifier`,
    `Item Fat Content`
ORDER BY
    `Outlet Identifier`,
    `Item Fat Content`;



--Total Sales by outlet establishment
SELECT 
     `Outlet Establishment Year`,
     sum(Sales) as total_sales,
     avg(Sales) as average_sales,
     count(*) as number_of_items,
     avg(Rating) as average_ratings
FROM blinkit_data
GROUP BY `Outlet Establishment Year`
ORDER BY `Outlet Establishment Year`;


--Percentage of Sales by Outlet Size 
SELECT 
`Outlet Size`,
 CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
            AVG(Sales) AS average_sales,
            COUNT(*) AS number_of_items,
            AVG(Rating) AS average_ratings, 
CAST( SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER() AS DECIMAL(10,2) ) AS sales_percentage 
FROM blinkit_data 
GROUP BY `Outlet Size` 
ORDER BY `Outlet Size`;



--Sales by Outlet Location
SELECT 
    `Outlet Location Type`,
    SUM(Sales) AS total_sales,
    AVG(Sales) AS average_sales,
    COUNT(*) AS number_of_items,
    AVG(Rating) AS average_ratings
FROM blinkit_data
GROUP BY `Outlet Location Type`
ORDER BY `Outlet Location Type`;

--7)All metrics by outlet type
SELECT 
      `Outlet Type`,
       SUM(Sales) AS total_sales,
       AVG(Sales) AS average_sales,
       COUNT(*) AS number_of_items,
       AVG(Rating) AS average_ratings
FROM blinkit_data 
GROUP BY `Outlet Type` 
ORDER BY `Outlet Type`;
