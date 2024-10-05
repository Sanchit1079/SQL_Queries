-- INNER JOIN: Retrieve users who have placed orders and the details of their orders
SELECT users.username, orders.product_name, orders.amount
FROM users
INNER JOIN orders ON users.user_id = orders.user_id;
