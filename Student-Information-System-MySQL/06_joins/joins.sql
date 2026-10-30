-- Section 5.4 | Joins (Student and Department)
USE StudentInformationSystem;

-- 5.4.1 INNER JOIN
SELECT Student.Student_ID, Student.Student_Name, Department.Department_ID, Department.Department_Name
FROM Student
INNER JOIN Department ON Student.Department_ID = Department.Department_ID;

-- 5.4.2 RIGHT JOIN
SELECT Student.Student_ID, Student.Student_Name, Department.Department_ID, Department.Department_Name
FROM Student
RIGHT JOIN Department ON Student.Department_ID = Department.Department_ID;

-- 5.4.3 LEFT JOIN
SELECT Student.Student_ID, Student.Student_Name, Student.Department_ID, Department.Department_Name
FROM Student
LEFT JOIN Department ON Student.Department_ID = Department.Department_ID;

-- 5.4.4 FULL OUTER JOIN (MySQL has no keyword; LEFT JOIN UNION RIGHT JOIN)
SELECT Student.Student_ID, Student.Student_Name, Department.Department_ID, Department.Department_Name
FROM Student
LEFT JOIN Department ON Student.Department_ID = Department.Department_ID
UNION
SELECT Student.Student_ID, Student.Student_Name, Department.Department_ID, Department.Department_Name
FROM Student
RIGHT JOIN Department ON Student.Department_ID = Department.Department_ID
WHERE Student.Student_ID IS NULL;

-- 5.4.5 CROSS JOIN (5 x 5 = 25 rows)
SELECT Student.Student_ID, Student.Student_Name, Department.Department_Name
FROM Student
CROSS JOIN Department
ORDER BY Student.Student_ID, Department.Department_ID;
