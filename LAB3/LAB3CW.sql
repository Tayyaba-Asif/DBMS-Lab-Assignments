/****QUESTION 1 ****/
SELECT E.empid,E.firstname,E.lastname,N.n FROM HR.Employees AS E CROSS JOIN dbo.Nums AS N WHERE N.n <= 5 
SELECT empid,firstname,lastname,n FROM HR.Employees CROSS JOIN dbo.Nums WHERE n <= 5 

/****QUESTION 2 ****/
SELECT E.empid,HIREDATE AS dt FROM HR.employees AS E CROSS JOIN Nums AS D WHERE hiredate BETWEEN '2003-02-01' AND '2007-05-01'

/****QUESTION 3 CORRECTION****/
SELECT Customers.custid, Customers.companyname,Orders.orderid,Orders.orderdate FROM Sales.Customers INNER JOIN Sales.Orders ON Customers.custid=Orders.custid
/****second alternate****/
SELECT C.custid, C.companyname,O.orderid,O.orderdate FROM Sales.Customers AS C INNER JOIN Sales.Orders AS O ON C.custid=O.custid

/****QUESTION 4 CORRECTION****/
SELECT C.custid,COUNT(DISTINCT O.orderid) AS numorders, SUM(OD.qty) AS totalqty FROM Sales.Customers AS C INNER JOIN Sales.Orders AS O ON O.custid = C.custid INNER JOIN Sales.OrderDetails AS OD ON OD.orderid=O.orderid WHERE Country='USA' GROUP BY C.custid  

/****QUESTION 5****/
SELECT C.custid, C.companyname, O.orderid, O.orderdate FROM sales.customers AS C LEFT OUTER JOIN sales.orders AS O ON C.custid=O.custid

/****QUESTION 6 ****/
SELECT C.custid,C.companyname FROM sales.customers AS C LEFT OUTER JOIN sales.orders AS O ON C.custid=O.custid WHERE O.orderid IS NULL

/****QUESTION 7 ****/
SELECT C.custid, C.companyname, O.orderid, O.orderdate FROM Sales.Customers AS C INNER JOIN Sales.Orders AS O ON O.custid=C.custid WHERE O.orderdate='2007-02-12' 

/****QUESTION 8 ****/
SELECT C.custid, C.companyname, O.orderid, O.orderdate FROM Sales.Customers AS C LEFT OUTER JOIN Sales.Orders AS O ON O.custid = C.custid AND O.orderdate = '2006-07-12'
