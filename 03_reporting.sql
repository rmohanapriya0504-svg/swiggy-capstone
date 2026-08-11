-- Restaurant Revenue Tiers


SELECT
    r.restaurant_id,
    r.name,
    COALESCE(SUM(
        CASE
            WHEN o.status = 'Delivered' THEN o.amount_inr
            ELSE 0
        END
    ), 0) AS total_revenue,
    CASE
        WHEN COALESCE(SUM(
            CASE
                WHEN o.status = 'Delivered' THEN o.amount_inr
                ELSE 0
            END
        ), 0) >= 50000 THEN 'High'
        WHEN COALESCE(SUM(
            CASE
                WHEN o.status = 'Delivered' THEN o.amount_inr
                ELSE 0
            END
        ), 0) >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS revenue_tier
FROM restaurants r
LEFT JOIN orders o
    ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.name
ORDER BY total_revenue DESC;


-- Monthly Cuisine Revenue Report


SELECT
    r.cuisine,
    strftime('%Y-%m', o.order_date) AS month,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS avg_revenue
FROM orders o
INNER JOIN restaurants r
    ON o.restaurant_id = r.restaurant_id
WHERE o.status = 'Delivered'
GROUP BY r.cuisine, strftime('%Y-%m', o.order_date)
ORDER BY r.cuisine, month;


-- Cuisine Target / Variance Report

WITH cuisine_revenue AS (
    SELECT
        r.cuisine,
        SUM(o.amount_inr) AS total_revenue
    FROM orders o
    INNER JOIN restaurants r
        ON o.restaurant_id = r.restaurant_id
    WHERE o.status = 'Delivered'
    GROUP BY r.cuisine
)

SELECT
    cr.cuisine,
    cr.total_revenue,
    ct.target_revenue_inr,
    ct.target_revenue_inr - cr.total_revenue AS variance,
    ((cr.total_revenue - ct.target_revenue_inr) * 100.0)
        / ct.target_revenue_inr AS percentage_variance,
    CASE
        WHEN cr.total_revenue >= ct.target_revenue_inr
            THEN 'Above Target'
        WHEN ((cr.total_revenue - ct.target_revenue_inr) * 100.0)
             / ct.target_revenue_inr >= -15
            THEN 'Below Target - Watch'
        ELSE 'Below Target - Critical'
    END AS target_status
FROM cuisine_revenue cr
INNER JOIN cuisine_targets ct
    ON cr.cuisine = ct.cuisine
ORDER BY cr.cuisine;


