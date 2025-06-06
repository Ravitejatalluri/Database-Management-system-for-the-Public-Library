-- Name: Ravi Teja Talluri
-- G01459601
-- CS 504 Final Project SQL Script


create Database CSProject;

use  CSProject;

-- Creating Catalog Table
CREATE TABLE Catalog (
   Catalog_ID INT PRIMARY KEY,
   Name VARCHAR(400),
   Location VARCHAR(400)
   );
   
-- Creating Genre Table
CREATE TABLE Genre (
    Genre_ID INT PRIMARY KEY,
    Name VARCHAR(400),
    Description VARCHAR(400)
    );
    
-- Creating Material Table    
CREATE TABLE Material (
    Material_ID INT PRIMARY KEY,
    Title VARCHAR(400),
    Publication_Date DATE,
    Catalog_ID INT,
    Genre_ID INT,
    FOREIGN KEY (Catalog_ID) REFERENCES Catalog(Catalog_ID),
    FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID)
    );

-- Creating Member Table
CREATE TABLE Member (
    Member_ID INT PRIMARY KEY,
    Name VARCHAR(400),
    Contact_Info VARCHAR(400),
    Join_Date DATE 
    );
    
-- Creating Staff Table
CREATE TABLE Staff (
   Staff_ID INT PRIMARY KEY,
   Name VARCHAR(400),
   Contact_Info VARCHAR(400),
   Job_Title VARCHAR(400),
   Hire_Date VARCHAR(400)
   );
   
-- Creating Borrow Table
CREATE TABLE Borrow (
   Borrow_ID INT PRIMARY KEY,
   Material_ID INT,
   Member_ID INT,
   Staff_ID INT,
   Borrow_Date DATE,
   Due_Date DATE,
   Return_Date DATE,
   FOREIGN KEY (Material_ID) REFERENCES Material(Material_ID),
   FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
   FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
   );
   
 -- Creating Author Table
 CREATE TABLE Author (
 Author_ID INT PRIMARY KEY,
 Name VARCHAR(400),
 Birth_Date DATE,
 Nationality VARCHAR(400)
   );
   
-- Creating Authorship Table
CREATE TABLE Authorship (
Authorship_ID INT PRIMARY KEY,
Author_ID INT,
Material_ID INT,
FOREIGN KEY (Material_ID) REFERENCES Material(Material_ID),
FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID)
  );
 
 -- Loading into Catalog table
 LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Catalog.csv'
INTO TABLE Catalog
IGNORE 1 ROWS
(Catalog_ID, Name, Location);
 
 -- loading into Genre table
 LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Genre.csv'
INTO TABLE Genre
IGNORE 1 ROWS
(Genre_ID, Name, Description);

-- Loading into material table
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Material.csv'
INTO TABLE Material
IGNORE 1 ROWS
(Material_ID, Title, Publication_Date, Catalog_ID, Genre_ID);

-- Loading into member table
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Member.csv'
INTO TABLE Member
IGNORE 1 ROWS
(Member_ID, Name, Contact_Info, Join_Date);

-- Loading into staff table
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Staff.csv'
INTO TABLE Staff
IGNORE 1 ROWS
(Staff_ID, Name, Contact_Info, Job_Title, Hire_Date);

