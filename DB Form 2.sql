-- Create roles/groups in the database if they don't exist
USE Northwind;
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'Sales_Role')
BEGIN
    CREATE ROLE Sales_Role;
END;

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'HR_Role')
BEGIN
    CREATE ROLE HR_Role;
END;

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'CEO_Role')
BEGIN
    CREATE ROLE CEO_Role;
END;

-- Grant access for roles/groups
-- Grant SalesRole access to Orders and Customers tables
GRANT SELECT ON dbo.Orders TO Sales_Role;
GRANT SELECT ON dbo.Customers TO Sales_Role;

-- Grant HRRole access to the Employee table
GRANT SELECT ON dbo.Employees TO HR_Role;

-- Grant CEORole access to Orders, Customers, and Employee tables
GRANT SELECT ON dbo.Orders TO CEO_Role;
GRANT SELECT ON dbo.Customers TO CEO_Role;
GRANT SELECT ON dbo.Employees TO CEO_Role;

-- Create new database users if they don't exist
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'User_CEO')
BEGIN
    CREATE USER User_CEO FOR LOGIN User_CEO;
    ALTER ROLE CEO_Role ADD MEMBER User_CEO;
END;

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'User_HR')
BEGIN
    CREATE USER User_HR FOR LOGIN User_HR;
    ALTER ROLE HR_Role ADD MEMBER User_HR;
END;

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'User_Sales')
BEGIN
    CREATE USER User_Sales FOR LOGIN User_Sales;
    ALTER ROLE Sales_Role ADD MEMBER User_Sales;
END;

-- Add users to appropriate role/group if they are not already members
USE Northwind;
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'User_CEO')
BEGIN
    CREATE USER User_CEO FOR LOGIN User_CEO;
    ALTER ROLE CEO_Role ADD MEMBER User_CEO;
END;

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'User_HR')
BEGIN
    CREATE USER User_HR FOR LOGIN User_HR;
    ALTER ROLE HR_Role ADD MEMBER User_HR;
END;

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'User_Sales')
BEGIN
    CREATE USER User_Sales FOR LOGIN User_Sales;
    ALTER ROLE Sales_Role ADD MEMBER User_Sales;
END;