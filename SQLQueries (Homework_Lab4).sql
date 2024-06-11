--Homework:

--1:
SELECT CustomerID, ContactName
FROM Customers
WHERE CustomerID IN (
		SELECT CustomerID
		FROM Orders
WHERE ShippedDate > RequiredDate)

--2:
SELECT ProductName, ContactName, CompanyName
FROM Products,Customers
WHERE SupplierID IN (
		SELECT SupplierID
		FROM Suppliers)

--3:
SELECT TOP 10 Products.ProductName,
              (
                SELECT SUM([Order Details].Quantity)
                FROM [Order Details]
                WHERE [Order Details].ProductID = Products.ProductID
              ) AS TotalSales
FROM Products 
WHERE Products.ProductID IN (
    SELECT [Order Details].ProductID
    FROM [Order Details] 
    WHERE [Order Details].OrderID IN (
        SELECT Orders.OrderID
        FROM Orders 
        WHERE YEAR(Orders.OrderDate) = 1998))
ORDER BY TotalSales DESC


--4:
SELECT CONCAT(Employees.FirstName, ' ', Employees.LastName) AS EmployeeName,
       (
           SELECT CONCAT(Manager.FirstName, ' ', Manager.LastName)
           FROM Employees AS Manager
           WHERE Manager.EmployeeID = Employees.ReportsTo
       ) AS ManagerName
FROM Employees
ORDER BY EmployeeName

--5:
SELECT CONCAT(Managers.FirstName, ' ', Managers.LastName) AS ManagerName
FROM Employees AS Managers
WHERE Managers.EmployeeID NOT IN (
    SELECT DISTINCT ReportsTo
    FROM Employees AS Employees
    WHERE ReportsTo IS NOT NULL)

--6:
SELECT PRODUCTID, Productname, UnitPrice
FROM Products 
WHERE UnitPrice > (
  SELECT AVG(UnitPrice)
  FROM Products)

--7:
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice = (
  SELECT MAX(UnitPrice)
  FROM Products
  WHERE UnitPrice < (
    SELECT MAX(UnitPrice)
    FROM Products))

--8:
SELECT CONCAT(Employees.FirstName, ' ', Employees.LastName) AS EmployeeName,
       (
           SELECT CONCAT(Manager.FirstName, ' ', Manager.LastName)
           FROM Employees AS Manager
           WHERE Manager.EmployeeID = Employees.ReportsTo
       ) AS ManagerName,
       Employees.BirthDate AS EmployeeAge,
       (
           SELECT Manager.BirthDate
           FROM Employees AS Manager
           WHERE Manager.EmployeeID = Employees.ReportsTo
       ) AS ManagerAge
FROM Employees
WHERE Employees.BirthDate > (
    SELECT Manager.BirthDate
    FROM Employees AS Manager
    WHERE Manager.EmployeeID = Employees.ReportsTo)


--9:
SELECT DISTINCT Products.ProductName
FROM Products
WHERE Products.ProductID IN (
  SELECT [Order Details].ProductID
  FROM [Order Details]
  WHERE [Order Details].OrderID IN (
    SELECT Orders.OrderID
    FROM Orders
    WHERE CONVERT(DATE, Orders.OrderDate) = '1997-08-08'))

--10:
SELECT DISTINCT Suppliers.CompanyName
FROM Suppliers
WHERE Suppliers.SupplierID IN (
  SELECT Products.SupplierID
  FROM Products
  WHERE Products.ProductID IN (
    SELECT [Order Details].ProductID
    FROM [Order Details]
    WHERE [Order Details].OrderID IN (
      SELECT Orders.OrderID
      FROM Orders
      WHERE YEAR(Orders.OrderDate) = 1997)))

--11:
SELECT COUNT(*) AS EmployeeCount
FROM Employees
WHERE Region IN (
  SELECT RegionDescription
  FROM Region
  WHERE RegionDescription = 'Eastern')

--12:
SELECT ProductName
FROM Products
WHERE ProductID NOT IN (
  SELECT DISTINCT ProductID
  FROM [Order Details]
  WHERE OrderID IN (
    SELECT OrderID
    FROM Orders
    WHERE YEAR(OrderDate) = 1996 ))


