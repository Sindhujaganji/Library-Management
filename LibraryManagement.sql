CREATE DATABASE LibraryManagement;
USE LibraryManagement;
	CREATE TABLE AUTHOR(
		AuthorID int NOT NULL,
        AuthorName varchar(30),
        Gender varchar(15),
        Qualification varchar(15),
        City varchar(30),
        PRIMARY KEY(AuthorID)
	);
    CREATE TABLE BRANCH(
		BranchID int NOT NULL,
        City varchar(30),
        ManagerID int,
        PRIMARY KEY(BranchID)
	);
     CREATE TABLE CUSTOMER(
         CustomerID int NOT NULL,
         CustName varchar(30),
         Email varchar(30),
         PhoneNo varchar(15),
         City varchar(30),
         RegDate date,
         PRIMARY KEY(CustomerID)
    );
     CREATE TABLE STAFF(
          StaffID int NOT NULL,
          BranchID int NOT NULL,
          Salary int,
          StaffName varchar(30),
          Gender varchar(15),
          PhoneNo varchar(15),
          City varchar(20),
          PRIMARY KEY(StaffID),
          FOREIGN KEY(BranchID) REFERENCES BRANCH(BranchID)
    );
    CREATE TABLE PUBLISHER(
           PublisherID int NOT NULL,
           PublName varchar(30),
           City varchar(20),
           PRIMARY KEY(PublisherID)
	);
    CREATE TABLE BOOKS(
           BookID int NOT NULL,
		   BookName varchar(40),
           ISBN varchar(30),
           AuthorID int NOT NULL,
           PublisherID int NOT NULL,
           BookCopies int,
           PRIMARY KEY(BookID),
           FOREIGN KEY(AuthorID) REFERENCES AUTHOR(AuthorID),
           FOREIGN KEY(PublisherID) REFERENCES PUBLISHER(PublisherID)
	);
       CREATE TABLE BORROWER(
          CustomerID int NOT NULL,
          BookID int NOT NULL,
          BranchID int NOT NULL,
          StaffID int NOT NULL,
          IssueDate date,
          ReturnDate date,
          FOREIGN KEY(CustomerID) REFERENCES CUSTOMER(CustomerID),
		  FOREIGN KEY(BookID) REFERENCES BOOKS(BookID),
          FOREIGN KEY(BranchID) REFERENCES BRANCH(BranchID),
          FOREIGN KEY(StaffID) REFERENCES STAFF(StaffID)
 );
 
 INSERT INTO AUTHOR
(AuthorID, AuthorName, Gender, Qualification, City) VALUES
(1, 'John Smyth', 'Male', 'PhD', 'Newyork');
INSERT INTO AUTHOR
(AuthorID, AuthorName, Gender, Qualification, City) VALUES
(2, 'Kit Townsend', 'Male', 'Undergraduate', 'Chicago'),
(3, 'Laura Lloras', 'Female', 'Graduate', 'Hartford'),
(4, 'Sara Carr', 'Female', 'PhD', 'Los Angeles'),
(5, 'Mantek Klem', 'Male', 'Graduate', 'New York'),
(6, 'Jens Kopek', 'Male', 'unknown', 'Portland'),
(7, 'Jim Jordan', 'Male', 'Undergraduate', 'San Francisco'),
(8, 'Silas Lambert', 'Male', 'PhD', 'Boston'),
(9, 'Barbara Bull', 'Female', 'Undergraduate', 'Ann Arbor'),
(10,'Dan Bland', 'Male', 'High School', 'North Carolina'),
(11,'Stephen King', 'Male', 'unknown', 'California'),
(12, 'Carol Sims', 'Female', 'Undergraduate', 'Chicago');

INSERT INTO BRANCH
(BranchID, ManagerID, City) VALUES
(1, 2, 'New York'),
(2, 7, 'Chicago'),
(3, 10, 'Boston');

