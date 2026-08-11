
SELECT *
From restaurants;

-- restaurants
SELECT COUNT(*) AS restaurant_count
FROM restaurants;

-- customers
SELECT COUNT(*) AS customer_count
FROM customers;

-- orders
SELECT COUNT(*) AS order_count
FROM orders;

-- cuisine targets
SELECT COUNT(*) AS cuisine_target_count
FROM cuisine_targets;

-- order status breakdown
SELECT status, COUNT(*) AS status_count
FROM orders
GROUP BY status
ORDER BY status;