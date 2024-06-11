/*SELECT TOP (1000) [orderid]
      ,[custid]
      ,[empid]
      ,[orderdate]
      ,[requireddate]
      ,[shippeddate]
      ,[shipperid]
      ,[freight]
      ,[shipname]
      ,[shipaddress]
      ,[shipcity]
      ,[shipregion]
      ,[shippostalcode]
      ,[shipcountry]
  FROM [TSQL2012].[Sales].[Orders]*/

  SELECT Sales.Customers.custid,Sales.Customers.companyname,Sales.Orders.orderid,Sales.Orders.orderdate
  FROM Sales.Customers
  LEFT JOIN Sales.Orders
  ON Sales.Customers.custid=Sales.Orders.custid
