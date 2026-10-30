-- Section 5.3 | Sorting and aggregate functions
USE StudentInformationSystem;

-- 5.3.2 COUNT
SELECT COUNT(*) AS Total_Students FROM Student;

-- 5.3.3 All five aggregates
SELECT
  COUNT(Marks_Obtained) AS Marks_Count,
  SUM(Marks_Obtained) AS Total_Marks,
  ROUND(AVG(Marks_Obtained), 2) AS Average_Marks,
  MIN(Marks_Obtained) AS Minimum_Marks,
  MAX(Marks_Obtained) AS Maximum_Marks
FROM Marks;

-- 5.3.4 ORDER BY
SELECT Student_ID, Student_Name, Department_ID
FROM Student
ORDER BY Student_Name ASC;

-- 5.3.5 GROUP BY
SELECT Status, COUNT(*) AS Attendance_Count
FROM Attendance
GROUP BY Status
ORDER BY Attendance_Count DESC;
