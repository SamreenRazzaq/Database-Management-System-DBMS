 USE [DB_Lab9 (2021-CE-13)];

-- DATA INSERTION FOR countries

INSERT INTO countries (code, name, continent_name) VALUES
(1, 'Pakistan', 'Continent1'),
(2, 'India', 'Continent2'),
(3, 'USA','Continent3'),
(4, 'Australia', 'Continent4'),
(5, 'Turkey', 'Contient5'),
(6, 'UAE',    'Contient6'),
(7, 'Sudan',  'Contient7'),
(8, 'India',  'Continent8'),
(9, 'Pakistan', 'Continent9'),
(10, 'USA',     'Continent10'),
(11, 'Australia', 'Continent11'),
(12, 'Turkey',    'Contient12'),
(13, 'UAE',       'Contient13'),
(14, 'Sudan',     'Contient14'),
(15, 'Pakistan',   'Continent15'),
(16, 'USA',        'Continent16'),
(17, 'Australia',  'Continent17'),
(18, 'Turkey',      'Contient18'),
(19, 'UAE',       'Contient19'),
(20, 'UAE',        'Contient20')
;
-- DATA INSERTION FOR Users

INSERT INTO users (id, full_name, email, gender, date_of_birth, country_code, created_at) VALUES
(1, 'Samreen', 'user1@example.com', 'Female', '2003-03-30', 1, '2023-11-10 12:00:00'),
(2, 'Urwah', 'user2@example.com', 'Female', '2003-04-25', 2, '2023-12-09 14:30:00'),
(3, 'Ayesha', 'user3@example.com', 'Female', '2003-04-04', 3, '2023-11-10 12:00:00'),
(4, 'Aiman',      'user4@example.com', 'Female', '2003-07-15', 4, '2023-15-09 14:30:00'),
(5, 'Azam', 'user5@example.com', 'Male', '2000-08-05', 4, '2023-11-10 12:00:00'),
(6, 'Azeem',      'user6@example.com', 'Male', '2004-07-25', 3, '2023-15-09 14:30:00'),
(7, 'Qasim',      'user7@example.com', 'Male', '2006-11-21', 5, '2023-11-10 12:00:00'),
(8, 'Umer',    'user8@example.com', 'Male', '2003-07-08', 6, '2023-15-09 14:30:00'),
(9, 'Abdulallah', 'user9@example.com', 'Male', '2003-04-04', 8, '2023-11-10 12:00:00'),
(10, 'Iram',   'user10@example.com', 'Female', '2003-07-15', 3, '2023-15-09 14:30:00'),
(11, 'Kiran', 'user11@example.com', 'Female', '2003-04-04', 5, '2023-11-10 12:00:00'),
(12, 'Iffat',    'user12@example.com', 'Female', '2003-07-15', 6, '2023-15-09 14:30:00'),
(13, 'Iman Fatima', 'user13@example.com', 'Female', '2003-04-04', 1, '2023-11-10 12:00:00'),
(14, 'Subhan',      'user14@example.com', 'Female', '2003-07-15', 3, '2023-15-09 14:30:00'),
(15, 'Rizwan',      'user15@example.com', 'Male', '2003-04-04', 5, '2023-11-10 12:00:00'),
(16, 'Mishal',    'user16@example.com', 'Female', '2003-07-15', 6, '2023-15-09 14:30:00'),
(17, 'Hanan', 'user17@example.com', 'Male', '2003-04-04', 1, '2023-11-10 12:00:00'),
(18, 'Jannat',      'user18@example.com', 'Female', '2003-07-15', 3, '2023-15-09 14:30:00'),
(19, 'Hoorain', 'user19@example.com', 'Femaile', '2003-04-04', 5, '2023-11-10 12:00:00'),
(20, 'Burhan', 'user20@example.com', 'Male', '1998-03-01', 3, '2023-11-08 11:45:00');

-- Insertion in Orders Table

INSERT INTO Orders (id, user_id, status, created_at) VALUES
(1, 1, 'Pending', '2023-11-10 12:15:00'),
(2, 1, 'Shipped', '2023-11-09 14:45:00'),
(3, 2, 'Delivered', '2023-15-10 12:15:00'),
(4, 3, 'Shipped', '2023-17-09 14:45:00'),
(5, 2, 'Delivered', '2023-23-10 12:15:00'),
(6, 3, 'Shipped', '2023-19-10 14:45:00'),
(7, 4, 'Pending', '2023-11-10 12:15:00'),
(8, 4, 'Shipped', '2023-11-09 14:45:00'),
(9, 5, 'Pending', '2023-15-10 12:15:00'),
(10, 6, 'Shipped', '2023-17-09 14:45:00'),
(11, 6, 'Delivered', '2023-23-10 12:15:00'),
(12, 9, 'Shipped', '2023-19-10 14:45:00'),
(13, 10, 'Pending', '2023-11-10 12:15:00'),
(14, 17, 'Shipped', '2023-11-09 14:45:00'),
(15, 11, 'Delivered', '2023-15-10 12:15:00'),
(16, 16, 'Shipped', '2023-17-09 14:45:00'),
(17, 12, 'Delivered', '2023-23-10 12:15:00'),
(18, 13, 'Shipped', '2023-19-10 14:45:00'),
(19, 14, 'Pending', '2023-11-10 12:15:00'),
(20, 15, 'Delivered', '2023-11-08 12:30:00');

