CREATE DATABASE CarRental
USE CarRental

CREATE TABLE Categories (
	Id INT PRIMARY KEY IDENTITY,
	CategoryName NVARCHAR(50) NOT NULL,
	DailyRate INT NOT NULL,
	WeeklyRate INT NOT NULL,
	MonthlyRate INT NOT NULL,
	WeekendRate INT NOT NULL
)

CREATE TABLE Cars (
	Id INT PRIMARY KEY IDENTITY,
	PlateNumber NVARCHAR(20) NOT NULL UNIQUE,
	Manufacturer NVARCHAR(30) NOT NULL,
	Model NVARCHAR(30) NOT NULL,
	CarYear INT NOT NULL,
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
	Doors INT,
	Picture VARBINARY(MAX),
	Condition NVARCHAR(500),
	Available BIT NOT NULL
)

CREATE TABLE Employees (
	Id INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(30) NOT NULL,
	Title NVARCHAR(30),
	Notes NVARCHAR(500)
)

CREATE TABLE Customers (
	Id INT PRIMARY KEY IDENTITY,
	DriverLicenceNumber NVARCHAR(20) NOT NULL UNIQUE,
	FullName NVARCHAR(100) NOT NULL,
	Address NVARCHAR(250) NOT NULL,
	City NVARCHAR(50) NOT NULL,
	ZIPCode NVARCHAR(30),
	Notes NVARCHAR(1000) 
)

CREATE TABLE RentalOrders (
	Id INT PRIMARY KEY IDENTITY,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
	CustomerId INT FOREIGN KEY REFERENCES Customers(Id),
	CarId INT FOREIGN KEY REFERENCES Cars(Id),
	TankLevel INT NOT NULL,
	KilometrageStart INT NOT NULL,
	KilometrageEnd INT NOT NULL,
	TotalKilometrage AS KilometrageEnd - KilometrageStart,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	TotalDays AS DATEDIFF(DAY, StartDate, EndDate),
	RateApplied INT NOT NULL,
	TaxRate AS RateApplied * 0.2,
	OrderStatus BIT NOT NULL,
	Notes NVARCHAR(1000)
)

INSERT INTO Categories VALUES
('Sedan', 50, 250, 1050, 100),
('SUV', 90, 600, 1300, 180),
('Cabrio', 60, 270, 650, 90)

INSERT INTO Cars VALUES
('PB2710CT', 'BMW', 'M5', 2011, 1, 5, NULL, 'Very Good', 1),
('CT6578YU', 'Peugeot', '206', 2002, 3, 5, NULL, 'Good', 0),
('CT1777GT', 'VW', 'Golf', 2008, 2, 3, NULL, 'Average', 1)

INSERT INTO Employees VALUES
('Georgi', 'Georgiev', NULL, NULL),
('Ivan', 'Ivanov', NULL, NULL),
('Kris', 'Donchev', NULL, 'Best employee 2021')

INSERT INTO Customers(DriverLicenceNumber, FullName, Address, City) VALUES
('AB5545VO', 'Jai White', 'Street str.56', 'NYC'),
('LG78544TT', 'Kevin Williams', 'Trafforrd str.67', 'Manchester'),
('KJ85554UI', 'Joshua Fr', 'Love str.87', 'Paris')

INSERT INTO RentalOrders(EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, 
StartDate, EndDate, RateApplied, OrderStatus) VALUES
(1, 3, 2, 65, 16505, 69855, '2007-08-08', '2007-08-10', 250, 1),
(3, 2, 1, 30, 5674, 56674, '2009-09-06', '2009-09-28', 1500, 0),
(2, 1, 3, 68, 6705, 68677, '2017-05-08', '2017-06-09', 850, 0)