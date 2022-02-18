/****QUESTION1****/
SELECT Location AS Station_Name 
FROM Stations AS S JOIN Bike_Rentals AS BR ON S.Station_ID=BR.Station_ID JOIN Payments AS P ON P.Customer_ID=BR.Customer_ID 
WHERE YEAR(Date_stamp)=2004

SELECT Location AS Station_Name 
FROM Stations 
WHERE Station_ID IN (SELECT Station_ID FROM Bike_Rentals WHERE Customer_ID IN(SELECT Customer_ID FROM Payments WHERE YEAR(Date_stamp)=2004))

/****QUESTION2****/
SELECT DISTINCT(B.Bike_ID), SUM(Price) AS Total_Repair_Cost 
FROM Repairs AS R JOIN Bike_Status AS BS ON R.B_Status_ID = BS.B_Status_ID JOIN Bikes AS B ON BS.Bike_ID = B.Bike_ID 
GROUP BY B.Bike_ID

/****QUESTION3****/
SELECT TOP 1 Stations.Address AS StationName, COUNT(Stations.Address) AS Value_Occurence
FROM Stations INNER JOIN 
Bikes AS B ON Stations.Station_ID = B.Station_ID
INNER JOIN Bike_Status AS S
ON B.Station_ID = S.B_Status_ID
INNER JOIN Repairs AS R
ON S.Bike_ID = R.B_Status_ID
GROUP BY Stations.Address ORDER BY Value_Occurence DESC;

/****QUESTION4****/
SELECT DISTINCT(Location),SUM(DISTINCT(Bike_ID)) AS Total_Bikes FROM Stations AS S JOIN Bikes AS B ON S.Station_ID=B.Station_ID
GROUP BY S.Location

/****QUESTION5****/
SELECT CONCAT(Fname,' ',Lname) AS CustomerFullName FROM Customer_Details AS CD 
WHERE Customer_ID NOT IN (SELECT Customer_ID FROM Bike_Rentals)

/****QUESTION6****/
SELECT DISTINCT(B.Bike_ID) FROM Bikes AS B JOIN Bike_Rentals AS BR ON B.Bike_ID=BR.Bike_ID JOIN Payments AS P ON BR.Customer_ID=P.Customer_ID
WHERE YEAR(Date_stamp)>'2016'

/****QUESTION7****/
SELECT DISTINCT(CONCAT(Fname,' ',lname)) AS Customer_Full_Name FROM Customer_Details AS CD JOIN Payments AS P ON CD.Customer_ID=P.Customer_ID JOIN Payment_Method AS PM ON P.Method_ID=PM.Method_ID
WHERE PM.Method='mastercard'

/****QUESTION8****/
SELECT location FROM Stations inner join Vans ON Stations.Station_ID=Vans.Station_ID 
WHERE year(Vans.Date_stamp)=2015 ORDER BY Vans.bikes

/****QUESTION9****/
SELECT dbo.Bikes.Bike_ID, AVG(dbo.Repairs.Price) as AverageCost 
FROM dbo.Repairs JOIN dbo.Bike_Status ON dbo.Repairs.B_Status_ID = dbo.Bike_Status.B_Status_ID JOIN dbo.Bikes ON dbo.Bike_Status.Bike_ID = dbo.Bikes.Bike_ID 
GROUP BY(dbo.Bikes.Bike_ID)

/****QUESTION10****/
SELECT *
FROM Bikes as B INNER JOIN Bike_Status as BS 
ON B.Bike_ID = BS.Bike_ID 
INNER JOIN Repairs as R ON
BS.B_Status_ID = R.B_Status_ID
WHERE R.Delivered > DATEADD(year,-3,GETDATE());