INSERT INTO CUSTOMER
(CustomerID, CustName, Email, PhoneNo, RegDate, City) VALUES
(1, 'Joe Smith', 'jsmith@gmail.com', '212-312-1234', '12/12/17', 'New York'),
(2, 'Jane Smith', 'janejoe@gmail.com', '212-931-4124', '2/2/18', 'New York'),
(3, 'Tom Li', 'tomli@gmail.com', '734-902-7455', '2/7/19',  'Chicago'),
(4, 'Angela Thompson', 'angelat@gmail.com', '313-591-2122', '2/3/22', 'Chicago' ),
(5, 'Harry Emnace', 'harryE@gmail.com', '412-512-5522', '12/12/20', 'Chicago'),
(6, 'Tom Haverford', 'tomhaverford@gmail.com', '212-631-3418', '21/4/21','Boston'),
(7, 'Haley Jackson', 'haleyj@gmail.com', '212-419-9935', '23/3/22', 'Boston'),
(8, 'Michael Horford', 'michaelhorford@gmail.com', '734-998-1513', '2/2/19', 'Boston'),
(9, 'Eleanor Mellors', 'eleanormellor@gmail.com', '609-608-1513', '2/3/22', 'New York'),
(10, 'Heidi Holly', 'heidiholly@gmail.com', '234-901-3232', '12/7/17', 'Boston'),
(11, 'Chef Jeff', 'chefjeff@gmail.com', '203-609-9324', '2/3/17','Chicago'),
(12, 'Bart Brat', 'bartbrat@gmail.com', '630-192-8267', '22/3/18','Chicago'),
(13, 'Jen Jones', 'jenjones@gmail.com', '789-358-8290', '2/6/19', 'New York');

INSERT INTO STAFF
(StaffID, BranchID, Salary, StaffName, Gender, PhoneNo, City) VALUES
(1, 1, 12000, 'John Carter', 'Male', '222-312-2234', 'New York'),
(2, 1, 20000, 'Elizebeth Johnson', 'Female', '211-931-4224','New York'),
(3, 2, 13000, 'Tommy Jones', 'Male', '733-902-7415','Chicago'),
(4, 2, 15000, 'Sara Williams', 'Female', '323-591-2112','Chicago' ),
(5, 2, 21000, 'Henry Martin', 'Male', '413-512-5622', 'Chicago'),
(6, 3, 12000, 'Steve Davis', 'Male', '202-631-3218','Boston'),
(7, 3, 22000, 'Haley Garcia', 'Female', '202-419-9835','Boston'),
(8, 3, 15000, 'David Harris', 'Male', '724-998-2513','Boston'),
(9, 1, 13000, 'Elena Lewis', 'Female', '629-608-1523','New York'),
(10,3,  12000, 'Meidi Thompson', 'Female', '235-901-3242','Boston'),
(11,2, 13000, 'Jeff Moore', 'Male', '283-609-9424','Chicago'),
(12,1, 13000, 'Jones Moore', 'Male', '709-358-8990','New York');

INSERT INTO PUBLISHER
(PublisherID, PublName, City) VALUES
(1, 'Alexander Robinson', 'New York'),
(2, 'Benjamin Clark', 'New York'),
(3, 'Olivia Baker', 'Chicago'),
(4, 'Emma Adams', 'Chicago' ),
(5, 'Thomas Campbell','Chicago'),
(6, 'Matthew Rodriguez', 'Boston'),
(7, 'Andrew Davis','Boston'),
(8, 'Jack Taylor','Boston'),
(9, 'Emily Martinez', 'New York'),
(10,'Anthony Lee','Boston');

