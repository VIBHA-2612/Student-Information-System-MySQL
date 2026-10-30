-- Section 4.2 | Table creation (parents first, children after)
USE StudentInformationSystem;

CREATE TABLE Department (
  Department_ID INT PRIMARY KEY,
  Department_Name VARCHAR(100) NOT NULL,
  HOD_Name VARCHAR(100),
  Office_Location VARCHAR(100),
  Contact_Number VARCHAR(15)
);

CREATE TABLE Student (
  Student_ID INT PRIMARY KEY,
  Student_Name VARCHAR(100) NOT NULL,
  Date_of_Birth DATE,
  Phone VARCHAR(15),
  Email VARCHAR(100),
  Department_ID INT,
  FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

CREATE TABLE Faculty (
  Faculty_ID INT PRIMARY KEY,
  Faculty_Name VARCHAR(100) NOT NULL,
  Email VARCHAR(100),
  Phone VARCHAR(15),
  Designation VARCHAR(50),
  Department_ID INT,
  FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

CREATE TABLE Course (
  Course_ID INT PRIMARY KEY,
  Course_Name VARCHAR(100) NOT NULL,
  Credits INT,
  Department_ID INT,
  Faculty_ID INT,
  FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID),
  FOREIGN KEY (Faculty_ID) REFERENCES Faculty(Faculty_ID)
);

CREATE TABLE Enrollment (
  Enrollment_ID INT PRIMARY KEY,
  Student_ID INT NOT NULL,
  Course_ID INT NOT NULL,
  Semester INT,
  Academic_Year VARCHAR(9),
  Enrollment_Date DATE,
  Status VARCHAR(20),
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
  FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

CREATE TABLE Attendance (
  Attendance_ID INT PRIMARY KEY,
  Enrollment_ID INT NOT NULL,
  Attendance_Date DATE NOT NULL,
  Status VARCHAR(10) NOT NULL,
  Remarks VARCHAR(200),
  FOREIGN KEY (Enrollment_ID) REFERENCES Enrollment(Enrollment_ID)
);

CREATE TABLE Examination (
  Exam_ID INT PRIMARY KEY,
  Course_ID INT NOT NULL,
  Exam_Name VARCHAR(50) NOT NULL,
  Exam_Date DATE,
  Max_Marks DECIMAL(5,2),
  Exam_Type VARCHAR(30),
  FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

CREATE TABLE Marks (
  Mark_ID INT PRIMARY KEY,
  Enrollment_ID INT NOT NULL,
  Exam_ID INT NOT NULL,
  Marks_Obtained DECIMAL(5,2),
  Grade VARCHAR(5),
  Remarks VARCHAR(100),
  FOREIGN KEY (Enrollment_ID) REFERENCES Enrollment(Enrollment_ID),
  FOREIGN KEY (Exam_ID) REFERENCES Examination(Exam_ID)
);

CREATE TABLE Fee (
  Fee_ID INT PRIMARY KEY,
  Student_ID INT NOT NULL,
  Amount DECIMAL(10,2) NOT NULL,
  Due_Date DATE,
  Payment_Date DATE,
  Payment_Status VARCHAR(20),
  Payment_Method VARCHAR(30),
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

CREATE TABLE UserAccount (
  Account_ID INT PRIMARY KEY,
  Student_ID INT NOT NULL UNIQUE,
  Username VARCHAR(50) NOT NULL UNIQUE,
  Password_Hash VARCHAR(255) NOT NULL,
  Role VARCHAR(20),
  Created_At DATE,
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);
