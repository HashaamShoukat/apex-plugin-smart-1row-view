create or replace package smart1rowview_pkg authid definer as

    procedure render_region (
        p_region in            apex_plugin.t_region,
        p_plugin in            apex_plugin.t_plugin,
        p_param  in            apex_plugin.t_region_render_param,
        p_result in out nocopy apex_plugin.t_region_render_result );

    -- Region refresh: re-renders the card and returns it as HTML, so a Refresh
    -- dynamic action (or apex.region(id).refresh()) updates it in place.
    procedure ajax_region (
        p_region in            apex_plugin.t_region,
        p_plugin in            apex_plugin.t_plugin,
        p_param  in            apex_plugin.t_region_ajax_param,
        p_result in out nocopy apex_plugin.t_region_ajax_result );

    -- Resolves the opaque edit token back to the record key. The token is
    -- generated server side at render time and stored in a session collection,
    -- so the browser never sees or controls the key.
    function resolve_key ( p_token  in varchar2,
                           p_column in varchar2 ) return varchar2;

    -- The same, and also applies the column's Validation rules to the new
    -- value: raises ORA-20013 with a readable message when a rule is broken.
    function resolve_key ( p_token  in varchar2,
                           p_column in varchar2,
                           p_value  in varchar2 ) return varchar2;

end smart1rowview_pkg;
/