INSERT INTO BOOKS 
(BookID, BookName, ISBN, AuthorID, PublisherID, BookCopies) VALUES
 (1,'The Lost Tribe','9780733426094', 2, 9, 34),
 (2,'How to Sew Buttons', '9480743426194', 4, 7, 43),
 (3,'The Terrible Night', '8780633423094', 6, 5, 35),
 (4,'Mindy''s Mittens','9680733426085', 8, 3, 46),
 (5,'Pizza and Donuts Diet','9880753426294', 10, 1, 53),
 (6,'101 Cat House Plans', '9380533427094', 12, 10, 37),
 (7,'Self-Help for Dummies', '9180543425094', 1, 8, 24),
 (8,'Land of Lemurs', '9290723426094', 3, 6, 44),
 (9,'Go For It!', '9350733126094', 5, 4, 45),
 (10,'Farming for Nerds', '9440733425094', 7, 2, 56),
 (11,'They Are Us', '9580735427094', 9, 1, 37),
 (12,'Here We Go!','9640736726094', 11, 2, 27),
 (13,'Spanish for Nurses', '9890733566094', 1, 3, 38),
 (14,'Tacos Everyday', '9550733488094', 2, 4, 30),
 (15,'One Minute Rule', '9770733496094', 3, 5, 29),
 (16,'Apples to Oranges', '9780733426094', 4, 6, 53),
 (17,'Tiger Mountain', '9980738428094', 5, 7, 39),
 (18,'How Cookies Crumble', '9120766426994', 6, 8, 15),
 (19,'Bridge to Yesterday', '9260833456094', 7, 9, 41),
 (20,'The Lemonade Stand', '9600713426094', 8, 10, 51),
 (21,'Hello World', '9500833426094', 9, 9, 23),
 (22,'Yoga for Moms', '9080733407094', 10, 8, 39),
 (23,'The Red Balloon', '9900731426094', 11, 7, 22),
 (24,'Make Art Not War','9080733425094', 12, 6, 34),
 (25,'War of Words', '9780733426094', 1, 5, 26),
 (26,'Green Smoothies for Kids', '9670768426094', 2, 4, 23),
 (27,'History of Jars', '9778733126094', 3, 3, 24),
 (28,'365 Dinner Ideas', '9550733427094', 4, 2, 25),
 (29,'Untitled Champion', '9660733429994', 5, 1, 27),
 (30,'Running in Thailand', '9770766426194', 6, 2, 45),
 (31,'Swimming After Dark', '9450778426194', 7, 3, 53),
 (32,'Don''t Pet the Shark', '9120733421294', 8, 4, 41),
 (33,'Is Your Dog Walking You?', '9230733422394', 5, 9, 44),
 (34,'Tips for Success', '9340733346094', 10, 6, 55),
 (35,'Learn to Type','9450733445094', 11, 7, 22),
 (36,'Tennis for Seniors', '9560733456094', 12, 8, 26),
 (37,'Zumba at the Zoo', '9670733426794', 2, 9, 38),
 (38,'Xavier and the Zebra','9780733786094', 6, 10, 28),
 (39,'You Can Do It!','9344533778094', 8, 1, 29),
 (40,'The Best Day Ever', '9780723786094', 10, 2, 29);
 
 INSERT INTO BORROWER 
(CustomerID, BookID, BranchID, StaffID, IssueDate, ReturnDate) VALUES
 (7, 38, 3, 12, '24/3/22', '24/4/22'),
 (6, 22, 3, 1, '4/7/21', '4/8/21'),      
 (8, 34, 3, 9, '2/5/20', '2/6/20'),       
 (10,  21, 3,1, '21/9/18', '21/10/18'),    
 (6,  23, 3, 12,'24/1/22', '24/2/22'),  
 (7,  10, 3, 1,' 3/4/22', '3/5/22'),
 (6,  14, 3, 12,'21/11/21', '21/12/21'),
 (8,  24, 3, 9,'22/3/21', '22/4/21'),
 (10,  25, 3, 1, '25/6/19', '25/7/19'),
 (3,  35, 2, 3, '21/3/22', '21/4/22' ),
 (12,  15, 2, 11,'2/3/19', '2/4/19' ),  
 (4,  5, 2, 4, '2/3/22', '2/4/22'),      
 (3, 10, 2, 3, '20/6/21', '20/7/21'),      
 (5, 20,  2, 4, '12/4/21', '12/5/21' ),     
 (11,  30, 2, 11,'26/9/20', '26/10/20'),    
 (12,  40, 2, 4, '30/12/21', '30/12/21'),
 (5,  28, 2, 3, '12/12/21', '12/12/21'),
 (11,  18, 2, 11, '24/3/18', '24/4/18'),
 (12,  39, 2, 3, '9/10/20', '9/11/20'),
 (1,  19, 1, 10, '11/11/18', '11/12/18'),
 (13,  29, 1, 8, '29/8/19', '29/9/19'),
 (2,  9, 1, 6, '24/5/18', '24/6/18'),
 (2, 13, 1, 6,'27/3/19', '27/4/19'),   
 (1, 34, 1, 10, '13/9/18', '13/10/18'), 
 (13, 26, 1, 8, '4/4/20', '4/5/20'),  
 (2,  34, 1, 6, '9/7/20', '9/8/20'),  
 (1,  26, 1, 10, '28/6/19', '28/7/19'),
 (1,  25, 1,8, '10/3/20', '10/4/20'),
 (13,  26, 1,10, '2/11/21', '2/12/21'),
 (1,  34, 1, 8, '5/5/21', '5/6/21');
 
