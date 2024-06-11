--1:

SELECT Sales.Orders.orderid,Sales.Orders.orderdate, Sales.Orders.custid,Sales.Orders.empid
FROM Sales.Orders
WHERE orderdate = (SELECT MAX(orderdate) FROM Sales.Orders)

--2:
SELECT HR.Employees.empid, HR.Employees.firstname, HR.Employees.lastname
FROM HR.Employees
WHERE empid NOT IN (SELECT empid FROM Sales.Orders WHERE orderdate >= '2008-05-01')

--3:
SELECT Sales.Orders.custid, Sales.Orders.orderid, Sales.Orders.orderdate, Sales.Orders.empid
FROM Sales.Orders
WHERE Sales.Orders.orderdate= (SELECT MAX (orderdate)
FROM Sales.Orders
WHERE custid=Sales.Orders.custid)

--4:
SELECT DISTINCT Sales.Customers.country
FROM Sales.Customers
WHERE country NOT IN (SELECT DISTINCT HR.Employees.country FROM HR.Employees)

--5:
SELECT DISTINCT Sales.Customers.custid, Sales.Customers.companyname
FROM Sales.Customers
WHERE Sales.Customers.custid IN (SELECT Sales.Orders.custid FROM Sales.Orders 
WHERE YEAR (Sales.Orders.orderdate)=2007 
AND Sales.Customers.custid NOT IN (SELECT Sales.Orders.custid FROM Sales.Orders
WHERE YEAR (Sales.Orders.orderdate)=2008))


