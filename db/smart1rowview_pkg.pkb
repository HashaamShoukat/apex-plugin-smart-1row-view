create or replace package body smart1rowview_pkg as

type t_vc_by_name  is table of varchar2(32767) index by varchar2(255);
type t_num_by_name is table of pls_integer     index by varchar2(255);

g_raw  t_vc_by_name;
g_type t_num_by_name;

c_ctx_coll constant varchar2(30) := 'SMART_1ROW_CTX';

--------------------------------------------------------------------------------
-- CSS and JS now ship as plug-in files (css/detail-grid.css, js/detail-grid.js)



--------------------------------------------------------------------------------
function subst ( p_tmpl in varchar2, p_escape in boolean default true )
    return varchar2
is
    l_out varchar2(32767) := p_tmpl;
    l_key varchar2(255);
    l_val varchar2(32767);
begin
    if p_tmpl is null then
        return null;
    end if;
    l_key := g_raw.first;
    while l_key is not null loop
        l_val := case when p_escape then apex_escape.html(g_raw(l_key))
                      else g_raw(l_key) end;
        -- both syntaxes are accepted everywhere: #COLUMN# and &COLUMN.
        l_out := replace( l_out, '#'||l_key||'#',  l_val );
        l_out := replace( l_out, '&'||l_key||'.',  l_val );
        l_out := replace( l_out, '&'||l_key||'!RAW.', l_val );
        l_key := g_raw.next(l_key);
    end loop;
    return apex_plugin_util.replace_substitutions( p_value => l_out );
end subst;

--------------------------------------------------------------------------------
-- Resolve a setting that may be a literal, a #COLUMN# token, or a column name.
function ref ( p_spec in varchar2 ) return varchar2
is
    l_v varchar2(32767) := p_spec;
begin
    if p_spec is null then
        return null;
    end if;
    -- #COLUMN_NAME# or &COLUMN_NAME. tokens
    if instr(l_v,'#') > 0 or instr(l_v,'&') > 0 then
        l_v := subst(l_v, false);
    end if;
    -- a bare column name also works
    if g_raw.exists(upper(trim(l_v))) then
        return g_raw(upper(trim(l_v)));
    end if;
    return l_v;
end ref;

--------------------------------------------------------------------------------
-- Values written into style attributes must be plain CSS values, so nothing
-- (a ";", url(), expression(), a quote ...) can add rules or break the markup.
-- Anything else is dropped and the default applies.
--
-- css_colour: #hex, rgb()/rgba()/hsl()/hsla(), a colour name or var(--name).
function css_colour ( p_value in varchar2 ) return varchar2
is
    l_v varchar2(4000) := trim(substr(p_value, 1, 4000));
begin
    if l_v is null then
        return null;
    elsif regexp_like(l_v, '^#([0-9a-f]{3,4}|[0-9a-f]{6}|[0-9a-f]{8})$', 'i')
       or regexp_like(l_v, '^(rgba?|hsla?)\([0-9.,%/ +-]+\)$', 'i')
       or regexp_like(l_v, '^[a-z]{3,30}$', 'i')
       or regexp_like(l_v, '^var\(--[a-z0-9_-]{1,60}\)$', 'i') then
        return l_v;
    end if;
    apex_debug.warn('Smart 1-Row View: ignored colour value "%s"', substr(l_v, 1, 200));
    return null;
end css_colour;

-- css_length: a number with a unit (px, rem, em, %, ch, vw), or 0.
function css_length ( p_value in varchar2, p_default in varchar2 ) return varchar2
is
    l_v varchar2(100) := lower(trim(substr(p_value, 1, 100)));
begin
    if l_v is null then
        return p_default;
    elsif regexp_like(l_v, '^(0|[0-9]{1,4}(\.[0-9]{1,3})?(px|rem|em|%|ch|vw))$') then
        return l_v;
    end if;
    apex_debug.warn('Smart 1-Row View: ignored length value "%s"', l_v);
    return p_default;
end css_length;

-- A column colour setting: a literal, a #COLUMN# token or a column name.
function colour ( p_spec in varchar2 ) return varchar2
is
begin
    return css_colour(ref(p_spec));
end colour;




--------------------------------------------------------------------------------
-- APEX 26.1 keeps live plug-in attribute values in the .attributes collection.
-- The legacy attribute_NN record fields still exist but are not populated.
-- These helpers read the collection first and fall back to the record field.
--------------------------------------------------------------------------------
function ra ( p_region in apex_plugin.t_region, p_seq in pls_integer )
    return varchar2
is
    l_val varchar2(32767);
begin
    begin
        l_val := p_region.attributes.get_varchar2(
                     'attribute_' || to_char(p_seq,'FM09') );
    exception
        when others then l_val := null;
    end;

    if l_val is null then
        l_val := case p_seq
                     when  1 then p_region.attribute_01
                     when  2 then p_region.attribute_02
                     when  3 then p_region.attribute_03
                     when  4 then p_region.attribute_04
                     when  5 then p_region.attribute_05
                     when  6 then p_region.attribute_06
                     when  7 then p_region.attribute_07
                     when  8 then p_region.attribute_08
                     when  9 then p_region.attribute_09
                     when 10 then p_region.attribute_10
                 end;
    end if;

    return case when l_val = '' then null else l_val end;
end ra;

--------------------------------------------------------------------------------
function ca ( p_col in apex_plugin.t_region_column, p_seq in pls_integer )
    return varchar2
is
    l_val varchar2(32767);
begin
    begin
        l_val := p_col.attributes.get_varchar2(
                     'attribute_' || to_char(p_seq,'FM09') );
    exception
        when others then l_val := null;
    end;

    if l_val is null then
        l_val := case p_seq
                     when  1 then p_col.attribute_01  when  2 then p_col.attribute_02
                     when  3 then p_col.attribute_03  when  4 then p_col.attribute_04
                     when  5 then p_col.attribute_05  when  6 then p_col.attribute_06
                     when  7 then p_col.attribute_07  when  8 then p_col.attribute_08
                     when  9 then p_col.attribute_09  when 10 then p_col.attribute_10
                     when 11 then p_col.attribute_11  when 12 then p_col.attribute_12
                     when 13 then p_col.attribute_13  when 14 then p_col.attribute_14
                     when 15 then p_col.attribute_15  when 16 then p_col.attribute_16
                     when 17 then p_col.attribute_17  when 18 then p_col.attribute_18
                     when 19 then p_col.attribute_19  when 20 then p_col.attribute_20
                     when 21 then p_col.attribute_21  when 22 then p_col.attribute_22
                     when 23 then p_col.attribute_23  when 24 then p_col.attribute_24
                     when 25 then p_col.attribute_25
                 end;
    end if;

    return case when l_val = '' then null else l_val end;
end ca;

--------------------------------------------------------------------------------
-- Stream a CLOB to the page in safe chunks. sys.htp.p cannot take more than
-- 32767 characters, which is what truncated long select lists before.
procedure put_clob ( p_clob in clob )
is
    l_len  pls_integer;
    l_pos  pls_integer := 1;
    l_size constant pls_integer := 8000;
begin
    if p_clob is null then
        return;
    end if;
    l_len := dbms_lob.getlength(p_clob);
    while l_pos <= l_len loop
        sys.htp.prn( dbms_lob.substr(p_clob, l_size, l_pos) );
        l_pos := l_pos + l_size;
    end loop;
end put_clob;

--------------------------------------------------------------------------------
function resolve_key ( p_token  in varchar2,
                       p_column in varchar2 ) return varchar2
is
    l_key  varchar2(4000);
    l_cols varchar2(4000);
begin
    if p_token is null then
        raise_application_error(-20010,'No edit token supplied.');
    end if;

    select c003, c004
      into l_key, l_cols
      from apex_collections
     where collection_name = c_ctx_coll
       and c001 = p_token;

    if instr(','||upper(l_cols)||',', ','||upper(p_column)||',') = 0 then
        raise_application_error(-20012, p_column||' is not editable in this region.');
    end if;

    return l_key;
exception
    when no_data_found then
        raise_application_error(-20011,
            'This edit session has expired. Reload the page.');
end resolve_key;

--------------------------------------------------------------------------------
-- Validation rules of a column: "required; min=2000; max=2100; minlength=2;
-- maxlength=150; pattern=^[A-Z].*$; message=Custom text". pattern= and
-- message= run to the end of the text, so write them last. The browser applies
-- the same rules (detail-grid.js); this is the server-side check.
function check_value ( p_rules in varchar2,
                       p_label in varchar2,
                       p_type  in varchar2,
                       p_value in varchar2 ) return varchar2
is
    l_rules varchar2(4000) := p_rules;
    l_msg   varchar2(4000);
    l_pat   varchar2(4000);
    l_tok   varchar2(4000);
    l_key   varchar2(30);
    l_arg   varchar2(4000);
    l_num   number;
    l_err   varchar2(4000);
    l_label varchar2(4000) := nvl(p_label, 'Value');
begin
    if p_rules is null then
        return null;
    end if;
    if instr(lower(l_rules), 'message=') > 0 then
        l_msg   := trim(substr(l_rules, instr(lower(l_rules), 'message=') + 8));
        l_rules := substr(l_rules, 1, instr(lower(l_rules), 'message=') - 1);
    end if;
    if instr(lower(l_rules), 'pattern=') > 0 then
        l_pat   := rtrim(trim(substr(l_rules, instr(lower(l_rules), 'pattern=') + 8)), '; ');
        l_rules := substr(l_rules, 1, instr(lower(l_rules), 'pattern=') - 1);
    end if;

    for i in 1 .. regexp_count(l_rules, '[^;]+') loop
        l_tok := trim(regexp_substr(l_rules, '[^;]+', 1, i));
        l_key := lower(trim(regexp_substr(l_tok, '^[^=]+')));
        l_arg := trim(substr(l_tok, instr(l_tok, '=') + 1));
        l_err := null;
        if l_key = 'required' then
            if p_value is null then l_err := l_label || ' is required.'; end if;
        elsif p_value is null then
            null;
        elsif l_key in ('min', 'max') then
            l_num := to_number(p_value default null on conversion error);
            if l_num is null then
                l_err := l_label || ' must be a number.';
            elsif l_key = 'min' and l_num < to_number(l_arg default null on conversion error) then
                l_err := l_label || ' must be at least ' || l_arg || '.';
            elsif l_key = 'max' and l_num > to_number(l_arg default null on conversion error) then
                l_err := l_label || ' must be at most ' || l_arg || '.';
            end if;
        elsif l_key = 'minlength' and length(p_value) < to_number(l_arg default 0 on conversion error) then
            l_err := l_label || ' must be at least ' || l_arg || ' characters.';
        elsif l_key = 'maxlength' and length(p_value) > to_number(l_arg default 32767 on conversion error) then
            l_err := l_label || ' must be at most ' || l_arg || ' characters.';
        end if;
        if l_err is not null then
            return nvl(l_msg, l_err);
        end if;
    end loop;

    if l_pat is not null and p_value is not null and not regexp_like(p_value, l_pat) then
        return nvl(l_msg, l_label || ' is not in the expected format.');
    end if;
    return null;
