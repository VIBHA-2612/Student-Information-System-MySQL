-- Section 4.2 | Sample data (run after 01_create_tables.sql)
USE StudentInformationSystem;

INSERT INTO Department (Department_ID, Department_Name, HOD_Name, Office_Location, Contact_Number) VALUES
(1, 'Computer Science', 'Dr. Kumar', 'Block A', '9876500001'),
(2, 'Information Technology', 'Dr. Sharma', 'Block B', '9876500002'),
(3, 'Electronics', 'Dr. Reddy', 'Block C', '9876500003'),
(4, 'Mechanical Engineering', 'Dr. Rao', 'Block D', '9876500004'),
(5, 'Civil Engineering', 'Dr. Singh', 'Block E', '9876500005');

INSERT INTO Student (Student_ID, Student_Name, Date_of_Birth, Phone, Email, Department_ID) VALUES
(101, 'Aarav Kumar', '2005-03-12', '9876500101', 'aarav@example.com', 1),
(102, 'Diya Sharma', '2005-07-24', '9876500102', 'diya@example.com', 1),
(103, 'Rahul Reddy', '2004-11-08', '9876500103', 'rahul@example.com', 2),
(104, 'Ananya Rao', '2005-01-16', '9876500104', 'ananya@example.com', 3),
(105, 'Kiran Singh', '2005-09-30', '9876500105', 'kiran@example.com', 2);

INSERT INTO Faculty (Faculty_ID, Faculty_Name, Email, Phone, Designation, Department_ID) VALUES
(201, 'Dr. Meera', 'meera@example.com', '9876500201', 'Professor', 1),
(202, 'Mr. Arjun', 'arjun@example.com', '9876500202', 'Assistant Professor', 2),
(203, 'Dr. Kavita', 'kavita@example.com', '9876500203', 'Professor', 3),
(204, 'Mr. Suresh', 'suresh@example.com', '9876500204', 'Lecturer', 4),
(205, 'Dr. Priya', 'priya@example.com', '9876500205', 'Assistant Professor', 5);

INSERT INTO Course (Course_ID, Course_Name, Credits, Department_ID, Faculty_ID) VALUES
(301, 'DBMS', 4, 1, 201),
(302, 'Computer Networks', 3, 2, 202),
(303, 'Digital Electronics', 4, 3, 203),
(304, 'Engineering Mechanics', 3, 4, 204),
(305, 'Structural Engineering', 4, 5, 205);

INSERT INTO Enrollment (Enrollment_ID, Student_ID, Course_ID, Semester, Academic_Year, Enrollment_Date, Status) VALUES
(401, 101, 301, 3, '2026-2027', '2026-07-01', 'Active'),
(402, 102, 301, 3, '2026-2027', '2026-07-02', 'Active'),
(403, 103, 302, 3, '2026-2027', '2026-07-03', 'Active'),
(404, 104, 303, 3, '2026-2027', '2026-07-04', 'Active'),
(405, 105, 302, 3, '2026-2027', '2026-07-05', 'Active');

INSERT INTO Attendance (Attendance_ID, Enrollment_ID, Attendance_Date, Status, Remarks) VALUES
(701, 401, '2026-07-10', 'Present', 'Attended class'),
(702, 402, '2026-07-10', 'Absent', 'Absent from class'),
(703, 403, '2026-07-10', 'Present', 'Attended class'),
(704, 404, '2026-07-10', 'Present', 'Attended class'),
(705, 405, '2026-07-10', 'Absent', 'Leave not recorded');

INSERT INTO Examination (Exam_ID, Course_ID, Exam_Name, Exam_Date, Max_Marks, Exam_Type) VALUES
(501, 301, 'DBMS Internal 1', '2026-08-10', 100, 'Internal'),
(502, 301, 'DBMS Internal 2', '2026-09-10', 100, 'Internal'),
(503, 302, 'Networks Internal 1', '2026-08-12', 100, 'Internal'),
(504, 303, 'Electronics Internal 1', '2026-08-15', 100, 'Internal'),
(505, 302, 'Networks Internal 2', '2026-09-12', 100, 'Internal');

INSERT INTO Marks (Mark_ID, Enrollment_ID, Exam_ID, Marks_Obtained, Grade, Remarks) VALUES
(601, 401, 501, 85, 'A', 'Good performance'),
(602, 402, 502, 90, 'A+', 'Excellent performance'),
(603, 403, 503, 78, 'B+', 'Good performance'),
(604, 404, 504, 88, 'A', 'Very good performance'),
(605, 405, 505, 72, 'B', 'Satisfactory performance');

INSERT INTO Fee (Fee_ID, Student_ID, Amount, Due_Date, Payment_Date, Payment_Status, Payment_Method) VALUES
(801, 101, 45000.00, '2026-07-15', '2026-07-10', 'Paid', 'UPI'),
(802, 102, 45000.00, '2026-07-15', NULL, 'Pending', NULL),
(803, 103, 42000.00, '2026-07-15', '2026-07-12', 'Paid', 'Bank Transfer'),
(804, 104, 48000.00, '2026-07-15', NULL, 'Pending', NULL),
(805, 105, 42000.00, '2026-07-15', '2026-07-11', 'Paid', 'Cash');

INSERT INTO UserAccount (Account_ID, Student_ID, Username, Password_Hash, Role, Created_At) VALUES
(901, 101, 'aarav101', 'sample_hash_101', 'Student', '2026-07-01'),
(902, 102, 'diya102', 'sample_hash_102', 'Student', '2026-07-02'),
(903, 103, 'rahul103', 'sample_hash_103', 'Student', '2026-07-03'),
(904, 104, 'ananya104', 'sample_hash_104', 'Student', '2026-07-04'),
(905, 105, 'kiran105', 'sample_hash_105', 'Student', '2026-07-05');
