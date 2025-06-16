CREATE DATABASE PetPals

CREATE TABLE Shelters(
ShelterID INT PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(100) NOT NULL,
Location NVARCHAR(255) NOT NULL)

CREATE TABLE Pets(
PetID INT PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(100) NOT NULL,
Age INT NOT NULL,
Breed VARCHAR(100),
Type VARCHAR(50),
AvailableForAdoption BIT NOT NULL DEFAULT 1,
ShelterID INT,
FOREIGN KEY (ShelterID) References Shelters(ShelterID))


CREATE TABLE Donations(
DonationID INT PRIMARY KEY IDENTITY(1,1),
DonorName VARCHAR(100) NOT NULL,
DonationType VARCHAR(50) CHECK(DonationType IN('Cash','Item')),
DonationAmount DECIMAL(10,2),
DonationItem VARCHAR(100),
DonationDate DATETIME NOT NULL,
ShelterID INT,
FOREIGN KEY(ShelterID) REFERENCES Shelters(ShelterID))


CREATE TABLE AdoptionEvents(
EventID INT PRIMARY KEY IDENTITY(1,1),
EventName VARCHAR(100) NOT NULL,
EventDate DATETIME NOT NULL,
Location NVARCHAR(255) NOT NULL)


CREATE TABLE Participants (
ParticipantID INT PRIMARY KEY IDENTITY(1,1),
ParticipantName VARCHAR(100) NOT NULL,
ParticipantType VARCHAR(50) CHECK (ParticipantType IN('Shelter','Adopter')),
EventID INT,
FOREIGN KEY(EventID) REFERENCES AdoptionEvents(EventID))

INSERT INTO Shelters (Name, Location) VALUES
('Happy Tails Shelter', 'Chennai'),
('Paws & Whiskers', 'Mumbai'),
('Furry Friends Home', 'Delhi'),
('Safe Paws Shelter', 'Bangalore'),
('The Pet Haven', 'Hyderabad'),
('Adopt Me Shelter', 'Kolkata'),
('Forever Homes', 'Chennai'),
('Animal Ark', 'Pune'),
('PetPal House', 'Jaipur'),
('Companion Corner', 'Ahmedabad');

INSERT INTO Pets (Name, Age, Breed, Type, AvailableForAdoption, ShelterID) VALUES
('Bruno', 2, 'Labrador', 'Dog', 1, 1),
('Milo', 4, 'Beagle', 'Dog', 1, 2),
('Whiskers', 3, 'Persian', 'Cat', 0, 3),
('Coco', 1, 'Pug', 'Dog', 1, 1),
('Simba', 5, 'Golden Retriever', 'Dog', 0, 2),
('Luna', 2, 'Siamese', 'Cat', 1, 4),
('Max', 6, 'Bulldog', 'Dog', 0, 5),
('Daisy', 3, 'Maine Coon', 'Cat', 1, 6),
('Oscar', 1, 'Dalmatian', 'Dog', 1, 7),
('Bella', 7, 'German Shepherd', 'Dog', 0, 8);


INSERT INTO Donations (DonorName, DonationType, DonationAmount, DonationItem, DonationDate, ShelterID) VALUES
('Anita Desai', 'Cash', 5000.00, NULL, '2024-01-10 10:00:00', 1),
('Raj Kumar', 'Item', NULL, 'Dog Food', '2024-02-15 12:30:00', 2),
('Sneha Iyer', 'Cash', 3500.00, NULL, '2024-03-05 09:45:00', 3),
('Arun Nair', 'Item', NULL, 'Cat Toys', '2024-04-11 14:00:00', 4),
('Deepak Singh', 'Cash', 2000.00, NULL, '2024-05-20 11:00:00', 1),
('Pooja Rao', 'Cash', 1500.00, NULL, '2024-05-25 16:30:00', 2),
('Nisha Mehta', 'Item', NULL, 'Blankets', '2024-06-01 13:00:00', 5),
('Amitabh Roy', 'Cash', 4200.00, NULL, '2024-06-12 08:30:00', 6),
('Vikram Jain', 'Cash', 3000.00, NULL, '2024-06-13 18:00:00', 7),
('Reena Sharma', 'Item', NULL, 'Leashes', '2024-06-14 10:30:00', 8);

