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

SELECT C.custid, COUNT(O.orderid) as numorders, SUM(OD.qty) as totalqty
FROM Sales.Customers AS C
INNER JOIN Sales.Orders AS O
ON C.custid = O.custid
INNER JOIN Sales.OrderDetails AS OD
ON O.orderid = OD.orderid
WHERE C.country = 'USA'
GROUP BY C.custid
ORDER BY C.custid;


