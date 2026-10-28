-- Smart 1-Row View - database objects.
-- Run as the application's parsing schema:  @install.sql
--   SMART1ROWVIEW_PKG                       render, Ajax callback, resolve_key (always needed)
--   SMART_1ROW_PREFS, SMART_1ROW_PREFS_PKG  per-user layouts (only for Allow User Configuration)
-- Safe to run again.

set define off
set feedback on

prompt Creating table SMART_1ROW_PREFS ...
@@smart_1row_prefs_table.sql

prompt Creating SMART_1ROW_PREFS_PKG ...
@@smart_1row_prefs_pkg.sql

prompt Creating SMART1ROWVIEW_PKG ...
@@smart1rowview_pkg.pks
@@smart1rowview_pkg.pkb

show errors package body smart1rowview_pkg
show errors package body smart_1row_prefs_pkg

prompt Done.
