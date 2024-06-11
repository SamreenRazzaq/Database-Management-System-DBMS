/*SELECT TOP (1000) [custid]
      ,[companyname]
      ,[contactname]
      ,[contacttitle]
      ,[address]
      ,[city]
      ,[region]
      ,[postalcode]
      ,[country]
      ,[phone]
      ,[fax]
  FROM [TSQL2012].[Sales].[Customers]*/
  SELECT Sales.Customers.custid, Sales.Customers.companyname,Sales.Orders.shipregion 
FROM Sales.Customers
LEFT JOIN Sales.Orders
ON Sales.Customers.custid=Sales.Orders.custid
WHERE orderid IS NULL