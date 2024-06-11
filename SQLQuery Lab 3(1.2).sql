/*SELECT TOP (1000) [empid]
      ,[lastname]
      ,[firstname]
      ,[title]
      ,[titleofcourtesy]
      ,[birthdate]
      ,[hiredate]
      ,[address]
      ,[city]
      ,[region]
      ,[postalcode]
      ,[country]
      ,[phone]
      ,[mgrid]
  FROM [TSQL2012].[HR].[Employees]*/

 SELECT E.empid,
DATEADD(day, D.n - 1, '20160612') AS dt
FROM HR.Employees AS E
CROSS JOIN dbo.Nums AS D
WHERE D.n <= DATEDIFF(day, '20160612', '20160616') + 1
ORDER BY empid, dt;
