-- Section 7.1 | DCL: GRANT and REVOKE (run as a privileged user, e.g. root)
USE StudentInformationSystem;

CREATE USER IF NOT EXISTS 'student_user'@'localhost' IDENTIFIED BY 'Student@123';

GRANT SELECT ON StudentInformationSystem.Department TO 'student_user'@'localhost';
SHOW GRANTS FOR 'student_user'@'localhost';

REVOKE SELECT ON StudentInformationSystem.Department FROM 'student_user'@'localhost';
SHOW GRANTS FOR 'student_user'@'localhost';
