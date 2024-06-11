USE DB_Lab9;

/*-- Insert data into countries
INSERT INTO countries (code, name, continent_name) VALUES
(1, 'India', 'Asia'),
(2, 'USA', 'North America'),
(3, 'Canada', 'North America'),
(4, 'Brazil', 'South America');


-- Insert data into users
INSERT INTO users (id, full_name, email, gender, date_of_birth, country_code, created_at) VALUES
(1, 'John Doe', 'john.doe@example.com', 'Male', '1990-01-01', 2, '2023-11-09'),
(2, 'Jane Smith', 'jane.smith@example.com', 'Female', '1995-02-15', 1, '2023-11-09'),
(3, 'Alice Johnson', 'alice.johnson@example.com', 'Female', '1988-05-20', 3, '2023-11-09'),
(4, 'Bob Anderson', 'bob.anderson@example.com', 'Male', '1992-08-10', 4, '2023-11-09');

-- Insert data into orders
INSERT INTO orders (id, user_id, status, created_at) VALUES
(1, 1, 'Pending', '2023-11-09'),
(2, 2, 'Shipped', '2023-11-09'),
(3, 3, 'Processing', '2023-11-09'),
(4, 4, 'Delivered', '2023-11-09');

-- Insert data into merchants
INSERT INTO merchants (id, merchant_name, admin_id, country_code, created_at) VALUES
(1, 'GlobalMart', 1, 2, '2023-11-09'),
(2, 'LocalShop', 2, 1, '2023-11-09'),
(3, 'TechStore', 3, 2, '2023-11-09'),
(4, 'FashionHub', 4, 4, '2023-11-09');

-- Insert data into products
INSERT INTO products (id, merchant_id, name, price, status, created_at) VALUES
(1, 1, 'Widget', 20, 'A', '2023-11-09'),
(2, 2, 'Gadget', 30, 'NA', '2023-11-09'),
(3, 3, 'Laptop', 800, 'A', '2023-11-09'),
(4, 4, 'Dress', 50, 'A', '2023-11-09');

-- Insert data into order_item
INSERT INTO order_item (order_id, product_id, quantity) VALUES
(1, 1, 60),
(2, 2, 40),
(3, 3, 30),
(4, 4, 20);
*/