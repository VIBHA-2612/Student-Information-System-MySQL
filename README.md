# 🎓 Student Information System (MySQL)

A DBMS case study by **BVRIT Hyderabad College of Engineering for Women, Dept. of CSE (AI&ML)**, under the guidance of **Miss V. Asha (Asst. Professor)**.

A MySQL relational database that manages departments, students, faculty, courses, enrollments, attendance, examinations, marks, fees and user accounts. It includes SQL demonstrations of DDL, DML, joins, subqueries, stored procedures, triggers, views, DCL and TCL.

## 📁 Project Contents

All code is inside the [`Student-Information-System-MySQL`](Student-Information-System-MySQL) folder.

| Folder | Topic | Report section |
|---|---|---|
| [01_database_setup](Student-Information-System-MySQL/01_database_setup) | Create the database | 4.1 |
| [02_tables_and_sample_data](Student-Information-System-MySQL/02_tables_and_sample_data) | 10 tables, sample data, verification | 4.2 |
| [03_ddl_commands](Student-Information-System-MySQL/03_ddl_commands) | ALTER, DROP, TRUNCATE (on a backup DB) | 5.1 |
| [04_dml_commands](Student-Information-System-MySQL/04_dml_commands) | SELECT, INSERT, UPDATE, DELETE | 5.2 |
| [05_sorting_and_aggregates](Student-Information-System-MySQL/05_sorting_and_aggregates) | ORDER BY, COUNT, SUM, AVG, MIN, MAX | 5.3 |
| [06_joins](Student-Information-System-MySQL/06_joins) | INNER, LEFT, RIGHT, FULL OUTER, CROSS | 5.4 |
| [07_group_by_having](Student-Information-System-MySQL/07_group_by_having) | GROUP BY and HAVING with joins | 5.5 |
| [08_subqueries](Student-Information-System-MySQL/08_subqueries) | Nested queries | 5.6 |
| [09_stored_procedures](Student-Information-System-MySQL/09_stored_procedures) | 6 stored procedures | 5.7 |
| [10_triggers](Student-Information-System-MySQL/10_triggers) | 6 triggers + audit table | 5.8 |
| [11_views](Student-Information-System-MySQL/11_views) | 10 view examples | 6 |
| [12_dcl_and_tcl](Student-Information-System-MySQL/12_dcl_and_tcl) | GRANT/REVOKE, COMMIT/ROLLBACK/SAVEPOINT | 7 |
| [docs](Student-Information-System-MySQL/docs) | Full project report (PDF) | n/a |

## 🗂️ Entities

Department · Student · Faculty · Course · Enrollment · Attendance · Examination · Marks · Fee · UserAccount
(plus a `Student_Audit` supporting table for the trigger demos)

## ▶️ How to Run

**Requirements:** MySQL 8.x (InnoDB) and the MySQL command-line client or MySQL Workbench.

**Run everything at once:**
```bash
cd Student-Information-System-MySQL
mysql -u root -p < run_all.sql
```

**Or run topic by topic**, in this order, because later scripts depend on earlier ones:
```sql
SOURCE 01_database_setup/01_create_database.sql;
SOURCE 02_tables_and_sample_data/01_create_tables.sql;
SOURCE 02_tables_and_sample_data/02_insert_sample_data.sql;
-- then any other folder, in numeric order
```

## ⚠️ Notes

- Statements that are meant to fail (invalid marks, deleting pending fees, CHECK OPTION violation, updating an aggregate view) are commented with `[ERROR DEMO]`. Uncomment them one at a time to see the error.
- `DROP TABLE` and `TRUNCATE` run on `StudentInformationSystem_Backup` so the main data stays safe.
- The DCL script needs a privileged MySQL account such as `root`.
- Password hashes are demo data only. No login interface is built.

## 👩‍💻 Team

| Roll No. | Name |
|---|---|
| 25WH1A6667 | A. Sreeja |
| 25WH1A6674 | G. Pranathi |
| 25WH1A6681 | M. Neharika |
| 25WH1A6688 | K. Thanusree |
| 25WH1A6695 | V. Srinija |
| 25WH1A66A2 | Y. Bhuvani |
| 25WH1A66B0 | B. Samanvi |
| 25WH1A66B7 | A. Sucharitha |
| 25WH1A66C4 | Vibha Manomai |
| 26WH5A6610 | D. Vyshnavi |

## 📄 License

MIT. See the [LICENSE](Student-Information-System-MySQL/LICENSE) file.
