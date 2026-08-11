-- WHERE
SELECT *
FROM restaurants
WHERE city = 'Mumbai';


-- DISTINCT
SELECT DISTINCT cuisine
FROM restaurants;


-- ORDER BY + LIMIT
SELECT *
FROM orders
ORDER BY amount_inr DESC
LIMIT 5;


-- LIKE
SELECT *
FROM restaurants
WHERE name LIKE '%Spice%';


-- IN
SELECT *
FROM customers
WHERE city IN ('Mumbai', 'Delhi');


-- BETWEEN
SELECT *
FROM orders
WHERE amount_inr BETWEEN 500 AND 1500;


-- NOT BETWEEN
SELECT *
FROM orders
WHERE amount_inr NOT BETWEEN 500 AND 1500;


-- IS NULL
SELECT *
FROM orders
WHERE rating IS NULL;
