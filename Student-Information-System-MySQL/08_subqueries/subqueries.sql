-- Section 5.6 | Nested queries (subqueries)
USE StudentInformationSystem;

-- 5.6.1 Students of the Computer Science department
SELECT Student_ID, Student_Name
FROM Student
WHERE Department_ID IN (
  SELECT Department_ID FROM Department WHERE Department_Name = 'Computer Science'
);

-- 5.6.2 Courses taught by Professors
SELECT Course_ID, Course_Name, Faculty_ID
FROM Course
WHERE Faculty_ID IN (
  SELECT Faculty_ID FROM Faculty WHERE Designation = 'Professor'
);

-- 5.6.3 Students scoring above the average mark
SELECT Student_ID, Student_Name
FROM Student
WHERE Student_ID IN (
  SELECT Student_ID FROM Enrollment
  WHERE Enrollment_ID IN (
    SELECT Enrollment_ID FROM Marks
    WHERE Marks_Obtained > (SELECT AVG(Marks_Obtained) FROM Marks)
  )
);

-- 5.6.4 Students marked Absent
SELECT Student_ID, Student_Name
FROM Student
WHERE Student_ID IN (
  SELECT Student_ID FROM Enrollment
  WHERE Enrollment_ID IN (
    SELECT Enrollment_ID FROM Attendance WHERE Status = 'Absent'
  )
);
