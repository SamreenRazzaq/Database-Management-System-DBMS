USE [DB Lab9];

CREATE TABLE countries (
	code INT PRIMARY KEY,
	name varchar(50),
	continent_name varchar(50)
);

CREATE TABLE users (
	id INT PRIMARY KEY,
	full_name varchar(50),
	email varchar(50),
	gender varchar(50),
	date_of_birth varchar(50),
	country_code INT FOREIGN KEY REFERENCES countries(code),
	created_at varchar(50)
);

CREATE TABLE orders (
	id INT PRIMARY KEY ,
	user_id INT FOREIGN KEY REFERENCES users(id),
	status varchar(50),
	created_at varchar(50)
);

CREATE TABLE merchants (
	id INT PRIMARY KEY ,
	merchant_name varchar(50),
	admin_id INT FOREIGN KEY REFERENCES users(id),
	country_code INT FOREIGN KEY REFERENCES countries(code),
	created_at varchar(50)
);

CREATE TABLE products (
	id INT PRIMARY KEY ,
	merchant_id INT FOREIGN KEY REFERENCES merchants(id),
	name varchar(50),
	price int,
	status varchar(50),
	created_at varchar(50)
);

CREATE TABLE order_item (
	order_id INT FOREIGN KEY REFERENCES orders(id),
	product_id INT FOREIGN KEY REFERENCES products(id),
	quantity INT,
);