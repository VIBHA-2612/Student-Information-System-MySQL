-- Section 5.5 | GROUP BY and HAVING with joins
USE StudentInformationSystem;

-- 5.5.1 Marks from highest to lowest
SELECT s.Student_Name, m.Marks_Obtained
FROM Marks AS m
JOIN Enrollment AS e ON m.Enrollment_ID = e.Enrollment_ID
JOIN Student AS s ON e.Student_ID = s.Student_ID
ORDER BY m.Marks_Obtained DESC;

-- 5.5.2 Students in each department
SELECT d.Department_Name, COUNT(s.Student_ID) AS Student_Count
FROM Department AS d
LEFT JOIN Student AS s ON d.Department_ID = s.Department_ID
GROUP BY d.Department_ID, d.Department_Name
ORDER BY d.Department_ID;

-- 5.5.3 Average marks by course
SELECT c.Course_Name,
       ROUND(AVG(m.Marks_Obtained), 2) AS Average_Marks,
       COUNT(m.Mark_ID) AS Marks_Records
FROM Course AS c
JOIN Examination AS ex ON c.Course_ID = ex.Course_ID
JOIN Marks AS m ON ex.Exam_ID = m.Exam_ID
GROUP BY c.Course_ID, c.Course_Name
ORDER BY Average_Marks DESC;

-- 5.5.4 Departments with more than one student
SELECT d.Department_Name, COUNT(s.Student_ID) AS Student_Count
FROM Department AS d
JOIN Student AS s ON d.Department_ID = s.Department_ID
GROUP BY d.Department_ID, d.Department_Name
HAVING COUNT(s.Student_ID) > 1
ORDER BY Student_Count DESC, d.Department_Name ASC;

-- 5.5.5 Courses with average marks above 80
SELECT c.Course_Name, ROUND(AVG(m.Marks_Obtained), 2) AS Average_Marks
FROM Course AS c
JOIN Examination AS ex ON c.Course_ID = ex.Course_ID
JOIN Marks AS m ON ex.Exam_ID = m.Exam_ID
GROUP BY c.Course_ID, c.Course_Name
HAVING AVG(m.Marks_Obtained) > 80
ORDER BY Average_Marks DESC;