-- loading into Borrow table
INSERT INTO Borrow (Borrow_ID, Material_ID, Member_ID, Staff_ID, Borrow_Date, Due_Date, Return_Date) VALUES 
(1, 1, 1, 1, '2018-09-12', '2018-10-03', '2018-09-30'),
(2, 2, 2, 1, '2018-10-15', '2018-11-05', '2018-10-29'),
(3, 3, 3, 1, '2018-12-20', '2019-01-10', '2019-01-08'),
(4, 4, 4, 1, '2019-03-11', '2019-04-01', '2019-03-27'),
(5, 5, 5, 1, '2019-04-20', '2019-05-11', '2019-05-05'),
(6, 6, 6, 1, '2019-07-05', '2019-07-26', '2019-07-21'),
(7, 7, 7, 1, '2019-09-10', '2019-10-01', '2019-09-25'),
(8, 8, 8, 1, '2019-11-08', '2019-11-29', '2019-11-20'),
(9, 9, 9, 1, '2020-01-15', '2020-02-05', '2020-02-03'),
(10, 10, 10, 1, '2020-03-12', '2020-04-02', '2020-03-28'),
(11, 1, 11, 2, '2020-05-14', '2020-06-04', '2020-05-28'),
(12, 2, 12, 2, '2020-07-21', '2020-08-11', '2020-08-02'),
(13, 3, 13, 2, '2020-09-25', '2020-10-16', '2020-10-15'),
(14, 4, 1, 2, '2020-11-08', '2020-11-29', '2020-11-24'),
(15, 5, 2, 2, '2021-01-03', '2021-01-24', '2021-01-19'),
(16, 6, 3, 2, '2021-02-18', '2021-03-11', '2021-03-12'),
(17, 17, 4, 2, '2021-04-27', '2021-05-18', '2021-05-20'),
(18, 18, 5, 2, '2021-06-13', '2021-07-04', '2021-06-28'),
(19, 19, 6, 2, '2021-08-15', '2021-09-05', '2021-09-03'),
(20, 20, 7, 2, '2021-10-21', '2021-11-11', NULL),
(21, 21, 1, 3, '2021-11-29', '2021-12-20', NULL),
(22, 22, 2, 3, '2022-01-10', '2022-01-31', '2022-01-25'),
(23, 23, 3, 3, '2022-02-07', '2022-02-28', '2022-02-23'),
(24, 24, 4, 3, '2022-03-11', '2022-04-01', '2022-03-28'),
(25, 25, 5, 3, '2022-04-28', '2022-05-19', '2022-05-18'),
(26, 26, 6, 3, '2022-06-22', '2022-07-13', '2022-07-08'),
(27, 27, 7, 3, '2022-08-04', '2022-08-25', '2022-08-23'),
(28, 28, 8, 3, '2022-09-13', '2022-10-04', '2022-09-28'),
(29, 29, 9, 3, '2022-10-16', '2022-11-06', '2022-11-05'),
(30, 30, 8, 3, '2022-11-21', '2022-12-12', '2022-12-05'),
(31, 1, 9, 4, '2022-12-28', '2023-01-18', NULL),
(32, 2, 1, 4, '2023-01-23', '2023-02-13', NULL),
(33, 3, 10, 4, '2023-02-02', '2023-02-23', '2023-02-17'),
(34, 4, 11, 4, '2023-03-01', '2023-03-22', NULL),
(35, 5, 12, 4, '2023-03-10', '2023-03-31', NULL),
(36, 6, 13, 4, '2023-03-15', '2023-04-05', NULL),
(37, 7, 17, 4, '2023-03-25', '2023-04-15', NULL),
(38, 8, 8, 4, '2023-03-30', '2023-04-20', NULL),
(39, 9, 9, 4, '2023-03-26', '2023-04-16', NULL),
(40, 10, 20, 4, '2023-03-28', '2023-04-18', NULL);

-- loading into author table
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Author.csv'
INTO TABLE Author
IGNORE 1 ROWS
(Author_ID, Name, Birth_Date, Nationality);

-- loading into authorship
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Authorship.csv'
INTO TABLE Authorship
IGNORE 1 ROWS
(Authorship_ID, Author_ID, Material_ID);

SELECT * from csproject.staff;

-- Q1.Which materials are currently available in the library? 
SELECT M.Material_ID, M.Title FROM Material as M  
         WHERE Material_ID NOT IN (SELECT Material_ID FROM Borrow WHERE Return_Date IS NULL);
                 
         
-- Q2.Which materials are currently overdue? Suppose today is 04/01/2023, and show the borrow date and due date of each material.
SELECT m.Material_ID, m.Title, b.Borrow_Date, b.Due_Date FROM Borrow b
JOIN Material m ON b.Material_ID = m.Material_ID WHERE b.Due_Date < '2023-04-01' AND b.Return_Date IS NULL
ORDER BY m.Material_ID;

-- Q3. What are the top 10 most borrowed materials in the library? Show the title of each 
-- material and order them based on their available counts.
SELECT M.Material_ID, M.Title, COUNT(B.Material_ID) as Borrowed_Count FROM Material M 
JOIN Borrow B on M.Material_ID = B.Material_ID GROUP BY M.Material_ID
ORDER BY Borrowed_Count DESC LIMIT 10;

