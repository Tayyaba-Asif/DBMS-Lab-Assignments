SELECT * FROM Employees
SELECT FirstName FROM Employees ORDER BY City
SELECT FirstName FROM Employees ORDER BY Country
SELECT FirstName FROM Employees ORDER BY Region

SELECT TOP 5 FirstName FROM Employees ORDER BY City
SELECT TOP 5 FirstName FROM Employees ORDER BY Country
SELECT TOP 5 FirstName FROM Employees ORDER BY Region

/****Comparison and Logic******/
SELECT * FROM Employees WHERE Region='WA'
SELECT * FROM Employees WHERE City LIKE 'London'
SELECT * FROM Employees WHERE Extension>3355
SELECT * FROM Employees WHERE Extension>=3355
SELECT * FROM Employees WHERE Extension<=3355
SELECT * FROM Employees WHERE Extension<3355
SELECT * FROM Employees WHERE Extension<>3355
SELECT * FROM Employees WHERE Region IS NULL
SELECT * FROM Employees WHERE NOT Region='WA'
SELECT * FROM Employees WHERE Region='WA' AND TitleOfCourtesy='Ms.'
SELECT * FROM Employees WHERE Region='WA' OR TitleOfCourtesy='Ms.'
SELECT Address FROM Employees WHERE Extension BETWEEN 428 AND 465
SELECT Address FROM Employees WHERE City IN ('London', 'Seattle')