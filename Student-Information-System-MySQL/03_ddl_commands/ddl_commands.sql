-- Section 5.1 | DDL: ALTER, DROP, TRUNCATE
-- DROP and TRUNCATE are destructive, so they run on a BACKUP database,
-- leaving the main sample data untouched for the other scripts.

DROP DATABASE IF EXISTS StudentInformationSystem_Backup;
CREATE DATABASE StudentInformationSystem_Backup;
USE StudentInformationSystem_Backup;

CREATE TABLE Student LIKE StudentInformationSystem.Student;
INSERT INTO Student SELECT * FROM StudentInformationSystem.Student;
CREATE TABLE Attendance LIKE StudentInformationSystem.Attendance;
INSERT INTO Attendance SELECT * FROM StudentInformationSystem.Attendance;
CREATE TABLE UserAccount LIKE StudentInformationSystem.UserAccount;
INSERT INTO UserAccount SELECT * FROM StudentInformationSystem.UserAccount;

-- 5.1.1 ALTER TABLE
ALTER TABLE Student ADD COLUMN Address VARCHAR(150);
DESCRIBE Student;

-- 5.1.2 DROP TABLE
DROP TABLE UserAccount;

-- 5.1.3 TRUNCATE TABLE
TRUNCATE TABLE Attendance;
SELECT * FROM Attendance;

-- Switch back to the main database
USE StudentInformationSystem;
