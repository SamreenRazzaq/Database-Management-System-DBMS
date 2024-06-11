 USE Northwind;
 --1:
  SELECT * FROM Orders 
  WHERE ShippedDate > RequiredDate
  --2:
  SELECT DISTINCT Country FROM Employees
  --3:
  SELECT * FROM Employees
  WHERE ReportsTo IS NULL 
  --4:
  SELECT ProductName FROM Products
  WHERE Discontinued = 1
  --5:
  SELECT OrderID FROM [Order Details]
  WHERE Discount=0
  --6:
  SELECT ContactName FROM Customers
  WHERE Region IS NULL 
  --7:
  SELECT ContactName,Phone FROM Customers
  WHERE Country IN ('UK','USA')
  --8:
  SELECT CompanyName FROM Suppliers
  WHERE HomePage IS NOT NULL
  --9:
  SELECT ShipCountry FROM Orders 
  WHERE OrderDate BETWEEN '1997-01-02' AND '1997-12-31'
  --10:
  SELECT CustomerID FROM Orders
  WHERE ShipRegion IS NULL