-- Section 5.7 | Stored procedures (6 examples)
USE StudentInformationSystem;

-- Example 1: all students
DROP PROCEDURE IF EXISTS GetAllStudents;
DELIMITER //
CREATE PROCEDURE GetAllStudents()
BEGIN
  SELECT * FROM Student ORDER BY Student_ID;
END //
DELIMITER ;

-- Example 2: one student by ID (IN parameter)
DROP PROCEDURE IF EXISTS GetStudentByID;
DELIMITER //
CREATE PROCEDURE GetStudentByID(IN p_student_id INT)
BEGIN
  SELECT s.Student_ID, s.Student_Name, s.Date_of_Birth,
         s.Phone, s.Email, d.Department_Name
  FROM Student s
  JOIN Department d ON s.Department_ID = d.Department_ID
  WHERE s.Student_ID = p_student_id;
END //
DELIMITER ;

-- Example 3: all courses with department and faculty
DROP PROCEDURE IF EXISTS GetAllCourses;
DELIMITER //
CREATE PROCEDURE GetAllCourses()
BEGIN
  SELECT c.Course_ID, c.Course_Name, c.Credits,
         d.Department_Name, f.Faculty_Name
  FROM Course c
  JOIN Department d ON c.Department_ID = d.Department_ID
  JOIN Faculty f ON c.Faculty_ID = f.Faculty_ID
  ORDER BY c.Course_ID;
END //
DELIMITER ;

-- Example 4: marks and grades of a student
DROP PROCEDURE IF EXISTS GetStudentMarks;
DELIMITER //
CREATE PROCEDURE GetStudentMarks(IN p_student_id INT)
BEGIN
  SELECT s.Student_Name, c.Course_Name, ex.Exam_Name,
         m.Marks_Obtained, ex.Max_Marks, m.Grade
  FROM Marks m
  JOIN Enrollment en ON m.Enrollment_ID = en.Enrollment_ID
  JOIN Student s ON en.Student_ID = s.Student_ID
  JOIN Course c ON en.Course_ID = c.Course_ID
  JOIN Examination ex ON m.Exam_ID = ex.Exam_ID
  WHERE s.Student_ID = p_student_id;
END //
DELIMITER ;

-- Example 5: attendance of a student
DROP PROCEDURE IF EXISTS GetStudentAttendance;
DELIMITER //
CREATE PROCEDURE GetStudentAttendance(IN p_student_id INT)
BEGIN
  SELECT s.Student_Name, c.Course_Name,
         a.Attendance_Date, a.Status, a.Remarks
  FROM Attendance a
  JOIN Enrollment en ON a.Enrollment_ID = en.Enrollment_ID
  JOIN Student s ON en.Student_ID = s.Student_ID
  JOIN Course c ON en.Course_ID = c.Course_ID
  WHERE s.Student_ID = p_student_id
  ORDER BY a.Attendance_Date;
END //
DELIMITER ;

-- Example 6: student count of a department (IN + OUT parameter)
DROP PROCEDURE IF EXISTS GetDeptStudentCount;
DELIMITER //
CREATE PROCEDURE GetDeptStudentCount(IN p_dept_id INT, OUT p_total INT)
BEGIN
  SELECT COUNT(*) INTO p_total
  FROM Student
  WHERE Department_ID = p_dept_id;
END //
DELIMITER ;

-- ---- Calling the procedures ----
CALL GetAllStudents();
CALL GetStudentByID(103);
CALL GetAllCourses();
CALL GetStudentMarks(101);
CALL GetStudentMarks(105);
CALL GetStudentAttendance(102);
CALL GetDeptStudentCount(1, @total);
SELECT @total AS Total_Students;

-- Verify
SELECT ROUTINE_NAME AS Procedure_Name, ROUTINE_TYPE
FROM information_schema.ROUTINES
WHERE ROUTINE_SCHEMA = 'StudentInformationSystem'
ORDER BY ROUTINE_NAME;
