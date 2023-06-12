<--creating schemas and tables--->
CREATE SCHEMA Bookstore;
GO
CREATE TABLE Bookstore.Authors(
AuthorID INT PRIMARY KEY,
FirstName VARCHAR(100) NOT NULL,
LastName VARCHAR(100) NOT NULL
);

CREATE TABLE Bookstore.Books(
BookID INT PRIMARY KEY,
Title VARCHAR(255) NOT NULL,
AuthorID INT FOREIGN KEY REFERENCES Bookstore.Authors(AuthorID)
);

<--inserting data into the tables-->
INSERT INTO Bookstore.Authors
(AuthorID,FirstName,LastName)
VALUES
(1,'John','Doe'),
(2,'Jane','Smith'),
(3,'David','Johnson');

SELECT * FROM Bookstore.Authors

INSERT INTO Bookstore.Books
(BookID,Title,AuthorID)
VALUES
(1,'Book1',1),
(2,'Book2',2),
(3,'Book3',3);
SELECT * FROM Bookstore.Books

<---implementing some queries..--->
<---Question 1---->
SELECT * FROM Bookstore.Books
WHERE
Title='Book2';

<---Question 2--->
UPDATE Bookstore.Authors
SET 
LastName ='Smithson'
WHERE AuthorID=(SELECT AuthorID FROM Bookstore.Books WHERE Title ='Book1')

<--delete Author with id 3 and all their associated books--->
DELETE FROM Bookstore.Books WHERE AuthorID = 3;
DELETE FROM Bookstore.Authors WHERE AuthorID = 3

<---total number of books in Books table--->
SELECT COUNT(*) AS TotalBooks FROM Bookstore.Books;

<---retrieving books and authors names--->
SELECT Title, FirstName, LastName
FROM Bookstore.Books
JOIN Bookstore.Authors ON Books.AuthorID = Authors.AuthorID;
