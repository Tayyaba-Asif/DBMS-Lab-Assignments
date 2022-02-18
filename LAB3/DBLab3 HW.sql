/****QUESTION1--> names of customers whose orders were delayed****/
SELECT Customers.CustomerID, Customers.ContactName FROM Customers JOIN Orders ON Customers.CustomerID=Orders.CustomerID WHERE Orders.ShippedDate>Orders.RequiredDate 

/****QUESTION2--> the products details with its supplier company.****/
SELECT P.productname,S.companyname FROM Products AS P JOIN suppliers AS S ON P.supplierID=S.SupplierID  

/****QUESTION3--> name of top products which have highest sale in the year 1998.****/
SELECT TOP(10) P.ProductName FROM [Order Details] AS OD INNER JOIN Orders AS O ON  OD.OrderID=O.OrderID JOIN Products AS P ON P.ProductID=OD.ProductID 
WHERE YEAR(O.OrderDate)=1998 GROUP BY ProductName ORDER BY SUM(OD.Quantity) DESC

/****QUESTION4--> the name of employees with its manager name.****/
SELECT M.FirstName AS EmployeeName,E.FirstName AS ManagerName FROM Employees AS E JOIN Employees AS M ON E.EmployeeID=M.ReportsTo

/****QUESTION5--> the full names of managers who have less than two employees****/
SELECT CONCAT(FirstName,' ',LastName) FROM Employees GROUP BY FirstName,LastName HAVING COUNT(DISTINCT(ReportsTo))<2 

/****QUESTION6--> List all the products whose price is more than average price.****/
SELECT ProductName,UnitPrice FROM Products WHERE UnitPrice>(SELECT AVG(UnitPrice) FROM Products) ORDER BY UnitPrice

/****QUESTION7--> second highest priced product without using TOP statement****/
SELECT  MAX(UnitPrice) AS Second_Highest_Priced_Product FROM Products WHERE UnitPrice<(SELECT Max (UnitPrice) FROM Products) 

/****QUESTION8--> Are there any employees who are elder than their managers?****/
SELECT CONCAT(E.FirstName,' ',E.LastName) AS Employee_Name,CONCAT(M.FirstName,' ',M.LastName) AS Manager_Name, E.BirthDate AS Employee_Age, M.BirthDate AS Manager_Age FROM Employees E, Employees M WHERE E.ReportsTo=M.EmployeeID AND E.BirthDate<M.BirthDate

/****QUESTION9--> List the names of products which were ordered on 8th August 1997.****/
SELECT P.ProductName FROM Products AS P JOIN [Order Details] AS OD ON P.ProductID=OD.ProductID JOIN Orders AS O ON O.OrderID=OD.OrderID WHERE O.OrderDate='1997-8-8'

/****QUESTION10--> List the names of suppliers whose supplied products were ordered in 1997.****/
SELECT DISTINCT(CompanyName) FROM [order details] AS OD JOIN Orders AS O ON OD.OrderID=O.orderID JOIN Products AS P ON P.productid=OD.productid JOIN Suppliers AS S ON P.Supplierid=S.supplierID WHERE YEAR(OrderDate)=1997

/****QUESTION11--> How many employees are assigned to Eastern region. Give count.****/
SELECT COUNT(E.FirstName) AS employees_in_eastern_region FROM Employees AS E JOIN EmployeeTerritories AS ET ON E.EmployeeID=ET.EmployeeID JOIN Territories AS T ON ET.TerritoryID=T.TerritoryID WHERE RegionID=1

/****QUESTION12-->Give the name of products which were not ordered in 1996.****/
SELECT DISTINCT(P.ProductName) FROM Products AS P JOIN [Order Details] AS OD ON P.ProductID=OD.ProductID JOIN Orders AS O ON O.OrderID=OD.OrderID WHERE YEAR(OrderDate)<>1996 ORDER BY ProductName ASC