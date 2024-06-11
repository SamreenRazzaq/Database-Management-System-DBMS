USE DB_Lab9;

/*-- Create countries table
CREATE TABLE countries (
    code INT PRIMARY KEY,
    name varchar(50),
    continent_name varchar(50)
);

-- Create users table with email constraint
CREATE TABLE users (
    id INT PRIMARY KEY,
    full_name varchar(50),
    email varchar(50),
    gender varchar(50),
    date_of_birth varchar(50),
    country_code INT FOREIGN KEY REFERENCES countries(code),
    created_at varchar(50),
    -- Constraint
    CONSTRAINT chk_valid_email
    CHECK (CHARINDEX('@', email) > 0 AND CHARINDEX('.', email) > CHARINDEX('@', email) + 1)
);

-- Create orders table
CREATE TABLE orders (
    id INT PRIMARY KEY,
    user_id INT FOREIGN KEY REFERENCES users(id),
    status varchar(50),
    created_at varchar(50)
);

-- Create merchants table with country constraint
CREATE TABLE merchants (
    id INT PRIMARY KEY,
    merchant_name varchar(50),
    admin_id INT FOREIGN KEY REFERENCES users(id),
    country_code INT FOREIGN KEY REFERENCES countries(code),
    created_at varchar(50),
    -- Constraint
    CONSTRAINT chk_merchants_country
    CHECK (country_code <> 1) -- Assuming India has code 1
);

-- Alter constraint to allow merchants from India
ALTER TABLE merchants
DROP CONSTRAINT chk_merchants_country; -- Drop the existing constraint

ALTER TABLE merchants
ADD CONSTRAINT chk_merchants_country
CHECK (country_code IS NOT NULL); -- Add a new constraint allowing any non-null country_code

-- Create products table without chk_valid_status constraint
CREATE TABLE products (
    id INT PRIMARY KEY,
    merchant_id INT FOREIGN KEY REFERENCES merchants(id),
    name varchar(50),
    price int,
    status varchar(50),
    created_at varchar(50)
);

-- Create order_item table with chk_min_quantity constraint
CREATE TABLE order_item (
    order_id INT FOREIGN KEY REFERENCES orders(id),
    product_id INT FOREIGN KEY REFERENCES products(id),
    quantity INT,
    -- Constraint
    CONSTRAINT chk_min_quantity
    CHECK (quantity >= 50)
);

-- Go to a new batch
GO

-- Create trigger for chk_valid_status
CREATE TRIGGER trg_chk_valid_status
ON order_item
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN products p ON i.product_id = p.id
        WHERE (p.status = 'A' AND i.quantity >= 50) OR
              (p.status = 'NA' AND i.quantity < 50)
    )
    BEGIN
        -- Corrected syntax for raising an error
        THROW 50000, 'Invalid product status or quantity', 16;
    END
END;*/