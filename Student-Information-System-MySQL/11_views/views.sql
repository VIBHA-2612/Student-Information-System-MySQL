-- Section 6 | Views (10 examples). Run AFTER the triggers script.
-- [ERROR DEMO] lines are expected to fail; uncomment to demonstrate.
USE StudentInformationSystem;

-- Example 1: join view
CREATE OR REPLACE VIEW Student_Department_View AS
SELECT s.Student_ID, s.Student_Name, s.Email, d.Department_Name
FROM Student s
JOIN Department d ON s.Department_ID = d.Department_ID;
SELECT * FROM Student_Department_View;

-- Example 2: row/column restricting view with CHECK OPTION
CREATE OR REPLACE VIEW CS_Students AS
SELECT Student_ID, Student_Name, Date_of_Birth, Email, Department_ID
FROM Student
WHERE Department_ID = 1
WITH CHECK OPTION;
SELECT * FROM CS_Students;

-- Example 3: aggregate view
CREATE OR REPLACE VIEW Dept_Student_Count AS
SELECT d.Department_ID, d.Department_Name, COUNT(s.Student_ID) AS Student_Count
FROM Department d
LEFT JOIN Student s ON d.Department_ID = s.Department_ID
GROUP BY d.Department_ID, d.Department_Name;
SELECT * FROM Dept_Student_Count;

-- Example 4: multi-table marks report
CREATE OR REPLACE VIEW Student_Marks_View AS
SELECT s.Student_Name, c.Course_Name, ex.Exam_Name, m.Marks_Obtained, m.Grade
FROM Marks m
JOIN Enrollment en ON m.Enrollment_ID = en.Enrollment_ID
JOIN Student s ON en.Student_ID = s.Student_ID
JOIN Course c ON en.Course_ID = c.Course_ID
JOIN Examination ex ON m.Exam_ID = ex.Exam_ID;
SELECT * FROM Student_Marks_View ORDER BY Marks_Obtained DESC, Student_Name;

-- Example 5: pending fees
CREATE OR REPLACE VIEW Pending_Fee_View AS
SELECT f.Fee_ID, s.Student_Name, f.Amount
FROM Fee f
JOIN Student s ON f.Student_ID = s.Student_ID
WHERE f.Payment_Status = 'Pending';
SELECT * FROM Pending_Fee_View;

-- Example 6: update through an updatable view
UPDATE CS_Students SET Email = 'aarav.kumar@example.com' WHERE Student_ID = 101;
SELECT Student_ID, Student_Name, Email FROM Student WHERE Student_ID = 101;

-- Example 7: WITH CHECK OPTION in action
-- [ERROR DEMO] INSERT INTO CS_Students (Student_ID, Student_Name, Date_of_Birth, Email, Department_ID)
-- [ERROR DEMO] VALUES (107, 'Test Student', '2005-01-01', 'test@example.com', 2);

-- Example 8: aggregate view is read-only
-- [ERROR DEMO] UPDATE Dept_Student_Count SET Student_Count = 5 WHERE Department_Name = 'Computer Science';

-- Example 9: modify a view
CREATE OR REPLACE VIEW Pending_Fee_View AS
SELECT f.Fee_ID, s.Student_Name, f.Amount, f.Due_Date, f.Payment_Status
FROM Fee f
JOIN Student s ON f.Student_ID = s.Student_ID
WHERE f.Payment_Status = 'Pending';
SELECT * FROM Pending_Fee_View;

-- Example 10: list and drop views
CREATE VIEW Temp_Dept_View AS SELECT * FROM Department;
SHOW FULL TABLES WHERE Table_type = 'VIEW';
DROP VIEW Temp_Dept_View;
SHOW FULL TABLES WHERE Table_type = 'VIEW';
