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

  /*SELECT Customers.custid, Customers.companyName, Orders.orderid, Orders.orderdate
  FROM Sales.Customers AS C
	INNER JOIN Sales.Orders AS O
		ON Customers.custid = Orders.custid;*/

  SELECT Customers.custid, Customers.companyName, Orders.orderid, Orders.orderdate
  FROM Sales.Customers
  INNER JOIN Sales.Orders
  ON Customers.custid = Orders.custid;