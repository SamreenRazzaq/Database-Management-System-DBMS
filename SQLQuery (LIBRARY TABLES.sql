USE [LIBRARY-MANAGEMENT-SYSTEM];
-- Table: Authors
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL
);

-- Table: Books
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    PublishedYear INT,
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Table: Categories
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

-- Table: Users
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE
);

-- Table: Borrowings
CREATE TABLE Borrowings (
    BorrowID INT PRIMARY KEY,
    UserID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Table: Publishers
CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(100) NOT NULL
);

-- Table: Copies
CREATE TABLE Copies (
    CopyID INT PRIMARY KEY,
    BookID INT,
    Status VARCHAR(20) NOT NULL, -- e.g., Available, Checked Out
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Table: Reviews
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    UserID INT,
    BookID INT,
    Rating INT,
    Comment TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Table: Reservations
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY,
    UserID INT,
    BookID INT,
    ReservationDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Table: BookCategories (Associative Entity for Many-to-Many Relationship)
CREATE TABLE BookCategories (
    BookID INT,
    CategoryID INT,
    PRIMARY KEY (BookID, CategoryID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
-- Insert sample data into Authors table
INSERT INTO Authors (AuthorID, AuthorName) VALUES
    (1, 'John Doe'),
    (2, 'Jane Smith');

-- Insert sample data into Books table
INSERT INTO Books (BookID, Title, ISBN, PublishedYear, AuthorID) VALUES
    (1, 'Introduction to Databases', '1234567890', 2020, 1),
    (2, 'Programming Basics', '9876543210', 2019, 2);

-- Insert sample data into Categories table
INSERT INTO Categories (CategoryID, CategoryName) VALUES
    (1, 'Database'),
    (2, 'Programming');

-- Insert sample data into Users table
INSERT INTO Users (UserID, UserName, Email) VALUES
    (1, 'Alice Johnson', 'alice@example.com'),
    (2, 'Bob Miller', 'bob@example.com');

-- Insert sample data into Borrowings table
INSERT INTO Borrowings (BorrowID, UserID, BookID, BorrowDate, ReturnDate) VALUES
    (1, 1, 1, '2022-01-01', '2022-01-15'),
    (2, 2, 2, '2022-02-01', '2022-02-15');

-- Insert sample data into Publishers table
INSERT INTO Publishers (PublisherID, PublisherName) VALUES
    (1, 'Tech Publications'),
    (2, 'Code Books');

-- Insert sample data into Copies table
INSERT INTO Copies (CopyID, BookID, Status) VALUES
    (1, 1, 'Available'),
    (2, 2, 'Checked Out');

-- Insert sample data into Reviews table
INSERT INTO Reviews (ReviewID, UserID, BookID, Rating, Comment) VALUES
    (1, 1, 1, 4, 'Great book!'),
    (2, 2, 2, 5, 'Excellent content.');

-- Insert sample data into Reservations table
INSERT INTO Reservations (ReservationID, UserID, BookID, ReservationDate) VALUES
    (1, 1, 2, '2022-03-01'),
    (2, 2, 1, '2022-03-15');

-- Insert sample data into BookCategories table
INSERT INTO BookCategories (BookID, CategoryID) VALUES
    (1, 1),
    (2, 2);