end check_value;

--------------------------------------------------------------------------------
-- resolve_key plus the column's validation rules for the new value: raises
-- ORA-20013 with a readable message when the value breaks a rule.
function resolve_key ( p_token  in varchar2,
                       p_column in varchar2,
                       p_value  in varchar2 ) return varchar2
is
    l_key   varchar2(4000) := resolve_key(p_token, p_column);
    l_rules clob;
    l_vals  apex_json.t_values;
    l_col   varchar2(255) := upper(p_column);
    l_err   varchar2(4000);
begin
    select clob001 into l_rules
      from apex_collections
     where collection_name = c_ctx_coll
       and c001 = p_token;

    if l_rules is not null and dbms_lob.getlength(l_rules) > 2 then
        apex_json.parse(p_values => l_vals, p_source => l_rules);
        if apex_json.does_exist(p_path => l_col, p_values => l_vals) then
            l_err := check_value(
                         p_rules => apex_json.get_varchar2(p_path => l_col || '.r', p_values => l_vals),
                         p_label => apex_json.get_varchar2(p_path => l_col || '.l', p_values => l_vals),
                         p_type  => apex_json.get_varchar2(p_path => l_col || '.t', p_values => l_vals),
                         p_value => p_value);
            if l_err is not null then
                raise_application_error(-20013, l_err);
            end if;
        end if;
    end if;
    return l_key;
end resolve_key;

--------------------------------------------------------------------------------
-- Rewrites #COLUMN#, &COLUMN. and &COLUMN!RAW. tokens in a developer query into
-- bind variables (:DG1, :DG2 ...) carrying the record's values, so a value can
-- never become SQL text. Numbers and dates bind with their own type.
--   - a token inside a string literal becomes '||:DGn||', so '%#NAME#%' keeps
--     working as a LIKE pattern
--   - &NAME. that is not a column becomes :NAME, bound from session state
--   - comments are copied untouched; q'[...]' literals are not recognised
function bind_sql ( p_sql    in            varchar2,
                    p_params in out nocopy apex_exec.t_parameters )
    return varchar2
is
    c_amp_tok constant varchar2(60) := '&([A-Za-z0-9_$]+)(![A-Za-z]+)?\.';
    l_out    varchar2(32767);
    l_len    pls_integer := nvl(length(p_sql), 0);
    l_i      pls_integer := 1;
    l_ch     varchar2(1 char);
    l_in_lit boolean := false;
    l_end    pls_integer;
    l_name   varchar2(255);
    l_tok    varchar2(300);
    l_seq    pls_integer := 0;
    l_bound  t_num_by_name;          -- column -> bind number, one bind per column

    function bind_for ( p_col in varchar2 ) return varchar2 is
        l_bind varchar2(30);
    begin
        if not l_bound.exists(p_col) then
            l_seq := l_seq + 1;
            l_bound(p_col) := l_seq;
            l_bind := 'DG'||l_seq;
            if g_raw(p_col) is not null
               and g_type(p_col) = apex_exec.c_data_type_number then
                apex_exec.add_parameter(p_params, l_bind, to_number(g_raw(p_col)));
            elsif g_raw(p_col) is not null
               and g_type(p_col) in ( apex_exec.c_data_type_date,
                                      apex_exec.c_data_type_timestamp,
                                      apex_exec.c_data_type_timestamp_tz ) then
                apex_exec.add_parameter(p_params, l_bind,
                                        to_date(g_raw(p_col),'YYYY-MM-DD HH24:MI:SS'));
            else
                apex_exec.add_parameter(p_params, l_bind, g_raw(p_col));
            end if;
        end if;
        return ':DG'||l_bound(p_col);
    end bind_for;

    procedure put_bind ( p_bind in varchar2 ) is
    begin
        l_out := l_out || case when l_in_lit
                               then '''||' || p_bind || '||'''
                               else p_bind end;
    end put_bind;

    procedure copy_to ( p_pos in pls_integer ) is    -- copy through p_pos
    begin
        l_out := l_out || substr(p_sql, l_i, p_pos - l_i + 1);
        l_i   := p_pos + 1;
    end copy_to;
