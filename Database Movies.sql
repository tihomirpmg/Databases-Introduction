CREATE DATABASE Movies
USE Movies

CREATE TABLE Directors (
	Id INT PRIMARY KEY IDENTITY,
	DirectorName NVARCHAR(80) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Genres (
	Id INT PRIMARY KEY IDENTITY,
	GenreName NVARCHAR(100) NOT NULL UNIQUE,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Categories (
	Id INT PRIMARY KEY IDENTITY,
	CategoryName NVARCHAR(120) NOT NULL UNIQUE,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Movies (
	Id INT PRIMARY KEY IDENTITY,
	Title NVARCHAR(MAX) NOT NULL,
	DirectorId INT FOREIGN KEY REFERENCES Directors(Id),
	CopyrightYear INT NOT NULL,
	Length TIME,
	GenreId INT FOREIGN KEY REFERENCES Genres(Id),
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
	Rating DECIMAL(2,1),
	Notes NVARCHAR(MAX)
)
USE Movies

INSERT INTO Directors VALUES
('Ivan Ivanov', 'Oscar 2021'),
('James Cameron', 'Best Actor 2021')

INSERT INTO Genres VALUES
('Comedy', 'Friends'),
('Action', 'Need For Speed')

INSERT INTO Categories VALUES
('1', NULL),
('2', NULL),
('3', NULL)

INSERT INTO Movies VALUES
('NFS', 1, 2002, '1:28:00', 1, 7, 8.5, 'Car'),
('Superman', 1, 1998, '1:46:00', 2, 4, 8.8, 'Superhero'),
('Marvel', 2, 2007, '1:45:45', 3, 3, 6.3, 'Heroes')
