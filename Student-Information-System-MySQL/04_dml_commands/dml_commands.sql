-- Section 5.2 | DML: SELECT, INSERT, UPDATE, DELETE
USE StudentInformationSystem;

-- 5.2.1 SELECT
SELECT * FROM Student;

-- 5.2.2 INSERT (temporary student 106)
INSERT INTO Student (Student_ID, Student_Name, Date_of_Birth, Phone, Email, Department_ID)
VALUES (106, 'Sneha Patel', '2005-05-14', '9876500106', 'sneha@example.com', 1);
SELECT * FROM Student;

-- 5.2.3 UPDATE
UPDATE Student SET Phone = '9876500199' WHERE Student_ID = 101;
SELECT Student_ID, Student_Name, Phone FROM Student WHERE Student_ID = 101;

-- 5.2.4 DELETE (removes the temporary student 106)
DELETE FROM Student WHERE Student_ID = 106;
SELECT * FROM Student WHERE Student_ID = 106;
