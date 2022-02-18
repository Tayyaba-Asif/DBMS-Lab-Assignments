/****QUESTION1 ORDERS THAT WERE SHIPPED LATE****/
SELECT * FROM Orders WHERE ShippedDate>RequiredDate

/****QUESTION2 Our employees belong to how many countries. List the names.****/
/****NUMBER OF COUNTRIES****/
SELECT COUNT(DISTINCT country) AS NumberOfCountries  FROM Employees
/****THEIR NAMES****/
SELECT DISTINCT country AS NamesOFCountries FROM Employees 

/****QUESTION3 Is there any employee whose is not accountable****/
 /****YES, 1 EMPLOYEE IS NOT ACCOUNTABLE****/
SELECT * FROM employees WHERE ReportsTo IS NULL

/****QUESTION4 List the names of products which have been discontinued****/
SELECT ProductName FROM Products WHERE Discontinued='True'

/****QUESTION5 List the IDs of the orders on which discount was not provided.****/
SELECT OrderID FROM [Order Details] WHERE Discount=0

/****QUESTION6 Enlist the names of customers who have not specified their region****/
SELECT CustomerID, ContactName FROM Customers WHERE Region IS NULL

/****QUESTION7 Enlist the names of customers along with contact number who either belongs to
UK or USA****/
SELECT ContactName, Phone FROM Customers WHERE Country IN('UK','USA')

/****QUESTION8 Report the names of companies who have provided their web page****/
SELECT CompanyName FROM Suppliers WHERE HomePage IS NOT NULL

/****QUESTION9 In which countries, products were sold in year 1997****/
SELECT DISTINCT ShipCountry AS Countries FROM Orders WHERE YEAR(OrderDate)=1997

/****QUESTION10 . List the ids of customers whose orders were never shipped****/
SELECT CustomerID FROM Orders WHERE ShippedDate IS NULL