-- Q4. How many materials has author Lucas Piki written?
SELECT A.Name, COUNT(*) AS Material_Count FROM Material M
JOIN Authorship AP ON AP.Material_ID = M.Material_ID
JOIN Author A ON AP.Author_ID = A.Author_ID
WHERE A.Name = 'Lucas Piki' GROUP BY A.Name;

-- Q5 How many materials were written by two or more than authors
SELECT COUNT(*) AS CountOfMaterialsWithMultipleAuthors
FROM (
    SELECT Material_ID
    FROM Authorship
    GROUP BY Material_ID
    HAVING COUNT(Author_ID) >= 2
) ASSUBQUERY;

-- Q6 What are the most popular genres in the library ranked by the total number of borrowed 
-- times of each genre?
SELECT G.Name as genre_type, COUNT(B.Borrow_ID) AS NoOfTimesBorrowed 
FROM Genre G JOIN Material M on G.Genre_ID = M.Genre_ID 
JOIN Borrow B ON M.Material_ID = B.Material_ID GROUP BY G.Genre_ID
ORDER BY NoOfTimesBorrowed DESC;

-- Q7. How many materials had been borrowed from 09/2020-10/2020?
SELECT COUNT(*) AS NoOfMaterialsBorrowed FROM Borrow 
Where Borrow_Date BETWEEN '2020-09-01' AND '2020-10-31';

-- Q8.How do you update the “Harry Poper and the Philosopher's Stone” 
-- when it is returned on 04/01/2023?
UPDATE Borrow SET Return_Date = '2023-04-01'
WHERE Material_ID = (SELECT Material_ID FROM Material 
WHERE Title = 'Harry Potter and the Philosopher''s Stone');

-- Query for verifying the Update query
select Return_Date FROM Borrow WHERE
Material_ID = (SELECT Material_ID FROM Material WHERE Title = 'Harry Potter and the Philosopher''s Stone');

-- Q9. How do you delete the member Emily Miller 
-- and all her related records from the database?
-- Deleting from Borrow table
DELETE FROM Borrow WHERE Member_ID = 
(SELECT Member_ID FROM Member WHERE Name = 'Emily Miller');
SELECT * FROM Borrow WHERE Member_ID = 5;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Member WHERE Name = 'Emily Miller';
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM Member WHERE Name = 'Emily Miller';

--  How do you add the following material to the database?
-- Title: New book, Date: 2020-08-01, Catalog: E-Books, Genre: Mystery & Thriller, Author: Lucas Luke
-- Inserting into Material Table
-- Drop foreign key constraint

INSERT INTO Material (Title, Publication_Date, Catalog_ID, Genre_ID)
VALUES('New book', '2020-08-01', 
(SELECT Catalog_ID FROM Catalog WHERE Name = 'E-Books'),
(SELECT Genre_ID FROM Genre WHERE Name = 'Mystery & Thriller'));

-- Inserting into Author table
INSERT INTO Author (Name)
VALUES ('Lucas Luke');

SELECT * FROM Material WHERE Material_ID = 32;
SELECT * FROM Author WHERE Name='Lucas Luke';

-- set of sample queries
SELECT * FROM Staff;
-- Update Command
UPDATE Staff
SET Contact_Info = REPLACE(Contact_Info, '@email.com', '@gmail.com') WHERE Staff_ID=4;
SELECT * FROM Staff;

-- Insert command
INSERT INTO Catalog (Catalog_ID, Name, Location)
VALUES (11, 'Ravi', 'K11.1');
SELECT * FROM Catalog WHERE Name = 'Ravi';

-- Delete Command
DELETE FROM Catalog WHERE Catalog_ID=11;
SELECT * FROM Catalog Where Catalog_ID=11;

-- Join Command
SELECT M.Material_ID, M.Title, G.Name FROM Material M 
JOIN Genre G ON M.Genre_ID = G.Genre_ID;

-- Aggregation Commands
SELECT 	G.Name, COUNT(*) AS TotalCount FROM Genre G JOIN
Material M ON G.Genre_ID = M.Genre_ID GROUP BY G.Name ORDER BY TotalCount DESC;

-- SubQuery

SELECT Name FROM Author 
WHERE Author_ID = (SELECT Author_ID FROM Authorship 
                    WHERE Material_ID = (SELECT Material_ID FROM Material WHERE Material_ID = 11));
                    



