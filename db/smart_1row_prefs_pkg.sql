create or replace package smart_1row_prefs_pkg authid definer as

    subtype t_key  is varchar2(255);
    subtype t_list is varchar2(4000);

    -- Returns {"hidden":"COL_A,COL_B","order":"COL_C,COL_A"}
    function get_prefs ( p_app_id     in number,
                         p_page_id    in number,
                         p_region_key in t_key,
                         p_username   in varchar2 ) return clob;

    procedure save_prefs ( p_app_id     in number,
                           p_page_id    in number,
                           p_region_key in t_key,
                           p_username   in varchar2,
                           p_hidden     in t_list,
                           p_order      in t_list );

    procedure reset_prefs ( p_app_id     in number,
                            p_page_id    in number,
                            p_region_key in t_key,
                            p_username   in varchar2 );

end smart_1row_prefs_pkg;
/
create or replace package body smart_1row_prefs_pkg as

    ----------------------------------------------------------------------------
    -- Column lists only ever hold uppercase names separated by commas. Anything
    -- else is stripped before storage, so a hostile payload cannot survive a
    -- round trip back into the page.
    ----------------------------------------------------------------------------
    function scrub ( p_list in t_list ) return t_list
    is
    begin
        return regexp_replace( substr(p_list, 1, 4000), '[^A-Za-z0-9_,]', '' );
    end scrub;

    ----------------------------------------------------------------------------
    function require ( p_value in varchar2, p_name in varchar2 ) return varchar2
    is
    begin
        if p_value is null then
            raise_application_error(-20001, p_name || ' is required.');
        end if;
        return p_value;
    end require;

    ----------------------------------------------------------------------------
    function get_prefs ( p_app_id     in number,
                         p_page_id    in number,
                         p_region_key in t_key,
                         p_username   in varchar2 ) return clob
    is
        l_hidden t_list;
        l_order  t_list;
    begin
        select hidden_columns, column_order
          into l_hidden, l_order
          from smart_1row_prefs
         where app_id     = p_app_id
           and page_id    = p_page_id
           and region_key = p_region_key
           and username   = upper(p_username);

        apex_json.initialize_clob_output;
        apex_json.open_object;
        apex_json.write('hidden', l_hidden);
        apex_json.write('order',  l_order);
        apex_json.close_object;
        return apex_json.get_clob_output;

    exception
        when no_data_found then
            apex_json.initialize_clob_output;
            apex_json.open_object;
            apex_json.write('hidden', '');
            apex_json.write('order',  '');
            apex_json.close_object;
            return apex_json.get_clob_output;
    end get_prefs;

    ----------------------------------------------------------------------------
    procedure save_prefs ( p_app_id     in number,
                           p_page_id    in number,
                           p_region_key in t_key,
                           p_username   in varchar2,
                           p_hidden     in t_list,
                           p_order      in t_list )
    is
        l_user  varchar2(255) := upper(require(p_username,   'Username'));
        l_key   t_key         :=       require(p_region_key, 'Region key');
        l_hide  t_list        := scrub(p_hidden);
        l_order t_list        := scrub(p_order);
    begin
        if p_app_id is null or p_page_id is null then
            raise_application_error(-20002, 'Application and page id are required.');
        end if;

        update smart_1row_prefs
           set hidden_columns = l_hide,
               column_order   = l_order,
               updated_on     = systimestamp
         where app_id     = p_app_id
           and page_id    = p_page_id
           and region_key = l_key
           and username   = l_user;

        if sql%rowcount = 0 then
            insert into smart_1row_prefs
                   ( app_id, page_id, region_key, username,
                     hidden_columns, column_order )
            values ( p_app_id, p_page_id, l_key, l_user,
                     l_hide, l_order );
        end if;
    end save_prefs;

    ----------------------------------------------------------------------------
    procedure reset_prefs ( p_app_id     in number,
                            p_page_id    in number,
                            p_region_key in t_key,
                            p_username   in varchar2 )
    is
    begin
        delete from smart_1row_prefs
         where app_id     = p_app_id
           and page_id    = p_page_id
           and region_key = p_region_key
           and username   = upper(p_username);
    end reset_prefs;

end smart_1row_prefs_pkg;
/