UPDATE BRANCH
SET ManagerID = 5
WHERE BranchID = 2;

UPDATE BRANCH
SET ManagerID = 7
WHERE BranchID =3;

SELECT * FROM BRANCH;
SELECT * FROM BORROWER
ORDER BY CustomerID;

SELECT DISTINCT AuthorID, BookName, ISBN 
FROM BOOKS;

SELECT * FROM STAFF
WHERE Gender='Female' AND City='Boston'; 

SELECT * FROM CUSTOMER
WHERE City='New York' OR City='Boston'; 

SELECT * FROM STAFF
WHERE StaffID IN (SELECT ManagerID FROM BRANCH);

SELECT * FROM STAFF
WHERE StaffName LIKE 'j%';

SELECT COUNT(BookName)
FROM BOOKS
WHERE AuthorID = 2;

SELECT AVG(Salary)
FROM STAFF
WHERE STAFF.BranchID = 3;

SELECT SUM(BookCopies)
FROM BOOKS;

/**SELF JOIN*/
SELECT A.CustName AS CustomerName1, B.CustName AS CustomerName2, A.City
FROM CUSTOMER A, CUSTOMER B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City;

SELECT  BOOKS.BookID, BOOKS.BookName, AUTHOR.AuthorName
FROM BOOKS
INNER JOIN AUTHOR ON BOOKS.AuthorID = AUTHOR.AuthorID;

SELECT  BOOKS.BookID, BOOKS.BookName, PUBLISHER.PublName
FROM BOOKS
RIGHT JOIN PUBLISHER ON BOOKS.PublisherID = PUBLISHER.PublisherID;

SELECT  BOOKS.BookID, BOOKS.BookName, PUBLISHER.PublName
FROM BOOKS
LEFT JOIN PUBLISHER ON BOOKS.PublisherID = PUBLISHER.PublisherID;

SELECT COUNT(CustomerID), City
FROM CUSTOMER
GROUP BY City;

SELECT COUNT(CustomerID), City
FROM CUSTOMER
GROUP BY City
HAVING COUNT(CustomerID)>4;

CREATE VIEW BookInfo(
BookId,
NameOfBook,
ISBN,
Author,
Publisher
)
AS SELECT BOOKS.BookID, BOOKS.BookName, BOOKS.ISBN, AUTHOR.AuthorName, PUBLISHER.PublName
FROM BOOKS, AUTHOR, PUBLISHER
WHERE AUTHOR.AuthorID = BOOKS.AuthorID 
AND PUBLISHER.PublisherID = BOOKS.PublisherID;

SELECT * FROM BookInfo;

CREATE VIEW StaffDetails(
Staff_Id,
Staff_name,
Salary,
Phonenumber
)
AS SELECT STAFF.StaffID, STAFF.StaffName, STAFF.Salary, STAFF.PhoneNo
FROM STAFF
WHERE STAFF.BranchID = 1;

SELECT * FROM StaffDetails;



CREATE TRIGGER StaffDetails 
BEFORE INSERT ON STAFF 
FOR EACH ROW 
INSERT INTO Salary VALUES (new.Salary);

CREATE TRIGGER BookCopy_details 
BEFORE INSERT ON BOOKS 
FOR EACH ROW SET 
new.BookCopies = new.BookCopies+100;

CREATE TRIGGER Cust_details
BEFORE DELETE ON CUSTOMER 
FOR EACH ROW 
DELETE FROM CustomerID;

  




