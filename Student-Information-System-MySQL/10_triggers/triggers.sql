-- Section 5.8 | Triggers (6 examples). Run in order.
-- Lines starting with "-- [ERROR DEMO]" are statements that are EXPECTED to fail.
-- They are commented so the whole script runs without stopping;
-- uncomment them one at a time to see the validation errors.
USE StudentInformationSystem;

-- Example 7: validate marks before INSERT
DROP TRIGGER IF EXISTS trg_marks_before_insert;
DELIMITER //
CREATE TRIGGER trg_marks_before_insert
BEFORE INSERT ON Marks
FOR EACH ROW
BEGIN
  DECLARE v_max DECIMAL(5,2);
  SELECT Max_Marks INTO v_max FROM Examination WHERE Exam_ID = NEW.Exam_ID;
  IF NEW.Marks_Obtained < 0 OR NEW.Marks_Obtained > v_max THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid marks: must be 0 to Max_Marks';
  END IF;
END //
DELIMITER ;

INSERT INTO Marks VALUES (606, 402, 501, 82, 'A', 'Good performance');
-- [ERROR DEMO] INSERT INTO Marks VALUES (607, 401, 502, 150, 'A+', 'Invalid test');
SELECT Mark_ID, Enrollment_ID, Marks_Obtained, Grade FROM Marks WHERE Mark_ID IN (606, 607);

-- Example 8: log new students (AFTER INSERT) + supporting audit table
CREATE TABLE IF NOT EXISTS Student_Audit (
  Audit_ID INT AUTO_INCREMENT PRIMARY KEY,
  Student_ID INT NOT NULL,
  Action_Type VARCHAR(10) NOT NULL,
  Old_Name VARCHAR(100),
  New_Name VARCHAR(100),
  Old_Phone VARCHAR(15),
  New_Phone VARCHAR(15),
  Old_Email VARCHAR(100),
  New_Email VARCHAR(100),
  Old_Department_ID INT,
  New_Department_ID INT,
  Changed_At DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS trg_student_after_insert;
DELIMITER //
CREATE TRIGGER trg_student_after_insert
AFTER INSERT ON Student
FOR EACH ROW
BEGIN
  INSERT INTO Student_Audit
    (Student_ID, Action_Type, New_Name, New_Phone, New_Email, New_Department_ID)
  VALUES
    (NEW.Student_ID, 'INSERT', NEW.Student_Name, NEW.Phone, NEW.Email, NEW.Department_ID);
END //
DELIMITER ;

INSERT INTO Student (Student_ID, Student_Name, Date_of_Birth, Phone, Email, Department_ID)
VALUES (106, 'Sneha Patel', '2005-05-14', '9876500106', 'sneha@example.com', 1);
SELECT Audit_ID, Student_ID, Action_Type, New_Name, New_Phone, New_Department_ID FROM Student_Audit;

-- Example 9: validate marks before UPDATE
DROP TRIGGER IF EXISTS trg_marks_before_update;
DELIMITER //
CREATE TRIGGER trg_marks_before_update
BEFORE UPDATE ON Marks
FOR EACH ROW
BEGIN
  DECLARE v_max DECIMAL(5,2);
  SELECT Max_Marks INTO v_max FROM Examination WHERE Exam_ID = NEW.Exam_ID;
  IF NEW.Marks_Obtained < 0 OR NEW.Marks_Obtained > v_max THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid update: marks out of range';
  END IF;
END //
DELIMITER ;

-- [ERROR DEMO] UPDATE Marks SET Marks_Obtained = 120 WHERE Mark_ID = 601;
UPDATE Marks SET Marks_Obtained = 88 WHERE Mark_ID = 601;
SELECT Mark_ID, Marks_Obtained, Grade FROM Marks WHERE Mark_ID = 601;

-- Example 10: audit student changes (AFTER UPDATE)
DROP TRIGGER IF EXISTS trg_student_after_update;
DELIMITER //
CREATE TRIGGER trg_student_after_update
AFTER UPDATE ON Student
FOR EACH ROW
BEGIN
  IF NOT (OLD.Student_Name <=> NEW.Student_Name
      AND OLD.Phone <=> NEW.Phone
      AND OLD.Email <=> NEW.Email
      AND OLD.Department_ID <=> NEW.Department_ID) THEN
    INSERT INTO Student_Audit
      (Student_ID, Action_Type, Old_Name, New_Name, Old_Phone, New_Phone,
       Old_Email, New_Email, Old_Department_ID, New_Department_ID)
    VALUES
      (OLD.Student_ID, 'UPDATE', OLD.Student_Name, NEW.Student_Name,
       OLD.Phone, NEW.Phone, OLD.Email, NEW.Email,
       OLD.Department_ID, NEW.Department_ID);
  END IF;
END //
DELIMITER ;

UPDATE Student SET Phone = '9876500188' WHERE Student_ID = 101;
SELECT Audit_ID, Student_ID, Action_Type, Old_Phone, New_Phone, Changed_At
FROM Student_Audit WHERE Action_Type = 'UPDATE';

-- Example 11: block deletion of pending fees (BEFORE DELETE)
DROP TRIGGER IF EXISTS trg_fee_before_delete;
DELIMITER //
CREATE TRIGGER trg_fee_before_delete
BEFORE DELETE ON Fee
FOR EACH ROW
BEGIN
  IF OLD.Payment_Status = 'Pending' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pending fee records cannot be deleted';
  END IF;
END //
DELIMITER ;

-- [ERROR DEMO] DELETE FROM Fee WHERE Fee_ID = 802;
INSERT INTO Fee VALUES (806, 105, 1000.00, '2026-07-15', '2026-07-12', 'Paid', 'Cash');
DELETE FROM Fee WHERE Fee_ID = 806;
SELECT Fee_ID, Student_ID, Amount, Payment_Status FROM Fee WHERE Fee_ID IN (802, 806);

-- Example 12: log deleted students (AFTER DELETE)
DROP TRIGGER IF EXISTS trg_student_after_delete;
DELIMITER //
CREATE TRIGGER trg_student_after_delete
AFTER DELETE ON Student
FOR EACH ROW
BEGIN
  INSERT INTO Student_Audit
    (Student_ID, Action_Type, Old_Name, Old_Phone, Old_Email, Old_Department_ID)
  VALUES
    (OLD.Student_ID, 'DELETE', OLD.Student_Name, OLD.Phone, OLD.Email, OLD.Department_ID);
END //
DELIMITER ;

DELETE FROM Student WHERE Student_ID = 106;
SELECT * FROM Student WHERE Student_ID = 106;
SELECT Audit_ID, Student_ID, Action_Type, Old_Name, Old_Phone, Old_Department_ID
FROM Student_Audit WHERE Action_Type = 'DELETE';

-- Verification
SELECT TRIGGER_NAME, ACTION_TIMING, EVENT_MANIPULATION, EVENT_OBJECT_TABLE
FROM information_schema.TRIGGERS
WHERE TRIGGER_SCHEMA = 'StudentInformationSystem'
ORDER BY TRIGGER_NAME;

SELECT Audit_ID, Student_ID, Action_Type, Old_Phone, New_Phone, Changed_At
FROM Student_Audit ORDER BY Audit_ID;
