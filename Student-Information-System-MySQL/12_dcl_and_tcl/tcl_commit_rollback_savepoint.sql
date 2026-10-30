-- Section 7.2 | TCL: COMMIT, ROLLBACK, SAVEPOINT (requires InnoDB)
USE StudentInformationSystem;

-- 7.2.1 COMMIT
START TRANSACTION;
UPDATE Department SET Office_Location = 'Block F' WHERE Department_ID = 1;
COMMIT;
SELECT Department_ID, Office_Location FROM Department WHERE Department_ID = 1;

-- 7.2.2 ROLLBACK
START TRANSACTION;
UPDATE Department SET Office_Location = 'Block Z' WHERE Department_ID = 1;
SELECT Department_ID, Office_Location FROM Department WHERE Department_ID = 1;
ROLLBACK;
SELECT Department_ID, Office_Location FROM Department WHERE Department_ID = 1;

-- 7.2.3 SAVEPOINT
START TRANSACTION;
UPDATE Department SET Office_Location = 'Block G' WHERE Department_ID = 2;
SAVEPOINT sp1;
UPDATE Department SET Office_Location = 'Block H' WHERE Department_ID = 3;
ROLLBACK TO SAVEPOINT sp1;
COMMIT;
SELECT Department_ID, Office_Location FROM Department WHERE Department_ID IN (2, 3);
