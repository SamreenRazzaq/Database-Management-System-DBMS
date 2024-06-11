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

  SELECT HR.Employees.empid, HR.Employees.firstname, HR.Employees.lastname, Nums.n
  FROM HR.Employees
  CROSS JOIN Nums
  WHERE n<=5
 