INSERT INTO AdoptionEvents (EventName, EventDate, Location) VALUES
('Paws Parade', '2024-03-10 10:00:00', 'Chennai'),
('Adoptathon', '2024-04-22 09:00:00', 'Mumbai'),
('PetFest', '2024-05-15 11:00:00', 'Delhi'),
('Furry Fiesta', '2024-06-01 10:30:00', 'Bangalore'),
('Pet Carnival', '2024-06-10 09:45:00', 'Hyderabad'),
('Adoption Fiesta', '2024-06-15 12:00:00', 'Chennai'),
('Rescue Rally', '2024-07-01 13:00:00', 'Pune'),
('Tail Waggers Day', '2024-07-10 14:00:00', 'Jaipur'),
('Pet Connect', '2024-07-20 15:00:00', 'Ahmedabad'),
('FurEver Homes Day', '2024-07-30 16:00:00', 'Kolkata');

INSERT INTO Participants (ParticipantName, ParticipantType, EventID) VALUES
('Happy Tails Shelter', 'Shelter', 1),
('Paws & Whiskers', 'Shelter', 2),
('Sneha Iyer', 'Adopter', 3),
('Raj Kumar', 'Adopter', 1),
('Safe Paws Shelter', 'Shelter', 4),
('Furry Friends Home', 'Shelter', 3),
('Anita Desai', 'Adopter', 2),
('Deepak Singh', 'Adopter', 5),
('Animal Ark', 'Shelter', 6),
('Forever Homes', 'Shelter', 7);



---SQL QUERIES

SELECT Name,Age,Breed,Type From Pets Where AvailableForAdoption = 1


SELECT p.ParticipantName,p.ParticipantType,ae.EventName,ae.EventDate,ae.Location
FROM Participants p JOIN AdoptionEvents ae ON p.EventID= ae.EventID
WHERE p.EventID = 4


SELECT s.Name AS ShelterName, ISNULL(SUM(d.DonationAmount),0) AS TotalDonations
FROM Shelters s
LEFT JOIN Donations d ON s.shelterID = d.ShelterID
GROUP BY s.Name

ALTER TABLE Pets ADD OwnerID NVARCHAR(10)
SELECT Name,Age,Breed,Type FROM Pets WHERE OwnerID = NULL

SELECT FORMAT(DonationDate, 'MMM yyyy') AS MonthYear, 
SUM(DonationAmount) AS TotalDonations FROM Donations
GROUP BY Format(DonationDate,'yyyy-MM')
ORDER BY MIN(DonationDate)

SELECT DISTINCT Breed FROM Pets where (Age BETWEEN 1 and 3) or (Age > 5)

SELECT p.Name AS PetName,
p.Type,
s.Name AS ShelterName
FROM Pets p JOIN Shelters s on p.ShelterID = s.ShelterID
where p.AvailableForAdoption = 1

SELECT COUNT(p.ParticipantID) AS TotalParticipants
from Participants p JOIN AdoptionEvents ae on P.EventID = ae.EventID
where ae.Location= 'Chennai'

SELECT DISTINCT Breed FROM Pets Where Age Between 1 and 5

SELECT * FROM Pets WHERE AvailableForAdoption = 1

SELECT p.Name AS PetName, U.Name AS AdopterName
FROM Adoption A JOIN Pets p ON A.PetID = P.PetID
JOIN Users U ON A.AdopterID= U.UsersID


SELECT s.Name AS ShelterName, COUNT(p.PetID) AS AvailablePetCount FROM Shelters s
Left join Pets p ON p.ShelterID = s.ShelterID AND p.AvailableForAdoption =1
GROUP BY s.Name

SELECT p1.Name As Pet1,
p2.Name As Pet2,
s.Name As ShelterName
FROM Pets p1 join Pets p2 on p1.ShelterID = p2.ShelterID and p1.Breed = p2.Breed and p1.PetID<p2.PetID
join Shelters s on p1.ShelterID = s.ShelterID

SELECT s.Name AS ShelterName, ae.EventName
FROM Shelters s
cross join AdoptionEvents ae

SELECT TOP 1 S.Name AS ShelterName , Count(*) AS AdoptedCount
FROM Pets P
join Shelters S on P.ShelterID = S.ShelterID 
where P.AvailableForAdoption =0
GROUP BY S.Name
ORDER BY COUNT(*) DESC