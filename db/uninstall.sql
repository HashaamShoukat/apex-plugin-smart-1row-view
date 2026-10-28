-- Smart 1-Row View - removes the database objects (and every saved user layout).
-- Remove the plug-in from your applications first.

declare
    procedure drop_it ( p_sql in varchar2 ) is
    begin
        execute immediate p_sql;
    exception
        when others then null;
    end drop_it;
begin
    drop_it('drop package smart1rowview_pkg');
    drop_it('drop package smart_1row_prefs_pkg');
    drop_it('drop table smart_1row_prefs purge');
end;
/
