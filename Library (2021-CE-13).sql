Use [Library (2021-CE-13)];
SELECT * FROM sys.procedures WHERE name = 'IssueBook';
-- 1. Login Table
CREATE TABLE Login (
    Username VARCHAR(150) NOT NULL,
    Password VARCHAR(20) NOT NULL
);

INSERT INTO Login (Username, Password) VALUES ('Admin', 'Admin');
INSERT INTO Login (Username, Password) VALUES ('Samreen', '1059');

-- 2. Author Table
CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(255) NOT NULL
);

INSERT INTO Author (AuthorID, AuthorName) VALUES (1, 'Athar Rehman');
INSERT INTO Author (AuthorID, AuthorName) VALUES (2, 'Waseem');
INSERT INTO Author (AuthorID, AuthorName) VALUES (3, 'Ali Hammad');
INSERT INTO Author (AuthorID, AuthorName) VALUES (4, 'Prof.Asim');

-- 3. Category Table
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(150) NOT NULL
);

INSERT INTO Category (CategoryID, CategoryName) VALUES (1, 'Coding');
INSERT INTO Category (CategoryID, CategoryName) VALUES (2, 'Book');
INSERT INTO Category (CategoryID, CategoryName) VALUES (3, 'Engineering');
INSERT INTO Category (CategoryID, CategoryName) VALUES (4, 'English');

-- 4. Book Table
CREATE TABLE Book (
    ISBN VARCHAR(150) PRIMARY KEY,
    BookName VARCHAR(150) NOT NULL,
    PublishDate VARCHAR(150) NOT NULL,
    Quantity INT NOT NULL,
    AuthorID INT REFERENCES Author(AuthorID),
    CategoryID INT REFERENCES Category(CategoryID)
);

INSERT INTO Book (BookName, ISBN, PublishDate, Quantity, AuthorID, CategoryID)
VALUES ('C++', '123', '12/12/2021', 10, 1, 1);

INSERT INTO Book (BookName, ISBN, PublishDate, Quantity, AuthorID, CategoryID)
VALUES ('DBMS', '1234', '2/04/2020', 9, 2, 2);

INSERT INTO Book (BookName, ISBN, PublishDate, Quantity, AuthorID, CategoryID)
VALUES ('Operating System', '12345', '1/01/2019', 8, 3, 2);

INSERT INTO Book (BookName, ISBN, PublishDate, Quantity, AuthorID, CategoryID)
VALUES ('Software Engineering', '123456', '03/06/2018', 7, 4, 3);

INSERT INTO Book (BookName, ISBN, PublishDate, Quantity, AuthorID, CategoryID)
VALUES ('Technical Writing', '1234567', '4/09/2022', 6, 1, 4);

-- 5. LibraryUser Table
CREATE TABLE LibraryUser (
    UserID VARCHAR(150) PRIMARY KEY,
    UserName VARCHAR(150) NOT NULL,
    UserContact VARCHAR(150) NOT NULL,
    UserEmail VARCHAR(150) NOT NULL
);

INSERT INTO LibraryUser (UserName, UserID, UserContact, UserEmail)
VALUES ('Samreen', '2021-CE-13', '0321456', 'samreen@gmail.com');

INSERT INTO LibraryUser (UserName, UserID, UserContact, UserEmail)
VALUES ('Urwah', '2021-CE-15', '0457694', 'urwah@gmail.com');

INSERT INTO LibraryUser (UserName, UserID, UserContact, UserEmail)
VALUES ('Ayesha', '2021-CE-18', '0968543', 'ayesha@gmail.com');

INSERT INTO LibraryUser (UserName, UserID, UserContact, UserEmail)
VALUES ('Aiman', '2021-CE-23', '0856483', 'aiman@gmail.com');

INSERT INTO LibraryUser (UserName, UserID, UserContact, UserEmail)
VALUES ('Ebaa', '2021-CE-22', '0456787', 'ebaa@gmail.com');

-- 6. Issue Table
CREATE TABLE Issue (
    IssueID INT PRIMARY KEY,
    UserID VARCHAR(150) REFERENCES LibraryUser(UserID) NOT NULL,
    ISBN VARCHAR(150) REFERENCES Book(ISBN) NOT NULL,
    IssueDate VARCHAR(150) NOT NULL,
    ReturnDate VARCHAR(150) NOT NULL,
    IsReturned BIT NOT NULL,
    Fine INT NOT NULL
);


-- Add issue entries as needed

-- 7. BookAuthor Table
CREATE TABLE BookAuthor (
    BookISBN VARCHAR(150) REFERENCES Book(ISBN) NOT NULL,
    AuthorID INT REFERENCES Author(AuthorID) NOT NULL,
    PRIMARY KEY (BookISBN, AuthorID)
);

-- Associate books with multiple authors

-- 8. BookCategory Table
CREATE TABLE BookCategory (
    BookISBN VARCHAR(150) REFERENCES Book(ISBN) NOT NULL,
    CategoryID INT REFERENCES Category(CategoryID) NOT NULL,
    PRIMARY KEY (BookISBN, CategoryID)
);

-- Associate books with multiple categories

-- 9. UserRole Table
CREATE TABLE UserRole (
    UserID VARCHAR(150) REFERENCES LibraryUser(UserID) NOT NULL,
    RoleName VARCHAR(50) NOT NULL,
    PRIMARY KEY (UserID, RoleName)
);

-- Assign roles to users

-- 10. LibraryUserIssue Table
CREATE TABLE LibraryUserIssue (
    UserID VARCHAR(150) REFERENCES LibraryUser(UserID) NOT NULL,
    IssueID INT REFERENCES Issue(IssueID) NOT NULL,
    PRIMARY KEY (UserID, IssueID)
);

-- Track issues associated with each user

-- 11. Triggers

-- Trigger to update the quantity of books when an issue is made
GO
CREATE TRIGGER UpdateBookQuantity
ON Issue
AFTER INSERT
AS
BEGIN
    UPDATE Book
    SET Quantity = Quantity - 1
    FROM Book
    INNER JOIN inserted ON Book.ISBN = inserted.ISBN;
END;
GO

-- Trigger to update the quantity of books when a book is returned
GO
CREATE TRIGGER ReturnBook
ON Issue
AFTER UPDATE
AS
BEGIN
    UPDATE Book
    SET Quantity = Quantity + 1
    FROM Book
    INNER JOIN deleted ON Book.ISBN = deleted.ISBN
    INNER JOIN inserted ON Book.ISBN = inserted.ISBN
    WHERE deleted.IsReturned = 0 AND inserted.IsReturned = 1;
END;
GO

-- 12. Stored Procedures

-- Stored procedure to get a list of overdue books
GO
CREATE PROCEDURE GetOverdueBooks
AS
BEGIN
    SELECT Book.BookName, Issue.UserID, Issue.IssueDate, Issue.ReturnDate
    FROM Issue
    INNER JOIN Book ON Issue.ISBN = Book.ISBN
    WHERE Issue.IsReturned = 0 AND Issue.ReturnDate < GETDATE();
END;
GO

-- Stored procedure to issue a book
GO
CREATE PROCEDURE IssueBook
    @UserID VARCHAR(150),
    @ISBN VARCHAR(150),
    @IssueDate VARCHAR(150),
    @ReturnDate VARCHAR(150),
    @Fine INT
AS
BEGIN
    INSERT INTO Issue (UserID, ISBN, IssueDate, ReturnDate, IsReturned, Fine)
    VALUES (@UserID, @ISBN, @IssueDate, @ReturnDate, 0, @Fine);
END;
GO