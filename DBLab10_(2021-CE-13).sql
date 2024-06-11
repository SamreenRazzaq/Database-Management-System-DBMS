USE Northwind;

--HOMEWORK QUESTIONS

--IF/ELSE
--1:
/*-- Drop and create the table
IF OBJECT_ID('dbo.MultiplesOf10', 'U') IS NOT NULL DROP TABLE dbo.MultiplesOf10;
CREATE TABLE dbo.MultiplesOf10 (Multiple INT);
-- Insert values using a WHILE loop
DECLARE @Counter INT = 1;
WHILE @Counter <= 10
BEGIN
    INSERT INTO dbo.MultiplesOf10 (Multiple) VALUES (@Counter * 10);
    SET @Counter = @Counter + 1;
END;
-- Display the contents of the table or print a message if empty
IF EXISTS (SELECT 1 FROM dbo.MultiplesOf10)
    SELECT * FROM dbo.MultiplesOf10;
ELSE
    PRINT 'The table is empty.';*/

--2:
/*
DECLARE @Counter INT = 1;
WHILE @Counter <= 50
BEGIN
    DECLARE @ProductName NVARCHAR(255);
    SELECT TOP 1 @ProductName = ProductName
    FROM (
        SELECT ProductName, ROW_NUMBER() OVER (ORDER BY ProductID) AS RowNum
        FROM Products
        WHERE UnitsInStock <> 0
    ) AS Subquery
    WHERE RowNum = @Counter;
    IF @ProductName IS NOT NULL
        PRINT 'Product Name: ' + @ProductName;
    SET @Counter = @Counter + 1;
END;*/

--CASE
--1:
/*
SELECT
    EmployeeID,
    FirstName + ' ' + LastName AS EmployeeName,
    CASE
        WHEN ReportsTo IS NOT NULL THEN 'Subordinate'
        ELSE 'Superior'
    END AS EmploymentStatus
FROM Employees;*/

--STORED PROCEDURES
--1:
/*
GO
CREATE FUNCTION dbo.GetMultiples(@Number INT)
RETURNS TABLE
AS
RETURN
(
    WITH Numbers AS (
        SELECT TOP 10 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS N
        FROM master.dbo.spt_values
    )
    SELECT N, @Number * N AS Multiple
    FROM Numbers
);*/

--2:
/*
-- Drop the procedure if it already exists
IF OBJECT_ID('dbo.CalculateOrderBillProcedure', 'P') IS NOT NULL
    DROP PROCEDURE dbo.CalculateOrderBillProcedure;
GO
-- Create the procedure
CREATE PROCEDURE dbo.CalculateOrderBillProcedure
    @OrderID INT
AS
BEGIN
    SELECT OrderID, SUM(UnitPrice * Quantity) AS TotalBill
    FROM [Order Details]
    WHERE OrderID = @OrderID
    GROUP BY OrderID;
END;
GO
-- Drop the function if it already exists
IF OBJECT_ID('dbo.CalculateOrderBillFunction', 'IF') IS NOT NULL
    DROP FUNCTION dbo.CalculateOrderBillFunction;
GO
-- Create the function
CREATE FUNCTION dbo.CalculateOrderBillFunction(@OrderID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT OrderID, SUM(UnitPrice * Quantity) AS TotalBill
    FROM [Order Details]
    WHERE OrderID = @OrderID
    GROUP BY OrderID
);
GO*/

--ERROR HANDLING
--1:
/*
DECLARE @Quantity INT;
BEGIN TRY
    -- Try to retrieve the quantity for Order ID 10248
    SET @Quantity = (SELECT TOP 1 Quantity FROM [Order Details] WHERE OrderID = 10248);

    -- Display the quantity if no error occurred
    PRINT 'Quantity: ' + CAST(@Quantity AS NVARCHAR(10));
END TRY
BEGIN CATCH
    -- Catch and handle the error
    PRINT 'Error Occurred: ' + ERROR_MESSAGE();
END CATCH;
*/

--2:
/*
-- Drop the procedure if it already exists
IF OBJECT_ID('dbo.ErrorInfo', 'P') IS NOT NULL
    DROP PROCEDURE dbo.ErrorInfo;
GO
-- Create the ErrorInfo procedure
CREATE PROCEDURE dbo.ErrorInfo
AS
BEGIN
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
    PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS NVARCHAR(10));
    PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR(10));
    PRINT 'Error Message: ' + ERROR_MESSAGE();
    PRINT 'Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR(10));
    PRINT 'Error Procedure: ' + ERROR_PROCEDURE();
    PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS NVARCHAR(10));
    PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR(10));
END;
GO
-- Example of using the ErrorInfo procedure in error handling
DECLARE @Quantity INT;

BEGIN TRY
    -- Try to retrieve the quantity for Order ID 10248
    SET @Quantity = (SELECT Quantity FROM[Order Details] WHERE OrderID = 10248);

    -- Display the quantity if no error occurred
    PRINT 'Quantity: ' + CAST(@Quantity AS NVARCHAR(10));
END TRY
BEGIN CATCH
    -- Catch and handle the error
    PRINT 'Error Occurred: ' + ERROR_MESSAGE();   
    -- Call the ErrorInfo procedure to display detailed error information
    EXEC dbo.ErrorInfo;
END CATCH;*/