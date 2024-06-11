/*SELECT TOP (1000) [OrderID]
      ,[CustomerID]
      ,[EmployeeID]
      ,[OrderDate]
      ,[RequiredDate]
      ,[ShippedDate]
      ,[ShipVia]
      ,[Freight]
      ,[ShipName]
      ,[ShipAddress]
      ,[ShipCity]
      ,[ShipRegion]
      ,[ShipPostalCode]
      ,[ShipCountry]
  FROM [Northwind].[dbo].[Orders]*/

  SELECT EmployeeID FROM Orders
  WHERE  EmployeeID = 5

  SELECT EmployeeID FROM Orders
  WHERE EmployeeID < 5 AND EmployeeID > 2

  SELECT EmployeeID FROM Orders
  WHERE EmployeeID > 6

  SELECT EmployeeID FROM Orders
  WHERE EmployeeID >= 9

  SELECT EmployeeID FROM Orders
  WHERE EmployeeID <= 3

  SELECT EmployeeID FROM Orders
  WHERE EmployeeID <3

  SELECT EmployeeID FROM Orders
  WHERE EmployeeID is NULL

  SELECT EmployeeID FROM Orders
  WHERE EmployeeID BETWEEN 1 AND 4

  SELECT EmployeeID FROM Orders
  WHERE EmployeeID IN(1,3)

  SELECT * FROM Orders
  WHERE CustomerID LIKE 'S%'

SELECT COUNT(DISTINCT ShipCountry) FROM Orders