begin
    while l_i <= l_len loop
        l_ch := substr(p_sql, l_i, 1);

        if l_ch = '''' then
            l_in_lit := not l_in_lit;          -- '' inside a literal flips twice
            copy_to(l_i);

        elsif not l_in_lit and substr(p_sql, l_i, 2) = '--' then
            l_end := instr(p_sql, chr(10), l_i);
            copy_to(case when l_end = 0 then l_len else l_end end);

        elsif not l_in_lit and substr(p_sql, l_i, 2) = '/*' then
            l_end := instr(p_sql, '*/', l_i + 2);
            copy_to(case when l_end = 0 then l_len else l_end + 1 end);

        elsif l_ch = '#' then
            l_end  := instr(p_sql, '#', l_i + 1);
            l_name := case when l_end > l_i + 1
                           then upper(substr(p_sql, l_i + 1, l_end - l_i - 1)) end;
            if l_name is not null and g_raw.exists(l_name) then
                put_bind(bind_for(l_name));
                l_i := l_end + 1;
            else
                copy_to(l_i);
            end if;

        elsif l_ch = '&'
              and regexp_instr(p_sql, c_amp_tok, l_i, 1, 0, 'i') = l_i then
            l_tok  := regexp_substr(p_sql, c_amp_tok, l_i, 1, 'i');
            l_name := upper(regexp_substr(l_tok, c_amp_tok, 1, 1, 'i', 1));
            put_bind(case when g_raw.exists(l_name) then bind_for(l_name)
                          else ':'||l_name end);
            l_i := l_i + length(l_tok);

        else
            copy_to(l_i);
        end if;
    end loop;

    return l_out;
end bind_sql;

--------------------------------------------------------------------------------
-- Build <option> markup from an LOV query returning display, return.
function lov_options ( p_sql     in varchar2,
                       p_current in varchar2,
                       p_max     in pls_integer default 100000 )
    return clob
is
    l_params apex_exec.t_parameters;
    l_sql    varchar2(32767);
    l_ctx  apex_exec.t_context;
    l_out  clob;
    l_buf  varchar2(32767);
    l_d    varchar2(4000);
    l_r    varchar2(4000);
    l_n    pls_integer := 0;

    procedure put ( p_txt in varchar2 ) is
    begin
        if lengthb(l_buf) + lengthb(p_txt) > 30000 then
            dbms_lob.writeappend(l_out, length(l_buf), l_buf);
            l_buf := null;
        end if;
        l_buf := l_buf || p_txt;
    end put;
begin
    dbms_lob.createtemporary(l_out, true);

    -- empty entry so a value can be cleared
    put('<option value=""'
        || case when p_current is null then ' selected' end
        ||'>&nbsp;</option>');

    if p_sql is null then
        put('<option value="'||apex_escape.html_attribute(p_current)||'" selected>'
            || apex_escape.html(p_current) ||'</option>');
    else
        -- record values travel as bind variables, never as SQL text
        -- (rewritten first: argument evaluation order is not guaranteed)
        l_sql := bind_sql(p_sql, l_params);
        l_ctx := apex_exec.open_query_context(
                     p_location       => apex_exec.c_location_local_db,
                     p_sql_query      => l_sql,
                     p_sql_parameters => l_params,
                     p_max_rows       => p_max );

        while apex_exec.next_row(l_ctx) loop
            l_d := apex_exec.get_varchar2(l_ctx, 1);
            l_r := case when apex_exec.get_column_count(l_ctx) > 1
                        then apex_exec.get_varchar2(l_ctx, 2)
                        else l_d end;
            put('<option value="'||apex_escape.html_attribute(l_r)||'"'
                || case when l_r = p_current then ' selected' end
                ||'>'|| apex_escape.html(l_d) ||'</option>');
            l_n := l_n + 1;
        end loop;
        apex_exec.close(l_ctx);

        -- keep the current value selectable even if it fell outside the cap
        if p_current is not null and l_n >= p_max then
            put('<option value="'||apex_escape.html_attribute(p_current)||'" selected>'
                || apex_escape.html(p_current) ||'</option>');
        end if;
    end if;

    if l_buf is not null then
        dbms_lob.writeappend(l_out, length(l_buf), l_buf);
    end if;
    return l_out;
exception
    when others then
        apex_debug.error('Smart 1-Row View list query failed: %s', sqlerrm);
        begin apex_exec.close(l_ctx); exception when others then null; end;
        l_buf := l_buf || '<option value="" disabled>-- list query failed --</option>';
        dbms_lob.writeappend(l_out, length(l_buf), l_buf);
        return l_out;
end lov_options;

--------------------------------------------------------------------------------
-- The display value of a return value, through an LOV query (display, return).
function lov_display ( p_sql in varchar2, p_value in varchar2 ) return varchar2
is
    l_params apex_exec.t_parameters;
    l_sql    varchar2(32767);
    l_ctx    apex_exec.t_context;
    l_two    boolean;
    l_d      varchar2(4000);
begin
    if p_sql is null or p_value is null then
        return null;
    end if;
    l_sql := bind_sql(p_sql, l_params);
    l_ctx := apex_exec.open_query_context(
                 p_location       => apex_exec.c_location_local_db,
                 p_sql_query      => l_sql,
                 p_sql_parameters => l_params,
                 p_max_rows       => 100000 );
    l_two := apex_exec.get_column_count(l_ctx) > 1;
    while apex_exec.next_row(l_ctx) loop
        if apex_exec.get_varchar2(l_ctx, case when l_two then 2 else 1 end) = p_value then
            l_d := apex_exec.get_varchar2(l_ctx, 1);
            exit;
        end if;
    end loop;
    apex_exec.close(l_ctx);
    return l_d;
exception
    when others then
        begin apex_exec.close(l_ctx); exception when others then null; end;
        return null;
end lov_display;

--------------------------------------------------------------------------------
-- "3 days ago", "in 2 hours", "just now"
function rel_time ( p_date in date ) return varchar2
is
    l_d   number;
    l_abs number;
    l_txt varchar2(100);
begin
    if p_date is null then
        return null;
    end if;
    -- a date without a time part counts in days: today, tomorrow, in 3 days
    if p_date = trunc(p_date) then
        l_d := trunc(p_date) - trunc(cast(localtimestamp as date));
        if abs(l_d) < 30 then
            return case
                       when l_d = 0  then 'today'
                       when l_d = 1  then 'tomorrow'
                       when l_d = -1 then 'yesterday'
                       when l_d > 0  then 'in ' || l_d || ' days'
                       else               abs(l_d) || ' days ago'
                   end;
        end if;
    end if;
    l_d   := cast(localtimestamp as date) - p_date;
    l_abs := abs(l_d);
    if l_abs < 1/1440 then
        return 'just now';
    end if;
    l_txt := case
        when l_abs < 1/24 then round(l_abs*1440) || ' min'
        when l_abs < 1    then round(l_abs*24) || ' hour'
                               || case when round(l_abs*24) != 1 then 's' end
        when l_abs < 30   then round(l_abs) || ' day'
                               || case when round(l_abs) != 1 then 's' end
        when l_abs < 365  then round(l_abs/30) || ' month'
                               || case when round(l_abs/30) != 1 then 's' end
        else round(l_abs/365, 1) || ' years'
    end;
    return case when l_d >= 0 then l_txt || ' ago' else 'in ' || l_txt end;
end rel_time;

--------------------------------------------------------------------------------
-- 950, 42.5K, 1.2M, 3.4B
function compact_num ( p_n in number ) return varchar2
is
    l_a number := abs(p_n);
    function one ( p in number ) return varchar2 is
    begin
        return regexp_replace(to_char(round(p, 1), 'FM999G990D0'), '[.,]0$');
    end one;
begin
    return case
        when l_a >= 1e9 then one(p_n / 1e9) || 'B'
        when l_a >= 1e6 then one(p_n / 1e6) || 'M'
        when l_a >= 1e3 then one(p_n / 1e3) || 'K'
        else one(p_n)
    end;
end compact_num;

--------------------------------------------------------------------------------
-- Display text of a value. The column Format Mask wins (an Oracle mask, or one
-- of the keywords COMPACT, PERCENT, CURRENCY[:code or #COLUMN#], SINCE);
-- otherwise whole numbers show without decimals and dates without a time part
-- without "12:00AM".
function fmt_value ( p_nm in varchar2, p_mask in varchar2 ) return varchar2
is
    l_raw  varchar2(32767);
    l_mask varchar2(4000) := trim(p_mask);
    l_up   varchar2(4000) := upper(trim(p_mask));
    l_n    number;
    l_d    date;
begin
    if not g_raw.exists(p_nm) or g_raw(p_nm) is null then
        return null;
    end if;
    l_raw := g_raw(p_nm);

    if g_type(p_nm) = apex_exec.c_data_type_number then
        l_n := to_number(l_raw);
        if l_up = 'COMPACT' then
            return compact_num(l_n);
        elsif l_up = 'PERCENT' then
            return regexp_replace(to_char(round(l_n, 1), 'FM999G990D0'), '[.,]0$') || '%';
        elsif l_up like 'CURRENCY%' then
            return trim(ref(substr(l_mask, 10)) || ' ' || to_char(l_n, 'FM999G999G999G990D00'));
        elsif l_mask is not null then
            return to_char(l_n, l_mask);
        elsif l_n = trunc(l_n) then
            return to_char(l_n, 'FM999G999G999G999G990');
        else
            return to_char(l_n, 'FM999G999G999G990D00');
        end if;

    elsif g_type(p_nm) in ( apex_exec.c_data_type_date,
                            apex_exec.c_data_type_timestamp,
                            apex_exec.c_data_type_timestamp_tz ) then
        l_d := to_date(l_raw, 'YYYY-MM-DD HH24:MI:SS');
        if l_up = 'SINCE' then
            return rel_time(l_d);
        elsif l_mask is not null then
            return to_char(l_d, l_mask);
        elsif l_d = trunc(l_d) then
            return to_char(l_d, 'DD-MON-YYYY');
        else
            return to_char(l_d, 'DD-MON-YYYY HH12:MIAM');
        end if;
    end if;

    return l_raw;
exception
    when others then           -- a bad mask shows the plain value
        return l_raw;
end fmt_value;

--------------------------------------------------------------------------------
-- Colour Rules: "Draft=grey; Approved=green; >40000=red; *=blue" - the first
-- matching rule wins. A test is a literal (any case, raw or shown value),
-- * for anything, or >, >=, <, <=, != with a number. A colour is a preset
-- (grey, blue, green, amber, red, purple, teal) or CSS colours "fg" / "fg/bg".
procedure rule_colour ( p_rules in  varchar2,
                        p_raw   in  varchar2,
                        p_shown in  varchar2,
                        x_fg    out varchar2,
                        x_bg    out varchar2 )
is
    l_rule varchar2(4000);
    l_cond varchar2(4000);
    l_col  varchar2(4000);
    l_op   varchar2(2);
    l_num  number;
    l_val  number := to_number(p_raw default null on conversion error);
    l_hit  boolean;
    c_sep  constant varchar2(10) := '[^;' || chr(10) || ']+';
begin
    x_fg := null;
    x_bg := null;
    if p_rules is null then
        return;
    end if;
    for i in 1 .. regexp_count(p_rules, c_sep) loop
        l_rule := trim(regexp_substr(p_rules, c_sep, 1, i));
        continue when l_rule is null or instr(l_rule, '=', -1) < 2;
        l_cond := trim(substr(l_rule, 1, instr(l_rule, '=', -1) - 1));
        l_col  := lower(trim(substr(l_rule, instr(l_rule, '=', -1) + 1)));
        l_op   := regexp_substr(l_cond, '^(>=|<=|!=|>|<)');
        if l_cond = '*' then
            l_hit := true;
        elsif l_op is not null then
            l_num := to_number(trim(substr(l_cond, length(l_op) + 1)) default null on conversion error);
            if l_val is null or l_num is null then
                l_hit := false;
            elsif l_op = '>'  then l_hit := l_val >  l_num;
            elsif l_op = '>=' then l_hit := l_val >= l_num;
            elsif l_op = '<'  then l_hit := l_val <  l_num;
            elsif l_op = '<=' then l_hit := l_val <= l_num;
            else                   l_hit := l_val != l_num;
            end if;
        else
            l_hit := upper(l_cond) = upper(p_raw) or upper(l_cond) = upper(p_shown);
        end if;

        if nvl(l_hit, false) then
            case l_col
                when 'grey'   then x_fg := '#4B5563'; x_bg := '#F3F4F6';
                when 'gray'   then x_fg := '#4B5563'; x_bg := '#F3F4F6';
                when 'blue'   then x_fg := '#1D4ED8'; x_bg := '#DBEAFE';
                when 'green'  then x_fg := '#047857'; x_bg := '#D1FAE5';
                when 'amber'  then x_fg := '#B45309'; x_bg := '#FEF3C7';
                when 'red'    then x_fg := '#B91C1C'; x_bg := '#FEE2E2';
                when 'purple' then x_fg := '#6D28D9'; x_bg := '#EDE9FE';
                when 'teal'   then x_fg := '#0F766E'; x_bg := '#CCFBF1';
                else
                    x_fg := css_colour(regexp_substr(l_col, '[^/]+', 1, 1));
                    x_bg := css_colour(regexp_substr(l_col, '[^/]+', 1, 2));
            end case;
            return;
        end if;
    end loop;
end rule_colour;

--------------------------------------------------------------------------------
-- A Link Builder target (same as a report column link): #COLUMN# tokens get
-- the record's values (URL encoded), &ITEM. substitutions are applied, and
-- apex_util.prepare_url adds the checksum - for a modal page it returns the
-- javascript:apex.navigation.dialog(...) call, exactly like native links.
function link_url ( p_link in varchar2 ) return varchar2
is
    l_url varchar2(32767) := p_link;
    l_key varchar2(255);
begin
    if p_link is null then
        return null;
    end if;
    l_key := g_raw.first;
    while l_key is not null loop
        l_url := replace(l_url, '#'||l_key||'#', apex_util.url_encode(g_raw(l_key)));
        l_key := g_raw.next(l_key);
    end loop;
    l_url := apex_plugin_util.replace_substitutions(p_value => l_url, p_escape => false);
    return apex_util.prepare_url(p_url => l_url);
end link_url;

--------------------------------------------------------------------------------
-- Runs the region query for one row into g_raw / g_type.
function load_record ( p_region in apex_plugin.t_region ) return boolean
is
    l_ctx  apex_exec.t_context;
    l_col  apex_exec.t_column;
    l_nm   varchar2(255);
    l_cols pls_integer;
    l_ok   boolean;
begin
    g_raw.delete;
    g_type.delete;
    l_ctx := apex_region.open_query_context(
                 p_page_id   => v('APP_PAGE_ID'),
                 p_region_id => p_region.id,
                 p_max_rows  => 1 );
    l_cols := apex_exec.get_column_count(l_ctx);
    for j in 1 .. l_cols loop
        l_col := apex_exec.get_column(l_ctx, j);
        g_type( upper(l_col.name) ) := l_col.data_type;
    end loop;
    l_ok := apex_exec.next_row(l_ctx);
    if l_ok then
        for j in 1 .. l_cols loop
            l_col := apex_exec.get_column(l_ctx, j);
            l_nm  := upper(l_col.name);
            g_raw(l_nm) :=
                case l_col.data_type
                    when apex_exec.c_data_type_number
                        then to_char(apex_exec.get_number(l_ctx,j))
                    when apex_exec.c_data_type_date
                        then to_char(apex_exec.get_date(l_ctx,j),'YYYY-MM-DD HH24:MI:SS')
                    when apex_exec.c_data_type_timestamp
                        then to_char(apex_exec.get_timestamp(l_ctx,j),'YYYY-MM-DD HH24:MI:SS')
                    when apex_exec.c_data_type_timestamp_tz
                        then to_char(apex_exec.get_timestamp_tz(l_ctx,j),'YYYY-MM-DD HH24:MI:SS')
                    when apex_exec.c_data_type_clob
                        then dbms_lob.substr(apex_exec.get_clob(l_ctx,j),32000,1)
                    else apex_exec.get_varchar2(l_ctx,j)
                end;
        end loop;
    end if;
    apex_exec.close(l_ctx);
    return l_ok;
exception
    when others then
        begin apex_exec.close(l_ctx); exception when others then null; end;
        raise;
end load_record;



--------------------------------------------------------------------------------
-- Renders an icon, made clickable when a message is supplied.
function icon_html ( p_class in varchar2, p_message in varchar2 )
    return varchar2
is
begin
    if p_message is null then
        return '<span class="dg-ico '
               || apex_escape.html_attribute(p_class)
               || '" aria-hidden="true"></span>';
    end if;
    return '<button type="button" class="dg-ico is-clickable '
           || apex_escape.html_attribute(p_class)
           || '" data-dg-alert="'
           || apex_escape.html_attribute(p_message)
           || '" aria-label="More information"></button>';
end icon_html;

--------------------------------------------------------------------------------
-- Writes the card (toolbar + grid). Shared by page render and region refresh.
procedure emit_card ( p_region in apex_plugin.t_region )
is
    c_pairs     constant pls_integer   := to_number(nvl(ra(p_region,1),'2'));
    c_label_w    constant varchar2(100) := css_length(ra(p_region,2),'160px');
    c_density    constant varchar2(30)  := nvl(ra(p_region,3),'cozy');
    c_frame      constant varchar2(30)  := nvl(ra(p_region,4),'card');
    c_stack      constant boolean       := nvl(ra(p_region,5),'Y') = 'Y';
    c_debug      constant boolean       := nvl(ra(p_region,6),'N') = 'Y';
    c_copy_icon  constant varchar2(255) := nvl(ra(p_region,7),'fa fa-copy');
    c_edit_expr  constant varchar2(4000):= ra(p_region,8);
    c_border_col constant varchar2(4000):= css_colour(ra(p_region,9));
    c_lbl_bg     constant varchar2(4000):= css_colour(ra(p_region,10));
    c_lbl_fg     constant varchar2(4000):= css_colour(ra(p_region,11));
    c_val_fg     constant varchar2(4000):= css_colour(ra(p_region,12));
    c_radius     constant varchar2(100) := css_length(ra(p_region,13), null);
    c_bstyle     constant varchar2(30)  := case when lower(ra(p_region,14))
                                                     in ('solid','dashed','dotted','none')
                                                then lower(ra(p_region,14)) end;
    c_config     constant boolean       := nvl(ra(p_region,15),'N') = 'Y';
    c_prefs_proc constant varchar2(255) := nvl(ra(p_region,16),'SMART_1ROW_PREFS');
    c_key_col    constant varchar2(128) := upper(ra(p_region,17));
    -- sections listed here start collapsed (comma separated, any case)
    c_coll_secs  constant varchar2(4000):= ','||upper(regexp_replace(trim(ra(p_region,18)),
                                                     '\s*,\s*', ','))||',';
    c_label_case constant varchar2(30)  := case when lower(ra(p_region,19)) = 'smallcaps'
                                                then 'upper' else 'asis' end;
    c_zebra      constant boolean       := nvl(ra(p_region,20),'N') = 'Y';
    c_accent     constant varchar2(4000):= css_colour(ra(p_region,21));
    c_editall    constant boolean       := nvl(ra(p_region,22),'N') = 'Y';
    c_ver_col    constant varchar2(128) := upper(trim(ra(p_region,23)));
    c_null_text  constant varchar2(100) := '&mdash;';
    c_date_fmt   constant varchar2(100) := 'DD-MON-YYYY HH12:MIAM';
    c_num_fmt    constant varchar2(100) := 'FM999G999G999G990D00';
    c_no_data    constant varchar2(4000):= nvl(p_region.no_data_found_message,
                                               'No record found.');

    l_ctx      apex_exec.t_context;
    l_col      apex_exec.t_column;
    l_cols     pls_integer;

    l_slot     pls_integer := 0;
    l_emitted  pls_integer := 0;
    l_gap      pls_integer;
    l_span     pls_integer;
    l_target   pls_integer;
    l_value    varchar2(32767);
    l_inner    varchar2(32767);
    l_classes  varchar2(1000);
    l_style    varchar2(4000);
    l_pos      varchar2(200);
    l_fg       varchar2(200);
    l_bg       varchar2(200);
    l_tip      varchar2(4000);
    l_ico_l    varchar2(255);
    l_ico_r    varchar2(255);
    l_icmsg    varchar2(32767);
    l_token    varchar2(64);
    l_editcols varchar2(4000);
    l_prefs    clob;
    l_pref_hide  varchar2(4000) := ',,';
    l_pref_order varchar2(4000);
    l_order    apex_t_number := apex_t_number();
    l_seen     t_num_by_name;
    l_editcall varchar2(4000);
    l_mask     varchar2(200);
    l_pct      number;
    l_editor   varchar2(32767);
    l_optclob  clob;
    l_pre      varchar2(32767);
    l_post     varchar2(4000);
    l_editable boolean;
    l_swoff    varchar2(255);
    l_swtxt    varchar2(255);
    l_swlbl    varchar2(255);
    l_swval    varchar2(255);
    l_lovsql   varchar2(32767);
    l_dbg      varchar2(32767);
    l_label    varchar2(4000);
    l_nm       varchar2(255);
    -- render list: 'C'||column index, or 'S'||section name for a section header
    l_final    apex_t_varchar2 := apex_t_varchar2();
    l_secs     t_num_by_name;            -- section (upper) -> displayed field count
    l_sec      varchar2(255);
    l_coll     boolean;
    l_auto     boolean;                  -- the browser lays the grid out
    l_side     varchar2(4000);
    l_end      varchar2(32767);          -- right-aligned slot: side badge + actions
    l_rules    clob;                     -- validation rules stored with the token
    l_secsum   t_vc_by_name;             -- section (upper) -> collapsed summary
    l_lovd     varchar2(4000);
    l_rfg      varchar2(200);            -- colour from Colour Rules
    l_rbg      varchar2(200);
    l_url      varchar2(32767);
    l_parents  varchar2(4000);
    l_tk       varchar2(255);
begin
    ----------------------------------------------------------------------------
    -- Fetch through the region's data source. A failing query is not retried
    -- another way: the caller shows the error inside the region.
    ----------------------------------------------------------------------------
    if not load_record(p_region) then
        sys.htp.p('<div class="dg dg--card"><div class="dg-empty">'
                  || apex_escape.html(c_no_data) || '</div></div>');
        return;
    end if;
    l_cols := g_type.count;

    ----------------------------------------------------------------------------
    -- Edit context: the record key is held server side against a random token.
    -- The browser only ever sees the token, so it cannot retarget the update.
    ----------------------------------------------------------------------------
    if c_edit_expr is not null then
        -- Used exactly as written: substituting &ITEM. values into JavaScript
        -- would let a value run as code. Read values through ctx / newValue,
        -- or apex.item("P1_X").getValue() inside the handler.
        l_editcall := c_edit_expr;
        if regexp_like(c_edit_expr, '&[A-Za-z0-9_$]+(![A-Za-z]+)?\.') then
            apex_debug.warn('Smart 1-Row View region "%s": Edit Handler Call contains '
                ||'a &ITEM. substitution, which is not replaced. Use apex.item() instead.',
                p_region.name);
        end if;

        -- which columns this region allows editing for THIS record: Editable
        -- When (#CAN_EDIT#) is applied here too, so the token never permits a
        -- save the card itself does not offer
        for c in 1 .. p_region.region_columns.count loop
            if lower(nvl(ca(p_region.region_columns(c),18),'no')) != 'no'
               and ( ca(p_region.region_columns(c),21) is null
                     or upper(nvl(ref(ca(p_region.region_columns(c),21)),'N'))
                            in ('Y','YES','1','TRUE') ) then
                l_editcols := l_editcols
                    || case when l_editcols is not null then ',' end
                    || upper(p_region.region_columns(c).name);
            end if;
        end loop;

        if c_key_col is not null and g_raw.exists(c_key_col) then
            l_token := lower(rawtohex(sys_guid()));

            if not apex_collection.collection_exists(c_ctx_coll) then
                apex_collection.create_collection(c_ctx_coll);
            end if;

            -- keep the newest contexts of this region only, but more than one:
            -- the same page open in several tabs (other records) must still
            -- save, and every refresh issues a new token
            for m in ( select seq_id
                         from ( select seq_id,
                                       row_number() over (order by seq_id desc) rn
                                  from apex_collections
                                 where collection_name = c_ctx_coll
                                   and c002 = to_char(p_region.id) )
                        where rn >= 20 ) loop
                apex_collection.delete_member(c_ctx_coll, m.seq_id);
            end loop;

            -- validation rules travel with the token, so the server can apply
            -- them to whatever value arrives (resolve_key with p_value)
            apex_json.initialize_clob_output;
            apex_json.open_object;
            for c in 1 .. p_region.region_columns.count loop
                if lower(nvl(ca(p_region.region_columns(c),18),'no')) != 'no'
                   and trim(ca(p_region.region_columns(c),27)) is not null then
                    apex_json.open_object(upper(p_region.region_columns(c).name));
                    apex_json.write('r', trim(ca(p_region.region_columns(c),27)));
                    apex_json.write('l', nvl(p_region.region_columns(c).heading,
                                             initcap(replace(p_region.region_columns(c).name,'_',' '))));
                    apex_json.write('t', lower(ca(p_region.region_columns(c),18)));
                    apex_json.close_object;
                end if;
            end loop;
            apex_json.close_object;
            l_rules := apex_json.get_clob_output;
            apex_json.free_output;

            apex_collection.add_member(
                p_collection_name => c_ctx_coll,
                p_c001            => l_token,
                p_c002            => to_char(p_region.id),
                p_c003            => g_raw(c_key_col),
                p_c004            => l_editcols,
                p_clob001         => l_rules );
        end if;
    end if;

    ----------------------------------------------------------------------------
    -- Debug: show exactly what the plug-in received
    ----------------------------------------------------------------------------
    if c_debug then
        l_dbg := 'edit call        = ' || nvl(l_editcall,'<not set>') || chr(10)
              || 'region_columns.count = ' || p_region.region_columns.count
              || chr(10) || 'query columns    = ' || l_cols
              || chr(10) || 'layout pairs     = ' || c_pairs || chr(10);
        for d in 1 .. p_region.region_columns.count loop
            l_dbg := l_dbg || chr(10)
                  || p_region.region_columns(d).name
                  || '  displayed=' || case when p_region.region_columns(d).is_displayed
                                            then 'Y' else 'N' end
                  || '  heading='   || nvl(p_region.region_columns(d).heading,'<null>')
                  || '  align='     || nvl(p_region.region_columns(d).value_alignment,'<null>')
                  || chr(10) || '    a01=' || nvl(ca(p_region.region_columns(d),1),'.')
                  || ' a02=' || nvl(ca(p_region.region_columns(d),2),'.')
                  || ' a03=' || nvl(ca(p_region.region_columns(d),3),'.')
                  || ' a04=' || nvl(ca(p_region.region_columns(d),4),'.')
                  || ' a05=' || nvl(ca(p_region.region_columns(d),5),'.')
                  || ' a06=' || nvl(ca(p_region.region_columns(d),6),'.')
                  || ' a08=' || nvl(ca(p_region.region_columns(d),8),'.')
                  || ' a13=' || nvl(ca(p_region.region_columns(d),13),'.')
                  || ' a14=' || nvl(ca(p_region.region_columns(d),14),'.');
        end loop;
        sys.htp.p('<pre class="dg-debug">'||apex_escape.html(l_dbg)||'</pre>');
    end if;

    ----------------------------------------------------------------------------
    -- Apply the saved layout before anything is written, so the first paint is
    -- already correct. Called dynamically: the preferences package is optional.
    ----------------------------------------------------------------------------
    if c_config then
        begin
            execute immediate
                'begin :1 := smart_1row_prefs_pkg.get_prefs(:2,:3,:4,:5); end;'
                using out l_prefs,
                      in  to_number(v('APP_ID')),
                      in  to_number(v('APP_PAGE_ID')),
                      in  nvl(p_region.static_id,'RC')||'_'||p_region.id,
                      in  v('APP_USER');

            apex_json.parse(l_prefs);
            l_pref_hide  := ','||upper(apex_json.get_varchar2('hidden'))||',';
            l_pref_order := upper(apex_json.get_varchar2('order'));
        exception
            when others then
                l_pref_hide  := ',,';
                l_pref_order := null;
        end;
    end if;

    -- card actions, moved by the browser into the last visible row
    if c_config or (c_editall and l_token is not null) then
        sys.htp.p('<div class="dg-toolbar">'
            || case when c_editall and l_token is not null then
                   '<button type="button" class="dg-cardact dg-editall" title="Edit all fields"'
                 ||' aria-label="Edit all fields"><span class="fa fa-edit" aria-hidden="true"></span></button>'
               end
            || case when c_config then
                   '<button type="button" class="dg-cardact dg-cfgbtn" title="Configure layout"'
                 ||' data-dg-region="'||apex_escape.html_attribute(p_region.static_id)||'"'
                 ||' data-dg-proc="'||apex_escape.html_attribute(c_prefs_proc)||'"'
                 ||' data-dg-key="'||apex_escape.html_attribute(
                         nvl(p_region.static_id,'RC')||'_'||p_region.id)||'">'
                 ||'<span class="fa fa-gear" aria-hidden="true"></span>'
                 ||'<span class="dg-cfgtext">Configure layout</span></button>'
               end
            ||'</div>');
    end if;

    -- render sequence: saved order first, then any column the user has not seen
    if l_pref_order is not null then
        for j in 1 .. regexp_count(l_pref_order,'[^,]+') loop
            l_nm := trim(regexp_substr(l_pref_order,'[^,]+',1,j));
            for k in 1 .. p_region.region_columns.count loop
                if upper(p_region.region_columns(k).name) = l_nm
                   and not l_seen.exists(l_nm) then
                    l_order.extend; l_order(l_order.count) := k;
                    l_seen(l_nm) := 1;
                end if;
            end loop;
        end loop;
    end if;
    for k in 1 .. p_region.region_columns.count loop
        if not l_seen.exists(upper(p_region.region_columns(k).name)) then
            l_order.extend; l_order(l_order.count) := k;
        end if;
    end loop;

    ----------------------------------------------------------------------------
    -- Sections: fields without a section come first, in their order; then each
    -- section (in order of its first field) with all its fields under one
    -- header - so nothing after a section looks like part of it.
    ----------------------------------------------------------------------------
    for oi in 1 .. l_order.count loop
        if trim(ca(p_region.region_columns(l_order(oi)), 24)) is null then
            l_final.extend; l_final(l_final.count) := 'C'||l_order(oi);
        end if;
    end loop;
    for oi in 1 .. l_order.count loop
        l_sec := trim(ca(p_region.region_columns(l_order(oi)), 24));
        if l_sec is null then
            null;
        elsif not l_secs.exists(upper(l_sec)) then
            l_secs(upper(l_sec)) := 0;
            for oj in oi .. l_order.count loop
                if upper(trim(ca(p_region.region_columns(l_order(oj)), 24))) = upper(l_sec)
                   and p_region.region_columns(l_order(oj)).is_displayed
                   and g_raw.exists(upper(p_region.region_columns(l_order(oj)).name)) then
                    l_secs(upper(l_sec)) := l_secs(upper(l_sec)) + 1;
                end if;
            end loop;
            if l_secs(upper(l_sec)) > 0 then
                l_final.extend; l_final(l_final.count) := 'S'||l_sec;
            end if;
            for oj in oi .. l_order.count loop
                if upper(trim(ca(p_region.region_columns(l_order(oj)), 24))) = upper(l_sec) then
                    l_final.extend; l_final(l_final.count) := 'C'||l_order(oj);
                end if;
            end loop;
        end if;
    end loop;

    -- collapsed-section summaries: fields marked "In Section Summary"
    for oi in 1 .. l_order.count loop
        declare
            l_c  apex_plugin.t_region_column := p_region.region_columns(l_order(oi));
            l_s  varchar2(255) := upper(trim(ca(l_c, 24)));
            l_n  varchar2(255) := upper(l_c.name);
            l_t  varchar2(4000);
        begin
            if l_s is not null and nvl(ca(l_c, 31),'N') = 'Y'
               and l_c.is_displayed and g_raw.exists(l_n) and g_raw(l_n) is not null then
                if lower(ca(l_c, 7)) = 'relative'
                   and g_type(l_n) in ( apex_exec.c_data_type_date,
                                        apex_exec.c_data_type_timestamp,
                                        apex_exec.c_data_type_timestamp_tz ) then
                    l_t := rel_time(to_date(g_raw(l_n), 'YYYY-MM-DD HH24:MI:SS'));
                elsif ca(l_c, 19) is not null and lower(ca(l_c, 18)) in ('select','search') then
                    l_t := nvl(lov_display(ca(l_c, 19), g_raw(l_n)), fmt_value(l_n, ca(l_c, 26)));
                else
                    l_t := fmt_value(l_n, ca(l_c, 26));
                end if;
                if l_t is not null then
                    l_secsum(l_s) := case when l_secsum.exists(l_s)
                                          then l_secsum(l_s) || ' ' || unistr('\00B7') || ' ' end || l_t;
                end if;
            end if;
        end;
    end loop;

    -- configurable or sectioned cards are laid out by the browser
    l_auto := c_config or l_secs.count > 0;

    sys.htp.p('<div class="dg dg--'||c_frame||' dg--'||c_density
        || case when c_label_case = 'upper' then ' dg--upper' end
        || case when c_stack then ' dg--stack' end
        || case when c_config then ' dg--configurable' end
        || case when l_auto then ' dg--auto' end
        || case when c_zebra then ' dg--zebra' end
        || case when c_accent is not null then ' dg--accent' end
        ||'" data-dg-pairs="'||c_pairs||'"'
        || case when c_ver_col is not null and g_raw.exists(c_ver_col)
                then ' data-dg-version="'||apex_escape.html_attribute(g_raw(c_ver_col))||'"' end
        ||' style="grid-template-columns:repeat('||c_pairs||',minmax(0,1fr));'
        ||'--dg-lw:'||c_label_w||';'
        || case when c_border_col is not null
                then '--dg-line:'||apex_escape.html_attribute(c_border_col)||';' end
        || case when c_lbl_bg is not null
                then '--dg-lbl-bg:'||apex_escape.html_attribute(c_lbl_bg)||';' end
        || case when c_lbl_fg is not null
                then '--dg-lbl-fg:'||apex_escape.html_attribute(c_lbl_fg)||';' end
        || case when c_val_fg is not null
                then '--dg-val-fg:'||apex_escape.html_attribute(c_val_fg)||';' end
        || case when c_radius is not null
                then '--dg-radius:'||apex_escape.html_attribute(c_radius)||';' end
        || case when c_bstyle is not null
                then '--dg-bstyle:'||apex_escape.html_attribute(c_bstyle)||';' end
        || case when c_accent is not null
                then '--dg-accent-bar:'||apex_escape.html_attribute(c_accent)||';' end
        ||'">');

    for fi in 1 .. l_final.count loop
        -- section header: a slim full-width row; the whole row toggles
        if substr(l_final(fi), 1, 1) = 'S' then
            l_sec  := substr(l_final(fi), 2);
            l_coll := instr(c_coll_secs, ','||upper(l_sec)||',') > 0;
            sys.htp.p('<div class="dg-sec'|| case when l_coll then ' is-collapsed' end ||'"'
                ||' data-dg-sec="'||apex_escape.html_attribute(l_sec)||'"'
                ||' data-dg-sec-default="'|| case when l_coll then 'collapsed' else 'expanded' end ||'"'
                ||' style="grid-column:1 / -1;">'
                ||'<button type="button" class="dg-sec-btn" aria-expanded="'
                || case when l_coll then 'false' else 'true' end ||'">'
                ||'<span class="dg-sec-chev fa fa-chevron-down" aria-hidden="true"></span>'
                ||'<span class="dg-sec-title">'||apex_escape.html(l_sec)||'</span>'
                ||'<span class="dg-sec-count">'||l_secs(upper(l_sec))||'</span>'
                || case when l_secsum.exists(upper(l_sec)) then
                       '<span class="dg-sec-sum">'||apex_escape.html(l_secsum(upper(l_sec)))||'</span>'
                   end
                ||'</button><span class="dg-end"></span></div>');
            goto next_column;
        end if;

        declare
            c       pls_integer := to_number(substr(l_final(fi), 2));
            l_c     apex_plugin.t_region_column := p_region.region_columns(c);
            a_pos   varchar2(30)    := lower(nvl(ca(l_c,1),'auto'));
            a_span  varchar2(30)    := lower(nvl(ca(l_c,2),'none'));
            a_bold  boolean         := nvl(ca(l_c,3),'N') = 'Y';
            a_ital  boolean         := nvl(ca(l_c,4),'N') = 'Y';
            a_undl  boolean         := nvl(ca(l_c,5),'N') = 'Y';
            a_hlcol varchar2(255)   := ca(l_c,6);
            a_disp  varchar2(30)    := lower(nvl(ca(l_c,7),'plain'));
            a_stfg  varchar2(255)   := ca(l_c,8);
            a_stbg  varchar2(255)   := ca(l_c,9);
            a_color varchar2(255)   := ca(l_c,10);
            a_collb boolean         := nvl(ca(l_c,11),'N') = 'Y';
            a_blink varchar2(255)   := ca(l_c,12);
            a_icon  varchar2(255)   := ca(l_c,13);
            a_icmsg varchar2(32767) := ca(l_c,14);
            a_tip   varchar2(4000)  := ca(l_c,15);
            a_copy  boolean         := nvl(ca(l_c,16),'N') = 'Y';
            a_hide  boolean         := nvl(ca(l_c,17),'N') = 'Y';
            a_edit  varchar2(30)    := lower(nvl(ca(l_c,18),'no'));
            a_elov  varchar2(32767) := ca(l_c,19);
            a_swtch varchar2(255)   := nvl(ca(l_c,20),'Yes-Y|No-N');
            a_econd varchar2(255)   := ca(l_c,21);
            a_ucfg  varchar2(30)    := lower(nvl(ca(l_c,22),'always'));
            a_html  varchar2(32767) := ca(l_c,23);
            a_sect  varchar2(255)   := trim(ca(l_c,24));
            a_side  varchar2(4000)  := ca(l_c,25);
            a_fmask varchar2(4000)  := nvl(trim(ca(l_c,26)), l_c.format_mask);
            a_vrule varchar2(4000)  := trim(ca(l_c,27));
            a_crule varchar2(4000)  := ca(l_c,28);
            a_link  varchar2(4000)  := ca(l_c,29);
            a_lattr varchar2(4000)  := ca(l_c,30);
            a_pop   varchar2(32767) := ca(l_c,32);
            a_icpos varchar2(30);
            a_icocl varchar2(255);
            -- the column's Alignment setting (start / center / end)
            a_valal varchar2(30)    := case
                                           when upper(l_c.value_alignment) in ('RIGHT','END')
                                               then 'RIGHT'
                                           when upper(l_c.value_alignment) = 'CENTER'
                                               then 'CENTER'
                                           else 'LEFT'
                                       end;
            a_hedal varchar2(30)    := upper(nvl(l_c.heading_alignment,'LEFT'));
            -- colours as they will be written into style attributes
            v_color varchar2(4000)  := colour(a_color);
            v_hlcol varchar2(4000)  := colour(a_hlcol);
        begin
            l_nm := upper(l_c.name);

            if not l_c.is_displayed or not g_raw.exists(l_nm) then
                goto next_column;
            end if;

            l_editable := false;
            l_value := g_raw(l_nm);

            if a_hide and l_value is null then
                goto next_column;
            end if;

            ------------------------------------------------------------------
            -- format: the column Format Mask (or keyword), else a sensible
            -- default for the value; a list column shows its display value
            ------------------------------------------------------------------
            l_value := fmt_value(l_nm, a_fmask);

            if a_elov is not null and a_edit in ('select', 'search') then
                l_lovd := lov_display(a_elov, g_raw(l_nm));
                if l_lovd is not null then
                    l_value := l_lovd;
                end if;
            end if;

            -- Colour Rules win over the fixed colours
            rule_colour(a_crule, g_raw(l_nm), l_value, l_rfg, l_rbg);
            if l_rfg is not null then
                v_color := l_rfg;
            end if;

            ------------------------------------------------------------------
            -- the value itself
            ------------------------------------------------------------------
            l_fg := null; l_bg := null; l_style := null;

            if l_value is null and a_disp != 'html' then
                l_inner := '<span class="dg-txt is-null">'||c_null_text||'</span>';

            elsif a_disp = 'html' then
                l_inner := subst(a_html, true);

            elsif a_disp = 'percent' then
                l_pct := least(greatest(
                             nvl(to_number(regexp_substr(g_raw(l_nm),'-?\d+(\.\d+)?')),0),
                             0), 100);
                l_inner := '<span class="dg-bar" role="img" aria-label="'
                        || to_char(l_pct,'FM990D0') ||' percent">'
                        ||'<span class="dg-bar-fill" style="width:'
                        || to_char(l_pct,'FM990D0') ||'%'
                        || case when v_color is not null
                                then ';background:'
                                     ||apex_escape.html_attribute(v_color) end
                        ||'"></span></span>'
                        ||'<span class="dg-bar-num">'
                        || apex_escape.html(nvl(l_value,'0')) ||'</span>';

            elsif a_disp = 'chips' then
                -- a comma / semicolon separated list, one chip per entry
                l_inner := null;
                for i in 1 .. regexp_count(l_value, '[^,;]+') loop
                    l_label := trim(regexp_substr(l_value, '[^,;]+', 1, i));
                    if l_label is not null then
                        l_inner := l_inner || '<span class="dg-chip">'
                                || apex_escape.html(l_label) || '</span>';
                    end if;
                end loop;
                l_inner := '<span class="dg-chips">' || l_inner || '</span>';

            elsif a_disp = 'avatar' then
                -- initials in a circle whose colour is stable for the name
                l_label := upper(substr(regexp_substr(l_value, '[[:alnum:]]+', 1, 1), 1, 1)
                              || substr(regexp_substr(l_value, '[[:alnum:]]+', 1, 2), 1, 1));
                l_inner := '<span class="dg-avatar" aria-hidden="true" style="--av-h:'
                        || dbms_utility.get_hash_value(l_value, 0, 360) || '">'
                        || apex_escape.html(nvl(l_label, '?')) || '</span>'
                        || '<span class="dg-txt">' || apex_escape.html(l_value) || '</span>';

            elsif a_disp = 'check' then
                l_inner := case
                    when upper(l_value) in ('Y','YES','1','TRUE','ON','ACTIVE') then
                        '<span class="dg-check is-yes"><span class="fa fa-check-circle" aria-hidden="true"></span>Yes</span>'
                    when upper(l_value) in ('N','NO','0','FALSE','OFF','INACTIVE') then
                        '<span class="dg-check is-no"><span class="fa fa-times-circle" aria-hidden="true"></span>No</span>'
                    else '<span class="dg-txt">' || apex_escape.html(l_value) || '</span>'
                end;

            elsif a_disp = 'kpi' then
                l_inner := '<span class="dg-kpi"'
                        || case when v_color is not null
                                then ' style="color:'||apex_escape.html_attribute(v_color)||'"' end
                        || '>' || apex_escape.html(l_value) || '</span>';

            elsif a_disp = 'relative'
                  and g_type(l_nm) in ( apex_exec.c_data_type_date,
                                        apex_exec.c_data_type_timestamp,
                                        apex_exec.c_data_type_timestamp_tz ) then
                -- "3 days ago" with the exact time on hover
                l_inner := '<span class="dg-txt dg-rel dg-tip tip-hover" data-tip="'
                        || apex_escape.html_attribute(to_char(
                               to_date(g_raw(l_nm), 'YYYY-MM-DD HH24:MI:SS'), 'DD-MON-YYYY HH12:MIAM')) || '">'
                        || apex_escape.html(rel_time(to_date(g_raw(l_nm), 'YYYY-MM-DD HH24:MI:SS')))
                        || '</span>';

            elsif a_disp like 'badge%' then
                l_fg := nvl(l_rfg, colour(a_stfg));
                l_bg := nvl(l_rbg, colour(a_stbg));
                l_style := case when l_fg is not null
                                then '--b-fg:'||apex_escape.html_attribute(l_fg)||';' end
                        || case when l_bg is not null
                                then '--b-bg:'||apex_escape.html_attribute(l_bg)||';' end;
                l_inner := '<span class="dg-badge b-'
                        || nvl(substr(a_disp, 7),'soft') ||'"'
                        || case when l_style is not null
                                then ' style="'||l_style||'"' end
                        ||'>'||apex_escape.html(l_value)||'</span>';
            else
                l_classes := 'dg-txt'
                          || case when a_disp = 'mono' then ' is-mono' end
                          || case when a_bold then ' is-bold' end
                          || case when a_ital then ' is-italic' end
                          || case when a_undl then ' is-underline' end
                          || case when a_hlcol is not null then ' is-highlight' end
                          || case when g_type(l_nm) = apex_exec.c_data_type_number
                                  then ' is-num' end
                          || case when l_c.value_css_classes is not null
                                  then ' '||l_c.value_css_classes end;
                l_style := case when v_hlcol is not null
                                then '--dg-hl:'
                                     ||apex_escape.html_attribute(v_hlcol)||';' end
                        || case when v_color is not null
                                then 'color:'
                                     ||apex_escape.html_attribute(v_color)||';' end;
                l_inner := '<span class="'||l_classes||'"'
                        || case when l_style is not null
                                then ' style="'||l_style||'"' end
                        ||'>'
                        || case when nvl(l_c.escape_output,true)
                                then apex_escape.html(l_value)
                                else l_value end
                        ||'</span>';
            end if;

            ------------------------------------------------------------------
            -- inline editor overrides the rendered value
            ------------------------------------------------------------------
            if a_edit != 'no'
               and ( a_econd is null
                     or upper(nvl(ref(a_econd),'N')) in ('Y','YES','1','TRUE') ) then
                -- a list whose query uses another editable field's value
                -- (#BU_ID#) is reloaded when that field changes
                l_parents := null;
                if a_elov is not null then
                    for t in 1 .. regexp_count(a_elov, '#[A-Za-z0-9_$]+#|&[A-Za-z0-9_$]+\.') loop
                        l_tk := upper(trim(both '#' from rtrim(ltrim(
                                    regexp_substr(a_elov, '#[A-Za-z0-9_$]+#|&[A-Za-z0-9_$]+\.', 1, t),
                                    '&'), '.')));
                        if l_tk != l_nm
                           and instr(','||l_editcols||',', ','||l_tk||',') > 0
                           and instr(','||l_parents||',', ','||l_tk||',') = 0 then
                            l_parents := l_parents || case when l_parents is not null then ',' end || l_tk;
                        end if;
                    end loop;
                end if;

                l_editor :=
                       ' data-dg-col="'  ||apex_escape.html_attribute(l_nm)||'"'
                    || ' data-dg-old="'  ||apex_escape.html_attribute(g_raw(l_nm))||'"'
                    || ' data-dg-call="' ||apex_escape.html_attribute(l_editcall)||'"'
                    || ' data-dg-token="'||apex_escape.html_attribute(l_token)||'"'
                    || ' data-dg-label="'||apex_escape.html_attribute(
                                             nvl(l_c.heading, initcap(replace(l_c.name,'_',' '))))||'"'
                    || case when a_vrule is not null
                            then ' data-dg-rules="'||apex_escape.html_attribute(a_vrule)||'"' end
                    || case when l_parents is not null
                            then ' data-dg-parents="'||apex_escape.html_attribute(l_parents)||'"' end;

                l_pre := null; l_post := null; l_optclob := null;

                if a_edit = 'select' then
                    l_pre     := '<select class="dg-edit"'||l_editor||'>';
                    l_optclob := lov_options(a_elov, g_raw(l_nm));
                    l_post    := '</select>';

                elsif a_edit = 'search' then
                    l_pre     := '<span class="dg-combo">'
                              ||'<input class="dg-edit dg-combo-input"'
                              || l_editor
                              ||' data-dg-value="'
                              ||apex_escape.html_attribute(g_raw(l_nm))||'"'
                              ||' value="'||apex_escape.html_attribute(g_raw(l_nm))||'"'
                              ||' role="combobox" aria-expanded="false" aria-autocomplete="list"'
                              ||' autocomplete="off" spellcheck="false" placeholder="Search">'
                              ||'<button type="button" class="dg-combo-btn" tabindex="-1"'
                              ||' aria-label="Show list"><span class="fa fa-search"'
                              ||' aria-hidden="true"></span></button>'
                              ||'<select class="dg-combo-src" hidden tabindex="-1">';
                    l_optclob := lov_options(a_elov, g_raw(l_nm));
                    l_post    := '</select><ul class="dg-combo-list" role="listbox">'
                              ||'</ul></span>';

                elsif a_edit in ('date','datetime') then
                    l_pre := '<input class="dg-edit" type="'
                          || case when a_edit = 'datetime'
                                  then 'datetime-local' else 'date' end
                          ||'"'|| l_editor
                          ||' value="'
                          || case when g_raw(l_nm) is not null
                                  then to_char(
                                         to_date(g_raw(l_nm),'YYYY-MM-DD HH24:MI:SS'),
                                         case when a_edit = 'datetime'
                                              then 'YYYY-MM-DD"T"HH24:MI'
                                              else 'YYYY-MM-DD' end) end
                          ||'">';

                elsif a_edit = 'switch' then
                    l_swlbl := regexp_substr(a_swtch,'[^-|]+',1,1);
                    l_swval := regexp_substr(a_swtch,'[^-|]+',1,2);
                    l_swtxt := regexp_substr(a_swtch,'[^-|]+',1,3);
                    l_swoff := regexp_substr(a_swtch,'[^-|]+',1,4);
                    l_pre := '<label class="dg-switch">'
                          ||'<input type="checkbox" class="dg-edit dg-switch-input"'
                          || l_editor
                          ||' data-dg-on="' ||apex_escape.html_attribute(l_swval)||'"'
                          ||' data-dg-off="'||apex_escape.html_attribute(l_swoff)||'"'
                          || case when upper(g_raw(l_nm)) = upper(l_swval)
                                  then ' checked' end
                          ||'>'
                          ||'<span class="dg-switch-track" aria-hidden="true">'
                          ||'<span class="dg-switch-knob"></span></span>'
                          ||'<span class="dg-switch-text" data-on="'
                          ||apex_escape.html_attribute(l_swlbl)||'" data-off="'
                          ||apex_escape.html_attribute(l_swtxt)||'">'
                          || apex_escape.html(
                               case when upper(g_raw(l_nm)) = upper(l_swval)
                                    then l_swlbl else l_swtxt end)
                          ||'</span></label>';
                elsif a_edit = 'textarea' then
                    l_pre := '<textarea class="dg-edit dg-textarea" rows="3"'||l_editor||'>'
                          || apex_escape.html(g_raw(l_nm)) ||'</textarea>';
                else
                    l_pre := '<input class="dg-edit"'||l_editor
                          || ' type="'
                          || case when a_edit = 'number' then 'number' else 'text' end
                          ||'" value="'||apex_escape.html_attribute(g_raw(l_nm))||'">';
                end if;

                l_editable := true;
            end if;

            ------------------------------------------------------------------
            -- tooltip wrapper
            ------------------------------------------------------------------
            l_tip := case when a_tip is not null
                          then subst(a_tip, false) end;
            if l_tip is not null then
                l_inner := '<span class="dg-tip tip-hover" data-tip="'
                        || apex_escape.html_attribute(l_tip) ||'">'
                        || l_inner ||'</span>';
            end if;

            ------------------------------------------------------------------
            -- link: a Link Builder target, prepared exactly like a report
            -- column link (checksum, modal dialog call)
            ------------------------------------------------------------------
            l_url := case when a_link is not null and g_raw(l_nm) is not null
                          then link_url(a_link) end;
            if l_url is not null then
                l_inner := '<a class="dg-link" href="'||apex_escape.html_attribute(l_url)||'"'
                        || case when a_lattr is not null then ' '||a_lattr end
                        || '>' || l_inner || '</a>';
            end if;

            ------------------------------------------------------------------
            -- icons and copy button
            ------------------------------------------------------------------
            a_icocl := trim(regexp_replace(a_icon,'\s*-\s*(left|right)\s*$','',1,1,'i'));
            a_icpos := lower(nvl(regexp_substr(a_icon,'-\s*(left|right)\s*$',1,1,'i',1),'right'));
            l_ico_l := case when a_icocl is not null and a_icpos = 'left'
                            then ref(a_icocl) end;
            l_ico_r := case when a_icocl is not null and a_icpos = 'right'
                            then ref(a_icocl) end;
            l_icmsg := case when a_icmsg is not null
                            then subst(a_icmsg, false) end;

            if l_ico_l is not null then
                l_inner := icon_html(l_ico_l, l_icmsg) || l_inner;
            end if;
            if l_ico_r is not null then
                l_inner := l_inner || icon_html(l_ico_r, l_icmsg);
            end if;

            if a_copy then
                l_inner := l_inner
                    ||'<button type="button" class="dg-copy" title="Copy"'
                    ||' data-dg-copy="'||apex_escape.html_attribute(l_value)||'"'
                    ||' aria-label="Copy '
                    ||apex_escape.html_attribute(nvl(l_c.heading,l_c.name))
                    ||'"><span class="'||apex_escape.html_attribute(c_copy_icon)||'" aria-hidden="true"></span></button>';
            end if;

            ------------------------------------------------------------------
            -- grid placement
            ------------------------------------------------------------------
            l_span := case a_span
                          when 'full'  then c_pairs
                          when 'two'   then least(2, c_pairs)
                          when 'merge' then 1
                          when 'fullmerge' then c_pairs
                          else 1
                      end;

            l_target := case a_pos when 'col1' then 1
                                   when 'col2' then 2
                                   when 'col3' then 3
                        end;

            if l_target is not null and l_target <= c_pairs then
                if mod(l_slot, c_pairs) + 1 > l_target then
                    l_slot := l_slot + ( c_pairs - mod(l_slot, c_pairs) );
                end if;
                l_slot := l_slot + ( l_target - 1 - mod(l_slot, c_pairs) );
            end if;

            if mod(l_slot, c_pairs) + l_span > c_pairs then
                l_slot := l_slot + ( c_pairs - mod(l_slot, c_pairs) );
            end if;

            -- With user configuration the browser can hide or reorder fields, so
            -- only forced placements get an explicit column; everything else
            -- auto-flows and closes up when a field is hidden.
            if l_auto and a_pos = 'auto' then
                l_pos := case when l_span > 1 then 'grid-column:span '||l_span||';' end;
            else
                l_pos := 'grid-column:'||(mod(l_slot, c_pairs) + 1)
                      || case when l_span > 1 then ' / span '||l_span end ||';';
            end if;

            -- forced placement can leave holes; fill them so the grid stays solid
            l_gap := case when l_auto then 0 else l_slot - l_emitted end;
            while l_gap > 0 loop
                sys.htp.p('<div class="dg-item dg-filler'
                    || case when mod(l_emitted + 1, c_pairs) = 0 then ' dg-edge' end
                    ||'" style="grid-column:'||(mod(l_emitted, c_pairs) + 1)||';"></div>');
                l_emitted := l_emitted + 1;
                l_gap     := l_gap - 1;
            end loop;

            l_slot    := l_slot + l_span;
            l_emitted := l_emitted + l_span;

            ------------------------------------------------------------------
            l_label := nvl(l_c.heading, initcap(replace(l_c.name,'_',' ')));



            sys.htp.p('<div class="dg-item'
                || case when mod(l_slot, c_pairs) = 0 then ' dg-edge' end
                || case when a_span in ('merge','fullmerge') then ' dg-merged' end
                || case when a_ucfg in ('hidden','shown') then ' dg-optional' end
                || case
                       when l_pref_order is not null
                            or l_pref_hide != ',,' then
                            case when instr(l_pref_hide, ','||l_nm||',') > 0
                                 then ' dg-hidden' end
                       when a_ucfg = 'hidden' then ' dg-hidden'
                   end
                || case when a_sect is not null
                         and instr(c_coll_secs, ','||upper(a_sect)||',') > 0
                        then ' dg-sec-hidden' end
                ||'" data-dg-name="'||apex_escape.html_attribute(l_nm)||'"'
                || case when a_sect is not null
                        then ' data-dg-sec="'||apex_escape.html_attribute(a_sect)||'"' end
                || ' data-dg-label="'||apex_escape.html_attribute(l_label)||'"'
                || ' data-dg-span="'||l_span||'"'
                || ' data-dg-col="'
                || case a_pos when 'col1' then '1' when 'col2' then '2'
                              when 'col3' then '3' end ||'"'
                ||' style="'||l_pos||'">');

            if a_span not in ('merge','fullmerge') then
                sys.htp.p('<div class="dg-lbl al-'||a_hedal||'"'
                    || case when a_collb and v_color is not null
                            then ' style="color:'
                                 ||apex_escape.html_attribute(v_color)||'"' end
                    ||'>'|| apex_escape.html(l_label)
                    || case when l_editable and regexp_like(a_vrule, '(^|;)\s*required\s*(;|$)', 'i')
                            then '<span class="dg-req" title="Required">*</span>' end
                    ||'</div>');
            end if;

            sys.htp.p('<div class="dg-val al-'||a_valal
                || case when a_blink is not null
                             and upper(nvl(ref(a_blink),'N')) in ('Y','YES','1','TRUE')
                        then ' is-blink' end
                ||'">');

            -- right-aligned slot at the end of the cell: side badge, then the
            -- edit button; the configure gear is placed here by the browser
            l_side := case when a_side is not null then trim(subst(a_side, false)) end;
            l_end  := null;
            if l_side is not null then
                l_fg := colour(a_stfg);
                l_bg := colour(a_stbg);
                l_end := '<span class="dg-side dg-badge b-soft"'
                      || case when l_fg is not null or l_bg is not null then ' style="'
                              || case when l_fg is not null
                                      then '--b-fg:'||apex_escape.html_attribute(l_fg)||';' end
                              || case when l_bg is not null
                                      then '--b-bg:'||apex_escape.html_attribute(l_bg)||';' end
                              || '"' end
                      || '>' || apex_escape.html(l_side) || '</span>';
            end if;
            -- details popover (e.g. an approval timeline), loaded on demand
            if a_pop is not null then
                l_end := l_end
                      || '<button type="button" class="dg-popbtn" data-dg-pop="'
                      || apex_escape.html_attribute(l_nm) || '" title="Show details"'
                      || ' aria-label="Show details for '
                      || apex_escape.html_attribute(nvl(l_c.heading, l_c.name)) || '">'
                      || '<span class="fa fa-history" aria-hidden="true"></span></button>';
            end if;

            if l_editable then
                sys.htp.p('<span class="dg-view">'||l_inner||'</span>'
                    ||'<span class="dg-editwrap" hidden>');
                sys.htp.prn(l_pre);
                put_clob(l_optclob);
                sys.htp.p(l_post
                    ||'<button type="button" class="dg-btn dg-save" title="Save">'
                    ||'<span class="fa fa-check" aria-hidden="true"></span></button>'
                    ||'<button type="button" class="dg-btn dg-cancel" title="Cancel">'
                    ||'<span class="fa fa-times" aria-hidden="true"></span></button>'
                    ||'</span>'
                    ||'<span class="dg-end">'|| l_end
                    ||'<button type="button" class="dg-editbtn" title="Edit"'
                    ||' aria-label="Edit '
                    ||apex_escape.html_attribute(nvl(l_c.heading,l_c.name))
                    ||'"><span class="fa fa-pencil" aria-hidden="true"></span></button>'
                    ||'</span>');
            else
                sys.htp.p(l_inner || '<span class="dg-end">' || l_end || '</span>');
            end if;

            sys.htp.p('</div>');
            sys.htp.p('</div>');
        end;
        <<next_column>>
        null;
    end loop;

    -- pad the last row so the card closes on a straight edge
    while not l_auto and mod(l_emitted, c_pairs) != 0 loop
        sys.htp.p('<div class="dg-item dg-filler'
            || case when mod(l_emitted + 1, c_pairs) = 0 then ' dg-edge' end
            ||'" style="grid-column:'||(mod(l_emitted, c_pairs) + 1)||';"></div>');
        l_emitted := l_emitted + 1;
    end loop;

    sys.htp.p('</div>');

exception
    when others then
        begin apex_exec.close(l_ctx); exception when others then null; end;
        raise;
end emit_card;

--------------------------------------------------------------------------------
-- Emits the card, or an error box inside the region instead of failing the
-- whole page. Developers (Builder session) also see the database error.
procedure emit_safe ( p_region in apex_plugin.t_region )
is
begin
    emit_card(p_region);
exception
    when others then
        apex_debug.error('Smart 1-Row View region "%s" failed: %s',
                         p_region.name, sqlerrm);
        sys.htp.p('<div class="dg dg--card"><div class="dg-empty dg-error">'
            ||'This section could not be loaded.'
            || case when v('APP_BUILDER_SESSION') is not null
                    then '<br><code>'||apex_escape.html(sqlerrm)||'</code>' end
            ||'</div></div>');
end emit_safe;

--------------------------------------------------------------------------------
function dom_id ( p_region in apex_plugin.t_region ) return varchar2
is
begin
    return nvl(p_region.dom_id, 'R'||p_region.id);
end dom_id;

--------------------------------------------------------------------------------
procedure render_region (
    p_region in            apex_plugin.t_region,
    p_plugin in            apex_plugin.t_plugin,
    p_param  in            apex_plugin.t_region_render_param,
    p_result in out nocopy apex_plugin.t_region_render_result )
is
begin
    -- the wrapper carries what the browser needs to refresh the region
    sys.htp.p('<div class="dg-root" id="'||apex_escape.html_attribute(dom_id(p_region)||'_dg')||'"'
        ||' data-dg-region="'||apex_escape.html_attribute(dom_id(p_region))||'"'
        ||' data-dg-ajax="'||apex_escape.html_attribute(apex_plugin.get_ajax_identifier)||'"'
        ||' data-dg-items="'||apex_escape.html_attribute(
                apex_plugin_util.page_item_names_to_jquery(p_region.ajax_items_to_submit))||'">');
    emit_safe(p_region);
    sys.htp.p('</div>');
end render_region;

--------------------------------------------------------------------------------
-- the region column called p_name, or null
function column_index ( p_region in apex_plugin.t_region, p_name in varchar2 )
    return pls_integer
is
begin
    for c in 1 .. p_region.region_columns.count loop
        if upper(p_region.region_columns(c).name) = upper(p_name) then
            return c;
        end if;
    end loop;
    return null;
end column_index;

--------------------------------------------------------------------------------
-- Details popover: the column's Popover Query, run for the current record.
-- Columns used: TITLE, DETAIL, WHEN_TEXT, STATE (DONE, CURRENT, PENDING,
-- REJECTED, SKIPPED) - each optional; shown as a vertical timeline.
procedure emit_popover ( p_region in apex_plugin.t_region, p_col in varchar2 )
is
    l_c      pls_integer := column_index(p_region, p_col);
    l_sql    varchar2(32767);
    l_params apex_exec.t_parameters;
    l_ctx    apex_exec.t_context;
    l_pos    t_num_by_name;
    l_n      pls_integer := 0;
    l_state  varchar2(30);
    function val ( p in varchar2 ) return varchar2 is
    begin
        return case when l_pos.exists(p) then apex_exec.get_varchar2(l_ctx, l_pos(p)) end;
    end val;
begin
    if l_c is null or ca(p_region.region_columns(l_c), 32) is null then
        sys.htp.p('<div class="dg-pop-empty">No details for this field.</div>');
        return;
    end if;
    if not load_record(p_region) then
        sys.htp.p('<div class="dg-pop-empty">No record.</div>');
        return;
    end if;

    l_sql := bind_sql(ca(p_region.region_columns(l_c), 32), l_params);
    l_ctx := apex_exec.open_query_context(
                 p_location       => apex_exec.c_location_local_db,
                 p_sql_query      => l_sql,
                 p_sql_parameters => l_params,
                 p_max_rows       => 200 );
    for j in 1 .. apex_exec.get_column_count(l_ctx) loop
        l_pos(upper(apex_exec.get_column(l_ctx, j).name)) := j;
    end loop;

    sys.htp.p('<div class="dg-pop-head">'
        || apex_escape.html(nvl(p_region.region_columns(l_c).heading, p_col)) || '</div>');
    while apex_exec.next_row(l_ctx) loop
        if l_n = 0 then
            sys.htp.p('<ol class="dg-tl">');
        end if;
        l_n := l_n + 1;
        l_state := lower(nvl(val('STATE'), 'pending'));
        if l_state not in ('done','current','pending','rejected','skipped') then
            l_state := 'pending';
        end if;
        sys.htp.p('<li class="dg-tl-item is-' || l_state || '">'
            || '<span class="dg-tl-dot" aria-hidden="true"></span><div class="dg-tl-body">'
            || case when val('TITLE') is not null
                    then '<div class="dg-tl-title">' || apex_escape.html(val('TITLE')) || '</div>' end
            || case when val('DETAIL') is not null
                    then '<div class="dg-tl-detail">' || apex_escape.html(val('DETAIL')) || '</div>' end
            || case when val('WHEN_TEXT') is not null
                    then '<div class="dg-tl-when">' || apex_escape.html(val('WHEN_TEXT')) || '</div>' end
            || '</div></li>');
    end loop;
    apex_exec.close(l_ctx);
    if l_n = 0 then
        sys.htp.p('<div class="dg-pop-empty">Nothing to show yet.</div>');
    else
        sys.htp.p('</ol>');
    end if;
exception
    when others then
        begin apex_exec.close(l_ctx); exception when others then null; end;
        apex_debug.error('Smart 1-Row View popover %s failed: %s', p_col, sqlerrm);
        sys.htp.p('<div class="dg-pop-empty">Details could not be loaded.</div>');
end emit_popover;

--------------------------------------------------------------------------------
-- Dependent list: the options of p_col's list with other editable fields set
-- to the values the user picked but has not saved yet (f01 names, f02 values).
procedure emit_lov ( p_region in apex_plugin.t_region,
                     p_col    in varchar2,
                     p_cur    in varchar2 )
is
    l_c pls_integer := column_index(p_region, p_col);
    l_p pls_integer;
begin
    if l_c is null or ca(p_region.region_columns(l_c), 19) is null
       or lower(nvl(ca(p_region.region_columns(l_c), 18), 'no')) not in ('select', 'search') then
        return;
    end if;
    if not load_record(p_region) then
        return;
    end if;
    for i in 1 .. apex_application.g_f01.count loop
        l_p := column_index(p_region, apex_application.g_f01(i));
        -- only editable fields of this region can be overridden; values are bound
        if l_p is not null
           and lower(nvl(ca(p_region.region_columns(l_p), 18), 'no')) != 'no'
           and g_raw.exists(upper(apex_application.g_f01(i))) then
            g_raw(upper(apex_application.g_f01(i))) :=
                case when i <= apex_application.g_f02.count then apex_application.g_f02(i) end;
        end if;
    end loop;
    put_clob(lov_options(ca(p_region.region_columns(l_c), 19), p_cur));
end emit_lov;

--------------------------------------------------------------------------------
procedure ajax_region (
    p_region in            apex_plugin.t_region,
    p_plugin in            apex_plugin.t_plugin,
    p_param  in            apex_plugin.t_region_ajax_param,
    p_result in out nocopy apex_plugin.t_region_ajax_result )
is
begin
    case apex_application.g_x01
        when 'POPOVER' then emit_popover(p_region, apex_application.g_x02);
        when 'LOV'     then emit_lov(p_region, apex_application.g_x02, apex_application.g_x03);
        else                emit_safe(p_region);
    end case;
end ajax_region;

end smart1rowview_pkg;
/
