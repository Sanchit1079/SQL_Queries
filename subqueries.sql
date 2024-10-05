-- Subquery Example 1: Find users who have placed orders
SELECT username FROM users
WHERE user_id IN (
    SELECT DISTINCT user_id FROM orders
);


-- Subquery Example 2: Find users who haven't placed any orders
SELECT username FROM users
WHERE user_id NOT IN (
    SELECT user_id FROM orders
);


-- Subquery Example 3: Retrieve the details of the most expensive order
SELECT * FROM orders
WHERE amount = (
    SELECT MAX(amount) FROM orders
);


-- Subquery Example 4: List all users along with their total spending (if any)
SELECT username, (
    SELECT SUM(amount) FROM orders WHERE users.user_id = orders.user_id
) AS total_spent
FROM users;


-- Subquery Example 5: Get the user with the highest total spending
SELECT username FROM users
WHERE user_id = (
    SELECT user_id FROM orders
    GROUP BY user_id
    ORDER BY SUM(amount) DESC
    LIMIT 1
);
