/****QUESTION1--> names of customers whose orders were delayed****/
SELECT DISTINCT(CustomerID),ContactName 
FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders WHERE ShippedDate>RequiredDate)

/****QUESTION2--> the products details with its supplier company.****/
SELECT ProductName,CompanyName 
FROM Products p,Suppliers s 
WHERE EXISTS (SELECT SupplierID FROM Suppliers WHERE p.SupplierID=s.SupplierID) 

/****QUESTION3--> name of top products which have highest sale in the year 1998.****/
SELECT TOP(10) ProductName 
FROM Products 
WHERE ProductID IN(SELECT ProductID FROM [Order Details] OD WHERE OrderID IN (SELECT OrderID FROM Orders WHERE YEAR(OrderDate)=1998) ) 
GROUP BY ProductName
ORDER BY SUM(Quantity)

/****QUESTION4--> the name of employees with its manager name.****/
SELECT M.FirstName AS EmployeeName,E.FirstName AS ManagerName 
FROM Employees AS E,Employees AS M
WHERE E.EmployeeID IN (SELECT EmployeeID FROM Employees WHERE E.EmployeeID=M.ReportsTo)

/****QUESTION5--> the full names of managers who have less than two employees****/
SELECT CONCAT(FirstName,' ',LastName) 
FROM Employees 
GROUP BY FirstName,LastName 
HAVING COUNT(DISTINCT(ReportsTo))<2

/****QUESTION6--> List all the products whose price is more than average price.****/
SELECT ProductName,UnitPrice 
FROM Products 
WHERE UnitPrice>(SELECT AVG(UnitPrice) FROM Products) ORDER BY UnitPrice

/****QUESTION7--> second highest priced product without using TOP statement****/
SELECT ProductName,UnitPrice 
FROM Products AS P 
WHERE (SELECT COUNT(DISTINCT ProductName) FROM Products WHERE P.UnitPrice<=UnitPrice)=2

/****QUESTION8--> Are there any employees who are elder than their managers?****/
SELECT CONCAT(E.FirstName,' ',E.LastName) AS Employee_Name,CONCAT(M.FirstName,' ',M.LastName) AS Manager_Name, E.BirthDate AS Employee_Age, M.BirthDate AS Manager_Age
FROM Employees E, Employees M 
WHERE E.ReportsTo=M.EmployeeID AND E.BirthDate<M.BirthDate

/****QUESTION9--> List the names of products which were ordered on 8th August 1997.****/
SELECT Productname 
FROM Products 
WHERE ProductID IN(SELECT ProductID FROM [Order Details] WHERE  OrderID IN (SELECT OrderID FROM Orders WHERE OrderDate='1997-8-8'))

/****QUESTION10--> List the names of suppliers whose supplied products were ordered in 1997.****/
SELECT CompanyName FROM Suppliers WHERE SupplierID IN (SELECT SupplierID FROM Products WHERE ProductID IN (SELECT ProductID FROM [Order Details] 
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE YEAR(OrderDate)=1997)))

/****QUESTION11--> How many employees are assigned to Eastern region. Give count.****/
SELECT COUNT(Firstname) AS Employees_in_Eastern_Region 
FROM Employees 
WHERE EmployeeID IN (SELECT DISTINCT(EmployeeID) FROM EmployeeTerritories WHERE TerritoryID IN (SELECT TerritoryID FROM Territories WHERE RegionID=1))

/****QUESTION12-->Give the name of products which were not ordered in 1996.****/
SELECT DISTINCT(ProductName) 
FROM Products 
WHERE ProductID IN (SELECT ProductID FROM [Order Details] WHERE OrderID IN (SELECT OrderID FROM Orders WHERE YEAR(OrderDate)<>1996)) ORDER BY ProductName ASC