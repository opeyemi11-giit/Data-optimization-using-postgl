-- 3. regional_logistic 
CREATE VIEW analytics.regional_logistic AS
SELECT c.state,
	COUNT(o.order_id) AS order_volume,
	SUM(o.total_amount) AS total_revenue,
	AVG(o.total_amount) AS average_revenue
FROM operations.customers c
JOIN operations.orders o ON c.customer_id = o.customer_id
GROUP BY c.state
ORDER BY total_revenue DESC;


--5 Peak Sales Hours
CREATE MATERIALIZED VIEW analytics.peak_sales_hour AS
SELECT 
	EXTRACT(HOUR FROM order_datetime) AS hour_of_day,
	COUNT(order_id) AS order_volume
FROM operations.orders
GROUP BY EXTRACT(HOUR FROM order_datetime)
ORDER BY order_volume desc;




CREATE MATERIALIZED VIEW analytics.employee_leaderboard AS
SELECT
    e.employee_id,
    e.name AS employee_name,
    e.role,
    COUNT(o.order_id) AS total_orders_handled,
    SUM(o.total_amount) AS total_sales_value
FROM operations.employees e
JOIN operations.orders o
    ON (
        (e.role = 'Pharmacist' AND o.prescribed_by = e.employee_id)
        OR
        (e.role = 'Dispatcher' AND o.dispatched_by = e.employee_id)
       )
GROUP BY
    e.employee_id,
    e.name,
    e.role
ORDER BY
    total_sales_value DESC;