-- Zomato Restaurant Analysis
-- Analyst: Prajna
-- Tool: SQL
-- Date: 31-03-2026

-- Query 1: Total Restaurants by Area (Top 10)
SELECT area, 
       COUNT(*) AS total_restaurants,
       ROUND(AVG(delivery_ratings),2) AS avg_delivery_rating
FROM zomato
GROUP BY area
ORDER BY total_restaurants DESC
LIMIT 10;

-- Query 2: Average Cost by Area (Top 10 Most Expensive)
SELECT area,
       ROUND(AVG(averagecost),2) AS avg_cost,
       COUNT(*) AS total_restaurants
FROM zomato
GROUP BY area
ORDER BY avg_cost DESC
LIMIT 10;

-- Query 3: Top Rated Restaurants (Delivery Rating > 4.5)
SELECT name, area, delivery_ratings, averagecost
FROM zomato
WHERE CAST(delivery_ratings AS FLOAT) > 4.5
ORDER BY delivery_ratings DESC
LIMIT 10;

-- Query 4: Veg vs Non-Veg Restaurant Count
SELECT 
    CASE WHEN isvegonly = 1 THEN 'Veg Only' 
         ELSE 'Non-Veg' END AS restaurant_type,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(delivery_ratings),2) AS avg_rating
FROM zomato
GROUP BY isvegonly;

-- Query 5: Restaurants with Home Delivery vs Not
SELECT 
    CASE WHEN ishomedelivery = 1 THEN 'Home Delivery' 
         ELSE 'No Delivery' END AS delivery_type,
    COUNT(*) AS total_restaurants
FROM zomato
GROUP BY ishomedelivery;

-- Query 6: Budget Restaurants (Cost < 200)
SELECT name, area, averagecost, delivery_ratings
FROM zomato
WHERE CAST(averagecost AS INT) < 200
ORDER BY delivery_ratings DESC
LIMIT 10;

-- Query 7: Premium Restaurants (Cost > 1000)
SELECT name, area, averagecost, delivery_ratings
FROM zomato
WHERE CAST(averagecost AS INT) > 1000
ORDER BY averagecost DESC
LIMIT 10;

-- Query 8: Areas with Best Average Delivery Rating
SELECT area,
       ROUND(AVG(CAST(delivery_ratings AS FLOAT)),2) AS avg_rating,
       COUNT(*) AS total_restaurants
FROM zomato
GROUP BY area
HAVING COUNT(*) > 10
ORDER BY avg_rating DESC
LIMIT 10;