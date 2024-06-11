			--HOMEWORK TASKS:

  --1:
  SELECT Customers.CustomerID, Customers.ContactName
  FROM Customers
  INNER JOIN Orders
  ON Customers.CustomerID=Orders.CustomerID
  WHERE ShippedDate>RequiredDate 

  --2:
  SELECT Products.ProductName,Suppliers.ContactName,Suppliers.CompanyName
  FROM Products
  INNER JOIN Suppliers
  ON Products.SupplierID=Suppliers.SupplierID

  --3:
  SELECT TOP 10 Products.ProductName, SUM([Order Details].Quantity) AS TotalSales
  FROM Products
  INNER JOIN [Order Details]
  ON Products.ProductID = [Order Details].ProductID
  INNER JOIN Orders 
  ON [Order Details].OrderID = Orders.OrderID
  WHERE YEAR(Orders.OrderDate) = 1998
  GROUP BY Products.ProductName
  ORDER BY TotalSales DESC

  --4:
  SELECT CONCAT(Employees.FirstName, ' ', Employees.LastName) AS EmployeeName,
           CONCAT(m.FirstName, ' ', m.LastName) AS ManagerName
  FROM Employees 
  LEFT JOIN Employees m 
  ON Employees.ReportsTo = m.EmployeeID
  ORDER BY EmployeeName

  --5:
  SELECT CONCAT(Managers.FirstName, ' ', Managers.LastName) AS ManagerName
  FROM Employees AS Managers
  LEFT JOIN Employees AS Employees 
  ON Managers.EmployeeID = Employees.ReportsTo
  GROUP BY Managers.EmployeeID, Managers.FirstName, Managers.LastName
  HAVING COUNT(Employees.EmployeeID) < 2

  --6:
 SELECT PRODUCTID, Productname, UnitPrice
 FROM Products 
 WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)

  --7:
  SELECT ProductName, UnitPrice
  FROM Products
  WHERE UnitPrice = (SELECT MAX(UnitPrice)
  FROM Products
  WHERE UnitPrice < (SELECT MAX(UnitPrice)
  FROM Products))

 --8:
 SELECT CONCAT(Employees.FirstName, ' ', Employees.LastName) AS EmployeeName,
        CONCAT(Managers.FirstName, ' ', Managers.LastName) AS ManagerName,
 Employees.BirthDate AS EmployeeAge,
 Managers.BirthDate AS ManagerAge
 FROM Employees
 INNER JOIN Employees AS Managers 
 ON Employees.ReportsTo = Managers.EmployeeID
 WHERE Employees.BirthDate > Managers.BirthDate

 --9:
 SELECT DISTINCT Products.ProductName
 FROM Products
 INNER JOIN [Order Details]
 ON Products.ProductID=[Order Details].ProductID
 INNER JOIN Orders
 ON [Order Details].OrderID=Orders.OrderID
 WHERE CONVERT(DATE,Orders.OrderDate) = '1997-08-08'

 --10:
SELECT DISTINCT Suppliers.CompanyName
FROM Suppliers
INNER JOIN Products 
ON Suppliers.SupplierID = Products.SupplierID
INNER JOIN [Order Details] 
ON Products.ProductID = [Order Details].ProductID
INNER JOIN Orders 
ON [Order Details].OrderID = Orders.OrderID
WHERE YEAR(Orders.OrderDate) = 1997

--11:
SELECT COUNT(Employees.Region) AS EmployeeCount
FROM Employees
WHERE Region = '%Eastern'
--OR
SELECT COUNT(*) AS EmployeeCount
FROM Employees
INNER JOIN Region 
ON Employees.Region = Region.RegionDescription
WHERE Region.RegionDescription = 'Eastern'

--12:
SELECT ProductName
FROM Products
WHERE ProductID NOT IN (
    SELECT DISTINCT ProductID
    FROM [Order Details]
    WHERE OrderID IN (
        SELECT OrderID
        FROM Orders
        WHERE YEAR(OrderDate) = 1996))