--Insertion in order_items Table

INSERT INTO order_item (order_id,product_id, quantity) VALUES
(1,1, 70),
(2, 2,60),
(1, 3,80),
(2,4, 90),
(3,5,100),
(4,8, 50),
(4, 6,60),
(5, 7,90),
(6,9, 90),
(4,17,180),
(15,10, 70),
(13, 11,60),
(12, 13,300),
(2,12, 290),
(16,14,140),
(6,15, 220),
(7, 18,180),
(5, 19,200),
(19,16, 190),
(20,20, 55);

-- Insertion in merchants table

INSERT INTO merchants (id, merchant_name, admin_id, country_code, created_at) VALUES
(1, 'Merchant1', 4, 4, '2023-11-10 08:30:00'),
(2, 'Merchant2', 5, 2, '2023-15-09 07:45:00'),
(3, 'Merchant3', 7, 8, '2023-16-10 08:30:00'),
(4, 'Merchant4', 8, 6, '2023-11-09 07:45:00'),
(5, 'Merchant5', 9, 7, '2023-17-10 08:30:00'),
(6, 'Merchant6', 10, 12, '2023-23-09 07:45:00'),
(7, 'Merchant7', 4, 12, '2023-25-10 08:30:00'),
(8, 'Merchant8', 11, 13, '2023-01-09 07:45:00'),
(9, 'Merchant9', 8, 11, '2023-11-10 08:30:00'),
(10, 'Merchant10', 5, 8, '2023-15-09 07:45:00'),
(11, 'Merchant11', 12, 10, '2023-16-10 08:30:00'),
(12, 'Merchant12', 15, 5, '2023-11-09 07:45:00'),
(13, 'Merchant13', 14, 11, '2023-17-10 08:30:00'),
(14, 'Merchant14', 9, 18, '2023-23-09 07:45:00'),
(15, 'Merchant15', 19, 19, '2023-25-10 08:30:00'),
(16, 'Merchant16', 6, 2, '2023-01-09 07:45:00'),
(17, 'Merchant17', 4, 6, '2023-25-10 08:30:00'),
(18, 'Merchant18', 7, 9, '2023-01-09 07:45:00'),
(19, 'Merchant19', 12, 10, '2023-11-10 08:30:00'),
(20, 'Merchant20', 6, 3, '2023-11-08 06:15:00');

-- Insertion in Products table

INSERT INTO products (id, merchant_id, name, price, status, created_at,quantity) VALUES
(1, 1, 'Product1', 100, 'A', '2023-11-10 08:45:00',50),
(2, 2, 'Product2', 75, 'NA', '2023-11-09 09:00:00',40),
(3, 3, 'Product3', 60, 'A', '2023-11-10 08:45:00',100),
(4, 4, 'Product4', 55, 'NA', '2023-11-09 09:00:00',60),
(5 ,4, 'Product5', 50, 'A', '2023-11-10 08:45:00',90),
(6, 6, 'Product6', 80, 'NA', '2023-11-09 09:00:00',10),
(7, 8, 'Product7', 10, 'A', '2023-11-10 08:45:00',100),
(8, 7, 'Product8', 160, 'NA', '2023-11-09 09:00:00',190),
(9, 9, 'Product9', 140, 'A', '2023-11-09 09:00:00',200),
(10, 11, 'Product10', 50, 'A', '2023-11-10 08:45:00',20),
(11, 10, 'Product11', 50, 'A', '2023-11-10 08:45:00',78),
(12, 12, 'Product12', 75, 'NA', '2023-11-09 09:00:00',90),
(13, 14, 'Product13', 60, 'A', '2023-11-10 08:45:00',66),
(14, 13, 'Product14', 55, 'NA', '2023-11-09 09:00:00',23),
(15, 15, 'Product15', 50, 'A', '2023-11-10 08:45:00',88),
(16, 16, 'Product16', 80, 'NA', '2023-11-09 09:00:00',74),
(17, 17, 'Product17', 10, 'A', '2023-11-10 08:45:00',122),
(18, 18, 'Product18', 100, 'NA', '2023-11-09 09:00:00',23),
(19, 19, 'Product19', 120, 'A', '2023-11-09 09:00:00',21),
(20, 20, 'Product20', 40, 'A', '2023-11-08 09:15:00',67);

