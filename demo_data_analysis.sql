-- show all the tables and their datas
select * from Customers;
select * from Restaurants;
select * from Delivery_Agents;
select * from Menu_Items;
select * from Orders;
select * from Order_Items;

-- 1. Total platform revenu
SELECT SUM(total_amount) AS total_revenue
FROM Orders
WHERE order_status = 'Delivered';


-- 2. Average order value
SELECT ROUND(AVG(total_amount), 2) AS avg_order_value
FROM Orders;


-- 3. Top earning restaurants
SELECT r.restaurant_name,
       SUM(o.total_amount) AS revenue
FROM Restaurants r
JOIN Orders o ON r.restaurant_id = o.restaurant_id
WHERE o.order_status = 'Delivered'
GROUP BY r.restaurant_id
ORDER BY revenue DESC;


-- 4. Most popular cuisine type
SELECT r.cuisine_type,
       COUNT(o.order_id) AS total_orders
FROM Restaurants r
JOIN Orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.cuisine_type
ORDER BY total_orders DESC;


-- 5. Most ordered menu items
SELECT m.item_name,
       SUM(oi.quantity) AS total_quantity
FROM Menu_Items m
JOIN Order_Items oi ON m.item_id = oi.item_id
GROUP BY m.item_id
ORDER BY total_quantity DESC;


-- 6. Highest spending customers
SELECT c.full_name,
       SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;


-- 7. Order status distribution
SELECT order_status,
       COUNT(*) AS total_orders
FROM Orders
GROUP BY order_status;


-- 8. Cancellation percentage
SELECT ROUND(
       SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
       2
       ) AS cancellation_rate_percent
FROM Orders;


-- 9. Delivery agent performance
SELECT d.full_name,
       COUNT(o.order_id) AS completed_deliveries
FROM Delivery_Agents d
JOIN Orders o ON d.agent_id = o.agent_id
WHERE o.order_status = 'Delivered'
GROUP BY d.agent_id
ORDER BY completed_deliveries DESC;


-- 10. Payment method usage
SELECT payment_method,
       COUNT(*) AS usage_count
FROM Payments
GROUP BY payment_method
ORDER BY usage_count DESC;


-- 11. Pending payments count
SELECT COUNT(*) AS pending_payments
FROM Payments
WHERE payment_status = 'Pending';


-- 12. Revenue by cuisine type
SELECT r.cuisine_type,
       SUM(o.total_amount) AS revenue
FROM Restaurants r
JOIN Orders o ON r.restaurant_id = o.restaurant_id
WHERE o.order_status = 'Delivered'
GROUP BY r.cuisine_type
ORDER BY revenue DESC;


-- 13. Restaurants with highest average order value
SELECT r.restaurant_name,
       ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM Restaurants r
JOIN Orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id
ORDER BY avg_order_value DESC;


-- 14. Orders without delivery agents
SELECT COUNT(*) AS unassigned_orders
FROM Orders
WHERE agent_id IS NULL;


-- 15. Peak order hour
SELECT HOUR(order_date) AS order_hour,
       COUNT(*) AS total_orders
FROM Orders
GROUP BY HOUR(order_date)
ORDER BY total_orders DESC;


-- 16. Revenue lost due to cancelled orders
SELECT SUM(total_amount) AS revenue_lost
FROM Orders
WHERE order_status = 'Cancelled';


-- 17. Menu availability analysis
SELECT availability,
       COUNT(*) AS item_count
FROM Menu_Items
GROUP BY availability;


-- 18. Customers ordering from multiple restaurants
SELECT c.full_name,
       COUNT(DISTINCT o.restaurant_id) AS restaurants_used
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING restaurants_used > 1;


-- 19. Restaurant order volume
SELECT r.restaurant_name,
       COUNT(o.order_id) AS total_orders
FROM Restaurants r
LEFT JOIN Orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id
ORDER BY total_orders DESC;


-- 20. Customer segmentation by spending
SELECT
    CASE
        WHEN total_spent >= 300 THEN 'High Value'
        WHEN total_spent >= 150 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment,
    COUNT(*) AS total_customers
FROM (
    SELECT customer_id,
           SUM(total_amount) AS total_spent
    FROM Orders
    GROUP BY customer_id
) t
GROUP BY customer_segment;