
-- Creating Student Table --

CREATE TABLE STUDENT (
    StudentID INT PRIMARY KEY IDENTITY(1,1),  
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')), 
    Email VARCHAR(100)
);

-- Creating Subject Table -- 

CREATE TABLE SUBJECT (
    SubjectID INT PRIMARY KEY IDENTITY(1,1), 
    SubjectName VARCHAR(100) NOT NULL,
    SubjectCode VARCHAR(10) UNIQUE NOT NULL
);

-- Creating Exam Table --

CREATE TABLE EXAM (
    ExamID INT PRIMARY KEY IDENTITY(1,1),  
    MinMark INT NOT NULL,
    MaxMark INT NOT NULL
);

-- Creating Marks Table --

CREATE TABLE MARKS (
    MarksID INT PRIMARY KEY IDENTITY(1,1), 
    ExamID INT NOT NULL,
    SubjectID INT NOT NULL,
    StudentID INT NOT NULL,
    Mark INT NOT NULL,
    FOREIGN KEY (ExamID) REFERENCES EXAM(ExamID), 
    FOREIGN KEY (SubjectID) REFERENCES SUBJECT(SubjectID), 
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID)   
);

-- Inserting values to Student --

INSERT INTO STUDENT (FirstName, LastName, Gender, Email)
VALUES 
('Alice', 'Johnson', 'F', 'alice.johnson@example.com'),
('Bob', 'Smith', 'M', 'bob.smith@example.com'),
('Charlie', 'Brown', 'M', 'charlie.brown@example.com');

-- Inserting values to Subject --

INSERT INTO SUBJECT (SubjectName, SubjectCode)
VALUES 
('Mathematics', 'MATH101'),
('Physics', 'PHYS101'),
('Chemistry', 'CHEM101');

-- Inserting values to Exam --

INSERT INTO EXAM (MinMark, MaxMark)
VALUES 
(40, 100),
(35, 100),
(50, 100);

-- Inserting values to Marks --

INSERT INTO MARKS (ExamID, SubjectID, StudentID, Mark)
VALUES 
(1, 1, 1, 85), 
(2, 2, 2, 75),
(3, 3, 3, 90); 


