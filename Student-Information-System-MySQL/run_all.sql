-- Runs the whole project in the correct order.
-- From the repo root, in the mysql client:   mysql -u root -p < run_all.sql
-- (or inside the client:                     SOURCE run_all.sql;)
SOURCE 01_database_setup/01_create_database.sql;
SOURCE 02_tables_and_sample_data/01_create_tables.sql;
SOURCE 02_tables_and_sample_data/02_insert_sample_data.sql;
SOURCE 03_ddl_commands/ddl_commands.sql;
SOURCE 04_dml_commands/dml_commands.sql;
SOURCE 05_sorting_and_aggregates/sorting_and_aggregates.sql;
SOURCE 06_joins/joins.sql;
SOURCE 07_group_by_having/group_by_having.sql;
SOURCE 08_subqueries/subqueries.sql;
SOURCE 09_stored_procedures/stored_procedures.sql;
SOURCE 10_triggers/triggers.sql;
SOURCE 11_views/views.sql;
SOURCE 12_dcl_and_tcl/dcl_grant_revoke.sql;
SOURCE 12_dcl_and_tcl/tcl_commit_rollback_savepoint.sql;
