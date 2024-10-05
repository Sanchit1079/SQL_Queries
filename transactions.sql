-- Start a transaction to insert a user and their order
START TRANSACTION;

-- Insert a new user
INSERT INTO users (user_id, username, email)
VALUES (4, 'new_user', 'new_user@example.com');

-- Insert an order for the newly added user
INSERT INTO orders (order_id, user_id, product_name, amount)
VALUES (1, 4, 'Smartphone', 499.99);

-- Commit the transaction to save changes
COMMIT;


-- Another example with rollback:
-- Start a transaction to update a user’s email and insert a new order
START TRANSACTION;

-- Update user email
UPDATE users
SET email = 'updated_email@example.com'
WHERE user_id = 4;

-- Insert an order for the updated user
INSERT INTO orders (order_id, user_id, product_name, amount)
VALUES (2, 4, 'Laptop', 999.99);

-- In case something goes wrong, rollback
ROLLBACK;

-- If all is well, commit the transaction to save changes
COMMIT;
