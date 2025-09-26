-- the goal is to find the top 5 products with the highest total revenue generated from sales


SELECT p.product_id,p.product_name,(p.price * o.quantity) AS total_revenue
FROM product p
JOIN orders o
ON p.product_id = o.product_id
ORDER BY total_revenue DESC
LIMIT 5;