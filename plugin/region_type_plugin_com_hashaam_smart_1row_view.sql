prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>6375939148427884
,p_default_application_id=>1530
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MRS'
);
end;
/
 
prompt APPLICATION 1530 - APEX Plugins By Hashaam
--
-- Application Export:
--   Application:     1530
--   Name:            APEX Plugins By Hashaam
--   Date and Time:   10:25 Wednesday October 28, 2026
--   Exported By:     WKSP_MRS
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 9533928290851658
--   Manifest End
--   Version:         26.1.0
--   Instance ID:     743364309778592
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/region_type/com_hashaam_smart_1row_view
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(9533928290851658)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.HASHAAM.SMART_1ROW_VIEW'
,p_display_name=>'Smart 1-Row View'
,p_apexlang_name=>'smart1RowView'
,p_javascript_file_urls=>'#PLUGIN_FILES#js/detail-grid.js?v=1.3.3'
,p_css_file_urls=>'#PLUGIN_FILES#css/detail-grid.css?v=1.3.3'
,p_api_version=>3
,p_render_function=>'smart1rowview_pkg.render_region'
,p_ajax_function=>'smart1rowview_pkg.ajax_region'
,p_standard_attributes=>'SOURCE_LOCATION:AJAX_ITEMS_TO_SUBMIT:ORDER_BY:FETCHED_ROWS:NO_DATA_FOUND_MESSAGE:ESCAPE_OUTPUT:INIT_JAVASCRIPT_CODE:COLUMNS:COLUMN_HEADING:HEADING_ALIGNMENT:VALUE_ALIGNMENT:VALUE_CSS:VALUE_ATTRIBUTE:VALUE_ESCAPE_OUTPUT'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('An Oracle APEX region plug-in for displaying a single record as a clean label-and-value grid \2014 the layout you keep hand-building with two report regions and a pile of CSS.'),
'',
'Point it at a query that returns one row and configure each column in Page Designer. Choose 2, 4 or 6 columns and place any field in a specific column, span it across pairs, or merge it with its own label. Style values with bold, italic, underline, h'
||'ighlight, color, monospace, status badges in five variants, or a percent bar. Add icons, tooltips, copy buttons and attention-grabbing blink, each driven by a literal or a `#COLUMN#` token so it varies per record.',
'',
'Fields can be edited in place through a text box, number, date, date-time, select list, searchable list or toggle. Your JavaScript handler decides what happens and what message appears; the record key never reaches the browser, resolved instead from '
||'a server-side token.',
'',
'Turn on user configuration and each user can drag fields into their own order and hide the ones they don''t need, saved per user and applied before the page paints.',
'',
'The region supports Refresh: a Refresh dynamic action, or apex.region("<static id>").refresh(), re-renders the card in place. List the items the query uses in Page Items to Submit so their current values are sent. If the query fails, the error is sho'
||'wn inside the region (with the database message in a Builder session) instead of failing the page.'))
,p_version_identifier=>'1.3.3'
,p_files_version=>2461342101756
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9534212883851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'attribute_01'
,p_prompt=>'Placement'
,p_apexlang_name=>'placement'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'auto'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Which grid column this field starts in.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9534364596851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9534212883851658)
,p_display_sequence=>10
,p_display_value=>'Auto'
,p_return_value=>'auto'
,p_apexlang_name=>'auto'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9534493949851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9534212883851658)
,p_display_sequence=>20
,p_display_value=>'Column 1'
,p_return_value=>'col1'
,p_apexlang_name=>'column1'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9534593497851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9534212883851658)
,p_display_sequence=>30
,p_display_value=>'Column 2'
,p_return_value=>'col2'
,p_apexlang_name=>'column2'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9534668921851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9534212883851658)
,p_display_sequence=>40
,p_display_value=>'Column 3'
,p_return_value=>'col3'
,p_apexlang_name=>'column3'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9534763255851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'attribute_01'
,p_prompt=>'Report Layout'
,p_apexlang_name=>'reportLayout'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'2'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'How many label+value pairs sit side by side on one row.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9534871997851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9534763255851658)
,p_display_sequence=>10
,p_display_value=>'2 columns (1 pair)'
,p_return_value=>'1'
,p_apexlang_name=>'2Columns1Pair'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9534954740851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9534763255851658)
,p_display_sequence=>20
,p_display_value=>'4 columns (2 pairs)'
,p_return_value=>'2'
,p_apexlang_name=>'4Columns2Pairs'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9535094991851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9534763255851658)
,p_display_sequence=>30
,p_display_value=>'6 columns (3 pairs)'
,p_return_value=>'3'
,p_apexlang_name=>'6Columns3Pairs'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9535115829851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'attribute_02'
,p_prompt=>'Span'
,p_apexlang_name=>'span'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'none'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'How much space the field takes. Merge with label removes the label cell, so the value also fills the label''s place. Full row without label does both - good for a headline or a notes banner.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9578859131103926)
,p_plugin_attribute_id=>wwv_flow_imp.id(9535115829851658)
,p_display_sequence=>50
,p_display_value=>'Full row without label'
,p_return_value=>'fullmerge'
,p_apexlang_name=>'fullRowNoLabel'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9535263971851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9535115829851658)
,p_display_sequence=>40
,p_display_value=>'Merge with label'
,p_return_value=>'merge'
,p_apexlang_name=>'mergeWithLabel'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9535318361851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9535115829851658)
,p_display_sequence=>10
,p_display_value=>'Single slot'
,p_return_value=>'none'
,p_apexlang_name=>'singleSlot'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9535414712851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9535115829851658)
,p_display_sequence=>30
,p_display_value=>'Span full row'
,p_return_value=>'full'
,p_apexlang_name=>'spanFullRow'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9535518696851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9535115829851658)
,p_display_sequence=>20
,p_display_value=>'Span two pairs'
,p_return_value=>'two'
,p_apexlang_name=>'spanTwoPairs'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9535627729851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'attribute_02'
,p_prompt=>'Label Column Width'
,p_apexlang_name=>'labelColumnWidth'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'160px'
,p_is_translatable=>false
,p_help_text=>'Any CSS width for the label column, e.g. 160px, 12rem, 25%.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9535753491851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'attribute_03'
,p_prompt=>'Bold'
,p_apexlang_name=>'bold'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Render the value in bold.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9535833454851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'attribute_03'
,p_prompt=>'Density'
,p_apexlang_name=>'density'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'cozy'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Row height, padding and font size.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9535947032851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9535833454851658)
,p_display_sequence=>40
,p_display_value=>'Comfortable'
,p_return_value=>'comfortable'
,p_apexlang_name=>'comfortable'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9536031787851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9535833454851658)
,p_display_sequence=>10
,p_display_value=>'Compact'
,p_return_value=>'compact'
,p_apexlang_name=>'compact'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9536101539851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9535833454851658)
,p_display_sequence=>30
,p_display_value=>'Cozy'
,p_return_value=>'cozy'
,p_apexlang_name=>'cozy'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9536292441851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9535833454851658)
,p_display_sequence=>20
,p_display_value=>'Normal'
,p_return_value=>'normal'
,p_apexlang_name=>'normal'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9536378143851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'attribute_04'
,p_prompt=>'Italic'
,p_apexlang_name=>'italic'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Render the value in italics.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9536481788851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'attribute_04'
,p_prompt=>'Frame'
,p_apexlang_name=>'frame'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'card'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Outer treatment of the card.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9536516993851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9536481788851658)
,p_display_sequence=>10
,p_display_value=>'Card with border and shadow'
,p_return_value=>'card'
,p_apexlang_name=>'cardWithBorderAndShadow'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9536697869851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9536481788851658)
,p_display_sequence=>30
,p_display_value=>'Flat, no separators'
,p_return_value=>'flat'
,p_apexlang_name=>'flatNoSeparators'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9536724513851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9536481788851658)
,p_display_sequence=>20
,p_display_value=>'Lined, no outer border'
,p_return_value=>'lined'
,p_apexlang_name=>'linedNoOuterBorder'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9536852786851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'attribute_05'
,p_prompt=>'Underline'
,p_apexlang_name=>'underline'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Underline the value.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9536946604851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'attribute_05'
,p_prompt=>'Stack On Mobile'
,p_apexlang_name=>'stackOnMobile'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>'Collapse to one pair per row below 640px.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9537071153851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_static_id=>'attribute_06'
,p_prompt=>'Highlight Colour'
,p_apexlang_name=>'highlightColour'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Set a colour to draw a highlighter band behind the value. Leave empty for no highlight. Also accepts #COLUMN_NAME# or &COLUMN_NAME.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9537164072851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_static_id=>'attribute_06'
,p_prompt=>'Debug Mode'
,p_apexlang_name=>'debugMode'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Print the column attribute values the plug-in received, above the card.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9537241883851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_static_id=>'attribute_07'
,p_prompt=>'Value Display'
,p_apexlang_name=>'valueDisplay'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'plain'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'How the value is rendered.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9538368927851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9537241883851658)
,p_display_sequence=>110
,p_display_value=>'Avatar and name'
,p_return_value=>'avatar'
,p_apexlang_name=>'avatarAndName'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9537311600851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9537241883851658)
,p_display_sequence=>60
,p_display_value=>'Badge - dot and text'
,p_return_value=>'badge_dot'
,p_apexlang_name=>'badgeDotAndText'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9537443044851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9537241883851658)
,p_display_sequence=>70
,p_display_value=>'Badge - left colour bar'
,p_return_value=>'badge_bar'
,p_apexlang_name=>'badgeLeftColourBar'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9537584785851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9537241883851658)
,p_display_sequence=>50
,p_display_value=>'Badge - outline pill'
,p_return_value=>'badge_outline'
,p_apexlang_name=>'badgeOutlinePill'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9537696998851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9537241883851658)
,p_display_sequence=>30
,p_display_value=>'Badge - soft pill'
,p_return_value=>'badge_soft'
,p_apexlang_name=>'badgeSoftPill'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9537724355851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9537241883851658)
,p_display_sequence=>40
,p_display_value=>'Badge - solid pill'
,p_return_value=>'badge_solid'
,p_apexlang_name=>'badgeSolidPill'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9538265523851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9537241883851658)
,p_display_sequence=>100
,p_display_value=>'Chips (comma separated list)'
,p_return_value=>'chips'
,p_apexlang_name=>'chipsCommaSeparated'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9537880320851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9537241883851658)
,p_display_sequence=>90
,p_display_value=>'HTML expression'
,p_return_value=>'html'
,p_apexlang_name=>'htmlExpression'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9538543571851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9537241883851658)
,p_display_sequence=>130
,p_display_value=>'Large number'
,p_return_value=>'kpi'
,p_apexlang_name=>'largeNumber'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9537969113851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9537241883851658)
,p_display_sequence=>20
,p_display_value=>'Monospace'
,p_return_value=>'mono'
,p_apexlang_name=>'monospace'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9538055756851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9537241883851658)
,p_display_sequence=>80
,p_display_value=>'Percent bar (0-100)'
,p_return_value=>'percent'
,p_apexlang_name=>'percentBar0100'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9538199537851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9537241883851658)
,p_display_sequence=>10
,p_display_value=>'Plain text'
,p_return_value=>'plain'
,p_apexlang_name=>'plainText'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9538661811851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9537241883851658)
,p_display_sequence=>140
,p_display_value=>'Relative time (dates)'
,p_return_value=>'relative'
,p_apexlang_name=>'relativeTime'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9538488121851658)
,p_plugin_attribute_id=>wwv_flow_imp.id(9537241883851658)
,p_display_sequence=>120
,p_display_value=>'Yes / No check'
,p_return_value=>'check'
,p_apexlang_name=>'yesNoCheck'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9538749714851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_static_id=>'attribute_07'
,p_prompt=>'Copy Icon Class'
,p_apexlang_name=>'copyIconClass'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'fa fa-copy'
,p_is_translatable=>false
,p_help_text=>'Icon class used for the copy-to-clipboard button.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9538860956851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_static_id=>'attribute_08'
,p_prompt=>'Badge Font Colour'
,p_apexlang_name=>'badgeFontColour'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Text colour of the value badge (Badge displays) and of the Side Badge. Pick a colour, or enter #COLUMN_NAME# to take it from a column of the record.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9538926374851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_static_id=>'attribute_08'
,p_prompt=>'Edit Handler Call'
,p_apexlang_name=>'editHandlerCall'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'JavaScript expression called when an edit is saved, e.g. saveBudgetField(ctx.token, ctx.column, newValue). newValue and ctx are in scope; ctx holds column, oldValue and token. Pass ctx.token to your Ajax Callback and resolve it with smart1rowview_pkg'
||'.resolve_key - the record key is never exposed to the browser. The expression must return {status:"SUCCESS"|"WARNING"|"ERROR", message:"..."} or a Promise of it. After a save that is not an ERROR the card refreshes itself. The expression is used exac'
||'tly as written - &ITEM. substitutions are not replaced; read other values with apex.item("P1_X").getValue().'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9539093910851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_static_id=>'attribute_09'
,p_prompt=>'Badge Background Colour'
,p_apexlang_name=>'badgeBackgroundColour'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Background colour of the value badge (Badge displays) and of the Side Badge. Pick a colour, or enter #COLUMN_NAME# to take it from a column of the record.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9539169608851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_static_id=>'attribute_09'
,p_prompt=>'Border Colour'
,p_apexlang_name=>'borderColour'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Colour of all card and cell borders.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9539239468851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_static_id=>'attribute_10'
,p_prompt=>'Value Colour'
,p_apexlang_name=>'valueColour'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Text colour for the value, or the fill colour of a percent bar. Also accepts #COLUMN_NAME# or &COLUMN_NAME.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9539327104851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_static_id=>'attribute_10'
,p_prompt=>'Label Background Colour'
,p_apexlang_name=>'labelBackgroundColour'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Background of the label column.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9539421113851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_static_id=>'attribute_11'
,p_prompt=>'Apply Colour To Label'
,p_apexlang_name=>'applyColourToLabel'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(9539239468851659)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_help_text=>'Use the same colour for this field label.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9539503849851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_static_id=>'attribute_11'
,p_prompt=>'Label Text Colour'
,p_apexlang_name=>'labelTextColour'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Text colour of labels.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9539602394851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_static_id=>'attribute_12'
,p_prompt=>'Blink When'
,p_apexlang_name=>'blinkWhen'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Enter #COLUMN_NAME# or &COLUMN_NAME. where that column returns Y or N. The value blinks when Y. Blinking pauses while the field is being edited.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9539776648851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_static_id=>'attribute_12'
,p_prompt=>'Value Text Colour'
,p_apexlang_name=>'valueTextColour'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Default text colour of values.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9539891638851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_static_id=>'attribute_13'
,p_prompt=>'Icon'
,p_apexlang_name=>'icon'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Icon class shown beside the value, e.g. fa fa-user. Append -left or -right to choose the side; the default is right. A #COLUMN_NAME# or &COLUMN_NAME. token also works.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9539916487851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_static_id=>'attribute_13'
,p_prompt=>'Corner Radius'
,p_apexlang_name=>'cornerRadius'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'CSS radius for the card, e.g. 12px or 0.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9540003752851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_static_id=>'attribute_14'
,p_prompt=>'Icon Click Message'
,p_apexlang_name=>'iconClickMessage'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(9539891638851659)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_help_text=>'Message shown when the icon is clicked. Mix static text with #COLUMN_NAME# tokens. Leave empty for a non-clickable icon.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9540139065851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_static_id=>'attribute_14'
,p_prompt=>'Border Style'
,p_apexlang_name=>'borderStyle'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Line style for borders.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9540236465851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9540139065851659)
,p_display_sequence=>20
,p_display_value=>'Dashed'
,p_return_value=>'dashed'
,p_apexlang_name=>'dashed'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9540390199851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9540139065851659)
,p_display_sequence=>30
,p_display_value=>'Dotted'
,p_return_value=>'dotted'
,p_apexlang_name=>'dotted'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9540424569851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9540139065851659)
,p_display_sequence=>40
,p_display_value=>'None'
,p_return_value=>'none'
,p_apexlang_name=>'none'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9540567872851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9540139065851659)
,p_display_sequence=>10
,p_display_value=>'Solid'
,p_return_value=>'solid'
,p_apexlang_name=>'solid'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9540635442851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_static_id=>'attribute_15'
,p_prompt=>'Tooltip Text'
,p_apexlang_name=>'tooltipText'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Text revealed on hover. Mix static text with #COLUMN_NAME# or &COLUMN_NAME. tokens.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9540706527851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_static_id=>'attribute_15'
,p_prompt=>'Allow User Configuration'
,p_apexlang_name=>'allowUserConfiguration'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'A small gear fades in inside the last value cell while the card is hovered. Users can reorder fields by dragging and show or hide any field whose User Configurable setting allows it. Requires the preferences table and Ajax Callback from prefs_smart1r'
||'owview.sql.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9540861448851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>16
,p_display_sequence=>160
,p_static_id=>'attribute_16'
,p_prompt=>'Show Copy Button'
,p_apexlang_name=>'showCopyButton'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Show a copy-to-clipboard button beside the value.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9540970837851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>16
,p_display_sequence=>160
,p_static_id=>'attribute_16'
,p_prompt=>'Preferences Process Name'
,p_apexlang_name=>'preferencesProcessName'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'SMART_1ROW_PREFS'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(9540706527851659)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'Name of the Ajax Callback page process that loads and saves user layouts.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9541044824851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>17
,p_display_sequence=>170
,p_static_id=>'attribute_17'
,p_prompt=>'Hide If Null'
,p_apexlang_name=>'hideIfNull'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Omit this field when its value is null.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9541109998851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>17
,p_display_sequence=>170
,p_static_id=>'attribute_17'
,p_prompt=>'Record Key Column'
,p_apexlang_name=>'recordKeyColumn'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Name of the primary key column in the region query, e.g. BUDGET_ID. Required for editing. The key is held server side against a random token, so the browser never receives it and cannot retarget an update.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9541220979851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>18
,p_display_sequence=>180
,p_static_id=>'attribute_18'
,p_prompt=>'Editable'
,p_apexlang_name=>'editable'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'no'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Show an edit button that swaps the value for an input. Requires an Edit Handler Call on the region.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9541317551851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9541220979851659)
,p_display_sequence=>50
,p_display_value=>'Date and time picker'
,p_return_value=>'datetime'
,p_apexlang_name=>'dateAndTimePicker'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9541445499851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9541220979851659)
,p_display_sequence=>40
,p_display_value=>'Date picker'
,p_return_value=>'date'
,p_apexlang_name=>'datePicker'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9541517904851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9541220979851659)
,p_display_sequence=>10
,p_display_value=>'Not editable'
,p_return_value=>'no'
,p_apexlang_name=>'notEditable'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9541642557851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9541220979851659)
,p_display_sequence=>30
,p_display_value=>'Number field'
,p_return_value=>'number'
,p_apexlang_name=>'numberField'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9541760142851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9541220979851659)
,p_display_sequence=>70
,p_display_value=>'Searchable list'
,p_return_value=>'search'
,p_apexlang_name=>'searchableList'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9541822000851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9541220979851659)
,p_display_sequence=>60
,p_display_value=>'Select list'
,p_return_value=>'select'
,p_apexlang_name=>'selectList'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9542162188851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9541220979851659)
,p_display_sequence=>25
,p_display_value=>'Text area (multi-line)'
,p_return_value=>'textarea'
,p_apexlang_name=>'textArea'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9541995896851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9541220979851659)
,p_display_sequence=>20
,p_display_value=>'Text field'
,p_return_value=>'text'
,p_apexlang_name=>'textField'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9542085060851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9541220979851659)
,p_display_sequence=>80
,p_display_value=>'Toggle switch'
,p_return_value=>'switch'
,p_apexlang_name=>'toggleSwitch'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9543292395851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>18
,p_display_sequence=>180
,p_static_id=>'attribute_18'
,p_prompt=>'Collapsed Sections'
,p_apexlang_name=>'collapsedSections'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Comma separated section names that start collapsed, e.g. Audit, Locking. A viewer''s own expand / collapse choice wins once they have made one.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9542245856851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>19
,p_display_sequence=>190
,p_static_id=>'attribute_19'
,p_prompt=>'Editable LOV Query'
,p_apexlang_name=>'editableLovQuery'
,p_attribute_type=>'SQL'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(9541220979851659)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'select,search'
,p_help_text=>'SQL returning display value and return value. Supports #COLUMN_NAME# or &COLUMN_NAME. tokens and :PAGE_ITEM binds. An empty entry is always added so the value can be cleared. The whole list is loaded; the browser shows 50 at a time with a Load more o'
||'ption, and typing searches across every entry.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9543378383851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>19
,p_display_sequence=>190
,p_static_id=>'attribute_19'
,p_prompt=>'Label Style'
,p_apexlang_name=>'labelStyle'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'normal'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Normal labels, or small capitals with letter spacing.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9543461813851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9543378383851659)
,p_display_sequence=>10
,p_display_value=>'Normal'
,p_return_value=>'normal'
,p_apexlang_name=>'normal'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9543557585851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9543378383851659)
,p_display_sequence=>20
,p_display_value=>'Small caps'
,p_return_value=>'smallcaps'
,p_apexlang_name=>'smallCaps'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9542313385851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>20
,p_display_sequence=>200
,p_static_id=>'attribute_20'
,p_prompt=>'Switch Values'
,p_apexlang_name=>'switchValues'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'Yes-Y|No-N'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(9541220979851659)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'switch'
,p_help_text=>'On label and value, then off label and value: Label-Value|Label-Value. For example Active-A|Inactive-I. The first pair is the on position.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9543623938851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>20
,p_display_sequence=>200
,p_static_id=>'attribute_20'
,p_prompt=>'Striped Rows'
,p_apexlang_name=>'stripedRows'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Shade every other row so wide cards are easier to scan.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9542453376851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>21
,p_display_sequence=>210
,p_static_id=>'attribute_21'
,p_prompt=>'Editable When'
,p_apexlang_name=>'editableWhen'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(9541220979851659)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_help_text=>'Enter #COLUMN_NAME# or &COLUMN_NAME. where that column returns Y or N. The edit button only appears when it is Y. Leave empty to always allow editing.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9543739696851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>21
,p_display_sequence=>210
,p_static_id=>'attribute_21'
,p_prompt=>'Accent Colour'
,p_apexlang_name=>'accentColour'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Draws a coloured bar along the top of the card. Leave empty for none.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9542545630851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>22
,p_display_sequence=>220
,p_static_id=>'attribute_22'
,p_prompt=>'User Configurable'
,p_apexlang_name=>'userConfigurable'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'always'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Always show keeps the field visible and out of the Configure panel checkboxes, though it can still be reordered. Shown initially and Hidden initially both let users toggle the field; they only differ in its state before the user saves a layout. Requi'
||'res Allow User Configuration on the region.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9542607266851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9542545630851659)
,p_display_sequence=>10
,p_display_value=>'Always show'
,p_return_value=>'always'
,p_apexlang_name=>'alwaysShow'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9542780587851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9542545630851659)
,p_display_sequence=>30
,p_display_value=>'Hidden initially'
,p_return_value=>'hidden'
,p_apexlang_name=>'hiddenInitially'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9542872842851659)
,p_plugin_attribute_id=>wwv_flow_imp.id(9542545630851659)
,p_display_sequence=>20
,p_display_value=>'Shown initially'
,p_return_value=>'shown'
,p_apexlang_name=>'shownInitially'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9544598383851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>22
,p_display_sequence=>220
,p_static_id=>'attribute_22'
,p_prompt=>'Whole Card Edit'
,p_apexlang_name=>'wholeCardEdit'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Adds an Edit all button next to the configure gear. It opens every editable field at once; a bar inside the card saves the changes together (Ctrl+Enter) or cancels them (Esc). Each changed field goes through the Edit Handler Call in turn.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9542954316851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>23
,p_display_sequence=>230
,p_static_id=>'attribute_23'
,p_prompt=>'HTML Expression'
,p_apexlang_name=>'htmlExpression'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(9537241883851658)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'html'
,p_help_text=>'Custom markup. #COLUMN_NAME# or &COLUMN_NAME. tokens are replaced with escaped row values.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9544621604851667)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>23
,p_display_sequence=>230
,p_static_id=>'attribute_23'
,p_prompt=>'Version Column'
,p_apexlang_name=>'versionColumn'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Column holding the record version (ROW_VERSION, or LAST_UPDATED_ON) for a conflict check. Its value is passed to the Edit Handler Call as ctx.version; compare it in your update and answer {status:"CONFLICT"} when someone else saved first - the card t'
||'hen shows the latest data. Return {version:...} after a save so the next save uses it.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9543022371851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>24
,p_display_sequence=>240
,p_static_id=>'attribute_24'
,p_prompt=>'Section'
,p_apexlang_name=>'section'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Name of a collapsible section, e.g. Audit. Fields without a section come first; then each section''s fields render together under a slim header row inside the card (sections in the order of their first field); clicking the header expands or collapses '
||'them. List a section in the region''s Collapsed Sections to start it closed. Each viewer''s choice is remembered in their browser.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9543134358851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>25
,p_display_sequence=>250
,p_static_id=>'attribute_25'
,p_prompt=>'Side Badge'
,p_apexlang_name=>'sideBadge'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Text of a small badge shown right-aligned in the same cell, next to the value, e.g. #CURRENCY_CODE# or v#ROW_VERSION#. Static text and #COLUMN_NAME# tokens can be mixed; nothing is shown when it resolves to empty. Coloured by Badge Font Colour and Ba'
||'dge Background Colour.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9543882627851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>26
,p_display_sequence=>260
,p_static_id=>'attribute_26'
,p_prompt=>'Format Mask'
,p_apexlang_name=>'formatMask'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'An Oracle format mask (FM9999, DD-MON-YYYY HH24:MI, FM999G999G990D00 ...) or a keyword - COMPACT (42.5K), PERCENT (12.5%), CURRENCY:SAR or CURRENCY:#CURRENCY_CODE# (SAR 42,500.00), SINCE (3 days ago). Empty - whole numbers show without decimals and d'
||'ates without a time part show without 12:00AM.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9543913763851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>27
,p_display_sequence=>270
,p_static_id=>'attribute_27'
,p_prompt=>'Validation'
,p_apexlang_name=>'validation'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(9541220979851659)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'no'
,p_help_text=>'Rules for an editable field, separated by semicolons - required; min=2000; max=2100; minlength=2; maxlength=150; pattern=^[A-Z].*$; message=Custom error text. Put pattern= and message= last. The browser checks them before saving, a red * marks requir'
||'ed fields, and the server checks them again when your Ajax Callback calls smart1rowview_pkg.resolve_key(token, column, value).'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9544085407851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>28
,p_display_sequence=>280
,p_static_id=>'attribute_28'
,p_prompt=>'Colour Rules'
,p_apexlang_name=>'colourRules'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Colour the value without extra SQL columns, e.g. Draft=grey; Under Approval=blue; Approved=green; Rejected=red; >100000=amber; *=teal. The first matching rule wins. A test is a value (any case), * for anything, or >, >=, <, <=, != with a number. A co'
||'lour is a preset (grey, blue, green, amber, red, purple, teal) or CSS colours fg or fg/bg. Badges use both colours, text uses the first.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9544170851851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>29
,p_display_sequence=>290
,p_static_id=>'attribute_29'
,p_prompt=>'Link'
,p_apexlang_name=>'link'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Turns the value into a link, exactly like a report column link - pick a page in this application (with items, clear cache and request) or a URL. Use #COLUMN_NAME# for item values. Checksums are added, and a modal page opens as a dialog; its close eve'
||'nt bubbles up from the link, so a Dynamic Action on this region can refresh it.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9544255779851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>30
,p_display_sequence=>300
,p_static_id=>'attribute_30'
,p_prompt=>'Link Attributes'
,p_apexlang_name=>'linkAttributes'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(9544170851851659)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_help_text=>'Extra HTML attributes for the link, e.g. target="_blank" or title="Open the budget".'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9544395733851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>31
,p_display_sequence=>310
,p_static_id=>'attribute_31'
,p_prompt=>'In Section Summary'
,p_apexlang_name=>'inSectionSummary'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(9543022371851659)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_help_text=>'Show this value on the section header while the section is collapsed, e.g. AUDIT 4 - APEX_PUBLIC_USER - 1 month ago.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9544452651851659)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_attribute_scope=>'COLUMN'
,p_attribute_sequence=>32
,p_display_sequence=>320
,p_static_id=>'attribute_32'
,p_prompt=>'Details Popover Query'
,p_apexlang_name=>'popoverQuery'
,p_attribute_type=>'SQL'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Adds a small history button that opens a popover timeline, loaded when clicked. Return any of TITLE, DETAIL, WHEN_TEXT and STATE (DONE, CURRENT, PENDING, REJECTED, SKIPPED), one row per step; #COLUMN_NAME# tokens and :PAGE_ITEM binds work. Example - '
||'the approval history behind Pending With.'
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(9534018803851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_name=>'INIT_JAVASCRIPT_CODE'
,p_is_required=>false
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(9534100424851658)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_name=>'SOURCE_LOCATION'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A2044657461696C204772696420726567696F6E20706C75672D696E202D20763133202A2F0A2F2A207468656D6520746F6B656E733A20666F6C6C6F7720556E6976657273616C205468656D65202F20526564776F6F64207661726961626C65732C20';
wwv_flow_imp.g_varchar2_table(2) := '736F206C6967687420616E64206461726B0A2020207468656D657320626F746820776F726B3B206E65757472616C2074696E747320757365206D69642D6772657920616C7068612074686174207375697473206569746865722E0A20202054686520636F';
wwv_flow_imp.g_varchar2_table(3) := '6E6669677572652070616E656C2C20706F706F76657220616E6420746F61737420736974206F757473696465202E64672C20736F207468657920676574207468650A20202073686172656420746F6B656E73206865726520746F6F202874686520636172';
wwv_flow_imp.g_varchar2_table(4) := '642773206F776E20636F6C6F7572732061726520736574206F6E202E64672062656C6F77292E202A2F0A2E64672D726F6F742C202E64672C202E64672D63666770616E656C2C202E64672D706F707B0A20202D2D64672D616363656E743A202076617228';
wwv_flow_imp.g_varchar2_table(5) := '2D2D75742D70616C657474652D7072696D6172792C2023303537326365293B0A20202D2D64672D6C696E653A20202020766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F722C207267626128302C302C302C2E313029293B0A20';
wwv_flow_imp.g_varchar2_table(6) := '202D2D64672D62673A202020202020766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F722C2023666666293B0A20202D2D64672D6C626C2D62673A2020766172282D2D75742D70616C657474652D7072696D6172792D';
wwv_flow_imp.g_varchar2_table(7) := '73686164652D6C6967687465722C207267626128302C302C302C2E30323829293B0A20202D2D64672D6C626C2D66673A2020766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F722C2023366237303735293B0A20202D';
wwv_flow_imp.g_varchar2_table(8) := '2D64672D737572666163653A20766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F722C2023666666293B0A20202D2D64672D746578743A20202020766172282D2D75742D636F6D706F6E656E742D746578742D636F6C';
wwv_flow_imp.g_varchar2_table(9) := '6F722C2023323332373261293B0A20202D2D64672D6D757465643A202020766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F722C2023366237303735293B0A20202D2D64672D6661696E743A202020766172282D2D75';
wwv_flow_imp.g_varchar2_table(10) := '742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F722C2023396161306136293B0A20202D2D64672D686F7665723A202020766172282D2D75742D636F6D706F6E656E742D686967686C696768742D6261636B67726F756E642D636F6C6F';
wwv_flow_imp.g_varchar2_table(11) := '722C2072676261283132372C3132372C3132372C2E313029293B0A20202D2D64672D74696E743A2020202072676261283132372C3132372C3132372C2E3130293B0A20202D2D64672D706F702D6C696E653A766172282D2D75742D636F6D706F6E656E74';
wwv_flow_imp.g_varchar2_table(12) := '2D626F726465722D636F6C6F722C207267626128302C302C302C2E313229293B0A20202D2D64672D7469702D62673A2020766172282D2D75742D636F6D706F6E656E742D746578742D636F6C6F722C2023323332373261293B0A20202D2D64672D746970';
wwv_flow_imp.g_varchar2_table(13) := '2D66673A2020766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F722C2023666666293B0A20202D2D64672D64616E6765723A2020234239314331433B0A7D0A2E64677B0A20202D2D64672D6C696E653A20766172282D';
wwv_flow_imp.g_varchar2_table(14) := '2D75742D636F6D706F6E656E742D626F726465722D636F6C6F722C207267626128302C302C302C2E313029293B0A20202D2D64672D6C626C2D62673A20766172282D2D75742D70616C657474652D7072696D6172792D73686164652D6C6967687465722C';
wwv_flow_imp.g_varchar2_table(15) := '207267626128302C302C302C2E30323829293B0A20202D2D64672D6C626C2D66673A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F722C2023366237303735293B0A20202D2D64672D76616C2D66673A20766172';
wwv_flow_imp.g_varchar2_table(16) := '282D2D75742D636F6D706F6E656E742D746578742D636F6C6F722C2023323332373261293B0A20202D2D64672D62673A20766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F722C2023666666293B0A20202D2D64672D';
wwv_flow_imp.g_varchar2_table(17) := '616363656E743A20766172282D2D75742D70616C657474652D7072696D6172792C2023303537326365293B0A20202D2D64672D7061642D793A2E363872656D3B202D2D64672D7061642D783A3172656D3B202D2D64672D683A343470783B0A20202D2D64';
wwv_flow_imp.g_varchar2_table(18) := '672D73697A653A313370783B0A2020646973706C61793A677269643B206261636B67726F756E643A766172282D2D64672D6267293B0A2020666F6E742D73697A653A766172282D2D64672D73697A65293B0A7D0A2E64672D2D636172647B20626F726465';
wwv_flow_imp.g_varchar2_table(19) := '723A31707820736F6C696420766172282D2D64672D6C696E65293B20626F726465722D7261646975733A313270783B206F766572666C6F773A68696464656E3B0A2020626F782D736861646F773A302031707820327078207267626128302C302C302C2E';
wwv_flow_imp.g_varchar2_table(20) := '3034292C30203670782031387078202D31327078207267626128302C302C302C2E3232293B207D0A2E64672D2D6C696E65647B20626F726465722D746F703A31707820736F6C696420766172282D2D64672D6C696E65293B207D0A2E64672D2D666C6174';
wwv_flow_imp.g_varchar2_table(21) := '202E64672D6974656D7B20626F726465722D636F6C6F723A7472616E73706172656E743B207D0A0A2F2A2064656E73697479202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(22) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D2D636F6D706163747B20202020202D2D64672D7061642D793A2E3272656D3B20202D2D64672D7061642D783A2E353572656D3B202D2D64672D683A323670783B202D2D64672D73697A653A313270';
wwv_flow_imp.g_varchar2_table(23) := '783B207D0A2E64672D2D6E6F726D616C7B2020202020202D2D64672D7061642D793A2E343272656D3B202D2D64672D7061642D783A2E3872656D3B20202D2D64672D683A333470783B202D2D64672D73697A653A31322E3570783B207D0A2E64672D2D63';
wwv_flow_imp.g_varchar2_table(24) := '6F7A797B20202020202020202D2D64672D7061642D793A2E363872656D3B202D2D64672D7061642D783A3172656D3B2020202D2D64672D683A343470783B202D2D64672D73697A653A313370783B207D0A2E64672D2D636F6D666F727461626C657B202D';
wwv_flow_imp.g_varchar2_table(25) := '2D64672D7061642D793A3172656D3B2020202D2D64672D7061642D783A312E313572656D3B2D2D64672D683A353470783B202D2D64672D73697A653A313470783B207D0A0A2E64672D6974656D7B20646973706C61793A677269643B20677269642D7465';
wwv_flow_imp.g_varchar2_table(26) := '6D706C6174652D636F6C756D6E733A766172282D2D64672D6C7729206D696E6D617828302C316672293B0A2020626F726465722D626F74746F6D3A31707820736F6C696420766172282D2D64672D6C696E65293B20626F726465722D72696768743A3170';
wwv_flow_imp.g_varchar2_table(27) := '7820736F6C696420766172282D2D64672D6C696E65293B0A20206D696E2D77696474683A303B207D0A2E64672D6974656D2E64672D656467657B20626F726465722D72696768743A303B207D0A2E64672D6974656D2E64672D6D65726765647B20677269';
wwv_flow_imp.g_varchar2_table(28) := '642D74656D706C6174652D636F6C756D6E733A6D696E6D617828302C316672293B207D0A2E64672D6974656D2E64672D66696C6C65727B20646973706C61793A626C6F636B3B206261636B67726F756E643A766172282D2D64672D6267293B206D696E2D';
wwv_flow_imp.g_varchar2_table(29) := '6865696768743A766172282D2D64672D68293B207D0A0A2F2A206C6162656C20616E642076616C7565207368617265207468652073616D6520747970652062792064656661756C74202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F';
wwv_flow_imp.g_varchar2_table(30) := '0A2E64672D6C626C2C202E64672D76616C7B0A2020646973706C61793A666C65783B20616C69676E2D6974656D733A63656E7465723B206D696E2D77696474683A303B0A202070616464696E673A766172282D2D64672D7061642D792920766172282D2D';
wwv_flow_imp.g_varchar2_table(31) := '64672D7061642D78293B0A2020666F6E742D73697A653A766172282D2D64672D73697A65293B206C696E652D6865696768743A312E343B0A20206D696E2D6865696768743A766172282D2D64672D68293B206F766572666C6F772D777261703A616E7977';
wwv_flow_imp.g_varchar2_table(32) := '686572653B0A20206A7573746966792D636F6E74656E743A666C65782D73746172743B20746578742D616C69676E3A6C6566743B0A7D0A2E64672D6C626C7B206761703A2E3472656D3B206261636B67726F756E643A766172282D2D64672D6C626C2D62';
wwv_flow_imp.g_varchar2_table(33) := '67293B20636F6C6F723A766172282D2D64672D6C626C2D6667293B0A2020666F6E742D7765696768743A3630303B20626F726465722D72696768743A31707820736F6C696420766172282D2D64672D6C696E65293B207D0A2E64672D76616C7B20676170';
wwv_flow_imp.g_varchar2_table(34) := '3A2E343572656D3B20636F6C6F723A766172282D2D64672D76616C2D6667293B20666F6E742D7765696768743A3530303B207D0A0A2F2A206F70742D696E20736D616C6C2D63617073206C6162656C2074726561746D656E74202A2F0A2E64672D2D7570';
wwv_flow_imp.g_varchar2_table(35) := '706572202E64672D6C626C7B20746578742D7472616E73666F726D3A7570706572636173653B206C65747465722D73706163696E673A2E3037656D3B0A2020666F6E742D73697A653A63616C6328766172282D2D64672D73697A6529202D20322E357078';
wwv_flow_imp.g_varchar2_table(36) := '293B20666F6E742D7765696768743A3730303B207D0A0A2E64672D6C626C2E616C2D52494748542C202E64672D76616C2E616C2D52494748547B206A7573746966792D636F6E74656E743A666C65782D656E643B20746578742D616C69676E3A72696768';
wwv_flow_imp.g_varchar2_table(37) := '743B207D0A2E64672D6C626C2E616C2D43454E5445522C202E64672D76616C2E616C2D43454E5445527B206A7573746966792D636F6E74656E743A63656E7465723B20746578742D616C69676E3A63656E7465723B207D0A0A2F2A2076616C7565207374';
wwv_flow_imp.g_varchar2_table(38) := '796C696E67202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D7478742E69732D626F6C647B20666F6E742D7765696768743A3730303B';
wwv_flow_imp.g_varchar2_table(39) := '207D0A2E64672D7478742E69732D6974616C69637B20666F6E742D7374796C653A6974616C69633B207D0A2E64672D7478742E69732D756E6465726C696E657B20746578742D6465636F726174696F6E3A756E6465726C696E653B20746578742D756E64';
wwv_flow_imp.g_varchar2_table(40) := '65726C696E652D6F66667365743A3270783B207D0A2E64672D7478742E69732D686967686C696768747B206261636B67726F756E643A766172282D2D64672D686C2C72676261283235352C3232362C3132302C2E353529293B0A202070616464696E673A';
wwv_flow_imp.g_varchar2_table(41) := '2E3035656D202E33656D3B20626F726465722D7261646975733A3370783B0A2020626F782D6465636F726174696F6E2D627265616B3A636C6F6E653B202D7765626B69742D626F782D6465636F726174696F6E2D627265616B3A636C6F6E653B207D0A2E';
wwv_flow_imp.g_varchar2_table(42) := '64672D7478742E69732D6D6F6E6F7B20666F6E742D66616D696C793A766172282D2D612D666F6E742D66616D696C792D6D6F6E6F2C75692D6D6F6E6F73706163652C6D6F6E6F7370616365293B0A2020666F6E742D73697A653A63616C6328766172282D';
wwv_flow_imp.g_varchar2_table(43) := '2D64672D73697A6529202D202E357078293B207D0A2E64672D7478742E69732D6E756D7B20666F6E742D76617269616E742D6E756D657269633A746162756C61722D6E756D733B207D0A2E64672D7478742E69732D6E756C6C7B20636F6C6F723A766172';
wwv_flow_imp.g_varchar2_table(44) := '282D2D64672D6C626C2D6667293B20666F6E742D7765696768743A3430303B207D0A2E64672D76616C20617B20636F6C6F723A766172282D2D64672D616363656E74293B20746578742D6465636F726174696F6E3A6E6F6E653B20666F6E742D77656967';
wwv_flow_imp.g_varchar2_table(45) := '68743A3630303B207D0A2E64672D76616C20613A686F7665727B20746578742D6465636F726174696F6E3A756E6465726C696E653B207D0A0A2E64672D69636F7B20666C65783A302030206175746F3B20636F6C6F723A766172282D2D64672D6C626C2D';
wwv_flow_imp.g_varchar2_table(46) := '6667293B20666F6E742D73697A653A2E3935656D3B207D0A2E64672D69636F2E69732D636C69636B61626C657B20637572736F723A706F696E7465723B20626F726465723A303B206261636B67726F756E643A6E6F6E653B2070616464696E673A327078';
wwv_flow_imp.g_varchar2_table(47) := '3B0A2020626F726465722D7261646975733A3470783B20636F6C6F723A696E68657269743B207D0A2E64672D69636F2E69732D636C69636B61626C653A686F7665727B20636F6C6F723A766172282D2D64672D616363656E74293B206261636B67726F75';
wwv_flow_imp.g_varchar2_table(48) := '6E643A766172282D2D64672D6C626C2D6267293B207D0A0A2F2A20626164676573202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A';
wwv_flow_imp.g_varchar2_table(49) := '2F0A2E64672D62616467657B20646973706C61793A696E6C696E652D666C65783B20616C69676E2D6974656D733A63656E7465723B206761703A2E3472656D3B0A2020666F6E742D73697A653A63616C6328766172282D2D64672D73697A6529202D2032';
wwv_flow_imp.g_varchar2_table(50) := '2E357078293B20666F6E742D7765696768743A3730303B206C65747465722D73706163696E673A2E3035656D3B0A2020746578742D7472616E73666F726D3A7570706572636173653B2077686974652D73706163653A6E6F777261703B0A20202D2D622D';
wwv_flow_imp.g_varchar2_table(51) := '66673A766172282D2D64672D6D75746564293B202D2D622D62673A766172282D2D64672D74696E74293B207D0A2E64672D62616467652E622D736F66747B2070616464696E673A2E323272656D202E363872656D3B20626F726465722D7261646975733A';
wwv_flow_imp.g_varchar2_table(52) := '39393970783B0A2020636F6C6F723A766172282D2D622D6667293B206261636B67726F756E643A766172282D2D622D6267293B207D0A2E64672D62616467652E622D736F6C69647B2070616464696E673A2E323272656D202E363872656D3B20626F7264';
wwv_flow_imp.g_varchar2_table(53) := '65722D7261646975733A39393970783B0A2020636F6C6F723A236666663B206261636B67726F756E643A766172282D2D622D6667293B207D0A2E64672D62616467652E622D6F75746C696E657B2070616464696E673A2E3272656D202E363672656D3B20';
wwv_flow_imp.g_varchar2_table(54) := '626F726465722D7261646975733A39393970783B0A2020636F6C6F723A766172282D2D622D6667293B206261636B67726F756E643A7472616E73706172656E743B20626F726465723A312E35707820736F6C69642063757272656E74436F6C6F723B207D';
wwv_flow_imp.g_varchar2_table(55) := '0A2E64672D62616467652E622D646F747B20636F6C6F723A766172282D2D64672D76616C2D6667293B206261636B67726F756E643A6E6F6E653B2070616464696E673A303B0A2020746578742D7472616E73666F726D3A6E6F6E653B206C65747465722D';
wwv_flow_imp.g_varchar2_table(56) := '73706163696E673A303B20666F6E742D73697A653A766172282D2D64672D73697A65293B0A2020666F6E742D7765696768743A3630303B207D0A2E64672D62616467652E622D646F743A3A6265666F72657B20636F6E74656E743A22223B207769647468';
wwv_flow_imp.g_varchar2_table(57) := '3A3870783B206865696768743A3870783B20626F726465722D7261646975733A3530253B0A20206261636B67726F756E643A766172282D2D622D6667293B20626F782D736861646F773A30203020302033707820766172282D2D622D6267293B20666C65';
wwv_flow_imp.g_varchar2_table(58) := '783A302030206175746F3B207D0A2E64672D62616467652E622D6261727B20636F6C6F723A766172282D2D64672D76616C2D6667293B206261636B67726F756E643A766172282D2D622D6267293B0A202070616464696E673A2E323272656D202E367265';
wwv_flow_imp.g_varchar2_table(59) := '6D202E323272656D202E353572656D3B20626F726465722D6C6566743A33707820736F6C696420766172282D2D622D6667293B0A2020626F726465722D7261646975733A3370783B20746578742D7472616E73666F726D3A6E6F6E653B206C6574746572';
wwv_flow_imp.g_varchar2_table(60) := '2D73706163696E673A303B0A2020666F6E742D73697A653A766172282D2D64672D73697A65293B207D0A0A2F2A20746F6F6C746970202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(61) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D7469707B20706F736974696F6E3A72656C61746976653B20637572736F723A68656C703B20626F726465722D626F74746F6D3A31707820646F747465642063757272656E74436F6C6F723B';
wwv_flow_imp.g_varchar2_table(62) := '207D0A2E64672D7469702E7469702D636C69636B7B20637572736F723A706F696E7465723B207D0A2E64672D7469703A3A61667465727B0A2020636F6E74656E743A6174747228646174612D746970293B20706F736974696F6E3A6162736F6C7574653B';
wwv_flow_imp.g_varchar2_table(63) := '206C6566743A303B20626F74746F6D3A63616C632831303025202B20377078293B0A20207A2D696E6465783A35303B206D696E2D77696474683A31323070783B206D61782D77696474683A32383070783B2077696474683A6D61782D636F6E74656E743B';
wwv_flow_imp.g_varchar2_table(64) := '0A202070616464696E673A2E343572656D202E3672656D3B20626F726465722D7261646975733A3770783B0A20206261636B67726F756E643A766172282D2D64672D7469702D6267293B20636F6C6F723A766172282D2D64672D7469702D6667293B2066';
wwv_flow_imp.g_varchar2_table(65) := '6F6E742D73697A653A31312E3570783B20666F6E742D7765696768743A3530303B0A20206C696E652D6865696768743A312E33353B206C65747465722D73706163696E673A303B20746578742D7472616E73666F726D3A6E6F6E653B2077686974652D73';
wwv_flow_imp.g_varchar2_table(66) := '706163653A6E6F726D616C3B0A2020626F782D736861646F773A30203670782031387078202D367078207267626128302C302C302C2E3435293B0A20206F7061636974793A303B207669736962696C6974793A68696464656E3B207472616E73666F726D';
wwv_flow_imp.g_varchar2_table(67) := '3A7472616E736C6174655928337078293B0A20207472616E736974696F6E3A6F706163697479202E31327320656173652C207472616E73666F726D202E31327320656173653B0A7D0A2E64672D7469702E7469702D686F7665723A686F7665723A3A6166';
wwv_flow_imp.g_varchar2_table(68) := '7465722C0A2E64672D7469702E7469702D636C69636B2E69732D6F70656E3A3A61667465727B206F7061636974793A313B207669736962696C6974793A76697369626C653B0A20207472616E73666F726D3A7472616E736C617465592830293B207D0A0A';
wwv_flow_imp.g_varchar2_table(69) := '2F2A20696E6C696E6520656469746F7273202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D656469747B0A202077696474683A31303025';
wwv_flow_imp.g_varchar2_table(70) := '3B206D696E2D77696474683A303B20666F6E743A696E68657269743B20636F6C6F723A696E68657269743B0A202070616464696E673A2E323272656D202E343572656D3B20626F726465722D7261646975733A3570783B0A2020626F726465723A317078';
wwv_flow_imp.g_varchar2_table(71) := '20736F6C6964207472616E73706172656E743B206261636B67726F756E643A7472616E73706172656E743B0A20207472616E736974696F6E3A626F726465722D636F6C6F72202E31327320656173652C206261636B67726F756E64202E31327320656173';
wwv_flow_imp.g_varchar2_table(72) := '653B0A7D0A2E64672D656469743A686F7665727B20626F726465722D636F6C6F723A766172282D2D64672D6C696E65293B206261636B67726F756E643A766172282D2D64672D6C626C2D6267293B207D0A2E64672D656469743A666F6375737B206F7574';
wwv_flow_imp.g_varchar2_table(73) := '6C696E653A6E6F6E653B20626F726465722D636F6C6F723A766172282D2D64672D616363656E74293B0A20206261636B67726F756E643A766172282D2D64672D6267293B20626F782D736861646F773A302030203020337078207267626128352C313134';
wwv_flow_imp.g_varchar2_table(74) := '2C3230362C2E3134293B207D0A2E64672D656469742E69732D627573797B206F7061636974793A2E35353B20706F696E7465722D6576656E74733A6E6F6E653B207D0A2E64672D656469742E69732D6F6B7B20626F726465722D636F6C6F723A23314137';
wwv_flow_imp.g_varchar2_table(75) := '4634333B207D0A2E64672D656469742E69732D6572727B20626F726465722D636F6C6F723A233841314632423B207D0A2E64672D76616C2E616C2D5249474854202E64672D656469747B20746578742D616C69676E3A72696768743B207D0A2E64672D76';
wwv_flow_imp.g_varchar2_table(76) := '616C2E616C2D43454E544552202E64672D656469747B20746578742D616C69676E3A63656E7465723B207D0A0A2E64672D656D7074797B2070616464696E673A312E3472656D203172656D3B20746578742D616C69676E3A63656E7465723B20636F6C6F';
wwv_flow_imp.g_varchar2_table(77) := '723A766172282D2D64672D6C626C2D6667293B0A2020666F6E742D73697A653A766172282D2D64672D73697A65293B207D0A2E64672D656D7074792E64672D6572726F727B20636F6C6F723A233841314632423B207D0A2E64672D656D7074792E64672D';
wwv_flow_imp.g_varchar2_table(78) := '6572726F7220636F64657B20646973706C61793A696E6C696E652D626C6F636B3B206D617267696E2D746F703A2E3472656D3B20666F6E742D73697A653A31312E3570783B0A2020636F6C6F723A766172282D2D64672D6C626C2D6667293B2077686974';
wwv_flow_imp.g_varchar2_table(79) := '652D73706163653A7072652D777261703B20746578742D616C69676E3A6C6566743B207D0A2E64672D726F6F747B20706F736974696F6E3A72656C61746976653B207D0A2E64672D636F70797B20626F726465723A303B206261636B67726F756E643A6E';
wwv_flow_imp.g_varchar2_table(80) := '6F6E653B20637572736F723A706F696E7465723B2070616464696E673A327078203470783B0A2020636F6C6F723A766172282D2D64672D6C626C2D6667293B206F7061636974793A2E353B20626F726465722D7261646975733A3470783B206C696E652D';
wwv_flow_imp.g_varchar2_table(81) := '6865696768743A313B0A2020666C65783A302030206175746F3B207D0A2E64672D636F70793A686F7665727B206F7061636974793A313B206261636B67726F756E643A766172282D2D64672D6C626C2D6267293B207D0A2E64672D6974656D3A666F6375';
wwv_flow_imp.g_varchar2_table(82) := '732D77697468696E202E64672D636F70797B206F7061636974793A313B207D0A0A2E64672D64656275677B206D617267696E3A30203020313270783B2070616464696E673A3130707820313270783B20626F726465722D7261646975733A3870783B0A20';
wwv_flow_imp.g_varchar2_table(83) := '20626F726465723A3170782064617368656420236235383930303B206261636B67726F756E643A236666666265363B20636F6C6F723A233563346130303B0A2020666F6E742D66616D696C793A75692D6D6F6E6F73706163652C6D6F6E6F73706163653B';
wwv_flow_imp.g_varchar2_table(84) := '20666F6E742D73697A653A31312E3570783B206C696E652D6865696768743A312E35353B0A202077686974652D73706163653A7072652D777261703B206F766572666C6F772D783A6175746F3B207D0A0A406D6564696120286D61782D77696474683A36';
wwv_flow_imp.g_varchar2_table(85) := '34307078297B0A20202E64672D2D737461636B7B20677269642D74656D706C6174652D636F6C756D6E733A3166722021696D706F7274616E743B202D2D64672D6C773A31313870782021696D706F7274616E743B207D0A20202E64672D2D737461636B20';
wwv_flow_imp.g_varchar2_table(86) := '2E64672D6974656D7B20677269642D636F6C756D6E3A312021696D706F7274616E743B20626F726465722D72696768743A303B207D0A20202F2A2066696C6C657273206F6E6C7920737175617265206F66662061206D756C74692D636F6C756D6E20726F';
wwv_flow_imp.g_varchar2_table(87) := '773B20737461636B656420746865792061726520656D70747920726F7773202A2F0A20202E64672D2D737461636B202E64672D6974656D2E64672D66696C6C65727B20646973706C61793A6E6F6E653B207D0A7D0A406D65646961202870726566657273';
wwv_flow_imp.g_varchar2_table(88) := '2D726564756365642D6D6F74696F6E3A726564756365297B0A20202E64672D7469703A3A61667465722C2E64672D656469747B207472616E736974696F6E3A6E6F6E653B207D0A7D0A0A2F2A2065646974206166666F7264616E636573202D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(89) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2F2A206564697461626C652076616C7565732073697420696E202E64672D766965773A206B6565702069636F6E2C2061';
wwv_flow_imp.g_varchar2_table(90) := '76617461722C2062617220616E642074657874207370616365640A2020207468652073616D652077617920617320696E206120726561642D6F6E6C792063656C6C202A2F0A2E64672D766965777B20646973706C61793A666C65783B20616C69676E2D69';
wwv_flow_imp.g_varchar2_table(91) := '74656D733A63656E7465723B206761703A2E343572656D3B20666C65783A312031206175746F3B0A20206D696E2D77696474683A303B206F766572666C6F772D777261703A616E7977686572653B207D0A2E64672D6564697462746E7B0A2020666C6578';
wwv_flow_imp.g_varchar2_table(92) := '3A302030206175746F3B0A2020626F726465723A303B206261636B67726F756E643A6E6F6E653B20637572736F723A706F696E7465723B2070616464696E673A337078203570783B0A2020636F6C6F723A766172282D2D64672D6C626C2D6667293B206F';
wwv_flow_imp.g_varchar2_table(93) := '7061636974793A2E35353B20626F726465722D7261646975733A3470783B206C696E652D6865696768743A313B0A20207472616E736974696F6E3A6F706163697479202E31327320656173652C20636F6C6F72202E31327320656173653B0A7D0A2E6467';
wwv_flow_imp.g_varchar2_table(94) := '2D6974656D3A686F766572202E64672D6564697462746E2C0A2E64672D6974656D3A666F6375732D77697468696E202E64672D6564697462746E7B206F7061636974793A313B207D0A2E64672D6564697462746E3A686F7665727B206F7061636974793A';
wwv_flow_imp.g_varchar2_table(95) := '313B20636F6C6F723A766172282D2D64672D616363656E74293B206261636B67726F756E643A766172282D2D64672D6C626C2D6267293B207D0A2E64672D65646974777261707B20646973706C61793A666C65783B20616C69676E2D6974656D733A6365';
wwv_flow_imp.g_varchar2_table(96) := '6E7465723B206761703A2E3372656D3B2077696474683A313030253B206D696E2D77696474683A303B207D0A2E64672D65646974777261705B68696464656E5D7B20646973706C61793A6E6F6E653B207D0A2E64672D62746E7B0A2020666C65783A3020';
wwv_flow_imp.g_varchar2_table(97) := '30206175746F3B20626F726465723A31707820736F6C696420766172282D2D64672D6C696E65293B206261636B67726F756E643A766172282D2D64672D6267293B0A2020637572736F723A706F696E7465723B2070616464696E673A337078203770783B';
wwv_flow_imp.g_varchar2_table(98) := '20626F726465722D7261646975733A3570783B206C696E652D6865696768743A313B0A2020636F6C6F723A766172282D2D64672D6C626C2D6667293B0A7D0A2E64672D62746E3A686F7665727B206261636B67726F756E643A766172282D2D64672D6C62';
wwv_flow_imp.g_varchar2_table(99) := '6C2D6267293B207D0A2E64672D736176653A686F7665727B20636F6C6F723A233141374634333B20626F726465722D636F6C6F723A233141374634333B207D0A2E64672D63616E63656C3A686F7665727B20636F6C6F723A233841314632423B20626F72';
wwv_flow_imp.g_varchar2_table(100) := '6465722D636F6C6F723A233841314632423B207D0A2E64672D6564697477726170202E64672D656469747B20626F726465722D636F6C6F723A766172282D2D64672D6C696E65293B206261636B67726F756E643A766172282D2D64672D6267293B207D0A';
wwv_flow_imp.g_varchar2_table(101) := '0A2F2A2073617665202F2063616E63656C20627574746F6E73202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D62746E2E64672D736176657B0A202063';
wwv_flow_imp.g_varchar2_table(102) := '6F6C6F723A236666663B206261636B67726F756E643A233141374634333B20626F726465722D636F6C6F723A233136364233393B0A7D0A2E64672D62746E2E64672D736176653A686F7665723A6E6F74283A64697361626C6564297B206261636B67726F';
wwv_flow_imp.g_varchar2_table(103) := '756E643A233136364233393B207D0A2E64672D62746E2E64672D63616E63656C7B0A2020636F6C6F723A236666663B206261636B67726F756E643A233841314632423B20626F726465722D636F6C6F723A233736313932353B0A7D0A2E64672D62746E2E';
wwv_flow_imp.g_varchar2_table(104) := '64672D63616E63656C3A686F7665723A6E6F74283A64697361626C6564297B206261636B67726F756E643A233736313932353B207D0A2E64672D62746E3A64697361626C65647B206F7061636974793A2E363B20637572736F723A64656661756C743B20';
wwv_flow_imp.g_varchar2_table(105) := '7D0A2E64672D62746E2E69732D7370696E6E696E677B20706F696E7465722D6576656E74733A6E6F6E653B207D0A406B65796672616D65732064672D7370696E7B20746F207B207472616E73666F726D3A726F7461746528333630646567293B207D207D';
wwv_flow_imp.g_varchar2_table(106) := '0A2E66612D616E696D2D7370696E7B20646973706C61793A696E6C696E652D626C6F636B3B20616E696D6174696F6E3A64672D7370696E202E3873206C696E65617220696E66696E6974653B207D0A406D656469612028707265666572732D7265647563';
wwv_flow_imp.g_varchar2_table(107) := '65642D6D6F74696F6E3A726564756365297B202E66612D616E696D2D7370696E7B20616E696D6174696F6E3A6E6F6E653B207D207D0A0A2F2A20726567696F6E2D6C6576656C207374796C6520686F6F6B73202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(108) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D2D636172647B20626F726465722D7261646975733A766172282D2D64672D7261646975732C31327078293B20626F726465722D7374796C653A766172282D2D';
wwv_flow_imp.g_varchar2_table(109) := '64672D627374796C652C736F6C6964293B207D0A2E64672D6974656D7B20626F726465722D626F74746F6D2D7374796C653A766172282D2D64672D627374796C652C736F6C6964293B0A20202020202020202020626F726465722D72696768742D737479';
wwv_flow_imp.g_varchar2_table(110) := '6C653A766172282D2D64672D627374796C652C736F6C6964293B207D0A2E64672D6C626C7B20626F726465722D72696768742D7374796C653A766172282D2D64672D627374796C652C736F6C6964293B207D0A0A2F2A2070657263656E7420626172202D';
wwv_flow_imp.g_varchar2_table(111) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D6261727B0A2020666C65783A312031206175746F3B206D696E2D77696474683A36';
wwv_flow_imp.g_varchar2_table(112) := '3070783B206D61782D77696474683A32323070783B206865696768743A3870783B0A2020626F726465722D7261646975733A39393970783B206261636B67726F756E643A766172282D2D64672D6C626C2D6267293B0A2020626F782D736861646F773A69';
wwv_flow_imp.g_varchar2_table(113) := '6E7365742030203020302031707820766172282D2D64672D6C696E65293B206F766572666C6F773A68696464656E3B0A2020646973706C61793A626C6F636B3B0A7D0A2E64672D6261722D66696C6C7B0A2020646973706C61793A626C6F636B3B206865';
wwv_flow_imp.g_varchar2_table(114) := '696768743A313030253B20626F726465722D7261646975733A39393970783B0A20206261636B67726F756E643A766172282D2D64672D616363656E74293B0A20207472616E736974696F6E3A7769647468202E3335732063756269632D62657A69657228';
wwv_flow_imp.g_varchar2_table(115) := '2E342C302C2E322C31293B0A7D0A2E64672D6261722D6E756D7B20666C65783A302030206175746F3B20666F6E742D76617269616E742D6E756D657269633A746162756C61722D6E756D733B0A2020666F6E742D73697A653A63616C6328766172282D2D';
wwv_flow_imp.g_varchar2_table(116) := '64672D73697A6529202D20317078293B20636F6C6F723A766172282D2D64672D6C626C2D6667293B207D0A0A2F2A20617474656E74696F6E20626C696E6B202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(117) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A406B65796672616D65732064672D626C696E6B7B2030252C313030257B206F7061636974793A313B207D203530257B206F7061636974793A2E32383B207D207D0A2E64672D7478742E69732D62';
wwv_flow_imp.g_varchar2_table(118) := '6C696E6B7B20616E696D6174696F6E3A64672D626C696E6B20312E317320656173652D696E2D6F757420696E66696E6974653B20666F6E742D7765696768743A3730303B207D0A406D656469612028707265666572732D726564756365642D6D6F74696F';
wwv_flow_imp.g_varchar2_table(119) := '6E3A726564756365297B0A20202E64672D7478742E69732D626C696E6B7B20616E696D6174696F6E3A6E6F6E653B206F75746C696E653A32707820736F6C69642063757272656E74436F6C6F723B0A202020206F75746C696E652D6F66667365743A3270';
wwv_flow_imp.g_varchar2_table(120) := '783B20626F726465722D7261646975733A3370783B207D0A7D0A0A2F2A2073656172636861626C6520656469746F72202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(121) := '2D2D202A2F0A2E64672D656469747772617020696E7075745B6C6973745D7B206D696E2D77696474683A303B207D0A0A2F2A206C61796F757420636F6E66696775726174696F6E202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(122) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D746F6F6C6261727B20706F736974696F6E3A72656C61746976653B20646973706C61793A666C65783B206A7573746966792D636F6E74656E743A666C65782D656E643B0A20';
wwv_flow_imp.g_varchar2_table(123) := '206D617267696E2D626F74746F6D3A3670783B207D0A2E64672D63666762746E7B20626F726465723A31707820736F6C696420766172282D2D64672D6C696E652C7267626128302C302C302C2E3129293B206261636B67726F756E643A7472616E737061';
wwv_flow_imp.g_varchar2_table(124) := '72656E743B0A2020637572736F723A706F696E7465723B2070616464696E673A34707820313070783B20626F726465722D7261646975733A3670783B20666F6E742D73697A653A313270783B0A2020636F6C6F723A766172282D2D64672D6D7574656429';
wwv_flow_imp.g_varchar2_table(125) := '3B207D0A2E64672D63666762746E3A686F7665727B206261636B67726F756E643A766172282D2D64672D686F766572293B207D0A2E64672D63666770616E656C7B0A2020706F736974696F6E3A6162736F6C7574653B20746F703A313030253B20726967';
wwv_flow_imp.g_varchar2_table(126) := '68743A303B207A2D696E6465783A36303B2077696474683A32383070783B0A20206D617267696E2D746F703A3470783B2070616464696E673A313070783B20626F726465722D7261646975733A313070783B0A20206261636B67726F756E643A76617228';
wwv_flow_imp.g_varchar2_table(127) := '2D2D64672D73757266616365293B20636F6C6F723A766172282D2D64672D74657874293B20626F726465723A31707820736F6C696420766172282D2D64672D706F702D6C696E65293B0A2020626F782D736861646F773A3020313070782033307078202D';
wwv_flow_imp.g_varchar2_table(128) := '387078207267626128302C302C302C2E33293B0A7D0A2E64672D636667686561647B20666F6E742D73697A653A313270783B20666F6E742D7765696768743A3730303B20746578742D7472616E73666F726D3A7570706572636173653B0A20206C657474';
wwv_flow_imp.g_varchar2_table(129) := '65722D73706163696E673A2E3036656D3B20636F6C6F723A766172282D2D64672D6D75746564293B206D617267696E2D626F74746F6D3A3870783B207D0A2E64672D6366676C6973747B206C6973742D7374796C653A6E6F6E653B206D617267696E3A30';
wwv_flow_imp.g_varchar2_table(130) := '3B2070616464696E673A303B206F766572666C6F772D793A6175746F3B207D0A2E64672D6366676C697374206C697B20646973706C61793A666C65783B20616C69676E2D6974656D733A63656E7465723B206761703A3870783B2070616464696E673A35';
wwv_flow_imp.g_varchar2_table(131) := '7078203670783B0A2020626F726465722D7261646975733A3670783B20666F6E742D73697A653A313370783B20637572736F723A677261623B207D0A2E64672D6366676C697374206C693A686F7665727B206261636B67726F756E643A766172282D2D64';
wwv_flow_imp.g_varchar2_table(132) := '672D686F766572293B207D0A2E64672D6366676C697374206C692E69732D6472616767696E677B206F7061636974793A2E34353B207D0A2E64672D647261677B20636F6C6F723A766172282D2D64672D6661696E74293B20637572736F723A677261623B';
wwv_flow_imp.g_varchar2_table(133) := '207D0A2E64672D6366676C697374206C6162656C7B206D617267696E3A303B20666F6E742D7765696768743A3530303B20646973706C61793A666C65783B20616C69676E2D6974656D733A63656E7465723B0A20206761703A3670783B207D0A2E64672D';
wwv_flow_imp.g_varchar2_table(134) := '6366676C697374202E64672D66697865647B20636F6C6F723A766172282D2D64672D6D75746564293B207D0A2E64672D636667666F6F747B20646973706C61793A666C65783B206A7573746966792D636F6E74656E743A666C65782D656E643B20676170';
wwv_flow_imp.g_varchar2_table(135) := '3A3670783B206D617267696E2D746F703A313070783B0A202070616464696E672D746F703A3870783B20626F726465722D746F703A31707820736F6C696420766172282D2D64672D6C696E652C7267626128302C302C302C2E3129293B207D0A2E64672D';
wwv_flow_imp.g_varchar2_table(136) := '6974656D2E64672D68696464656E7B20646973706C61793A6E6F6E653B207D0A0A2F2A20626C696E6B206E6F772073697473206F6E207468652076616C75652063656C6C202A2F0A2E64672D76616C2E69732D626C696E6B7B20616E696D6174696F6E3A';
wwv_flow_imp.g_varchar2_table(137) := '64672D626C696E6B20312E317320656173652D696E2D6F757420696E66696E6974653B207D0A406D656469612028707265666572732D726564756365642D6D6F74696F6E3A726564756365297B0A20202E64672D76616C2E69732D626C696E6B7B20616E';
wwv_flow_imp.g_varchar2_table(138) := '696D6174696F6E3A6E6F6E653B20626F782D736861646F773A696E73657420337078203020302063757272656E74436F6C6F723B207D0A7D0A0A2F2A20636F6D626F626F78202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(139) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D636F6D626F7B20706F736974696F6E3A72656C61746976653B20666C65783A312031206175746F3B206D696E2D77696474683A303B20646973706C';
wwv_flow_imp.g_varchar2_table(140) := '61793A626C6F636B3B207D0A2E64672D636F6D626F2D696E7075747B2077696474683A313030253B2070616464696E672D72696768743A312E3972656D3B207D0A2F2A20666978656420746F207468652076696577706F72742028706F736974696F6E65';
wwv_flow_imp.g_varchar2_table(141) := '6420627920746865207363726970742920736F206E6F20636172642063616E20636C6970206974202A2F0A2E64672D636F6D626F2D6C6973747B0A2020706F736974696F6E3A66697865643B207A2D696E6465783A313030303B206C6566743A303B2074';
wwv_flow_imp.g_varchar2_table(142) := '6F703A303B0A20206D617267696E3A303B2070616464696E673A3470783B206C6973742D7374796C653A6E6F6E653B206D61782D6865696768743A32383070783B206F766572666C6F772D793A6175746F3B0A20206261636B67726F756E643A76617228';
wwv_flow_imp.g_varchar2_table(143) := '2D2D64672D73757266616365293B20636F6C6F723A766172282D2D64672D74657874293B20626F726465723A31707820736F6C696420766172282D2D64672D706F702D6C696E65293B0A2020626F726465722D7261646975733A3870783B20626F782D73';
wwv_flow_imp.g_varchar2_table(144) := '6861646F773A3020313070782032367078202D387078207267626128302C302C302C2E33293B0A2020646973706C61793A6E6F6E653B0A7D0A2E64672D636F6D626F2D6C6973742E69732D6F70656E7B20646973706C61793A626C6F636B3B207D0A2E64';
wwv_flow_imp.g_varchar2_table(145) := '672D636F6D626F2D6C697374206C697B2070616464696E673A357078203870783B20626F726465722D7261646975733A3570783B20666F6E742D73697A653A313370783B0A2020637572736F723A706F696E7465723B207D0A2E64672D636F6D626F2D6C';
wwv_flow_imp.g_varchar2_table(146) := '697374206C693A686F7665727B206261636B67726F756E643A766172282D2D64672D686F766572293B207D0A2E64672D636F6D626F2D6C697374202E64672D636F6D626F2D6D6F72657B0A2020746578742D616C69676E3A63656E7465723B20666F6E74';
wwv_flow_imp.g_varchar2_table(147) := '2D7765696768743A3630303B20636F6C6F723A766172282D2D75742D70616C657474652D7072696D6172792C23303537326365293B0A2020626F726465722D746F703A31707820736F6C696420766172282D2D64672D6C696E652C7267626128302C302C';
wwv_flow_imp.g_varchar2_table(148) := '302C2E3129293B206D617267696E2D746F703A3370783B0A7D0A2E64672D636F6D626F2D6C697374202E64672D636F6D626F2D6E6F6E657B20636F6C6F723A766172282D2D64672D6661696E74293B20637572736F723A64656661756C743B207D0A2E64';
wwv_flow_imp.g_varchar2_table(149) := '672D636F6D626F2D6C697374202E64672D636F6D626F2D6E6F6E653A686F7665727B206261636B67726F756E643A6E6F6E653B207D0A0A2F2A20636F6E66696775726520747269676765723A20736C696D2062616E6E6572202D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(150) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D746F6F6C6261722E64672D6366672D62616E6E65727B0A20206A7573746966792D636F6E74656E743A666C65782D656E643B206D617267696E3A3020302034';
wwv_flow_imp.g_varchar2_table(151) := '70783B0A2020626F726465722D746F703A32707820736F6C696420766172282D2D64672D6C696E652C7267626128302C302C302C2E3129293B0A2020626F726465722D7261646975733A34707820347078203020303B0A7D0A2E64672D6366672D62616E';
wwv_flow_imp.g_varchar2_table(152) := '6E6572202E64672D63666762746E7B0A2020626F726465723A303B206261636B67726F756E643A6E6F6E653B2070616464696E673A317078203670783B20666F6E742D73697A653A313170783B206C696E652D6865696768743A312E353B0A20206F7061';
wwv_flow_imp.g_varchar2_table(153) := '636974793A2E35353B20626F726465722D7261646975733A303B0A7D0A2E64672D6366672D62616E6E6572202E64672D63666762746E3A686F7665727B206F7061636974793A313B206261636B67726F756E643A6E6F6E653B0A2020636F6C6F723A7661';
wwv_flow_imp.g_varchar2_table(154) := '72282D2D75742D70616C657474652D7072696D6172792C23303537326365293B207D0A2E64672D6366672D62616E6E6572202E64672D636667746578747B206D617267696E2D6C6566743A3470783B207D0A0A2F2A20636F6E6669677572652074726967';
wwv_flow_imp.g_varchar2_table(155) := '6765723A2068696464656E20756E74696C20646F75626C6520636C69636B202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D746F6F6C6261722E64672D6366672D64626C636C69636B7B206865696768743A303B20';
wwv_flow_imp.g_varchar2_table(156) := '6D617267696E3A303B206F766572666C6F773A76697369626C653B207D0A2E64672D6366672D64626C636C69636B202E64672D63666762746E7B20646973706C61793A6E6F6E653B207D0A2E64672D2D636F6E666967757261626C657B20637572736F72';
wwv_flow_imp.g_varchar2_table(157) := '3A64656661756C743B207D0A0A2F2A20666C6F6174696E6720636F6E66696775726520636F6E74726F6C202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D746F6F6C62';
wwv_flow_imp.g_varchar2_table(158) := '61727B20646973706C61793A6E6F6E653B207D0A2E64672D636667686F73747B20706F736974696F6E3A72656C61746976653B207D0A2F2A2074686520636F6E74726F6C207369747320696E207468652072696768742D68616E6420736C6F74206F6620';
wwv_flow_imp.g_varchar2_table(159) := '746865206C6173742076697369626C6520726F77202A2F0A2E64672D656E64203E202E64672D63666762746E7B0A2020646973706C61793A696E6C696E652D666C65783B20616C69676E2D6974656D733A63656E7465723B206761703A3570783B0A2020';
wwv_flow_imp.g_varchar2_table(160) := '70616464696E673A337078203970783B20626F726465722D7261646975733A39393970783B0A2020626F726465723A31707820736F6C6964207472616E73706172656E743B206261636B67726F756E643A7472616E73706172656E743B0A2020636F6C6F';
wwv_flow_imp.g_varchar2_table(161) := '723A766172282D2D64672D6D75746564293B0A2020666F6E742D73697A653A31312E3570783B20637572736F723A706F696E7465723B206C696E652D6865696768743A312E363B0A20206F7061636974793A303B207472616E736974696F6E3A6F706163';
wwv_flow_imp.g_varchar2_table(162) := '697479202E31347320656173652C20626F726465722D636F6C6F72202E31347320656173653B0A7D0A2E64672D636667686F73743A686F766572202E64672D63666762746E2C0A2E64672D636667686F7374202E64672D63666762746E3A666F6375732D';
wwv_flow_imp.g_varchar2_table(163) := '76697369626C657B206F7061636974793A2E373B207D0A2E64672D656E64203E202E64672D63666762746E3A686F7665727B206F7061636974793A313B0A2020636F6C6F723A766172282D2D75742D70616C657474652D7072696D6172792C2330353732';
wwv_flow_imp.g_varchar2_table(164) := '6365293B0A20206261636B67726F756E643A766172282D2D64672D6C626C2D62672C7267626128302C302C302C2E303429293B0A7D0A2E64672D656E64203E202E64672D63666762746E202E64672D636667746578747B20646973706C61793A6E6F6E65';
wwv_flow_imp.g_varchar2_table(165) := '3B207D0A0A2E64672D63666770616E656C7B20646973706C61793A666C65783B20666C65782D646972656374696F6E3A636F6C756D6E3B2077696474683A33303070783B207D0A2E64672D63666770616E656C202E64672D6366676C6973747B20666C65';
wwv_flow_imp.g_varchar2_table(166) := '783A312031206175746F3B206D696E2D6865696768743A303B206D61782D6865696768743A6E6F6E653B207D0A0A2F2A206E6576657220626C696E6B2061206669656C642074686174206973206265696E6720656469746564202D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(167) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D6974656D2E69732D65646974696E67202E64672D76616C2E69732D626C696E6B7B20616E696D6174696F6E3A6E6F6E653B207D0A2E64672D76616C3A686173282E64672D656469';
wwv_flow_imp.g_varchar2_table(168) := '74777261703A6E6F74285B68696464656E5D29292E69732D626C696E6B7B20616E696D6174696F6E3A6E6F6E653B207D0A0A0A2F2A20746F67676C6520737769746368202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(169) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D7377697463687B20646973706C61793A696E6C696E652D666C65783B20616C69676E2D6974656D733A63656E7465723B206761703A3870783B20637572736F723A70';
wwv_flow_imp.g_varchar2_table(170) := '6F696E7465723B0A20206D617267696E3A303B207D0A2E64672D7377697463682D696E7075747B20706F736974696F6E3A6162736F6C7574653B206F7061636974793A303B2077696474683A303B206865696768743A303B207D0A2E64672D7377697463';
wwv_flow_imp.g_varchar2_table(171) := '682D747261636B7B0A202077696474683A333870783B206865696768743A323070783B20626F726465722D7261646975733A39393970783B20666C65783A302030206175746F3B0A20206261636B67726F756E643A72676261283132372C3132372C3132';
wwv_flow_imp.g_varchar2_table(172) := '372C2E3435293B20706F736974696F6E3A72656C61746976653B207472616E736974696F6E3A6261636B67726F756E64202E31367320656173653B0A7D0A2E64672D7377697463682D6B6E6F627B0A2020706F736974696F6E3A6162736F6C7574653B20';
wwv_flow_imp.g_varchar2_table(173) := '746F703A3270783B206C6566743A3270783B2077696474683A313670783B206865696768743A313670783B0A2020626F726465722D7261646975733A3530253B206261636B67726F756E643A236666663B20626F782D736861646F773A30203170782033';
wwv_flow_imp.g_varchar2_table(174) := '7078207267626128302C302C302C2E3335293B0A20207472616E736974696F6E3A7472616E73666F726D202E31367320656173653B0A7D0A2E64672D7377697463682D696E7075743A636865636B6564202B202E64672D7377697463682D747261636B7B';
wwv_flow_imp.g_varchar2_table(175) := '206261636B67726F756E643A233141374634333B207D0A2E64672D7377697463682D696E7075743A636865636B6564202B202E64672D7377697463682D747261636B202E64672D7377697463682D6B6E6F627B0A20207472616E73666F726D3A7472616E';
wwv_flow_imp.g_varchar2_table(176) := '736C617465582831387078293B207D0A2E64672D7377697463682D696E7075743A666F6375732D76697369626C65202B202E64672D7377697463682D747261636B7B0A2020626F782D736861646F773A302030203020337078207267626128352C313134';
wwv_flow_imp.g_varchar2_table(177) := '2C3230362C2E3235293B207D0A2E64672D7377697463682D746578747B20666F6E742D73697A653A766172282D2D64672D73697A65293B20666F6E742D7765696768743A3530303B207D0A2E64672D63666770616E656C7B207A2D696E6465783A393939';
wwv_flow_imp.g_varchar2_table(178) := '393B207D0A0A2F2A203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D202A2F0A2F2A20763131202020202020202020';
wwv_flow_imp.g_varchar2_table(179) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202A2F0A2F2A203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D';
wwv_flow_imp.g_varchar2_table(180) := '3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D202A2F0A0A2F2A2072696768742D68616E6420736C6F743A20736964652062616467652C20656469742070656E63696C2C20636F6E6669677572652067';
wwv_flow_imp.g_varchar2_table(181) := '656172202D20696E2074686174206F726465722C0A202020616C77617973206174207468652072696768742065646765206F66207468652063656C6C20616E64206E65766572206F6E20746F70206F662065616368206F74686572202A2F0A2E64672D65';
wwv_flow_imp.g_varchar2_table(182) := '6E647B20646973706C61793A696E6C696E652D666C65783B20616C69676E2D6974656D733A63656E7465723B206761703A2E3372656D3B206D617267696E2D6C6566743A6175746F3B0A2020666C65783A302030206175746F3B2070616464696E672D6C';
wwv_flow_imp.g_varchar2_table(183) := '6566743A2E333572656D3B207D0A2E64672D656E643A656D7074797B20646973706C61793A6E6F6E653B207D0A2E64672D65646974777261707B20666C65783A312031206175746F3B207D0A2E64672D6974656D2E69732D65646974696E67202E64672D';
wwv_flow_imp.g_varchar2_table(184) := '736964657B20646973706C61793A6E6F6E653B207D0A0A2F2A20736964652062616467653A2061207365636F6E642C2072696768742D616C69676E656420626164676520696E207468652073616D652063656C6C202A2F0A2E64672D736964652E64672D';
wwv_flow_imp.g_varchar2_table(185) := '62616467657B20746578742D7472616E73666F726D3A6E6F6E653B206C65747465722D73706163696E673A303B20666F6E742D7765696768743A3630303B0A2020666F6E742D73697A653A63616C6328766172282D2D64672D73697A6529202D20312E35';
wwv_flow_imp.g_varchar2_table(186) := '7078293B207D0A0A2F2A20746F7563682073637265656E732068617665206E6F20686F7665723A206B6565702074686520636F6E74726F6C732076697369626C65202A2F0A406D656469612028686F7665723A6E6F6E65297B0A20202E64672D656E6420';
wwv_flow_imp.g_varchar2_table(187) := '3E202E64672D63666762746E7B206F7061636974793A2E36353B207D0A20202E64672D6564697462746E7B206F7061636974793A2E38353B207D0A7D0A0A2F2A2073656374696F6E73202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(188) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D7365637B20646973706C61793A666C65783B20616C69676E2D6974656D733A63656E7465723B206D696E2D77696474683A303B0A2020';
wwv_flow_imp.g_varchar2_table(189) := '626F726465722D626F74746F6D3A31707820736F6C696420766172282D2D64672D6C696E65293B0A2020626F726465722D626F74746F6D2D7374796C653A766172282D2D64672D627374796C652C736F6C6964293B0A20206261636B67726F756E643A76';
wwv_flow_imp.g_varchar2_table(190) := '6172282D2D64672D6C626C2D6267293B20637572736F723A706F696E7465723B2070616464696E672D72696768743A766172282D2D64672D7061642D78293B0A20202D7765626B69742D757365722D73656C6563743A6E6F6E653B20757365722D73656C';
wwv_flow_imp.g_varchar2_table(191) := '6563743A6E6F6E653B207D0A2E64672D7365632D62746E7B20666C65783A312031206175746F3B20646973706C61793A666C65783B20616C69676E2D6974656D733A63656E7465723B206761703A2E353572656D3B0A20206D696E2D77696474683A303B';
wwv_flow_imp.g_varchar2_table(192) := '20626F726465723A303B206261636B67726F756E643A6E6F6E653B20637572736F723A706F696E7465723B20746578742D616C69676E3A6C6566743B0A202070616464696E673A2E343272656D20766172282D2D64672D7061642D78293B20666F6E743A';
wwv_flow_imp.g_varchar2_table(193) := '696E68657269743B206C696E652D6865696768743A312E333B0A2020666F6E742D73697A653A63616C6328766172282D2D64672D73697A6529202D20312E357078293B20666F6E742D7765696768743A3730303B206C65747465722D73706163696E673A';
wwv_flow_imp.g_varchar2_table(194) := '2E3036656D3B0A2020746578742D7472616E73666F726D3A7570706572636173653B20636F6C6F723A766172282D2D64672D6C626C2D6667293B207D0A2E64672D7365632D62746E3A666F6375732D76697369626C657B206F75746C696E653A32707820';
wwv_flow_imp.g_varchar2_table(195) := '736F6C696420766172282D2D64672D616363656E74293B206F75746C696E652D6F66667365743A2D3370783B0A2020626F726465722D7261646975733A3470783B207D0A2E64672D7365633A686F766572202E64672D7365632D62746E7B20636F6C6F72';
wwv_flow_imp.g_varchar2_table(196) := '3A766172282D2D64672D76616C2D6667293B207D0A2E64672D7365632D636865767B20666C65783A302030206175746F3B2077696474683A31656D3B20666F6E742D73697A653A2E38656D3B20746578742D616C69676E3A63656E7465723B0A20207472';
wwv_flow_imp.g_varchar2_table(197) := '616E736974696F6E3A7472616E73666F726D202E31367320656173653B207D0A2E64672D7365632E69732D636F6C6C6170736564202E64672D7365632D636865767B207472616E73666F726D3A726F74617465282D3930646567293B207D0A2E64672D73';
wwv_flow_imp.g_varchar2_table(198) := '65632D636F756E747B20666C65783A302030206175746F3B20666F6E742D7765696768743A3630303B206C65747465722D73706163696E673A303B20666F6E742D73697A653A2E3932656D3B0A202070616464696E673A2E303272656D202E343572656D';
wwv_flow_imp.g_varchar2_table(199) := '3B20626F726465722D7261646975733A39393970783B206261636B67726F756E643A766172282D2D64672D74696E74293B0A2020636F6C6F723A766172282D2D64672D6C626C2D6667293B207D0A2E64672D7365632E69732D636F6C6C61707365647B20';
wwv_flow_imp.g_varchar2_table(200) := '626F726465722D626F74746F6D2D636F6C6F723A7472616E73706172656E743B207D0A2E64672D7365632E69732D636F6C6C6170736564202B202E64672D6974656D3A6E6F74282E64672D7365632D68696464656E292C0A2E64672D7365632E69732D63';
wwv_flow_imp.g_varchar2_table(201) := '6F6C6C6170736564202B202E64672D7365637B20626F726465722D746F703A31707820736F6C696420766172282D2D64672D6C696E65293B207D0A2E64672D7365632E64672D7365632D656D7074792C202E64672D6974656D2E64672D7365632D686964';
wwv_flow_imp.g_varchar2_table(202) := '64656E7B20646973706C61793A6E6F6E653B207D0A406D656469612028707265666572732D726564756365642D6D6F74696F6E3A726564756365297B202E64672D7365632D636865767B207472616E736974696F6E3A6E6F6E653B207D207D0A0A2F2A20';
wwv_flow_imp.g_varchar2_table(203) := '726567696F6E207374796C6573202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D2D616363656E747B20626F726465722D746F70';
wwv_flow_imp.g_varchar2_table(204) := '3A33707820736F6C696420766172282D2D64672D616363656E742D626172292021696D706F7274616E743B207D0A2E64672D2D7A65627261202E64672D6974656D2E64672D616C74203E202E64672D76616C2C0A2E64672D2D7A65627261202E64672D69';
wwv_flow_imp.g_varchar2_table(205) := '74656D2E64672D616C742E64672D66696C6C65727B0A20206261636B67726F756E642D696D6167653A6C696E6561722D6772616469656E74287267626128302C302C302C2E303232292C207267626128302C302C302C2E30323229293B207D0A2E64672D';
wwv_flow_imp.g_varchar2_table(206) := '2D7A65627261202E64672D6974656D2E64672D616C74203E202E64672D6C626C7B0A20206261636B67726F756E642D696D6167653A6C696E6561722D6772616469656E74287267626128302C302C302C2E3033292C207267626128302C302C302C2E3033';
wwv_flow_imp.g_varchar2_table(207) := '29293B207D0A2E64672D6974656D5B646174612D64672D6E616D655D3A686F766572203E202E64672D6C626C7B20636F6C6F723A766172282D2D64672D76616C2D6667293B207D0A0A2F2A2076616C756520646973706C617973202D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(208) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D63686970737B20646973706C61793A666C65783B20666C65782D777261703A777261703B206761703A2E33';
wwv_flow_imp.g_varchar2_table(209) := '72656D3B206D696E2D77696474683A303B207D0A2E64672D636869707B20646973706C61793A696E6C696E652D666C65783B20616C69676E2D6974656D733A63656E7465723B206D61782D77696474683A313030253B0A202070616464696E673A2E3134';
wwv_flow_imp.g_varchar2_table(210) := '72656D202E3672656D3B20626F726465722D7261646975733A39393970783B2077686974652D73706163653A6E6F777261703B0A20206F766572666C6F773A68696464656E3B20746578742D6F766572666C6F773A656C6C69707369733B0A2020626163';
wwv_flow_imp.g_varchar2_table(211) := '6B67726F756E643A766172282D2D64672D6267293B20626F726465723A31707820736F6C696420766172282D2D64672D6C696E65293B0A2020666F6E742D73697A653A63616C6328766172282D2D64672D73697A6529202D20317078293B20666F6E742D';
wwv_flow_imp.g_varchar2_table(212) := '7765696768743A3630303B20636F6C6F723A766172282D2D64672D76616C2D6667293B207D0A0A2E64672D6176617461727B20666C65783A302030206175746F3B2077696474683A312E3935656D3B206865696768743A312E3935656D3B20626F726465';
wwv_flow_imp.g_varchar2_table(213) := '722D7261646975733A3530253B0A2020646973706C61793A696E6C696E652D666C65783B20616C69676E2D6974656D733A63656E7465723B206A7573746966792D636F6E74656E743A63656E7465723B0A2020666F6E742D73697A653A63616C63287661';
wwv_flow_imp.g_varchar2_table(214) := '72282D2D64672D73697A6529202D20327078293B20666F6E742D7765696768743A3730303B206C65747465722D73706163696E673A2E3032656D3B0A2020636F6C6F723A236666663B206261636B67726F756E643A68736C28766172282D2D61762D682C';
wwv_flow_imp.g_varchar2_table(215) := '323130292034322520343525293B207D0A0A2E64672D636865636B7B20646973706C61793A696E6C696E652D666C65783B20616C69676E2D6974656D733A63656E7465723B206761703A2E333872656D3B20666F6E742D7765696768743A3630303B207D';
wwv_flow_imp.g_varchar2_table(216) := '0A2E64672D636865636B202E66617B20666F6E742D73697A653A312E3035656D3B207D0A2E64672D636865636B2E69732D7965737B20636F6C6F723A233141374634333B207D0A2E64672D636865636B2E69732D6E6F7B20636F6C6F723A233841314632';
wwv_flow_imp.g_varchar2_table(217) := '423B207D0A0A2E64672D6B70697B20666F6E742D73697A653A63616C6328766172282D2D64672D73697A6529202B20357078293B20666F6E742D7765696768743A3730303B206C696E652D6865696768743A312E31353B0A20206C65747465722D737061';
wwv_flow_imp.g_varchar2_table(218) := '63696E673A2D2E3031656D3B20666F6E742D76617269616E742D6E756D657269633A746162756C61722D6E756D733B20636F6C6F723A766172282D2D64672D76616C2D6667293B207D0A0A2E64672D72656C7B20626F726465722D626F74746F6D2D7374';
wwv_flow_imp.g_varchar2_table(219) := '796C653A646F747465643B207D0A0A2F2A2073656172636861626C65206C6973742028506F707570204C4F56207374796C6529202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D202A2F0A2E64672D63';
wwv_flow_imp.g_varchar2_table(220) := '6F6D626F2D62746E7B20706F736974696F6E3A6162736F6C7574653B2072696768743A3270783B20746F703A3530253B207472616E73666F726D3A7472616E736C61746559282D353025293B0A2020626F726465723A303B206261636B67726F756E643A';
wwv_flow_imp.g_varchar2_table(221) := '6E6F6E653B2070616464696E673A337078203770783B20626F726465722D7261646975733A3470783B206C696E652D6865696768743A313B0A2020636F6C6F723A766172282D2D64672D6C626C2D6667293B20637572736F723A706F696E7465723B207D';
wwv_flow_imp.g_varchar2_table(222) := '0A2E64672D636F6D626F2D62746E3A686F7665727B20636F6C6F723A766172282D2D64672D616363656E74293B206261636B67726F756E643A766172282D2D64672D6C626C2D6267293B207D0A2E64672D636F6D626F2D6C697374206C695B646174612D';
wwv_flow_imp.g_varchar2_table(223) := '695D7B20646973706C61793A666C65783B20616C69676E2D6974656D733A63656E7465723B206761703A2E3572656D3B207D0A2E64672D636F6D626F2D6C697374206C692E69732D6163746976657B206261636B67726F756E643A7267626128352C3131';
wwv_flow_imp.g_varchar2_table(224) := '342C3230362C2E3130293B0A2020626F782D736861646F773A696E736574203370782030203020766172282D2D64672D616363656E74293B207D0A2E64672D636F6D626F2D6C697374206C692E69732D63757272656E74202E64672D636F6D626F2D7478';
wwv_flow_imp.g_varchar2_table(225) := '747B20666F6E742D7765696768743A3730303B207D0A2E64672D636F6D626F2D7478747B206D696E2D77696474683A303B206F766572666C6F772D777261703A616E7977686572653B207D0A2E64672D636F6D626F2D7469636B7B206D617267696E2D6C';
wwv_flow_imp.g_varchar2_table(226) := '6566743A6175746F3B20636F6C6F723A766172282D2D64672D616363656E74293B20666F6E742D73697A653A2E39656D3B207D0A2E64672D636F6D626F2D6C697374206D61726B7B206261636B67726F756E643A72676261283235352C3230362C36342C';
wwv_flow_imp.g_varchar2_table(227) := '2E3535293B20636F6C6F723A696E68657269743B0A202070616464696E673A30203170783B20626F726465722D7261646975733A3270783B207D0A2E64672D636F6D626F2D6C697374202E64672D636F6D626F2D6D6F72657B206A7573746966792D636F';
wwv_flow_imp.g_varchar2_table(228) := '6E74656E743A63656E7465723B20666F6E742D7765696768743A3530303B0A2020666F6E742D73697A653A313270783B20636F6C6F723A766172282D2D64672D6D75746564293B20637572736F723A64656661756C743B207D0A2E64672D636F6D626F2D';
wwv_flow_imp.g_varchar2_table(229) := '6C697374202E64672D636F6D626F2D6D6F72653A686F7665727B206261636B67726F756E643A6E6F6E653B207D0A2E64672D636F6D626F2D6C6973742E69732D75707B20626F782D736861646F773A30202D313070782032367078202D38707820726762';
wwv_flow_imp.g_varchar2_table(230) := '6128302C302C302C2E33293B207D0A0A2F2A20636F6E6669677572652070616E656C3A2073656374696F6E20746167202A2F0A2E64672D6366677365637B206D617267696E2D6C6566743A6175746F3B20666F6E742D73697A653A31302E3570783B2066';
wwv_flow_imp.g_varchar2_table(231) := '6F6E742D7765696768743A3730303B206C65747465722D73706163696E673A2E3035656D3B0A2020746578742D7472616E73666F726D3A7570706572636173653B20636F6C6F723A766172282D2D64672D6D75746564293B206261636B67726F756E643A';
wwv_flow_imp.g_varchar2_table(232) := '766172282D2D64672D74696E74293B0A202070616464696E673A2E303572656D202E3472656D3B20626F726465722D7261646975733A3470783B207D0A406D656469612028707265666572732D726564756365642D6D6F74696F6E3A726564756365297B';
wwv_flow_imp.g_varchar2_table(233) := '0A20202E64672D7377697463682D747261636B2C2E64672D7377697463682D6B6E6F627B207472616E736974696F6E3A6E6F6E653B207D0A7D0A0A2F2A203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D';
wwv_flow_imp.g_varchar2_table(234) := '3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D202A2F0A2F2A207631322020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(235) := '20202020202020202020202020202A2F0A2F2A203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D202A2F0A0A2F2A20';
wwv_flow_imp.g_varchar2_table(236) := '6361726420616374696F6E7320284564697420616C6C2C20436F6E66696775726529207368617265207468652072696768742D68616E6420736C6F74202A2F0A2E64672D656E64203E202E64672D636172646163747B0A2020646973706C61793A696E6C';
wwv_flow_imp.g_varchar2_table(237) := '696E652D666C65783B20616C69676E2D6974656D733A63656E7465723B206761703A3570783B0A202070616464696E673A337078203970783B20626F726465722D7261646975733A39393970783B20626F726465723A31707820736F6C6964207472616E';
wwv_flow_imp.g_varchar2_table(238) := '73706172656E743B0A20206261636B67726F756E643A7472616E73706172656E743B20636F6C6F723A766172282D2D64672D6D75746564293B20666F6E742D73697A653A31312E3570783B206C696E652D6865696768743A312E363B0A2020637572736F';
wwv_flow_imp.g_varchar2_table(239) := '723A706F696E7465723B206F7061636974793A303B207472616E736974696F6E3A6F706163697479202E31347320656173653B207D0A2E64672D636667686F73743A686F766572202E64672D636172646163742C0A2E64672D636667686F7374202E6467';
wwv_flow_imp.g_varchar2_table(240) := '2D636172646163743A666F6375732D76697369626C657B206F7061636974793A2E373B207D0A2E64672D656E64203E202E64672D636172646163743A686F7665727B206F7061636974793A313B20636F6C6F723A766172282D2D64672D616363656E7429';
wwv_flow_imp.g_varchar2_table(241) := '3B206261636B67726F756E643A766172282D2D64672D686F766572293B207D0A2E64672E69732D65646974616C6C207E202E64672D636172646163742C202E64672E69732D65646974616C6C202E64672D636172646163742E64672D65646974616C6C7B';
wwv_flow_imp.g_varchar2_table(242) := '206F7061636974793A313B20636F6C6F723A766172282D2D64672D616363656E74293B207D0A406D656469612028686F7665723A6E6F6E65297B202E64672D656E64203E202E64672D636172646163747B206F7061636974793A2E36353B207D207D0A0A';
wwv_flow_imp.g_varchar2_table(243) := '2F2A206C696E6B733A2073616D65206665656C206173207265706F727420636F6C756D6E206C696E6B73202A2F0A2E64672D6C696E6B7B20636F6C6F723A766172282D2D64672D616363656E74293B20746578742D6465636F726174696F6E3A6E6F6E65';
wwv_flow_imp.g_varchar2_table(244) := '3B20666F6E742D7765696768743A3630303B207D0A2E64672D6C696E6B3A686F7665727B20746578742D6465636F726174696F6E3A756E6465726C696E653B20746578742D756E6465726C696E652D6F66667365743A3270783B207D0A2E64672D6C696E';
wwv_flow_imp.g_varchar2_table(245) := '6B3A666F6375732D76697369626C657B206F75746C696E653A32707820736F6C696420766172282D2D64672D616363656E74293B206F75746C696E652D6F66667365743A3270783B20626F726465722D7261646975733A3370783B207D0A2E64672D6C69';
wwv_flow_imp.g_varchar2_table(246) := '6E6B202E64672D7478747B20636F6C6F723A696E68657269743B207D0A0A2F2A207265717569726564206D61726B6572202A2F0A2E64672D7265717B20636F6C6F723A766172282D2D64672D64616E676572293B206D617267696E2D6C6566743A2E3272';
wwv_flow_imp.g_varchar2_table(247) := '656D3B20666F6E742D7765696768743A3730303B207D0A0A2F2A2076616C69646174696F6E202A2F0A2E64672D76616C2E6861732D6572727B20666C65782D777261703A777261703B207D0A2E64672D6669656C646572727B20666C65782D6261736973';
wwv_flow_imp.g_varchar2_table(248) := '3A313030253B206F726465723A31303B206D617267696E2D746F703A2E3372656D3B20666F6E742D73697A653A63616C6328766172282D2D64672D73697A6529202D20312E357078293B0A2020666F6E742D7765696768743A3630303B20636F6C6F723A';
wwv_flow_imp.g_varchar2_table(249) := '766172282D2D64672D64616E676572293B207D0A2E64672D6669656C646572723A3A6265666F72657B20636F6E74656E743A225C323641302020223B207D0A2E64672D656469742E69732D696E76616C69642C202E64672D6564697477726170202E6467';
wwv_flow_imp.g_varchar2_table(250) := '2D656469742E69732D696E76616C69647B20626F726465722D636F6C6F723A766172282D2D64672D64616E676572293B0A2020626F782D736861646F773A3020302030203370782072676261283138352C32382C32382C2E3134293B207D0A0A2F2A2074';
wwv_flow_imp.g_varchar2_table(251) := '657874206172656120656469746F72202A2F0A2E64672D74657874617265617B20726573697A653A766572746963616C3B206D696E2D6865696768743A342E32656D3B206C696E652D6865696768743A312E343B207D0A2E64672D65646974777261703A';
wwv_flow_imp.g_varchar2_table(252) := '686173282E64672D7465787461726561297B20616C69676E2D6974656D733A666C65782D73746172743B207D0A0A2F2A2077686F6C652D636172642065646974202A2F0A2E64672E69732D65646974616C6C202E64672D6564697477726170202E64672D';
wwv_flow_imp.g_varchar2_table(253) := '62746E7B20646973706C61793A6E6F6E653B207D0A2E64672E69732D65646974616C6C202E64672D6974656D2E69732D65646974696E67203E202E64672D76616C7B206261636B67726F756E642D696D6167653A0A20206C696E6561722D677261646965';
wwv_flow_imp.g_varchar2_table(254) := '6E74287267626128352C3131342C3230362C2E303335292C207267626128352C3131342C3230362C2E30333529293B207D0A2E64672D656469746261727B20646973706C61793A666C65783B20616C69676E2D6974656D733A63656E7465723B20676170';
wwv_flow_imp.g_varchar2_table(255) := '3A2E3572656D3B20666C65782D777261703A777261703B0A202070616464696E673A2E353572656D20766172282D2D64672D7061642D78293B20626F726465722D746F703A31707820736F6C696420766172282D2D64672D6C696E65293B0A2020626163';
wwv_flow_imp.g_varchar2_table(256) := '6B67726F756E643A766172282D2D64672D6C626C2D6267293B20706F736974696F6E3A737469636B793B20626F74746F6D3A303B207A2D696E6465783A353B207D0A2E64672D656469746261722D6D73677B206D617267696E2D72696768743A6175746F';
wwv_flow_imp.g_varchar2_table(257) := '3B20636F6C6F723A766172282D2D64672D6D75746564293B20666F6E742D7765696768743A3630303B0A2020666F6E742D73697A653A63616C6328766172282D2D64672D73697A6529202D202E357078293B207D0A2E64672D656469746261722D68696E';
wwv_flow_imp.g_varchar2_table(258) := '747B20666F6E742D7765696768743A3430303B206D617267696E2D6C6566743A2E3572656D3B207D0A2E64672D65646974626172206B62647B20666F6E743A696E68657269743B20666F6E742D73697A653A2E3835656D3B2070616464696E673A30202E';
wwv_flow_imp.g_varchar2_table(259) := '3372656D3B20626F726465722D7261646975733A3370783B0A2020626F726465723A31707820736F6C696420766172282D2D64672D6C696E65293B206261636B67726F756E643A766172282D2D64672D73757266616365293B207D0A2E64672D62746E2E';
wwv_flow_imp.g_varchar2_table(260) := '64672D62746E2D7072696D6172797B20636F6C6F723A236666663B206261636B67726F756E643A766172282D2D64672D616363656E74293B20626F726465722D636F6C6F723A7472616E73706172656E743B0A202070616464696E673A35707820313270';
wwv_flow_imp.g_varchar2_table(261) := '783B20666F6E742D7765696768743A3630303B207D0A2E64672D62746E2E64672D62746E2D7072696D6172793A686F7665723A6E6F74283A64697361626C6564297B2066696C7465723A6272696768746E657373282E3932293B207D0A2E64672D62746E';
wwv_flow_imp.g_varchar2_table(262) := '2E64672D62746E2D67686F73747B206261636B67726F756E643A7472616E73706172656E743B20636F6C6F723A766172282D2D64672D74657874293B2070616464696E673A35707820313270783B207D0A2E64672D62746E2E64672D62746E2D67686F73';
wwv_flow_imp.g_varchar2_table(263) := '743A686F7665723A6E6F74283A64697361626C6564297B206261636B67726F756E643A766172282D2D64672D686F766572293B207D0A0A2F2A20756E646F20746F6173742028696E736964652074686520636172642C20626F74746F6D20726967687429';
wwv_flow_imp.g_varchar2_table(264) := '202A2F0A2E64672D726F6F747B20706F736974696F6E3A72656C61746976653B207D0A2E64672D746F6173747B20706F736974696F6E3A6162736F6C7574653B2072696768743A313070783B20626F74746F6D3A313070783B207A2D696E6465783A3430';
wwv_flow_imp.g_varchar2_table(265) := '3B0A2020646973706C61793A696E6C696E652D666C65783B20616C69676E2D6974656D733A63656E7465723B206761703A2E3672656D3B206D61782D77696474683A63616C632831303025202D2032307078293B0A202070616464696E673A2E3572656D';
wwv_flow_imp.g_varchar2_table(266) := '202E3672656D202E3572656D202E3872656D3B20626F726465722D7261646975733A3870783B0A20206261636B67726F756E643A766172282D2D64672D7469702D6267293B20636F6C6F723A766172282D2D64672D7469702D6667293B0A2020626F782D';
wwv_flow_imp.g_varchar2_table(267) := '736861646F773A3020313070782032387078202D31307078207267626128302C302C302C2E3435293B20666F6E742D73697A653A31322E3570783B0A2020616E696D6174696F6E3A64672D746F6173742D696E202E31387320656173652D6F75743B207D';
wwv_flow_imp.g_varchar2_table(268) := '0A2E64672D746F617374202E66612D636865636B2D636972636C657B20636F6C6F723A233441444538303B207D0A2E64672D746F6173742D6D73677B206D696E2D77696474683A303B206F766572666C6F773A68696464656E3B20746578742D6F766572';
wwv_flow_imp.g_varchar2_table(269) := '666C6F773A656C6C69707369733B2077686974652D73706163653A6E6F777261703B207D0A2E64672D756E646F7B20626F726465723A303B206261636B67726F756E643A7472616E73706172656E743B20636F6C6F723A233933433546443B20666F6E74';
wwv_flow_imp.g_varchar2_table(270) := '3A696E68657269743B20666F6E742D7765696768743A3730303B0A202070616464696E673A2E313572656D202E3472656D3B20626F726465722D7261646975733A3470783B20637572736F723A706F696E7465723B207D0A2E64672D756E646F3A686F76';
wwv_flow_imp.g_varchar2_table(271) := '65727B206261636B67726F756E643A72676261283235352C3235352C3235352C2E3132293B207D0A2E64672D746F6173742D787B20626F726465723A303B206261636B67726F756E643A7472616E73706172656E743B20636F6C6F723A696E6865726974';
wwv_flow_imp.g_varchar2_table(272) := '3B206F7061636974793A2E363B20637572736F723A706F696E7465723B0A2020666F6E742D73697A653A313670783B206C696E652D6865696768743A313B2070616464696E673A30202E3272656D3B207D0A2E64672D746F6173742D783A686F7665727B';
wwv_flow_imp.g_varchar2_table(273) := '206F7061636974793A313B207D0A2E64672D746F6173742E69732D6C656176696E677B206F7061636974793A303B207472616E73666F726D3A7472616E736C6174655928347078293B207472616E736974696F6E3A6F706163697479202E32732C207472';
wwv_flow_imp.g_varchar2_table(274) := '616E73666F726D202E32733B207D0A406B65796672616D65732064672D746F6173742D696E7B2066726F6D7B206F7061636974793A303B207472616E73666F726D3A7472616E736C6174655928367078293B207D20746F7B206F7061636974793A313B20';
wwv_flow_imp.g_varchar2_table(275) := '7472616E73666F726D3A6E6F6E653B207D207D0A406D656469612028707265666572732D726564756365642D6D6F74696F6E3A726564756365297B202E64672D746F6173747B20616E696D6174696F6E3A6E6F6E653B207D207D0A0A2F2A20636F6C6C61';
wwv_flow_imp.g_varchar2_table(276) := '707365642D73656374696F6E2073756D6D617279202A2F0A2E64672D7365632D73756D7B206D696E2D77696474683A303B206F766572666C6F773A68696464656E3B20746578742D6F766572666C6F773A656C6C69707369733B2077686974652D737061';
wwv_flow_imp.g_varchar2_table(277) := '63653A6E6F777261703B0A2020666F6E742D7765696768743A3530303B206C65747465722D73706163696E673A303B20746578742D7472616E73666F726D3A6E6F6E653B20636F6C6F723A766172282D2D64672D6D75746564293B0A2020666F6E742D73';
wwv_flow_imp.g_varchar2_table(278) := '697A653A63616C6328766172282D2D64672D73697A6529202D202E357078293B207D0A2E64672D7365633A6E6F74282E69732D636F6C6C617073656429202E64672D7365632D73756D7B20646973706C61793A6E6F6E653B207D0A0A2F2A206465746169';
wwv_flow_imp.g_varchar2_table(279) := '6C7320706F706F766572202B2074696D656C696E65202A2F0A2E64672D706F7062746E7B20666C65783A302030206175746F3B20626F726465723A303B206261636B67726F756E643A6E6F6E653B20637572736F723A706F696E7465723B207061646469';
wwv_flow_imp.g_varchar2_table(280) := '6E673A337078203570783B0A2020626F726465722D7261646975733A3470783B20636F6C6F723A766172282D2D64672D6D75746564293B206C696E652D6865696768743A313B206F7061636974793A2E37353B207D0A2E64672D706F7062746E3A686F76';
wwv_flow_imp.g_varchar2_table(281) := '65722C202E64672D706F7062746E5B617269612D657870616E6465643D2274727565225D7B206F7061636974793A313B20636F6C6F723A766172282D2D64672D616363656E74293B0A20206261636B67726F756E643A766172282D2D64672D686F766572';
wwv_flow_imp.g_varchar2_table(282) := '293B207D0A2E64672D706F707B20706F736974696F6E3A66697865643B207A2D696E6465783A393939393B206F766572666C6F772D793A6175746F3B2070616464696E673A3132707820313470783B0A2020626F726465722D7261646975733A31307078';
wwv_flow_imp.g_varchar2_table(283) := '3B206261636B67726F756E643A766172282D2D64672D73757266616365293B20636F6C6F723A766172282D2D64672D74657874293B0A2020626F726465723A31707820736F6C696420766172282D2D64672D706F702D6C696E65293B20626F782D736861';
wwv_flow_imp.g_varchar2_table(284) := '646F773A3020313270782033327078202D31307078207267626128302C302C302C2E3335293B0A2020666F6E742D73697A653A313370783B207D0A2E64672D706F702D686561647B20666F6E742D73697A653A31312E3570783B20666F6E742D77656967';
wwv_flow_imp.g_varchar2_table(285) := '68743A3730303B206C65747465722D73706163696E673A2E3036656D3B20746578742D7472616E73666F726D3A7570706572636173653B0A2020636F6C6F723A766172282D2D64672D6D75746564293B206D617267696E2D626F74746F6D3A313070783B';
wwv_flow_imp.g_varchar2_table(286) := '207D0A2E64672D706F702D6C6F6164696E672C202E64672D706F702D656D7074797B20636F6C6F723A766172282D2D64672D6D75746564293B2070616464696E673A34707820303B207D0A2E64672D746C7B206C6973742D7374796C653A6E6F6E653B20';
wwv_flow_imp.g_varchar2_table(287) := '6D617267696E3A303B2070616464696E673A303B207D0A2E64672D746C2D6974656D7B20706F736974696F6E3A72656C61746976653B20646973706C61793A666C65783B206761703A313070783B2070616464696E672D626F74746F6D3A313270783B20';
wwv_flow_imp.g_varchar2_table(288) := '7D0A2E64672D746C2D6974656D3A6C6173742D6368696C647B2070616464696E672D626F74746F6D3A303B207D0A2E64672D746C2D6974656D3A6E6F74283A6C6173742D6368696C64293A3A6265666F72657B20636F6E74656E743A22223B20706F7369';
wwv_flow_imp.g_varchar2_table(289) := '74696F6E3A6162736F6C7574653B206C6566743A3570783B20746F703A313470783B20626F74746F6D3A303B0A202077696474683A3270783B206261636B67726F756E643A766172282D2D64672D706F702D6C696E65293B207D0A2E64672D746C2D646F';
wwv_flow_imp.g_varchar2_table(290) := '747B20666C65783A302030206175746F3B2077696474683A313270783B206865696768743A313270783B206D617267696E2D746F703A3370783B20626F726465722D7261646975733A3530253B0A2020626F726465723A32707820736F6C696420766172';
wwv_flow_imp.g_varchar2_table(291) := '282D2D64672D6661696E74293B206261636B67726F756E643A766172282D2D64672D73757266616365293B207A2D696E6465783A313B207D0A2E64672D746C2D6974656D2E69732D646F6E65202E64672D746C2D646F747B206261636B67726F756E643A';
wwv_flow_imp.g_varchar2_table(292) := '233034373835373B20626F726465722D636F6C6F723A233034373835373B207D0A2E64672D746C2D6974656D2E69732D63757272656E74202E64672D746C2D646F747B206261636B67726F756E643A233235363345423B20626F726465722D636F6C6F72';
wwv_flow_imp.g_varchar2_table(293) := '3A233235363345423B0A2020626F782D736861646F773A30203020302034707820726762612833372C39392C3233352C2E3138293B207D0A2E64672D746C2D6974656D2E69732D72656A6563746564202E64672D746C2D646F747B206261636B67726F75';
wwv_flow_imp.g_varchar2_table(294) := '6E643A234239314331433B20626F726465722D636F6C6F723A234239314331433B207D0A2E64672D746C2D6974656D2E69732D736B6970706564202E64672D746C2D646F747B20626F726465722D7374796C653A6461736865643B207D0A2E64672D746C';
wwv_flow_imp.g_varchar2_table(295) := '2D626F64797B206D696E2D77696474683A303B207D0A2E64672D746C2D7469746C657B20666F6E742D7765696768743A3630303B207D0A2E64672D746C2D64657461696C7B20636F6C6F723A766172282D2D64672D74657874293B206F7061636974793A';
wwv_flow_imp.g_varchar2_table(296) := '2E38353B207D0A2E64672D746C2D7768656E7B20636F6C6F723A766172282D2D64672D6D75746564293B20666F6E742D73697A653A313270783B206D617267696E2D746F703A3170783B207D0A0A2F2A20646570656E64656E74206C6973742072656C6F';
wwv_flow_imp.g_varchar2_table(297) := '6164696E67202A2F0A2E64672D656469742E69732D627573797B206F7061636974793A2E35353B207D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(9544712804851667)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_file_name=>'css/detail-grid.css'
,p_mime_type=>'text/css'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A2044657461696C204772696420726567696F6E20706C75672D696E202D20763132202877686F6C652D6361726420656469742C2076616C69646174696F6E2C20636F6E666C696374732C20756E646F2C0A202020646570656E64656E74206C697374';
wwv_flow_imp.g_varchar2_table(2) := '732C206C696E6B732C20706F706F766572732C2073656374696F6E732C20706F7075702D7374796C652073656172636861626C65206C69737429202A2F0A2866756E6374696F6E202829207B0A20202275736520737472696374223B0A0A202066756E63';
wwv_flow_imp.g_varchar2_table(3) := '74696F6E206E6F74696679287374617475732C206D65737361676529207B0A2020202069662028216D65737361676529207B2072657475726E3B207D202020202020202020202F2F206F6E6C79207468652068616E646C65722064656369646573207768';
wwv_flow_imp.g_varchar2_table(4) := '61742069732073686F776E0A202020207661722073203D2028737461747573207C7C202222292E746F55707065724361736528293B0A20202020747279207B0A2020202020206966202873203D3D3D20224552524F5222207C7C2073203D3D3D2022434F';
wwv_flow_imp.g_varchar2_table(5) := '4E464C4943542229207B0A2020202020202020617065782E6D6573736167652E636C6561724572726F727328293B0A2020202020202020617065782E6D6573736167652E73686F774572726F7273285B7B20747970653A20226572726F72222C206C6F63';
wwv_flow_imp.g_varchar2_table(6) := '6174696F6E3A202270616765222C0A20202020202020202020202020202020202020202020202020202020202020202020206D6573736167653A206D6573736167652C0A2020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(7) := '202020756E736166653A2066616C7365207D5D293B0A2020202020207D20656C7365206966202873203D3D3D20225741524E494E472229207B0A2020202020202020617065782E6D6573736167652E616C657274286D657373616765293B0A2020202020';
wwv_flow_imp.g_varchar2_table(8) := '207D20656C7365207B0A2020202020202020617065782E6D6573736167652E73686F775061676553756363657373286D657373616765293B0A2020202020207D0A202020207D20636174636820286529207B0A20202020202077696E646F772E616C6572';
wwv_flow_imp.g_varchar2_table(9) := '74286D657373616765293B0A202020207D0A20207D0A0A202066756E6374696F6E20657363287329207B0A2020202072657475726E20537472696E672873203D3D206E756C6C203F202222203A2073290A2020202020202E7265706C616365282F262F67';
wwv_flow_imp.g_varchar2_table(10) := '2C202226616D703B22292E7265706C616365282F3C2F672C2022266C743B22292E7265706C616365282F3E2F672C20222667743B22290A2020202020202E7265706C616365282F222F672C20222671756F743B22292E7265706C616365282F272F672C20';
wwv_flow_imp.g_varchar2_table(11) := '22262333393B22293B0A20207D0A0A20202F2F207065722D76696577657220636F6E76656E69656E636573206F6E6C793B2073746F726167652063616E20626520626C6F636B65642C20736F206E657665722072656C79206F6E2069740A202066756E63';
wwv_flow_imp.g_varchar2_table(12) := '74696F6E2073746F7265286B65792C2076616C29207B0A20202020747279207B0A2020202020206966202876616C203D3D3D20756E646566696E656429207B2072657475726E2077696E646F772E6C6F63616C53746F726167652E6765744974656D286B';
wwv_flow_imp.g_varchar2_table(13) := '6579293B207D0A20202020202077696E646F772E6C6F63616C53746F726167652E7365744974656D286B65792C2076616C293B0A202020207D20636174636820286529207B202F2A2069676E6F7265202A2F207D0A2020202072657475726E206E756C6C';
wwv_flow_imp.g_varchar2_table(14) := '3B0A20207D0A0A202066756E6374696F6E2063737371287329207B2072657475726E20537472696E672873292E7265706C616365282F5B225C5C5D2F672C20225C5C242622293B207D0A0A20207661722063616C6C4361636865203D207B7D3B0A0A2020';
wwv_flow_imp.g_varchar2_table(15) := '2F2F205468652063616C6C2065787072657373696F6E20697320646576656C6F7065722D617574686F72656420706C75672D696E20636F6E66696775726174696F6E2C20757365640A20202F2F2065786163746C79206173207772697474656E20286E6F';
wwv_flow_imp.g_varchar2_table(16) := '20737562737469747574696F6E73292E2056616C7565732061727269766520766961206E657756616C7565202F206374782E0A202066756E6374696F6E20636F6D70696C6543616C6C286578707229207B0A2020202069662028216578707229207B2072';
wwv_flow_imp.g_varchar2_table(17) := '657475726E206E756C6C3B207D0A20202020696620282163616C6C43616368655B657870725D29207B0A202020202020747279207B0A202020202020202063616C6C43616368655B657870725D203D206E65772046756E6374696F6E28226E657756616C';
wwv_flow_imp.g_varchar2_table(18) := '7565222C2022637478222C202272657475726E202822202B2065787072202B2022293B22293B0A2020202020207D20636174636820286529207B0A202020202020202063616C6C43616368655B657870725D203D2066616C73653B0A2020202020207D0A';
wwv_flow_imp.g_varchar2_table(19) := '202020207D0A2020202072657475726E2063616C6C43616368655B657870725D207C7C206E756C6C3B0A20207D0A0A202066756E6374696F6E206D61726B537461746528656C2C2073746174757329207B0A20202020656C2E636C6173734C6973742E72';
wwv_flow_imp.g_varchar2_table(20) := '656D6F7665282269732D62757379222C202269732D6F6B222C202269732D65727222293B0A202020207661722073203D2028737461747573207C7C202222292E746F55707065724361736528293B0A202020206966202873203D3D3D2022535543434553';
wwv_flow_imp.g_varchar2_table(21) := '532229207B20656C2E636C6173734C6973742E616464282269732D6F6B22293B207D0A20202020656C7365206966202873203D3D3D20224552524F5222207C7C2073203D3D3D2022434F4E464C4943542229207B20656C2E636C6173734C6973742E6164';
wwv_flow_imp.g_varchar2_table(22) := '64282269732D65727222293B207D0A2020202077696E646F772E73657454696D656F75742866756E6374696F6E202829207B0A202020202020656C2E636C6173734C6973742E72656D6F7665282269732D6F6B222C202269732D65727222293B0A202020';
wwv_flow_imp.g_varchar2_table(23) := '207D2C2032353030293B0A20207D0A0A20202F2F202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2073656172636861626C65206C6973742028776F726B73206C696B6520616E20696E6C696E6520506F707570204C4F5629202D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(24) := '2D2D2D0A20202F2F205479706520746F2066696C74657220286D61746368657320686967686C696768746564292C206172726F7773202F2050616765206B657973206D6F76652C20456E746572207069636B732C0A20202F2F2045736320636C6F736573';
wwv_flow_imp.g_varchar2_table(25) := '2C206D6F726520726F7773206C6F616420617320796F75207363726F6C6C2C207468652063757272656E742076616C7565206973207469636B65642E0A20202F2F20546578742074686174206973206E6F742061206C69737420656E74727920676F6573';
wwv_flow_imp.g_varchar2_table(26) := '206261636B20746F20746865206C6173742076616C69642076616C75653B20616E20656D7074790A20202F2F20626F7820636C65617273207468652076616C75652E0A202076617220434F4D424F5F50414745203D2035302C20636F6D626F536571203D';
wwv_flow_imp.g_varchar2_table(27) := '20303B0A0A202066756E6374696F6E20706172747328636F6D626F29207B0A2020202072657475726E207B20696E7075743A20636F6D626F2E717565727953656C6563746F7228222E64672D636F6D626F2D696E70757422292C0A202020202020202020';
wwv_flow_imp.g_varchar2_table(28) := '202020206C6973743A2020636F6D626F2E717565727953656C6563746F7228222E64672D636F6D626F2D6C69737422292C0A202020202020202020202020207372633A202020636F6D626F2E717565727953656C6563746F7228222E64672D636F6D626F';
wwv_flow_imp.g_varchar2_table(29) := '2D7372632229207D3B0A20207D0A0A202066756E6374696F6E20636F6D626F4F7074696F6E7328636F6D626F29207B0A202020206966202821636F6D626F2E5F6F70747329207B0A202020202020636F6D626F2E5F6F707473203D2041727261792E7072';
wwv_flow_imp.g_varchar2_table(30) := '6F746F747970652E6D61702E63616C6C28706172747328636F6D626F292E7372632E6F7074696F6E732C2066756E6374696F6E20286F29207B0A202020202020202072657475726E207B20746578743A206F2E746578742E7472696D28292C2076616C75';
wwv_flow_imp.g_varchar2_table(31) := '653A206F2E76616C7565207D3B0A2020202020207D292E66696C7465722866756E6374696F6E20286F29207B2072657475726E206F2E7465787420213D3D202222202626206F2E76616C756520213D3D2022223B207D293B0A202020207D0A2020202072';
wwv_flow_imp.g_varchar2_table(32) := '657475726E20636F6D626F2E5F6F7074733B0A20207D0A0A202066756E6374696F6E20646973706C6179466F7228636F6D626F2C2076616C756529207B0A20202020766172206F203D20636F6D626F4F7074696F6E7328636F6D626F292E66696C746572';
wwv_flow_imp.g_varchar2_table(33) := '2866756E6374696F6E20287829207B2072657475726E20782E76616C7565203D3D3D2076616C75653B207D295B305D3B0A2020202072657475726E206F203F206F2E74657874203A206E756C6C3B0A20207D0A0A202066756E6374696F6E2068696C6974';
wwv_flow_imp.g_varchar2_table(34) := '6528746578742C207465726D29207B0A202020207661722069203D207465726D203F20746578742E746F4C6F7765724361736528292E696E6465784F66287465726D29203A202D313B0A202020206966202869203C203029207B2072657475726E206573';
wwv_flow_imp.g_varchar2_table(35) := '632874657874293B207D0A2020202072657475726E2065736328746578742E736C69636528302C20692929202B20223C6D61726B3E22202B2065736328746578742E736C69636528692C2069202B207465726D2E6C656E6774682929202B0A2020202020';
wwv_flow_imp.g_varchar2_table(36) := '202020202020223C2F6D61726B3E22202B2065736328746578742E736C6963652869202B207465726D2E6C656E67746829293B0A20207D0A0A20202F2F20666978656420746F207468652076696577706F727420736F206E6F2063617264206F72207265';
wwv_flow_imp.g_varchar2_table(37) := '67696F6E2063616E20636C69702069743B20666C697073207570206E6561722074686520626F74746F6D0A202066756E6374696F6E20636F6D626F506F736974696F6E28636F6D626F29207B0A202020207661722070203D20706172747328636F6D626F';
wwv_flow_imp.g_varchar2_table(38) := '292C2072203D20702E696E7075742E676574426F756E64696E67436C69656E745265637428293B0A20202020766172207677203D2077696E646F772E696E6E657257696474682C207668203D2077696E646F772E696E6E65724865696768742C206D203D';
wwv_flow_imp.g_varchar2_table(39) := '20383B0A202020207661722077203D204D6174682E6D696E284D6174682E6D617828722E77696474682C20323630292C207677202D2032202A206D293B0A20202020766172206C656674203D204D6174682E6D696E284D6174682E6D6178286D2C20722E';
wwv_flow_imp.g_varchar2_table(40) := '6C656674292C207677202D2077202D206D293B0A202020207661722062656C6F77203D207668202D20722E626F74746F6D202D206D2C2061626F7665203D20722E746F70202D206D3B0A20202020766172207570203D2062656C6F77203C203232302026';
wwv_flow_imp.g_varchar2_table(41) := '262061626F7665203E2062656C6F773B0A20202020766172206D617848203D204D6174682E6D6178283132302C204D6174682E6D696E283332302C20287570203F2061626F7665203A2062656C6F7729202D203629293B0A20202020702E6C6973742E73';
wwv_flow_imp.g_varchar2_table(42) := '74796C652E6C656674203D206C656674202B20227078223B0A20202020702E6C6973742E7374796C652E7769647468203D2077202B20227078223B0A20202020702E6C6973742E7374796C652E6D6178486569676874203D206D617848202B2022707822';
wwv_flow_imp.g_varchar2_table(43) := '3B0A2020202069662028757029207B20702E6C6973742E7374796C652E746F70203D20226175746F223B20702E6C6973742E7374796C652E626F74746F6D203D20287668202D20722E746F70202B203429202B20227078223B207D0A20202020656C7365';
wwv_flow_imp.g_varchar2_table(44) := '202020207B20702E6C6973742E7374796C652E626F74746F6D203D20226175746F223B20702E6C6973742E7374796C652E746F70203D2028722E626F74746F6D202B203429202B20227078223B207D0A20202020702E6C6973742E636C6173734C697374';
wwv_flow_imp.g_varchar2_table(45) := '2E746F67676C65282269732D7570222C207570293B0A20207D0A0A202066756E6374696F6E20636F6D626F5061696E7428636F6D626F29207B0A202020207661722070203D20706172747328636F6D626F292C206D203D20636F6D626F2E5F6D61746368';
wwv_flow_imp.g_varchar2_table(46) := '6573207C7C205B5D2C20637572203D20702E696E7075742E646174617365742E646756616C75653B0A20202020766172206E203D204D6174682E6D696E28636F6D626F2E5F73686F776E2C206D2E6C656E677468292C2068746D6C203D2022223B0A2020';
wwv_flow_imp.g_varchar2_table(47) := '2020666F7220287661722069203D20303B2069203C206E3B20692B2B29207B0A202020202020766172206973437572203D206D5B695D2E76616C7565203D3D3D206375723B0A20202020202068746D6C202B3D20223C6C6920726F6C653D276F7074696F';
wwv_flow_imp.g_varchar2_table(48) := '6E272069643D2722202B20702E6C6973742E6964202B20222D22202B2069202B20222720646174612D693D2722202B2069202B20222722202B0A20202020202020202020202020202220636C6173733D2722202B202869203D3D3D20636F6D626F2E5F61';
wwv_flow_imp.g_varchar2_table(49) := '6374697665203F202269732D61637469766522203A20222229202B20286973437572203F20222069732D63757272656E7422203A20222229202B20222722202B0A20202020202020202020202020202220617269612D73656C65637465643D2722202B20';
wwv_flow_imp.g_varchar2_table(50) := '6973437572202B2022273E3C7370616E20636C6173733D2764672D636F6D626F2D747874273E22202B2068696C697465286D5B695D2E746578742C20636F6D626F2E5F7465726D29202B0A2020202020202020202020202020223C2F7370616E3E22202B';
wwv_flow_imp.g_varchar2_table(51) := '20286973437572203F20223C7370616E20636C6173733D2766612066612D636865636B2064672D636F6D626F2D7469636B2720617269612D68696464656E3D2774727565273E3C2F7370616E3E22203A20222229202B0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(52) := '20223C2F6C693E223B0A202020207D0A2020202069662028216D2E6C656E67746829207B0A20202020202068746D6C203D20223C6C6920636C6173733D2764672D636F6D626F2D6E6F6E652720726F6C653D2770726573656E746174696F6E273E4E6F20';
wwv_flow_imp.g_varchar2_table(53) := '6D6174636865733C2F6C693E223B0A202020207D20656C736520696620286D2E6C656E677468203E206E29207B0A20202020202068746D6C202B3D20223C6C6920636C6173733D2764672D636F6D626F2D6D6F72652720726F6C653D2770726573656E74';
wwv_flow_imp.g_varchar2_table(54) := '6174696F6E273E5363726F6C6C20666F72206D6F726520266D6964646F743B2022202B0A2020202020202020202020202020286D2E6C656E677468202D206E29202B20222072656D61696E696E673C2F6C693E223B0A202020207D0A20202020702E6C69';
wwv_flow_imp.g_varchar2_table(55) := '73742E696E6E657248544D4C203D2068746D6C3B0A2020202076617220616374203D20702E6C6973742E717565727953656C6563746F7228222E69732D61637469766522293B0A202020206966202861637429207B20702E696E7075742E736574417474';
wwv_flow_imp.g_varchar2_table(56) := '7269627574652822617269612D61637469766564657363656E64616E74222C206163742E6964293B207D0A20202020656C7365207B20702E696E7075742E72656D6F76654174747269627574652822617269612D61637469766564657363656E64616E74';
wwv_flow_imp.g_varchar2_table(57) := '22293B207D0A20207D0A0A202066756E6374696F6E207363726F6C6C41637469766528636F6D626F29207B0A202020207661722061203D20706172747328636F6D626F292E6C6973742E717565727953656C6563746F7228222E69732D61637469766522';
wwv_flow_imp.g_varchar2_table(58) := '293B0A20202020696620286120262620612E7363726F6C6C496E746F5669657729207B20612E7363726F6C6C496E746F56696577287B20626C6F636B3A20226E65617265737422207D293B207D0A20207D0A0A202066756E6374696F6E20636F6D626F49';
wwv_flow_imp.g_varchar2_table(59) := '734F70656E28636F6D626F29207B2072657475726E20706172747328636F6D626F292E6C6973742E636C6173734C6973742E636F6E7461696E73282269732D6F70656E22293B207D0A0A202066756E6374696F6E20636F6D626F4F70656E28636F6D626F';
wwv_flow_imp.g_varchar2_table(60) := '2C207465726D29207B0A202020207661722070203D20706172747328636F6D626F293B0A202020206966202821702E6C6973742E696429207B0A202020202020702E6C6973742E6964203D202264672D636F6D626F2D22202B20282B2B636F6D626F5365';
wwv_flow_imp.g_varchar2_table(61) := '71293B0A202020202020702E696E7075742E7365744174747269627574652822617269612D636F6E74726F6C73222C20702E6C6973742E6964293B0A202020207D0A202020207661722074203D20287465726D207C7C202222292E7472696D28292E746F';
wwv_flow_imp.g_varchar2_table(62) := '4C6F7765724361736528292C20616C6C203D20636F6D626F4F7074696F6E7328636F6D626F293B0A20202020636F6D626F2E5F7465726D203D20743B0A20202020636F6D626F2E5F6D617463686573203D2074203F20616C6C2E66696C7465722866756E';
wwv_flow_imp.g_varchar2_table(63) := '6374696F6E20286F29207B2072657475726E206F2E746578742E746F4C6F7765724361736528292E696E6465784F66287429203E202D313B207D29203A20616C6C3B0A20202020636F6D626F2E5F616374697665203D20303B0A20202020696620282174';
wwv_flow_imp.g_varchar2_table(64) := '29207B202020202020202020202020202020202020202020202020202020202020202020202F2F207374617274206F6E207468652063757272656E742076616C75650A202020202020666F7220287661722069203D20303B2069203C20636F6D626F2E5F';
wwv_flow_imp.g_varchar2_table(65) := '6D6174636865732E6C656E6774683B20692B2B29207B0A202020202020202069662028636F6D626F2E5F6D6174636865735B695D2E76616C7565203D3D3D20702E696E7075742E646174617365742E646756616C756529207B20636F6D626F2E5F616374';
wwv_flow_imp.g_varchar2_table(66) := '697665203D20693B20627265616B3B207D0A2020202020207D0A202020207D0A20202020636F6D626F2E5F73686F776E203D204D6174682E6D617828434F4D424F5F504147452C20636F6D626F2E5F616374697665202B2031293B0A20202020636F6D62';
wwv_flow_imp.g_varchar2_table(67) := '6F5061696E7428636F6D626F293B0A20202020702E6C6973742E636C6173734C6973742E616464282269732D6F70656E22293B0A20202020702E696E7075742E7365744174747269627574652822617269612D657870616E646564222C20227472756522';
wwv_flow_imp.g_varchar2_table(68) := '293B0A20202020636F6D626F506F736974696F6E28636F6D626F293B0A202020207363726F6C6C41637469766528636F6D626F293B0A20207D0A0A202066756E6374696F6E20636F6D626F4D6F766528636F6D626F2C2064656C746129207B0A20202020';
wwv_flow_imp.g_varchar2_table(69) := '766172206D203D20636F6D626F2E5F6D617463686573207C7C205B5D3B0A2020202069662028216D2E6C656E67746829207B2072657475726E3B207D0A202020207661722069203D204D6174682E6D696E284D6174682E6D61782828636F6D626F2E5F61';
wwv_flow_imp.g_varchar2_table(70) := '6374697665207C7C203029202B2064656C74612C2030292C206D2E6C656E677468202D2031293B0A202020206966202869203E3D20636F6D626F2E5F73686F776E29207B20636F6D626F2E5F73686F776E203D204D6174682E6D696E286D2E6C656E6774';
wwv_flow_imp.g_varchar2_table(71) := '682C2069202B20434F4D424F5F50414745293B207D0A20202020636F6D626F2E5F616374697665203D20693B0A20202020636F6D626F5061696E7428636F6D626F293B0A202020207363726F6C6C41637469766528636F6D626F293B0A20207D0A0A2020';
wwv_flow_imp.g_varchar2_table(72) := '2F2F206C696B6520506F707570204C4F563A20756E6D6174636865642074657874207265766572747320746F20746865206C6173742076616C69642076616C75653B20656D70747920636C656172730A202066756E6374696F6E20636F6D626F52657665';
wwv_flow_imp.g_varchar2_table(73) := '727428636F6D626F29207B0A202020207661722070203D20706172747328636F6D626F293B0A2020202069662028702E696E7075742E646174617365742E646756616C756520213D3D20756E646566696E656429207B2072657475726E3B207D0A202020';
wwv_flow_imp.g_varchar2_table(74) := '2069662028702E696E7075742E76616C75652E7472696D2829203D3D3D20222229207B20702E696E7075742E646174617365742E646756616C7565203D2022223B2072657475726E3B207D0A202020207661722076203D20702E696E7075742E64617461';
wwv_flow_imp.g_varchar2_table(75) := '7365742E64674C617374207C7C2022223B0A20202020702E696E7075742E646174617365742E646756616C7565203D20763B0A20202020702E696E7075742E76616C7565203D20646973706C6179466F7228636F6D626F2C207629207C7C20763B0A2020';
wwv_flow_imp.g_varchar2_table(76) := '7D0A0A202066756E6374696F6E20636F6D626F436C6F736528636F6D626F2C2072657665727429207B0A202020207661722070203D20706172747328636F6D626F293B0A20202020702E6C6973742E636C6173734C6973742E72656D6F7665282269732D';
wwv_flow_imp.g_varchar2_table(77) := '6F70656E22293B0A20202020702E696E7075742E7365744174747269627574652822617269612D657870616E646564222C202266616C736522293B0A20202020702E696E7075742E72656D6F76654174747269627574652822617269612D616374697665';
wwv_flow_imp.g_varchar2_table(78) := '64657363656E64616E7422293B0A202020206966202872657665727429207B20636F6D626F52657665727428636F6D626F293B207D0A20207D0A0A202066756E6374696F6E20636F6D626F5069636B28636F6D626F2C206929207B0A2020202076617220';
wwv_flow_imp.g_varchar2_table(79) := '70203D20706172747328636F6D626F292C206F203D2028636F6D626F2E5F6D617463686573207C7C205B5D295B695D3B0A2020202069662028216F29207B2072657475726E3B207D0A20202020702E696E7075742E76616C7565203D206F2E746578743B';
wwv_flow_imp.g_varchar2_table(80) := '0A20202020702E696E7075742E646174617365742E646756616C7565203D206F2E76616C75653B0A20202020702E696E7075742E646174617365742E64674C617374203D206F2E76616C75653B0A20202020636F6D626F436C6F736528636F6D626F293B';
wwv_flow_imp.g_varchar2_table(81) := '0A20202020702E696E7075742E666F63757328293B0A20202020702E696E7075742E64697370617463684576656E74286E6577204576656E7428226368616E6765222C207B20627562626C65733A2074727565207D29293B0A20207D0A0A20202F2F2072';
wwv_flow_imp.g_varchar2_table(82) := '657475726E732074727565207768656E20746865206B6579207761732068616E646C656420627920746865206C6973740A202066756E6374696F6E20636F6D626F4B657928652C20696E70757429207B0A2020202076617220636F6D626F203D20696E70';
wwv_flow_imp.g_varchar2_table(83) := '75742E636C6F7365737428222E64672D636F6D626F22292C206F70656E203D20636F6D626F49734F70656E28636F6D626F293B0A202020207377697463682028652E6B657929207B0A2020202020206361736520224172726F77446F776E223A0A202020';
wwv_flow_imp.g_varchar2_table(84) := '2020202020652E70726576656E7444656661756C7428293B0A202020202020202069662028216F70656E29207B20636F6D626F4F70656E28636F6D626F2C20696E7075742E646174617365742E646756616C7565203D3D3D20756E646566696E6564203F';
wwv_flow_imp.g_varchar2_table(85) := '20696E7075742E76616C7565203A202222293B207D0A2020202020202020656C7365207B20636F6D626F4D6F766528636F6D626F2C2031293B207D0A202020202020202072657475726E20747275653B0A2020202020206361736520224172726F775570';
wwv_flow_imp.g_varchar2_table(86) := '223A0A2020202020202020652E70726576656E7444656661756C7428293B0A2020202020202020696620286F70656E29207B20636F6D626F4D6F766528636F6D626F2C202D31293B207D0A202020202020202072657475726E20747275653B0A20202020';
wwv_flow_imp.g_varchar2_table(87) := '202063617365202250616765446F776E223A20696620286F70656E29207B20652E70726576656E7444656661756C7428293B20636F6D626F4D6F766528636F6D626F2C203130293B2072657475726E20747275653B207D2072657475726E2066616C7365';
wwv_flow_imp.g_varchar2_table(88) := '3B0A202020202020636173652022506167655570223A202020696620286F70656E29207B20652E70726576656E7444656661756C7428293B20636F6D626F4D6F766528636F6D626F2C202D3130293B2072657475726E20747275653B207D207265747572';
wwv_flow_imp.g_varchar2_table(89) := '6E2066616C73653B0A202020202020636173652022456E746572223A0A202020202020202069662028216F70656E207C7C20652E6374726C4B6579207C7C20652E6D6574614B657929207B2072657475726E2066616C73653B207D2020202F2F20636C6F';
wwv_flow_imp.g_varchar2_table(90) := '7365643A20456E7465722073617665730A2020202020202020652E70726576656E7444656661756C7428293B0A20202020202020206966202828636F6D626F2E5F6D617463686573207C7C205B5D292E6C656E67746829207B20636F6D626F5069636B28';
wwv_flow_imp.g_varchar2_table(91) := '636F6D626F2C20636F6D626F2E5F616374697665207C7C2030293B207D0A2020202020202020656C7365207B20636F6D626F436C6F736528636F6D626F2C2074727565293B207D0A202020202020202072657475726E20747275653B0A20202020202063';
wwv_flow_imp.g_varchar2_table(92) := '6173652022457363617065223A0A202020202020202069662028216F70656E29207B2072657475726E2066616C73653B207D2020202020202020202020202020202F2F20636C6F7365643A204573632063616E63656C732074686520656469740A202020';
wwv_flow_imp.g_varchar2_table(93) := '2020202020652E70726576656E7444656661756C7428293B0A2020202020202020636F6D626F436C6F736528636F6D626F2C2074727565293B0A202020202020202072657475726E20747275653B0A202020202020636173652022546162223A0A202020';
wwv_flow_imp.g_varchar2_table(94) := '2020202020696620286F70656E29207B20636F6D626F436C6F736528636F6D626F2C2074727565293B207D0A202020202020202072657475726E2066616C73653B0A202020207D0A2020202072657475726E2066616C73653B0A20207D0A0A2020646F63';
wwv_flow_imp.g_varchar2_table(95) := '756D656E742E6164644576656E744C697374656E65722822696E707574222C2066756E6374696F6E20286529207B0A202020207661722074203D20652E7461726765743B0A2020202069662028742E636C6F7365737420262620742E636C6F7365737428';
wwv_flow_imp.g_varchar2_table(96) := '222E64672D65646974222929207B20636C6561724669656C644572726F7228742E636C6F7365737428222E64672D656469742229293B207D0A2020202076617220696E707574203D20742E636C6F7365737420262620742E636C6F7365737428222E6467';
wwv_flow_imp.g_varchar2_table(97) := '2D636F6D626F2D696E70757422293B0A202020206966202821696E70757429207B2072657475726E3B207D0A2020202064656C65746520696E7075742E646174617365742E646756616C75653B202020202020202020202F2F20747970696E6720696E76';
wwv_flow_imp.g_varchar2_table(98) := '616C696461746573207468652073656C656374696F6E0A20202020636F6D626F4F70656E28696E7075742E636C6F7365737428222E64672D636F6D626F22292C20696E7075742E76616C7565293B0A20207D293B0A0A2020646F63756D656E742E616464';
wwv_flow_imp.g_varchar2_table(99) := '4576656E744C697374656E65722822666F637573696E222C2066756E6374696F6E20286529207B0A2020202076617220696E707574203D20652E7461726765742E636C6F7365737420262620652E7461726765742E636C6F7365737428222E64672D636F';
wwv_flow_imp.g_varchar2_table(100) := '6D626F2D696E70757422293B0A2020202069662028696E7075742026262021636F6D626F49734F70656E28696E7075742E636C6F7365737428222E64672D636F6D626F22292929207B20636F6D626F4F70656E28696E7075742E636C6F7365737428222E';
wwv_flow_imp.g_varchar2_table(101) := '64672D636F6D626F22292C202222293B207D0A20207D293B0A0A2020646F63756D656E742E6164644576656E744C697374656E65722822666F6375736F7574222C2066756E6374696F6E20286529207B0A2020202076617220636F6D626F203D20652E74';
wwv_flow_imp.g_varchar2_table(102) := '61726765742E636C6F7365737420262620652E7461726765742E636C6F7365737428222E64672D636F6D626F22293B0A202020206966202821636F6D626F29207B2072657475726E3B207D0A2020202077696E646F772E73657454696D656F7574286675';
wwv_flow_imp.g_varchar2_table(103) := '6E6374696F6E202829207B0A2020202020206966202821636F6D626F2E636F6E7461696E7328646F63756D656E742E616374697665456C656D656E742929207B20636F6D626F436C6F736528636F6D626F2C2074727565293B207D0A202020207D2C2030';
wwv_flow_imp.g_varchar2_table(104) := '293B0A20207D293B0A0A20202F2F206B65657020666F63757320696E2074686520626F78207768696C6520746865206C6973742069732075736564207769746820746865206D6F7573650A2020646F63756D656E742E6164644576656E744C697374656E';
wwv_flow_imp.g_varchar2_table(105) := '657228226D6F757365646F776E222C2066756E6374696F6E20286529207B0A20202020766172206C69203D20652E7461726765742E636C6F7365737420262620652E7461726765742E636C6F7365737428222E64672D636F6D626F2D6C697374206C695B';
wwv_flow_imp.g_varchar2_table(106) := '646174612D695D22293B0A20202020696620286C6929207B0A202020202020652E70726576656E7444656661756C7428293B0A202020202020636F6D626F5069636B286C692E636C6F7365737428222E64672D636F6D626F22292C207061727365496E74';
wwv_flow_imp.g_varchar2_table(107) := '286C692E646174617365742E692C20313029293B0A20202020202072657475726E3B0A202020207D0A2020202069662028652E7461726765742E636C6F736573742026262028652E7461726765742E636C6F7365737428222E64672D636F6D626F2D6C69';
wwv_flow_imp.g_varchar2_table(108) := '73742229207C7C20652E7461726765742E636C6F7365737428222E64672D636F6D626F2D62746E22292929207B0A202020202020652E70726576656E7444656661756C7428293B0A202020207D0A20207D293B0A0A20202F2F206C6F6164206D6F726520';
wwv_flow_imp.g_varchar2_table(109) := '617320746865206C697374207363726F6C6C733B206B656570206F70656E206C69737473206E65787420746F20746865697220626F780A2020646F63756D656E742E6164644576656E744C697374656E657228227363726F6C6C222C2066756E6374696F';
wwv_flow_imp.g_varchar2_table(110) := '6E20286529207B0A20202020766172206C203D20652E74617267657420262620652E7461726765742E636C6173734C69737420262620652E7461726765742E636C6173734C6973742E636F6E7461696E73282264672D636F6D626F2D6C6973742229203F';
wwv_flow_imp.g_varchar2_table(111) := '20652E746172676574203A206E756C6C3B0A20202020696620286C29207B0A20202020202076617220636F6D626F203D206C2E636C6F7365737428222E64672D636F6D626F22293B0A202020202020696620286C2E7363726F6C6C546F70202B206C2E63';
wwv_flow_imp.g_varchar2_table(112) := '6C69656E74486569676874203E3D206C2E7363726F6C6C486569676874202D2032342026260A20202020202020202020636F6D626F2E5F6D61746368657320262620636F6D626F2E5F73686F776E203C20636F6D626F2E5F6D6174636865732E6C656E67';
wwv_flow_imp.g_varchar2_table(113) := '746829207B0A2020202020202020766172207374203D206C2E7363726F6C6C546F703B0A2020202020202020636F6D626F2E5F73686F776E202B3D20434F4D424F5F504147453B0A2020202020202020636F6D626F5061696E7428636F6D626F293B0A20';
wwv_flow_imp.g_varchar2_table(114) := '202020202020206C2E7363726F6C6C546F70203D2073743B0A2020202020207D0A20202020202072657475726E3B0A202020207D0A20202020646F63756D656E742E717565727953656C6563746F72416C6C28222E64672D636F6D626F2D6C6973742E69';
wwv_flow_imp.g_varchar2_table(115) := '732D6F70656E22292E666F72456163682866756E6374696F6E20287829207B0A202020202020636F6D626F506F736974696F6E28782E636C6F7365737428222E64672D636F6D626F2229293B0A202020207D293B0A20207D2C2074727565293B0A0A2020';
wwv_flow_imp.g_varchar2_table(116) := '77696E646F772E6164644576656E744C697374656E65722822726573697A65222C2066756E6374696F6E202829207B0A20202020646F63756D656E742E717565727953656C6563746F72416C6C28222E64672D636F6D626F2D6C6973742E69732D6F7065';
wwv_flow_imp.g_varchar2_table(117) := '6E22292E666F72456163682866756E6374696F6E20287829207B0A202020202020636F6D626F506F736974696F6E28782E636C6F7365737428222E64672D636F6D626F2229293B0A202020207D293B0A20207D293B0A0A20202F2F202D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(118) := '2D2D2D2D2D2D2D2D206669656C642076616C756573202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0A202066756E6374696F6E206669656C6456616C7565286669656C6429207B0A20202020696620286669656C642E636C6173734C6973742E636F6E746169';
wwv_flow_imp.g_varchar2_table(119) := '6E73282264672D636F6D626F2D696E707574222929207B0A20202020202072657475726E206669656C642E646174617365742E646756616C75653B0A202020207D0A20202020696620286669656C642E636C6173734C6973742E636F6E7461696E732822';
wwv_flow_imp.g_varchar2_table(120) := '64672D7377697463682D696E707574222929207B0A20202020202072657475726E206669656C642E636865636B6564203F206669656C642E646174617365742E64674F6E203A206669656C642E646174617365742E64674F66663B0A202020207D0A2020';
wwv_flow_imp.g_varchar2_table(121) := '202072657475726E206669656C642E76616C75653B0A20207D0A0A202066756E6374696F6E207365744669656C6456616C7565286669656C642C207629207B0A2020202076203D2076203D3D206E756C6C203F202222203A20537472696E672876293B0A';
wwv_flow_imp.g_varchar2_table(122) := '20202020696620286669656C642E636C6173734C6973742E636F6E7461696E73282264672D636F6D626F2D696E707574222929207B0A2020202020206669656C642E646174617365742E646756616C7565203D20763B0A2020202020206669656C642E76';
wwv_flow_imp.g_varchar2_table(123) := '616C7565203D20646973706C6179466F72286669656C642E636C6F7365737428222E64672D636F6D626F22292C207629207C7C20763B0A202020207D20656C736520696620286669656C642E636C6173734C6973742E636F6E7461696E73282264672D73';
wwv_flow_imp.g_varchar2_table(124) := '77697463682D696E707574222929207B0A2020202020206669656C642E636865636B6564203D2076203D3D3D206669656C642E646174617365742E64674F6E3B0A202020207D20656C7365207B0A2020202020206669656C642E76616C7565203D20763B';
wwv_flow_imp.g_varchar2_table(125) := '0A202020207D0A20207D0A0A20202F2F202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2076616C69646174696F6E202873616D652072756C657320617320736D61727431726F77766965775F706B672E636865636B5F76616C756529202D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(126) := '2D2D2D2D2D2D2D0A202066756E6374696F6E20706172736552756C6573287465787429207B0A202020207661722072203D207B7D2C2073203D2074657874207C7C2022222C20693B0A2020202069203D20732E746F4C6F7765724361736528292E696E64';
wwv_flow_imp.g_varchar2_table(127) := '65784F6628226D6573736167653D22293B0A202020206966202869203E202D3129207B20722E6D657373616765203D20732E736C6963652869202B2038292E7472696D28293B2073203D20732E736C69636528302C2069293B207D0A2020202069203D20';
wwv_flow_imp.g_varchar2_table(128) := '732E746F4C6F7765724361736528292E696E6465784F6628227061747465726E3D22293B0A202020206966202869203E202D3129207B20722E7061747465726E203D20732E736C6963652869202B2038292E7472696D28292E7265706C616365282F5B3B';
wwv_flow_imp.g_varchar2_table(129) := '5C735D2B242F2C202222293B2073203D20732E736C69636528302C2069293B207D0A20202020732E73706C697428223B22292E666F72456163682866756E6374696F6E2028746F6B29207B0A202020202020746F6B203D20746F6B2E7472696D28293B0A';
wwv_flow_imp.g_varchar2_table(130) := '2020202020206966202821746F6B29207B2072657475726E3B207D0A202020202020766172206B203D20746F6B2E73706C697428223D22295B305D2E7472696D28292E746F4C6F7765724361736528292C2061203D20746F6B2E696E6465784F6628223D';
wwv_flow_imp.g_varchar2_table(131) := '2229203E202D31203F20746F6B2E736C69636528746F6B2E696E6465784F6628223D2229202B2031292E7472696D2829203A20747275653B0A202020202020725B6B5D203D20613B0A202020207D293B0A2020202072657475726E20723B0A20207D0A0A';
wwv_flow_imp.g_varchar2_table(132) := '202066756E6374696F6E2076616C69646174654669656C64286669656C6429207B0A202020207661722072756C6573203D206669656C642E646174617365742E646752756C65733B0A20202020696620282172756C657329207B2072657475726E206E75';
wwv_flow_imp.g_varchar2_table(133) := '6C6C3B207D0A202020207661722072203D20706172736552756C65732872756C6573292C2076203D206669656C6456616C7565286669656C64292C206C6162656C203D206669656C642E646174617365742E64674C6162656C207C7C202256616C756522';
wwv_flow_imp.g_varchar2_table(134) := '3B0A2020202076203D2076203D3D206E756C6C203F202222203A20537472696E672876293B0A2020202076617220656D707479203D20762E7472696D2829203D3D3D2022222C206E203D204E756D6265722876292C20657272203D206E756C6C3B0A2020';
wwv_flow_imp.g_varchar2_table(135) := '202069662028722E726571756972656420262620656D70747929207B20657272203D206C6162656C202B20222069732072657175697265642E223B207D0A20202020656C7365206966202821656D70747929207B0A2020202020206966202828722E6D69';
wwv_flow_imp.g_varchar2_table(136) := '6E20213D3D20756E646566696E6564207C7C20722E6D617820213D3D20756E646566696E6564292026262069734E614E286E2929207B20657272203D206C6162656C202B2022206D7573742062652061206E756D6265722E223B207D0A20202020202065';
wwv_flow_imp.g_varchar2_table(137) := '6C73652069662028722E6D696E20213D3D20756E646566696E6564202626206E203C204E756D62657228722E6D696E2929207B20657272203D206C6162656C202B2022206D757374206265206174206C656173742022202B20722E6D696E202B20222E22';
wwv_flow_imp.g_varchar2_table(138) := '3B207D0A202020202020656C73652069662028722E6D617820213D3D20756E646566696E6564202626206E203E204E756D62657228722E6D61782929207B20657272203D206C6162656C202B2022206D757374206265206174206D6F73742022202B2072';
wwv_flow_imp.g_varchar2_table(139) := '2E6D6178202B20222E223B207D0A202020202020656C73652069662028722E6D696E6C656E67746820213D3D20756E646566696E656420262620762E6C656E677468203C204E756D62657228722E6D696E6C656E6774682929207B20657272203D206C61';
wwv_flow_imp.g_varchar2_table(140) := '62656C202B2022206D757374206265206174206C656173742022202B20722E6D696E6C656E677468202B202220636861726163746572732E223B207D0A202020202020656C73652069662028722E6D61786C656E67746820213D3D20756E646566696E65';
wwv_flow_imp.g_varchar2_table(141) := '6420262620762E6C656E677468203E204E756D62657228722E6D61786C656E6774682929207B20657272203D206C6162656C202B2022206D757374206265206174206D6F73742022202B20722E6D61786C656E677468202B202220636861726163746572';
wwv_flow_imp.g_varchar2_table(142) := '732E223B207D0A202020202020656C73652069662028722E7061747465726E29207B0A2020202020202020747279207B2069662028216E65772052656745787028722E7061747465726E292E7465737428762929207B20657272203D206C6162656C202B';
wwv_flow_imp.g_varchar2_table(143) := '2022206973206E6F7420696E2074686520657870656374656420666F726D61742E223B207D207D0A2020202020202020636174636820287829207B202F2A2061207061747465726E206F6E6C79204F7261636C6520756E6465727374616E64733A207468';
wwv_flow_imp.g_varchar2_table(144) := '652073657276657220636865636B73206974202A2F207D0A2020202020207D0A202020207D0A2020202072657475726E20657272203F2028722E6D657373616765207C7C2065727229203A206E756C6C3B0A20207D0A0A202066756E6374696F6E207368';
wwv_flow_imp.g_varchar2_table(145) := '6F774669656C644572726F72286669656C642C206D736729207B0A20202020766172206974656D203D206669656C642E636C6F7365737428222E64672D6974656D22292C2076616C203D206974656D202626206974656D2E717565727953656C6563746F';
wwv_flow_imp.g_varchar2_table(146) := '7228222E64672D76616C22293B0A20202020696620282176616C29207B2072657475726E3B207D0A20202020636C6561724669656C644572726F72286669656C64293B0A202020207661722064203D20646F63756D656E742E637265617465456C656D65';
wwv_flow_imp.g_varchar2_table(147) := '6E74282264697622293B0A20202020642E636C6173734E616D65203D202264672D6669656C64657272223B0A20202020642E7365744174747269627574652822726F6C65222C2022616C65727422293B0A20202020642E74657874436F6E74656E74203D';
wwv_flow_imp.g_varchar2_table(148) := '206D73673B0A2020202076616C2E617070656E644368696C642864293B0A2020202076616C2E636C6173734C6973742E61646428226861732D65727222293B0A202020206669656C642E636C6173734C6973742E616464282269732D696E76616C696422';
wwv_flow_imp.g_varchar2_table(149) := '293B0A202020206669656C642E7365744174747269627574652822617269612D696E76616C6964222C20227472756522293B0A20207D0A0A202066756E6374696F6E20636C6561724669656C644572726F72286669656C6429207B0A2020202076617220';
wwv_flow_imp.g_varchar2_table(150) := '6974656D203D206669656C642E636C6F7365737428222E64672D6974656D22292C2076616C203D206974656D202626206974656D2E717565727953656C6563746F7228222E64672D76616C22293B0A20202020696620282176616C29207B207265747572';
wwv_flow_imp.g_varchar2_table(151) := '6E3B207D0A2020202076616C2E717565727953656C6563746F72416C6C28222E64672D6669656C6465727222292E666F72456163682866756E6374696F6E20286429207B20642E72656D6F766528293B207D293B0A2020202076616C2E636C6173734C69';
wwv_flow_imp.g_varchar2_table(152) := '73742E72656D6F766528226861732D65727222293B0A202020206669656C642E636C6173734C6973742E72656D6F7665282269732D696E76616C696422293B0A202020206669656C642E72656D6F76654174747269627574652822617269612D696E7661';
wwv_flow_imp.g_varchar2_table(153) := '6C696422293B0A20207D0A0A20202F2F202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D20736176696E67202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0A20202F2F2041207265616461626C65206D65737361676520666F72207768617465766572206120666169';
wwv_flow_imp.g_varchar2_table(154) := '6C65642068616E646C65722063616C6C2072656A6563747320776974683A20616E0A20202F2F204572726F722C2061206A715848522066726F6D20617065782E73657276657220286F66666C696E652C2074696D656F75742C2048545450206572726F72';
wwv_flow_imp.g_varchar2_table(155) := '29206F7220746578742E0A202066756E6374696F6E2065727254657874286529207B0A2020202069662028216529207B2072657475726E2022436F756C64206E6F7420736176652E223B207D0A2020202069662028747970656F662065203D3D3D202273';
wwv_flow_imp.g_varchar2_table(156) := '7472696E672229207B2072657475726E20653B207D0A2020202069662028652E6D65737361676529207B2072657475726E20652E6D6573736167653B207D0A2020202069662028652E726573706F6E73654A534F4E20262620652E726573706F6E73654A';
wwv_flow_imp.g_varchar2_table(157) := '534F4E2E6D65737361676529207B2072657475726E20652E726573706F6E73654A534F4E2E6D6573736167653B207D0A2020202069662028652E737461747573203D3D3D2030207C7C20652E72656164795374617465203D3D3D203029207B0A20202020';
wwv_flow_imp.g_varchar2_table(158) := '202072657475726E2022436F756C64206E6F7420726561636820746865207365727665722E20436865636B20796F757220636F6E6E656374696F6E20616E642074727920616761696E2E223B0A202020207D0A2020202069662028652E73746174757329';
wwv_flow_imp.g_varchar2_table(159) := '207B2072657475726E2022436F756C64206E6F742073617665202822202B20652E737461747573202B2028652E73746174757354657874203F20222022202B20652E73746174757354657874203A20222229202B2022292E223B207D0A20202020726574';
wwv_flow_imp.g_varchar2_table(160) := '75726E2022436F756C64206E6F7420736176652E223B0A20207D0A0A20202F2F204F6E652063616C6C206F662074686520646576656C6F706572277320456469742048616E646C65722E206374782E76657273696F6E2063617272696573207468652072';
wwv_flow_imp.g_varchar2_table(161) := '65636F72640A20202F2F2076657273696F6E2028726567696F6E2056657273696F6E20436F6C756D6E2920666F72206120636F6E666C69637420636865636B3B206120726573706F6E736520776974680A20202F2F207B2076657273696F6E207D207570';
wwv_flow_imp.g_varchar2_table(162) := '64617465732069742C207B207374617475733A2022434F4E464C49435422207D206D65616E7320736F6D656F6E6520656C73652073617665642066697273742E0A202066756E6374696F6E2063616C6C53617665286669656C6429207B0A202020207661';
wwv_flow_imp.g_varchar2_table(163) := '7220666E203D20636F6D70696C6543616C6C286669656C642E6765744174747269627574652822646174612D64672D63616C6C2229293B0A202020206966202821666E29207B0A20202020202072657475726E2050726F6D6973652E7265736F6C766528';
wwv_flow_imp.g_varchar2_table(164) := '7B207374617475733A20224552524F52222C206D6573736167653A2022456469742068616E646C65722063616C6C20636F756C64206E6F7420626520636F6D70696C65642E22207D293B0A202020207D0A202020207661722067203D206669656C642E63';
wwv_flow_imp.g_varchar2_table(165) := '6C6F7365737428222E646722293B0A2020202076617220637478203D207B0A202020202020636F6C756D6E3A2020206669656C642E6765744174747269627574652822646174612D64672D636F6C22292C0A2020202020206F6C6456616C75653A206669';
wwv_flow_imp.g_varchar2_table(166) := '656C642E6765744174747269627574652822646174612D64672D6F6C6422292C0A202020202020746F6B656E3A202020206669656C642E6765744174747269627574652822646174612D64672D746F6B656E22292C0A20202020202076657273696F6E3A';
wwv_flow_imp.g_varchar2_table(167) := '202067203F20672E646174617365742E646756657273696F6E203A20756E646566696E65640A202020207D3B0A20202020766172207265733B0A20202020747279207B20726573203D20666E286669656C6456616C7565286669656C64292C2063747829';
wwv_flow_imp.g_varchar2_table(168) := '3B207D0A20202020636174636820286529207B2072657475726E2050726F6D6973652E7265736F6C7665287B207374617475733A20224552524F52222C206D6573736167653A2065727254657874286529207D293B207D0A2020202072657475726E2050';
wwv_flow_imp.g_varchar2_table(169) := '726F6D6973652E7265736F6C766528726573292E7468656E2866756E6374696F6E20287229207B0A20202020202072203D2072207C7C207B7D3B0A20202020202069662028722E76657273696F6E20213D3D20756E646566696E656420262620722E7665';
wwv_flow_imp.g_varchar2_table(170) := '7273696F6E20213D3D206E756C6C202626206729207B20672E646174617365742E646756657273696F6E203D20722E76657273696F6E3B207D0A20202020202072657475726E207B207374617475733A2028722E737461747573207C7C20225355434345';
wwv_flow_imp.g_varchar2_table(171) := '535322292E746F55707065724361736528292C206D6573736167653A20722E6D657373616765207D3B0A202020207D2C2066756E6374696F6E20286529207B0A20202020202072657475726E207B207374617475733A20224552524F52222C206D657373';
wwv_flow_imp.g_varchar2_table(172) := '6167653A2065727254657874286529207D3B0A202020207D293B0A20207D0A0A202066756E6374696F6E206564697461626C654974656D73286729207B0A2020202072657475726E2041727261792E70726F746F747970652E66696C7465722E63616C6C';
wwv_flow_imp.g_varchar2_table(173) := '28672E717565727953656C6563746F72416C6C28222E64672D6974656D5B646174612D64672D6E616D655D22292C2066756E6374696F6E2028697429207B0A20202020202072657475726E2069742E717565727953656C6563746F7228222E64672D6564';
wwv_flow_imp.g_varchar2_table(174) := '6974777261702229202626202169742E636C6173734C6973742E636F6E7461696E73282264672D68696464656E22293B0A202020207D293B0A20207D0A0A202066756E6374696F6E2068616E646C6545646974286669656C642C20777261702C20697465';
wwv_flow_imp.g_varchar2_table(175) := '6D2C206F70747329207B0A202020206F707473203D206F707473207C7C207B7D3B0A2020202076617220726F6F74203D206974656D2E636C6F7365737428222E64672D726F6F7422292C2067203D206974656D2E636C6F7365737428222E646722293B0A';
wwv_flow_imp.g_varchar2_table(176) := '202020202F2F206F6E65207361766520617420612074696D653A2061207365636F6E6420456E746572202F20636C69636B207768696C652074686973206F6E65206973206F6E206974730A202020202F2F2077617920776F756C642073656E6420746865';
wwv_flow_imp.g_varchar2_table(177) := '206F6C642076657273696F6E20616E6420636F6D65206261636B20617320612066616C736520636F6E666C6963740A20202020696620286974656D2E5F6467536176696E6729207B2072657475726E3B207D0A0A20202020696620286669656C642E636C';
wwv_flow_imp.g_varchar2_table(178) := '6173734C6973742E636F6E7461696E73282264672D636F6D626F2D696E707574222929207B0A202020202020636F6D626F436C6F7365286669656C642E636C6F7365737428222E64672D636F6D626F22292C2074727565293B0A20202020202069662028';
wwv_flow_imp.g_varchar2_table(179) := '6669656C642E646174617365742E646756616C7565203D3D3D20756E646566696E656429207B0A202020202020202073686F774669656C644572726F72286669656C642C20225069636B20612076616C75652066726F6D20746865206C6973742E22293B';
wwv_flow_imp.g_varchar2_table(180) := '0A202020202020202072657475726E3B0A2020202020207D0A202020207D0A2020202076617220657272203D2076616C69646174654669656C64286669656C64293B0A202020206966202865727229207B2073686F774669656C644572726F7228666965';
wwv_flow_imp.g_varchar2_table(181) := '6C642C20657272293B206669656C642E666F63757328293B2072657475726E3B207D0A0A202020202F2F206E6F7468696E67206368616E6765643A206A75737420636C6F73652028616E64206D6F7665206F6E292C206E6F20726F756E6420747269700A';
wwv_flow_imp.g_varchar2_table(182) := '20202020696620286669656C642E5F696E697469616C20213D3D20756E646566696E656420262620537472696E67286669656C6456616C7565286669656C642929203D3D3D20537472696E67286669656C642E5F696E697469616C2929207B0A20202020';
wwv_flow_imp.g_varchar2_table(183) := '2020636C6F7365456469746F72286974656D293B0A202020202020696620286F7074732E6E65787429207B206F70656E42794E616D6528672C206F7074732E6E657874293B207D0A20202020202072657475726E3B0A202020207D0A0A20202020766172';
wwv_flow_imp.g_varchar2_table(184) := '207361766542746E203D2077726170203F20777261702E717565727953656C6563746F7228222E64672D736176652229203A206E756C6C3B0A202020207661722063616E63656C42746E203D2077726170203F20777261702E717565727953656C656374';
wwv_flow_imp.g_varchar2_table(185) := '6F7228222E64672D63616E63656C2229203A206E756C6C3B0A20202020766172207361766549636F6E203D207361766542746E203F207361766542746E2E717565727953656C6563746F7228227370616E2229203A206E756C6C3B0A2020202076617220';
wwv_flow_imp.g_varchar2_table(186) := '736176656449636F6E436C617373203D207361766549636F6E203F207361766549636F6E2E636C6173734E616D65203A206E756C6C3B0A2020202066756E6374696F6E2062757379286F6E29207B0A2020202020206974656D2E5F6467536176696E6720';
wwv_flow_imp.g_varchar2_table(187) := '3D206F6E3B0A2020202020206669656C642E636C6173734C6973742E746F67676C65282269732D62757379222C206F6E293B0A202020202020696620287361766542746E29207B207361766542746E2E64697361626C6564203D206F6E3B207361766542';
wwv_flow_imp.g_varchar2_table(188) := '746E2E636C6173734C6973742E746F67676C65282269732D7370696E6E696E67222C206F6E293B207D0A2020202020206966202863616E63656C42746E29207B2063616E63656C42746E2E64697361626C6564203D206F6E3B207D0A2020202020206966';
wwv_flow_imp.g_varchar2_table(189) := '20287361766549636F6E29207B207361766549636F6E2E636C6173734E616D65203D206F6E203F202266612066612D7370696E6E65722066612D616E696D2D7370696E22203A20736176656449636F6E436C6173733B207D0A202020207D0A0A20202020';
wwv_flow_imp.g_varchar2_table(190) := '627573792874727565293B0A2020202063616C6C53617665286669656C64292E7468656E2866756E6374696F6E20287229207B0A202020202020627573792866616C7365293B0A2020202020206D61726B5374617465286669656C642C20722E73746174';
wwv_flow_imp.g_varchar2_table(191) := '7573293B0A20202020202069662028722E737461747573203D3D3D2022434F4E464C4943542229207B0A20202020202020206E6F7469667928224552524F52222C20722E6D657373616765207C7C2022536F6D656F6E6520656C7365206368616E676564';
wwv_flow_imp.g_varchar2_table(192) := '2074686973207265636F72642E20546865206C61746573742076657273696F6E2069732073686F776E2E22293B0A202020202020202069662028726F6F7420262620726F6F742E646174617365742E6467416A617829207B2072656672657368526F6F74';
wwv_flow_imp.g_varchar2_table(193) := '28726F6F74293B207D0A202020202020202072657475726E3B0A2020202020207D0A20202020202069662028722E737461747573203D3D3D20224552524F522229207B0A202020202020202073686F774669656C644572726F72286669656C642C20722E';
wwv_flow_imp.g_varchar2_table(194) := '6D657373616765207C7C2022436F756C64206E6F7420736176652E22293B0A202020202020202072657475726E3B0A2020202020207D0A20202020202069662028722E737461747573203D3D3D20225741524E494E472229207B206E6F74696679282257';
wwv_flow_imp.g_varchar2_table(195) := '41524E494E47222C20722E6D657373616765293B207D0A202020202020766172206368616E6765203D207B20636F6C3A206669656C642E646174617365742E6467436F6C2C206C6162656C3A206669656C642E646174617365742E64674C6162656C2C20';
wwv_flow_imp.g_varchar2_table(196) := '6F6C6456616C75653A206669656C642E5F696E697469616C207D3B0A2020202020206669656C642E7365744174747269627574652822646174612D64672D6F6C64222C206669656C6456616C7565286669656C6429293B0A202020202020636C6F736545';
wwv_flow_imp.g_varchar2_table(197) := '6469746F72286974656D293B0A20202020202069662028726F6F7420262620726F6F742E646174617365742E6467416A617829207B0A20202020202020202F2F2072652D72656E6465722066726F6D2074686520646174616261736520736F20666F726D';
wwv_flow_imp.g_varchar2_table(198) := '617474696E672C2062616467657320616E6420646570656E64656E740A20202020202020202F2F206669656C64732073686F772077686174207761732073617665643B207468656E206F6666657220556E646F0A20202020202020207265667265736852';
wwv_flow_imp.g_varchar2_table(199) := '6F6F7428726F6F742C207B0A202020202020202020206F70656E3A206F7074732E6E6578742C0A2020202020202020202061667465723A2066756E6374696F6E202829207B0A20202020202020202020202073686F77546F61737428726F6F742C20722E';
wwv_flow_imp.g_varchar2_table(200) := '6D657373616765207C7C2028286368616E67652E6C6162656C207C7C20224669656C642229202B20222073617665642E22292C205B6368616E67655D293B0A202020202020202020207D0A20202020202020207D293B0A2020202020207D20656C736520';
wwv_flow_imp.g_varchar2_table(201) := '7B0A20202020202020206E6F74696679282253554343455353222C20722E6D657373616765293B0A2020202020207D0A202020207D293B0A20207D0A0A20202F2F202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D207065722D6669656C6420656469746F7220';
wwv_flow_imp.g_varchar2_table(202) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0A202066756E6374696F6E206F70656E456469746F72286974656D2C206E6F466F63757329207B0A202020207661722077726170203D206974656D2E717565727953656C6563746F7228222E64672D6564697477';
wwv_flow_imp.g_varchar2_table(203) := '72617022293B0A2020202069662028217772617029207B2072657475726E3B207D0A202020207661722067203D206974656D2E636C6F7365737428222E646722293B0A20202020696620286974656D2E636C6173734C6973742E636F6E7461696E732822';
wwv_flow_imp.g_varchar2_table(204) := '64672D7365632D68696464656E2229202626206729207B2020202F2F206F70656E206974732073656374696F6E2066697273740A20202020202076617220736563203D20672E717565727953656C6563746F7228272E64672D7365635B646174612D6467';
wwv_flow_imp.g_varchar2_table(205) := '2D7365633D2227202B2063737371286974656D2E646174617365742E646753656329202B2027225D27293B0A2020202020206966202873656329207B2073657453656374696F6E28672C207365632C2066616C73652C2066616C7365293B2072656C6179';
wwv_flow_imp.g_varchar2_table(206) := '6F75742867293B207265616E63686F722867293B207D0A202020207D0A202020206974656D2E636C6173734C6973742E616464282269732D65646974696E6722293B0A202020206974656D2E717565727953656C6563746F72416C6C28222E64672D7669';
wwv_flow_imp.g_varchar2_table(207) := '65772C202E64672D6564697462746E22292E666F72456163682866756E6374696F6E20286E29207B0A2020202020206E2E7374796C652E646973706C6179203D20226E6F6E65223B0A202020207D293B0A20202020777261702E68696464656E203D2066';
wwv_flow_imp.g_varchar2_table(208) := '616C73653B0A20202020766172206669656C64203D20777261702E717565727953656C6563746F7228222E64672D6564697422293B0A2020202069662028216669656C6429207B2072657475726E3B207D0A20202020696620286669656C642E636C6173';
wwv_flow_imp.g_varchar2_table(209) := '734C6973742E636F6E7461696E73282264672D636F6D626F2D696E707574222929207B0A2020202020202F2F2073686F772074686520646973706C61792076616C7565206F66207468652063757272656E742072657475726E2076616C75652C206C696B';
wwv_flow_imp.g_varchar2_table(210) := '6520506F707570204C4F560A20202020202076617220636F6D626F203D206669656C642E636C6F7365737428222E64672D636F6D626F22292C2076203D206669656C642E646174617365742E646756616C7565207C7C2022223B0A202020202020666965';
wwv_flow_imp.g_varchar2_table(211) := '6C642E646174617365742E64674C617374203D20763B0A2020202020206669656C642E76616C7565203D20646973706C6179466F7228636F6D626F2C207629207C7C206669656C642E76616C75653B0A202020207D0A202020206669656C642E5F726573';
wwv_flow_imp.g_varchar2_table(212) := '746F7265203D207B2076616C75653A206669656C642E76616C75652C20636865636B65643A206669656C642E636865636B65642C20646756616C75653A206669656C642E646174617365742E646756616C7565207D3B0A202020206669656C642E5F696E';
wwv_flow_imp.g_varchar2_table(213) := '697469616C203D206669656C6456616C7565286669656C64293B0A2020202069662028216E6F466F63757329207B0A2020202020206669656C642E666F63757328293B0A202020202020696620286669656C642E73656C656374202626206669656C642E';
wwv_flow_imp.g_varchar2_table(214) := '7479706520213D3D2022636865636B626F7822202626206669656C642E7461674E616D6520213D3D202253454C4543542229207B206669656C642E73656C65637428293B207D0A202020207D0A20207D0A0A202066756E6374696F6E206F70656E42794E';
wwv_flow_imp.g_varchar2_table(215) := '616D6528672C206E616D6529207B0A20202020766172206974203D206720262620672E717565727953656C6563746F7228272E64672D6974656D5B646174612D64672D6E616D653D2227202B2063737371286E616D6529202B2027225D27293B0A202020';
wwv_flow_imp.g_varchar2_table(216) := '206966202869742026262069742E717565727953656C6563746F7228222E64672D6564697477726170222929207B206F70656E456469746F72286974293B207D0A20207D0A0A202066756E6374696F6E20636C6F7365456469746F72286974656D29207B';
wwv_flow_imp.g_varchar2_table(217) := '0A202020207661722077726170203D206974656D2E717565727953656C6563746F7228222E64672D656469747772617022293B0A2020202069662028217772617029207B2072657475726E3B207D0A202020206974656D2E717565727953656C6563746F';
wwv_flow_imp.g_varchar2_table(218) := '72416C6C28222E64672D636F6D626F22292E666F72456163682866756E6374696F6E20286329207B20636F6D626F436C6F73652863293B207D293B0A202020207661722066203D206974656D2E717565727953656C6563746F7228222E64672D65646974';
wwv_flow_imp.g_varchar2_table(219) := '22293B0A20202020696620286629207B20636C6561724669656C644572726F722866293B207D0A202020206974656D2E636C6173734C6973742E72656D6F7665282269732D65646974696E6722293B0A20202020777261702E68696464656E203D207472';
wwv_flow_imp.g_varchar2_table(220) := '75653B0A202020206974656D2E717565727953656C6563746F72416C6C28222E64672D766965772C202E64672D6564697462746E22292E666F72456163682866756E6374696F6E20286E29207B0A2020202020206E2E7374796C652E646973706C617920';
wwv_flow_imp.g_varchar2_table(221) := '3D2022223B0A202020207D293B0A20207D0A0A202066756E6374696F6E2063616E63656C45646974286974656D29207B0A20202020766172206669656C64203D206974656D2E717565727953656C6563746F7228222E64672D6564697422293B0A202020';
wwv_flow_imp.g_varchar2_table(222) := '20696620286669656C64202626206669656C642E5F726573746F726529207B0A2020202020206669656C642E76616C7565203D206669656C642E5F726573746F72652E76616C75653B0A2020202020206669656C642E636865636B6564203D206669656C';
wwv_flow_imp.g_varchar2_table(223) := '642E5F726573746F72652E636865636B65643B0A202020202020696620286669656C642E5F726573746F72652E646756616C7565203D3D3D20756E646566696E656429207B2064656C657465206669656C642E646174617365742E646756616C75653B20';
wwv_flow_imp.g_varchar2_table(224) := '7D0A202020202020656C7365207B206669656C642E646174617365742E646756616C7565203D206669656C642E5F726573746F72652E646756616C75653B207D0A202020202020696620286669656C642E636C6173734C6973742E636F6E7461696E7328';
wwv_flow_imp.g_varchar2_table(225) := '2264672D7377697463682D696E707574222929207B0A202020202020202076617220747874203D206974656D2E717565727953656C6563746F7228222E64672D7377697463682D7465787422293B0A20202020202020207478742E74657874436F6E7465';
wwv_flow_imp.g_varchar2_table(226) := '6E74203D206669656C642E636865636B6564203F207478742E646174617365742E6F6E203A207478742E646174617365742E6F66663B0A2020202020207D0A202020207D0A20202020636C6F7365456469746F72286974656D293B0A20207D0A0A20202F';
wwv_flow_imp.g_varchar2_table(227) := '2F202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2077686F6C652D636172642065646974202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0A20202F2F204F6E652045646974206F70656E73206576657279206564697461626C65206669656C643B20612062617220';
wwv_flow_imp.g_varchar2_table(228) := '696E73696465207468652063617264207361766573207468656D0A20202F2F20746F67657468657220284374726C2B456E74657229206F722063616E63656C732028457363292E0A202066756E6374696F6E2065646974416C6C286729207B0A20202020';
wwv_flow_imp.g_varchar2_table(229) := '696620282167207C7C20672E636C6173734C6973742E636F6E7461696E73282269732D65646974616C6C222929207B2072657475726E3B207D0A20202020766172206974656D73203D206564697461626C654974656D732867293B0A2020202069662028';
wwv_flow_imp.g_varchar2_table(230) := '216974656D732E6C656E67746829207B2072657475726E3B207D0A202020206974656D732E666F72456163682866756E6374696F6E2028697429207B206966202869742E636C6173734C6973742E636F6E7461696E73282269732D65646974696E672229';
wwv_flow_imp.g_varchar2_table(231) := '29207B2063616E63656C45646974286974293B207D207D293B0A20202020672E717565727953656C6563746F72416C6C28222E64672D7365632E69732D636F6C6C617073656422292E666F72456163682866756E6374696F6E202873656329207B0A2020';
wwv_flow_imp.g_varchar2_table(232) := '20202020696620286974656D732E736F6D652866756E6374696F6E2028697429207B2072657475726E2069742E646174617365742E6467536563203D3D3D207365632E646174617365742E64675365633B207D2929207B0A202020202020202073657453';
wwv_flow_imp.g_varchar2_table(233) := '656374696F6E28672C207365632C2066616C73652C2066616C7365293B0A2020202020207D0A202020207D293B0A20202020672E636C6173734C6973742E616464282269732D65646974616C6C22293B0A202020206974656D732E666F72456163682866';
wwv_flow_imp.g_varchar2_table(234) := '756E6374696F6E2028697429207B206F70656E456469746F722869742C2074727565293B207D293B0A2020202076617220626172203D20646F63756D656E742E637265617465456C656D656E74282264697622293B0A202020206261722E636C6173734E';
wwv_flow_imp.g_varchar2_table(235) := '616D65203D202264672D65646974626172223B0A202020206261722E7374796C652E67726964436F6C756D6E203D202231202F202D31223B0A202020206261722E696E6E657248544D4C203D0A202020202020223C7370616E20636C6173733D2764672D';
wwv_flow_imp.g_varchar2_table(236) := '656469746261722D6D7367273E3C7370616E20636C6173733D2766612066612D656469742720617269612D68696464656E3D2774727565273E3C2F7370616E3E2045646974696E672022202B0A2020202020206974656D732E6C656E677468202B202220';
wwv_flow_imp.g_varchar2_table(237) := '6669656C6422202B20286974656D732E6C656E677468203D3D3D2031203F202222203A2022732229202B0A20202020202022203C7370616E20636C6173733D2764672D656469746261722D68696E74273E3C6B62643E4374726C3C2F6B62643E2B3C6B62';
wwv_flow_imp.g_varchar2_table(238) := '643E456E7465723C2F6B62643E20736176657320266D6964646F743B203C6B62643E4573633C2F6B62643E2063616E63656C733C2F7370616E3E3C2F7370616E3E22202B0A202020202020223C627574746F6E20747970653D27627574746F6E2720636C';
wwv_flow_imp.g_varchar2_table(239) := '6173733D2764672D62746E2064672D62746E2D67686F73742064672D616C6C63616E63656C273E43616E63656C3C2F627574746F6E3E22202B0A202020202020223C627574746F6E20747970653D27627574746F6E2720636C6173733D2764672D62746E';
wwv_flow_imp.g_varchar2_table(240) := '2064672D62746E2D7072696D6172792064672D616C6C73617665273E3C7370616E20636C6173733D2766612066612D636865636B2720617269612D68696464656E3D2774727565273E3C2F7370616E3E20536176653C2F627574746F6E3E223B0A202020';
wwv_flow_imp.g_varchar2_table(241) := '20672E617070656E644368696C6428626172293B0A2020202072656C61796F75742867293B0A202020207265616E63686F722867293B0A20202020766172206669727374203D206974656D735B305D2E717565727953656C6563746F7228222E64672D65';
wwv_flow_imp.g_varchar2_table(242) := '64697422293B0A2020202069662028666972737429207B2066697273742E666F63757328293B207D0A20207D0A0A202066756E6374696F6E206578697445646974416C6C28672C20736176656429207B0A202020206564697461626C654974656D732867';
wwv_flow_imp.g_varchar2_table(243) := '292E666F72456163682866756E6374696F6E2028697429207B0A2020202020206966202869742E636C6173734C6973742E636F6E7461696E73282269732D65646974696E67222929207B2069662028736176656429207B20636C6F7365456469746F7228';
wwv_flow_imp.g_varchar2_table(244) := '6974293B207D20656C7365207B2063616E63656C45646974286974293B207D207D0A202020207D293B0A20202020672E717565727953656C6563746F72416C6C28222E64672D6564697462617222292E666F72456163682866756E6374696F6E20286229';
wwv_flow_imp.g_varchar2_table(245) := '207B20622E72656D6F766528293B207D293B0A20202020672E636C6173734C6973742E72656D6F7665282269732D65646974616C6C22293B0A2020202072656C61796F75742867293B0A202020207265616E63686F722867293B0A20207D0A0A20206675';
wwv_flow_imp.g_varchar2_table(246) := '6E6374696F6E2073617665416C6C286729207B0A2020202069662028672E5F6467536176696E6729207B2072657475726E3B207D2020202020202020202020202020202020202F2F204374726C2B456E74657220616761696E207768696C652073617669';
wwv_flow_imp.g_varchar2_table(247) := '6E670A2020202076617220726F6F74203D20672E636C6F7365737428222E64672D726F6F7422292C20626172203D20672E717565727953656C6563746F7228222E64672D6564697462617222293B0A20202020766172206669656C6473203D2065646974';
wwv_flow_imp.g_varchar2_table(248) := '61626C654974656D732867292E66696C7465722866756E6374696F6E2028697429207B2072657475726E2069742E636C6173734C6973742E636F6E7461696E73282269732D65646974696E6722293B207D290A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(249) := '20202020202020202020202020202020202E6D61702866756E6374696F6E2028697429207B2072657475726E2069742E717565727953656C6563746F7228222E64672D6564697422293B207D293B0A2020202076617220626164203D206E756C6C3B0A20';
wwv_flow_imp.g_varchar2_table(250) := '2020206669656C64732E666F72456163682866756E6374696F6E20286629207B0A20202020202069662028662E636C6173734C6973742E636F6E7461696E73282264672D636F6D626F2D696E707574222929207B20636F6D626F436C6F736528662E636C';
wwv_flow_imp.g_varchar2_table(251) := '6F7365737428222E64672D636F6D626F22292C2074727565293B207D0A202020202020636C6561724669656C644572726F722866293B0A2020202020207661722065203D2076616C69646174654669656C642866293B0A20202020202069662028652920';
wwv_flow_imp.g_varchar2_table(252) := '7B2073686F774669656C644572726F7228662C2065293B20626164203D20626164207C7C20663B207D0A202020207D293B0A202020206966202862616429207B206261642E666F63757328293B2072657475726E3B207D0A0A2020202076617220636861';
wwv_flow_imp.g_varchar2_table(253) := '6E676564203D206669656C64732E66696C7465722866756E6374696F6E20286629207B2072657475726E20537472696E67286669656C6456616C75652866292920213D3D20537472696E6728662E5F696E697469616C293B207D293B0A20202020696620';
wwv_flow_imp.g_varchar2_table(254) := '28216368616E6765642E6C656E67746829207B206578697445646974416C6C28672C2074727565293B2072657475726E3B207D0A0A2020202076617220627574746F6E73203D20626172203F206261722E717565727953656C6563746F72416C6C282262';
wwv_flow_imp.g_varchar2_table(255) := '7574746F6E2229203A205B5D3B0A2020202041727261792E70726F746F747970652E666F72456163682E63616C6C28627574746F6E732C2066756E6374696F6E20286229207B20622E64697361626C6564203D20747275653B207D293B0A20202020672E';
wwv_flow_imp.g_varchar2_table(256) := '5F6467536176696E67203D20747275653B0A2020202076617220646F6E65203D205B5D2C2073746F70203D206E756C6C2C20636F6E666C696374203D2066616C73653B0A2020202076617220636861696E203D2050726F6D6973652E7265736F6C766528';
wwv_flow_imp.g_varchar2_table(257) := '293B0A202020206368616E6765642E666F72456163682866756E6374696F6E20286629207B0A202020202020636861696E203D20636861696E2E7468656E2866756E6374696F6E202829207B0A20202020202020206966202873746F7029207B20726574';
wwv_flow_imp.g_varchar2_table(258) := '75726E3B207D0A2020202020202020662E636C6173734C6973742E616464282269732D6275737922293B0A202020202020202072657475726E2063616C6C536176652866292E7468656E2866756E6374696F6E20287229207B0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(259) := '662E636C6173734C6973742E72656D6F7665282269732D6275737922293B0A2020202020202020202069662028722E737461747573203D3D3D2022434F4E464C4943542229207B20636F6E666C696374203D20747275653B2073746F70203D20723B2072';
wwv_flow_imp.g_varchar2_table(260) := '657475726E3B207D0A2020202020202020202069662028722E737461747573203D3D3D20224552524F522229207B2073686F774669656C644572726F7228662C20722E6D657373616765207C7C2022436F756C64206E6F7420736176652E22293B207374';
wwv_flow_imp.g_varchar2_table(261) := '6F70203D20723B2072657475726E3B207D0A20202020202020202020646F6E652E70757368287B20636F6C3A20662E646174617365742E6467436F6C2C206C6162656C3A20662E646174617365742E64674C6162656C2C206F6C6456616C75653A20662E';
wwv_flow_imp.g_varchar2_table(262) := '5F696E697469616C207D293B0A20202020202020202020662E5F696E697469616C203D206669656C6456616C75652866293B0A20202020202020202020662E7365744174747269627574652822646174612D64672D6F6C64222C20662E5F696E69746961';
wwv_flow_imp.g_varchar2_table(263) := '6C293B0A20202020202020207D293B0A2020202020207D293B0A202020207D293B0A20202020636861696E2E7468656E2866756E6374696F6E202829207B0A202020202020672E5F6467536176696E67203D2066616C73653B0A20202020202041727261';
wwv_flow_imp.g_varchar2_table(264) := '792E70726F746F747970652E666F72456163682E63616C6C28627574746F6E732C2066756E6374696F6E20286229207B20622E64697361626C6564203D2066616C73653B207D293B0A20202020202069662028636F6E666C69637429207B0A2020202020';
wwv_flow_imp.g_varchar2_table(265) := '2020206E6F7469667928224552524F52222C2073746F702E6D657373616765207C7C2022536F6D656F6E6520656C7365206368616E6765642074686973207265636F72642E20546865206C61746573742076657273696F6E2069732073686F776E2E2229';
wwv_flow_imp.g_varchar2_table(266) := '3B0A202020202020202072656672657368526F6F7428726F6F74293B0A202020202020202072657475726E3B0A2020202020207D0A2020202020206966202873746F7029207B0A2020202020202020766172206D7367203D20626172202626206261722E';
wwv_flow_imp.g_varchar2_table(267) := '717565727953656C6563746F7228222E64672D656469746261722D6D736722293B0A2020202020202020696620286D736720262620646F6E652E6C656E67746829207B206D73672E74657874436F6E74656E74203D20646F6E652E6C656E677468202B20';
wwv_flow_imp.g_varchar2_table(268) := '222073617665643B206669782074686520686967686C696768746564206669656C6420616E64207361766520616761696E2E223B207D0A202020202020202072657475726E3B0A2020202020207D0A2020202020206578697445646974416C6C28672C20';
wwv_flow_imp.g_varchar2_table(269) := '74727565293B0A20202020202072656672657368526F6F7428726F6F742C207B0A202020202020202061667465723A2066756E6374696F6E202829207B0A2020202020202020202073686F77546F61737428726F6F742C20646F6E652E6C656E67746820';
wwv_flow_imp.g_varchar2_table(270) := '3D3D3D2031203F2028646F6E655B305D2E6C6162656C202B20222073617665642E2229203A2028646F6E652E6C656E677468202B2022206669656C64732073617665642E22292C20646F6E65293B0A20202020202020207D0A2020202020207D293B0A20';
wwv_flow_imp.g_varchar2_table(271) := '2020207D293B0A20207D0A0A20202F2F202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D20756E646F202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0A202066756E6374696F6E2073686F77546F61737428726F6F742C206D73672C206368616E67657329207B0A20';
wwv_flow_imp.g_varchar2_table(272) := '202020726F6F742E717565727953656C6563746F72416C6C28222E64672D746F61737422292E666F72456163682866756E6374696F6E20287429207B20742E72656D6F766528293B207D293B0A202020207661722074203D20646F63756D656E742E6372';
wwv_flow_imp.g_varchar2_table(273) := '65617465456C656D656E74282264697622293B0A20202020742E636C6173734E616D65203D202264672D746F617374223B0A20202020742E7365744174747269627574652822726F6C65222C202273746174757322293B0A20202020742E696E6E657248';
wwv_flow_imp.g_varchar2_table(274) := '544D4C203D20223C7370616E20636C6173733D2766612066612D636865636B2D636972636C652720617269612D68696464656E3D2774727565273E3C2F7370616E3E22202B0A202020202020202020202020202020202020223C7370616E20636C617373';
wwv_flow_imp.g_varchar2_table(275) := '3D2764672D746F6173742D6D7367273E22202B20657363286D736729202B20223C2F7370616E3E22202B0A202020202020202020202020202020202020286368616E676573202626206368616E6765732E6C656E677468203F20223C627574746F6E2074';
wwv_flow_imp.g_varchar2_table(276) := '7970653D27627574746F6E2720636C6173733D2764672D756E646F273E556E646F3C2F627574746F6E3E22203A20222229202B0A202020202020202020202020202020202020223C627574746F6E20747970653D27627574746F6E2720636C6173733D27';
wwv_flow_imp.g_varchar2_table(277) := '64672D746F6173742D782720617269612D6C6162656C3D274469736D697373273E2674696D65733B3C2F627574746F6E3E223B0A20202020742E5F6368616E676573203D206368616E6765733B0A20202020726F6F742E617070656E644368696C642874';
wwv_flow_imp.g_varchar2_table(278) := '293B0A20202020742E5F74696D6572203D2077696E646F772E73657454696D656F75742866756E6374696F6E202829207B206469736D697373546F6173742874293B207D2C2038303030293B0A20207D0A0A202066756E6374696F6E206469736D697373';
wwv_flow_imp.g_varchar2_table(279) := '546F617374287429207B0A2020202077696E646F772E636C65617254696D656F757428742E5F74696D6572293B0A20202020742E636C6173734C6973742E616464282269732D6C656176696E6722293B0A2020202077696E646F772E73657454696D656F';
wwv_flow_imp.g_varchar2_table(280) := '75742866756E6374696F6E202829207B20742E72656D6F766528293B207D2C20323530293B0A20207D0A0A20202F2F2072652D736176657320746865206F6C642076616C75657320286E657765737420666972737429207468726F756768207468652073';
wwv_flow_imp.g_varchar2_table(281) := '616D652068616E646C65720A202066756E6374696F6E20756E646F4368616E67657328726F6F742C206368616E67657329207B0A2020202076617220756E646F6E65203D20302C206661696C6564203D206E756C6C2C20636861696E203D2050726F6D69';
wwv_flow_imp.g_varchar2_table(282) := '73652E7265736F6C766528293B0A202020206368616E6765732E736C69636528292E7265766572736528292E666F72456163682866756E6374696F6E2028636829207B0A202020202020636861696E203D20636861696E2E7468656E2866756E6374696F';
wwv_flow_imp.g_varchar2_table(283) := '6E202829207B0A2020202020202020696620286661696C656429207B2072657475726E3B207D0A2020202020202020766172206669656C64203D20726F6F742E717565727953656C6563746F7228272E64672D656469745B646174612D64672D636F6C3D';
wwv_flow_imp.g_varchar2_table(284) := '2227202B20637373712863682E636F6C29202B2027225D27293B0A202020202020202069662028216669656C6429207B206661696C6564203D202863682E6C6162656C207C7C2063682E636F6C29202B20222063616E206E6F206C6F6E67657220626520';
wwv_flow_imp.g_varchar2_table(285) := '6368616E6765642E223B2072657475726E3B207D0A20202020202020207365744669656C6456616C7565286669656C642C2063682E6F6C6456616C7565293B0A202020202020202072657475726E2063616C6C53617665286669656C64292E7468656E28';
wwv_flow_imp.g_varchar2_table(286) := '66756E6374696F6E20287229207B0A2020202020202020202069662028722E737461747573203D3D3D20225355434345535322207C7C20722E737461747573203D3D3D20225741524E494E472229207B20756E646F6E652B2B3B207D0A20202020202020';
wwv_flow_imp.g_varchar2_table(287) := '202020656C7365207B206661696C6564203D20722E6D657373616765207C7C2022556E646F206661696C65642E223B207D0A20202020202020207D293B0A2020202020207D293B0A202020207D293B0A20202020636861696E2E7468656E2866756E6374';
wwv_flow_imp.g_varchar2_table(288) := '696F6E202829207B0A202020202020696620286661696C656429207B206E6F7469667928224552524F52222C206661696C6564293B207D0A20202020202072656672657368526F6F7428726F6F742C207B2061667465723A2066756E6374696F6E202829';
wwv_flow_imp.g_varchar2_table(289) := '207B2069662028756E646F6E6520262620216661696C656429207B2073686F77546F61737428726F6F742C2022556E646F6E652E222C206E756C6C293B207D207D207D293B0A202020207D293B0A20207D0A0A20202F2F202D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(290) := '2D2D2D2D20646570656E64656E74206C69737473202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0A20202F2F2041206C6973742077686F7365207175657279207573657320616E6F74686572206564697461626C65206669656C6420282342555F4944232920';
wwv_flow_imp.g_varchar2_table(291) := '72656C6F616473207768656E0A20202F2F2074686174206669656C64206368616E6765732C207769746820746865206E65772C20756E73617665642076616C75652E0A202066756E6374696F6E2072656C6F61644368696C6472656E286669656C642920';
wwv_flow_imp.g_varchar2_table(292) := '7B0A202020207661722067203D206669656C642E636C6F7365737428222E646722292C20726F6F74203D206669656C642E636C6F7365737428222E64672D726F6F7422292C20636F6C203D206669656C642E646174617365742E6467436F6C3B0A202020';
wwv_flow_imp.g_varchar2_table(293) := '20696620282167207C7C2021726F6F74207C7C2021726F6F742E646174617365742E6467416A6178207C7C2021636F6C29207B2072657475726E3B207D0A20202020672E717565727953656C6563746F72416C6C28222E64672D656469745B646174612D';
wwv_flow_imp.g_varchar2_table(294) := '64672D706172656E74735D22292E666F72456163682866756E6374696F6E20286368696C6429207B0A2020202020206966202828222C22202B206368696C642E646174617365742E6467506172656E7473202B20222C22292E696E6465784F6628222C22';
wwv_flow_imp.g_varchar2_table(295) := '202B20636F6C202B20222C2229203C203029207B2072657475726E3B207D0A202020202020766172206E616D6573203D206368696C642E646174617365742E6467506172656E74732E73706C697428222C22293B0A2020202020207661722076616C7320';
wwv_flow_imp.g_varchar2_table(296) := '3D206E616D65732E6D61702866756E6374696F6E20286E29207B0A20202020202020207661722070203D20672E717565727953656C6563746F7228272E64672D656469745B646174612D64672D636F6C3D2227202B2063737371286E29202B2027225D27';
wwv_flow_imp.g_varchar2_table(297) := '293B0A202020202020202069662028217029207B2072657475726E2022223B207D0A2020202020202020766172206F70656E203D20702E636C6F7365737428222E64672D6974656D22292E636C6173734C6973742E636F6E7461696E73282269732D6564';
wwv_flow_imp.g_varchar2_table(298) := '6974696E6722293B0A20202020202020207661722076203D206F70656E203F206669656C6456616C7565287029203A20702E6765744174747269627574652822646174612D64672D6F6C6422293B0A202020202020202072657475726E2076203D3D206E';
wwv_flow_imp.g_varchar2_table(299) := '756C6C203F202222203A20537472696E672876293B0A2020202020207D293B0A2020202020206368696C642E636C6173734C6973742E616464282269732D6275737922293B0A202020202020617065782E7365727665722E706C7567696E28726F6F742E';
wwv_flow_imp.g_varchar2_table(300) := '646174617365742E6467416A61782C0A20202020202020207B207830313A20224C4F56222C207830323A206368696C642E646174617365742E6467436F6C2C207830333A206669656C6456616C7565286368696C6429207C7C2022222C0A202020202020';
wwv_flow_imp.g_varchar2_table(301) := '202020206630313A206E616D65732C206630323A2076616C732C20706167654974656D733A20726F6F742E646174617365742E64674974656D73207C7C20756E646566696E6564207D2C0A20202020202020207B2064617461547970653A202268746D6C';
wwv_flow_imp.g_varchar2_table(302) := '22207D290A20202020202020202E646F6E652866756E6374696F6E202868746D6C29207B206170706C794F7074696F6E73286368696C642C2068746D6C293B207D290A20202020202020202E616C776179732866756E6374696F6E202829207B20636869';
wwv_flow_imp.g_varchar2_table(303) := '6C642E636C6173734C6973742E72656D6F7665282269732D6275737922293B207D293B0A202020207D293B0A20207D0A0A202066756E6374696F6E206170706C794F7074696F6E73286368696C642C2068746D6C29207B0A2020202076617220763B0A20';
wwv_flow_imp.g_varchar2_table(304) := '202020696620286368696C642E7461674E616D65203D3D3D202253454C4543542229207B0A20202020202076203D206368696C642E76616C75653B0A2020202020206368696C642E696E6E657248544D4C203D2068746D6C3B0A2020202020206368696C';
wwv_flow_imp.g_varchar2_table(305) := '642E76616C7565203D2041727261792E70726F746F747970652E736F6D652E63616C6C286368696C642E6F7074696F6E732C2066756E6374696F6E20286F29207B2072657475726E206F2E76616C7565203D3D3D20763B207D29203F2076203A2022223B';
wwv_flow_imp.g_varchar2_table(306) := '0A202020207D20656C736520696620286368696C642E636C6173734C6973742E636F6E7461696E73282264672D636F6D626F2D696E707574222929207B0A20202020202076617220636F6D626F203D206368696C642E636C6F7365737428222E64672D63';
wwv_flow_imp.g_varchar2_table(307) := '6F6D626F22293B0A202020202020706172747328636F6D626F292E7372632E696E6E657248544D4C203D2068746D6C3B0A202020202020636F6D626F2E5F6F707473203D206E756C6C3B0A20202020202076203D206368696C642E646174617365742E64';
wwv_flow_imp.g_varchar2_table(308) := '6756616C7565207C7C2022223B0A20202020202069662028762026262021646973706C6179466F7228636F6D626F2C20762929207B2020202020202F2F206E6F206C6F6E67657220612076616C69642063686F6963650A20202020202020206368696C64';
wwv_flow_imp.g_varchar2_table(309) := '2E76616C7565203D2022223B0A20202020202020206368696C642E646174617365742E646756616C7565203D2022223B0A20202020202020206368696C642E646174617365742E64674C617374203D2022223B0A2020202020207D0A202020207D0A2020';
wwv_flow_imp.g_varchar2_table(310) := '20206368696C642E64697370617463684576656E74286E6577204576656E7428226368616E6765222C207B20627562626C65733A2074727565207D29293B2020202F2F206361736361646520667572746865720A20207D0A0A2020646F63756D656E742E';
wwv_flow_imp.g_varchar2_table(311) := '6164644576656E744C697374656E657228226368616E6765222C2066756E6374696F6E20286529207B0A20202020766172207377203D20652E7461726765742E636C6F7365737420262620652E7461726765742E636C6F7365737428222E64672D737769';
wwv_flow_imp.g_varchar2_table(312) := '7463682D696E70757422293B0A2020202069662028737729207B0A20202020202076617220747874203D2073772E636C6F7365737428222E64672D73776974636822292E717565727953656C6563746F7228222E64672D7377697463682D746578742229';
wwv_flow_imp.g_varchar2_table(313) := '3B0A2020202020207478742E74657874436F6E74656E74203D2073772E636865636B6564203F207478742E646174617365742E6F6E203A207478742E646174617365742E6F66663B0A202020207D0A202020207661722066203D20652E7461726765742E';
wwv_flow_imp.g_varchar2_table(314) := '636C6F7365737420262620652E7461726765742E636C6F7365737428222E64672D6564697422293B0A20202020696620286629207B2072656C6F61644368696C6472656E2866293B207D0A20207D293B0A0A20202F2F202D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(315) := '2D2D2D206B6579626F617264202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0A20202F2F20456E74657220736176657320284374726C2B456E74657220696E206120746578742061726561292C204573632063616E63656C732C20546162202F205368696674';
wwv_flow_imp.g_varchar2_table(316) := '2B5461620A20202F2F207361766520616E64206D6F766520746F20746865206E657874202F2070726576696F7573206564697461626C65206669656C642E0A2020646F63756D656E742E6164644576656E744C697374656E657228226B6579646F776E22';
wwv_flow_imp.g_varchar2_table(317) := '2C2066756E6374696F6E20286529207B0A2020202069662028652E6B6579203D3D3D20224573636170652220262620636C6F7365506F706F76657273282929207B2072657475726E3B207D0A20202020766172206669656C64203D20652E746172676574';
wwv_flow_imp.g_varchar2_table(318) := '2E636C6F7365737420262620652E7461726765742E636C6F7365737428222E64672D6564697422293B0A2020202069662028216669656C6429207B2072657475726E3B207D0A20202020696620286669656C642E636C6173734C6973742E636F6E746169';
wwv_flow_imp.g_varchar2_table(319) := '6E73282264672D636F6D626F2D696E707574222920262620636F6D626F4B657928652C206669656C642929207B2072657475726E3B207D0A20202020766172206974656D203D206669656C642E636C6F7365737428222E64672D6974656D22292C206720';
wwv_flow_imp.g_varchar2_table(320) := '3D206669656C642E636C6F7365737428222E646722293B0A2020202076617220616C6C203D206720262620672E636C6173734C6973742E636F6E7461696E73282269732D65646974616C6C22293B0A0A2020202069662028616C6C29207B0A2020202020';
wwv_flow_imp.g_varchar2_table(321) := '2069662028652E6B6579203D3D3D2022456E746572222026262028652E6374726C4B6579207C7C20652E6D6574614B65792929207B20652E70726576656E7444656661756C7428293B2073617665416C6C2867293B207D0A202020202020656C73652069';
wwv_flow_imp.g_varchar2_table(322) := '662028652E6B6579203D3D3D20224573636170652229207B20652E70726576656E7444656661756C7428293B206578697445646974416C6C28672C2066616C7365293B207D0A20202020202072657475726E3B2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(323) := '2020202020202020202020202020202020202020202F2F20546162206D6F766573206E61746976656C79206265747765656E206F70656E206669656C64730A202020207D0A2020202069662028652E6B6579203D3D3D2022456E74657222202626202866';
wwv_flow_imp.g_varchar2_table(324) := '69656C642E7461674E616D6520213D3D2022544558544152454122207C7C20652E6374726C4B6579207C7C20652E6D6574614B65792929207B0A202020202020652E70726576656E7444656661756C7428293B0A20202020202068616E646C6545646974';
wwv_flow_imp.g_varchar2_table(325) := '286669656C642C206669656C642E636C6F7365737428222E64672D656469747772617022292C206974656D293B0A202020207D20656C73652069662028652E6B6579203D3D3D20224573636170652229207B0A202020202020652E70726576656E744465';
wwv_flow_imp.g_varchar2_table(326) := '6661756C7428293B0A20202020202063616E63656C45646974286974656D293B0A202020207D20656C73652069662028652E6B6579203D3D3D20225461622229207B0A202020202020766172206974656D73203D206564697461626C654974656D732867';
wwv_flow_imp.g_varchar2_table(327) := '292C2069203D206974656D732E696E6465784F66286974656D293B0A202020202020766172206E657874203D206974656D735B69202B2028652E73686966744B6579203F202D31203A2031295D3B0A202020202020652E70726576656E7444656661756C';
wwv_flow_imp.g_varchar2_table(328) := '7428293B0A20202020202068616E646C6545646974286669656C642C206669656C642E636C6F7365737428222E64672D656469747772617022292C206974656D2C207B206E6578743A206E657874203F206E6578742E646174617365742E64674E616D65';
wwv_flow_imp.g_varchar2_table(329) := '203A206E756C6C207D293B0A202020207D0A20207D293B0A0A20202F2F202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2064657461696C7320706F706F766572202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0A202066756E6374696F6E20636C6F7365506F706F';
wwv_flow_imp.g_varchar2_table(330) := '766572732829207B0A2020202076617220616E79203D2066616C73653B0A20202020646F63756D656E742E717565727953656C6563746F72416C6C28222E64672D706F7022292E666F72456163682866756E6374696F6E20287029207B0A202020202020';
wwv_flow_imp.g_varchar2_table(331) := '69662028702E5F62746E29207B20702E5F62746E2E7365744174747269627574652822617269612D657870616E646564222C202266616C736522293B207D0A202020202020702E72656D6F766528293B0A202020202020616E79203D20747275653B0A20';
wwv_flow_imp.g_varchar2_table(332) := '2020207D293B0A2020202072657475726E20616E793B0A20207D0A0A202066756E6374696F6E206F70656E506F706F7665722862746E29207B0A2020202076617220726F6F74203D2062746E2E636C6F7365737428222E64672D726F6F7422293B0A2020';
wwv_flow_imp.g_varchar2_table(333) := '2020766172207761734F70656E203D2062746E2E6765744174747269627574652822617269612D657870616E6465642229203D3D3D202274727565223B0A20202020636C6F7365506F706F7665727328293B0A20202020696620287761734F70656E207C';
wwv_flow_imp.g_varchar2_table(334) := '7C2021726F6F74207C7C2021726F6F742E646174617365742E6467416A617829207B2072657475726E3B207D0A2020202076617220706F70203D20646F63756D656E742E637265617465456C656D656E74282264697622293B0A20202020706F702E636C';
wwv_flow_imp.g_varchar2_table(335) := '6173734E616D65203D202264672D706F70223B0A20202020706F702E7365744174747269627574652822726F6C65222C20226469616C6F6722293B0A20202020706F702E696E6E657248544D4C203D20223C64697620636C6173733D2764672D706F702D';
wwv_flow_imp.g_varchar2_table(336) := '6C6F6164696E67273E3C7370616E20636C6173733D2766612066612D7370696E6E65722066612D616E696D2D7370696E2720617269612D68696464656E3D2774727565273E3C2F7370616E3E204C6F6164696E672668656C6C69703B3C2F6469763E223B';
wwv_flow_imp.g_varchar2_table(337) := '0A20202020706F702E5F62746E203D2062746E3B0A20202020726F6F742E617070656E644368696C6428706F70293B0A2020202062746E2E7365744174747269627574652822617269612D657870616E646564222C20227472756522293B0A2020202070';
wwv_flow_imp.g_varchar2_table(338) := '6F736974696F6E50616E656C28706F702C2062746E2C20333230293B0A20202020617065782E7365727665722E706C7567696E28726F6F742E646174617365742E6467416A61782C0A2020202020207B207830313A2022504F504F564552222C20783032';
wwv_flow_imp.g_varchar2_table(339) := '3A2062746E2E646174617365742E6467506F702C20706167654974656D733A20726F6F742E646174617365742E64674974656D73207C7C20756E646566696E6564207D2C0A2020202020207B2064617461547970653A202268746D6C22207D290A202020';
wwv_flow_imp.g_varchar2_table(340) := '2020202E646F6E652866756E6374696F6E202868746D6C29207B20706F702E696E6E657248544D4C203D2068746D6C3B20706F736974696F6E50616E656C28706F702C2062746E2C20333230293B207D290A2020202020202E6661696C2866756E637469';
wwv_flow_imp.g_varchar2_table(341) := '6F6E202829207B20706F702E696E6E657248544D4C203D20223C64697620636C6173733D2764672D706F702D656D707479273E44657461696C7320636F756C64206E6F74206265206C6F616465642E3C2F6469763E223B207D293B0A20207D0A0A20202F';
wwv_flow_imp.g_varchar2_table(342) := '2F202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2073656374696F6E732028657870616E64202F20636F6C6C6170736529202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0A20202F2F20412073656374696F6E20686561646572206973206120736C696D20726F77';
wwv_flow_imp.g_varchar2_table(343) := '20696E736964652074686520636172643B207468652077686F6C6520726F7720746F67676C65732E0A20202F2F20456163682076696577657227732063686F6963652069732072656D656D626572656420696E207468652062726F777365722E0A202066';
wwv_flow_imp.g_varchar2_table(344) := '756E6374696F6E207365634B657928672C206E616D6529207B0A2020202076617220726F6F74203D20672E636C6F7365737428222E64672D726F6F7422293B0A2020202072657475726E202264672D7365633A22202B2077696E646F772E6C6F63617469';
wwv_flow_imp.g_varchar2_table(345) := '6F6E2E706174686E616D65202B20223A22202B0A202020202020202020202028726F6F74203F20726F6F742E646174617365742E6467526567696F6E203A20222229202B20223A22202B206E616D653B0A20207D0A0A202066756E6374696F6E20736574';
wwv_flow_imp.g_varchar2_table(346) := '53656374696F6E28672C207365632C20636F6C6C61707365642C207065727369737429207B0A20202020766172206E616D65203D207365632E646174617365742E64675365633B0A202020207365632E636C6173734C6973742E746F67676C6528226973';
wwv_flow_imp.g_varchar2_table(347) := '2D636F6C6C6170736564222C20636F6C6C6170736564293B0A202020207661722062203D207365632E717565727953656C6563746F7228222E64672D7365632D62746E22293B0A20202020696620286229207B20622E7365744174747269627574652822';
wwv_flow_imp.g_varchar2_table(348) := '617269612D657870616E646564222C20537472696E672821636F6C6C617073656429293B207D0A20202020672E717565727953656C6563746F72416C6C28222E64672D6974656D5B646174612D64672D7365635D22292E666F72456163682866756E6374';
wwv_flow_imp.g_varchar2_table(349) := '696F6E2028697429207B0A2020202020206966202869742E646174617365742E6467536563203D3D3D206E616D6529207B2069742E636C6173734C6973742E746F67676C65282264672D7365632D68696464656E222C20636F6C6C6170736564293B207D';
wwv_flow_imp.g_varchar2_table(350) := '0A202020207D293B0A20202020696620287065727369737429207B2073746F7265287365634B657928672C206E616D65292C20636F6C6C6170736564203F20223122203A20223022293B207D0A20207D0A0A202066756E6374696F6E20696E6974536563';
wwv_flow_imp.g_varchar2_table(351) := '74696F6E73286729207B0A20202020672E717565727953656C6563746F72416C6C28222E64672D73656322292E666F72456163682866756E6374696F6E202873656329207B0A2020202020207661722073203D2073746F7265287365634B657928672C20';
wwv_flow_imp.g_varchar2_table(352) := '7365632E646174617365742E646753656329293B0A2020202020206966202873203D3D3D20223122207C7C2073203D3D3D2022302229207B2073657453656374696F6E28672C207365632C2073203D3D3D202231222C2066616C7365293B207D0A202020';
wwv_flow_imp.g_varchar2_table(353) := '207D293B0A20207D0A0A20202F2F206669656C647320776974686F757420612073656374696F6E2066697273742C207468656E20656163682073656374696F6E207769746820616C6C20697473206669656C64730A20202F2F20756E6465722069747320';
wwv_flow_imp.g_varchar2_table(354) := '686561646572202873616D65206F7264657220617320746865207365727665722072656E64657273290A202066756E6374696F6E20726567726F7570286729207B0A20202020766172206865616473203D207B7D3B0A20202020672E717565727953656C';
wwv_flow_imp.g_varchar2_table(355) := '6563746F72416C6C28222E64672D73656322292E666F72456163682866756E6374696F6E20286829207B2068656164735B682E646174617365742E64675365635D203D20683B207D293B0A20202020766172206974656D73203D2041727261792E70726F';
wwv_flow_imp.g_varchar2_table(356) := '746F747970652E736C6963652E63616C6C28672E717565727953656C6563746F72416C6C28222E64672D6974656D5B646174612D64672D6E616D655D2229293B0A2020202076617220646F6E65203D207B7D2C206F7574203D206974656D732E66696C74';
wwv_flow_imp.g_varchar2_table(357) := '65722866756E6374696F6E2028697429207B2072657475726E202169742E646174617365742E64675365633B207D293B0A202020206974656D732E666F72456163682866756E6374696F6E2028697429207B0A2020202020207661722073203D2069742E';
wwv_flow_imp.g_varchar2_table(358) := '646174617365742E64675365633B0A202020202020696620282173207C7C20646F6E655B735D29207B2072657475726E3B207D0A202020202020646F6E655B735D203D20747275653B0A2020202020206966202868656164735B735D29207B206F75742E';
wwv_flow_imp.g_varchar2_table(359) := '707573682868656164735B735D293B207D0A2020202020206974656D732E666F72456163682866756E6374696F6E20287829207B2069662028782E646174617365742E6467536563203D3D3D207329207B206F75742E707573682878293B207D207D293B';
wwv_flow_imp.g_varchar2_table(360) := '0A202020207D293B0A202020206F75742E666F72456163682866756E6374696F6E20286E29207B20672E617070656E644368696C64286E293B207D293B0A20202020672E717565727953656C6563746F72416C6C28223A73636F7065203E202E64672D65';
wwv_flow_imp.g_varchar2_table(361) := '64697462617222292E666F72456163682866756E6374696F6E20286229207B20672E617070656E644368696C642862293B207D293B0A20207D0A0A20202F2F202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D206C61796F7574202D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_imp.g_varchar2_table(362) := '2D2D2D2D0A202066756E6374696F6E20677269644F662862746E29207B0A2020202076617220686F7374203D2062746E2E636C6F7365737428222E64672D636667686F737422293B0A2020202069662028686F737429207B2072657475726E20686F7374';
wwv_flow_imp.g_varchar2_table(363) := '2E717565727953656C6563746F7228222E646722293B207D0A2020202076617220626172203D2062746E2E636C6F7365737428222E64672D746F6F6C62617222293B0A2020202072657475726E20626172203F206261722E6E657874456C656D656E7453';
wwv_flow_imp.g_varchar2_table(364) := '69626C696E67203A206E756C6C3B0A20207D0A0A20202F2F20577261702065616368206361726420776974682069747320616374696F6E7320284564697420616C6C2C20436F6E6669677572652920736F20746865792063616E206C6976650A20202F2F';
wwv_flow_imp.g_varchar2_table(365) := '20696E736964652069742E0A202066756E6374696F6E20706C616365466C6F6174696E67427574746F6E732873636F706529207B0A202020202873636F7065207C7C20646F63756D656E74292E717565727953656C6563746F72416C6C28222E64672D74';
wwv_flow_imp.g_varchar2_table(366) := '6F6F6C62617222292E666F72456163682866756E6374696F6E202862617229207B0A2020202020207661722067203D206261722E6E657874456C656D656E745369626C696E673B0A202020202020696620282167207C7C2021672E636C6173734C697374';
wwv_flow_imp.g_varchar2_table(367) := '2E636F6E7461696E73282264672229207C7C206261722E646174617365742E6467506C6163656429207B2072657475726E3B207D0A20202020202076617220686F7374203D20646F63756D656E742E637265617465456C656D656E74282264697622293B';
wwv_flow_imp.g_varchar2_table(368) := '0A202020202020686F73742E636C6173734E616D65203D202264672D636667686F7374223B0A202020202020672E706172656E744E6F64652E696E736572744265666F726528686F73742C2067293B0A202020202020686F73742E617070656E64436869';
wwv_flow_imp.g_varchar2_table(369) := '6C642867293B0A2020202020206261722E717565727953656C6563746F72416C6C28222E64672D6361726461637422292E666F72456163682866756E6374696F6E20286229207B20686F73742E617070656E644368696C642862293B207D293B0A202020';
wwv_flow_imp.g_varchar2_table(370) := '2020206261722E646174617365742E6467506C61636564203D202231223B0A202020202020616E63686F72416374696F6E732867293B0A202020207D293B0A20207D0A0A20202F2F20546865206361726420616374696F6E73206C69766520696E207468';
wwv_flow_imp.g_varchar2_table(371) := '652072696768742D68616E6420736C6F74206F6620746865206C6173742076697369626C6520726F773A207468650A20202F2F206C6173742076616C75652063656C6C2C206F72206120636F6C6C61707365642073656374696F6E277320686561646572';
wwv_flow_imp.g_varchar2_table(372) := '207768656E207468617420697320746865206C61737420726F772E0A202066756E6374696F6E20616E63686F72416374696F6E73286729207B0A2020202076617220686F7374203D20672E636C6F7365737428222E64672D636667686F737422293B0A20';
wwv_flow_imp.g_varchar2_table(373) := '2020206966202821686F737429207B2072657475726E3B207D0A202020207661722061637473203D20686F73742E717565727953656C6563746F72416C6C28222E64672D6361726461637422293B0A202020206966202821616374732E6C656E67746829';
wwv_flow_imp.g_varchar2_table(374) := '207B2072657475726E3B207D0A2020202076617220726F7773203D20672E717565727953656C6563746F72416C6C280A202020202020222E64672D6974656D5B646174612D64672D6E616D655D3A6E6F74282E64672D68696464656E293A6E6F74282E64';
wwv_flow_imp.g_varchar2_table(375) := '672D7365632D68696464656E29203E202E64672D76616C2C22202B0A20202020202022202E64672D7365633A6E6F74282E64672D7365632D656D7074792922293B0A2020202076617220746172676574203D20726F77735B726F77732E6C656E67746820';
wwv_flow_imp.g_varchar2_table(376) := '2D20315D3B0A20202020696620282174617267657429207B2072657475726E3B207D0A2020202076617220656E64203D206E756C6C3B0A20202020666F7220287661722069203D20303B2069203C207461726765742E6368696C6472656E2E6C656E6774';
wwv_flow_imp.g_varchar2_table(377) := '683B20692B2B29207B0A202020202020696620287461726765742E6368696C6472656E5B695D2E636C6173734C6973742E636F6E7461696E73282264672D656E64222929207B20656E64203D207461726765742E6368696C6472656E5B695D3B207D0A20';
wwv_flow_imp.g_varchar2_table(378) := '2020207D0A202020206966202821656E6429207B0A202020202020656E64203D20646F63756D656E742E637265617465456C656D656E7428227370616E22293B0A202020202020656E642E636C6173734E616D65203D202264672D656E64223B0A202020';
wwv_flow_imp.g_varchar2_table(379) := '2020207461726765742E617070656E644368696C6428656E64293B0A202020207D0A2020202041727261792E70726F746F747970652E666F72456163682E63616C6C28616374732C2066756E6374696F6E20286229207B20656E642E617070656E644368';
wwv_flow_imp.g_varchar2_table(380) := '696C642862293B207D293B0A20207D0A0A202066756E6374696F6E207265616E63686F72286729207B20696620286729207B20616E63686F72416374696F6E732867293B207D207D0A0A20202F2F204D6972726F72732074686520504C2F53514C20736C';
wwv_flow_imp.g_varchar2_table(381) := '6F7420616C676F726974686D3B20616C736F2068616E646C65732073656374696F6E20686561646572732028612066756C6C0A20202F2F20726F77292C20636F6C6C61707365642073656374696F6E732C207A6562726120726F777320616E6420746865';
wwv_flow_imp.g_varchar2_table(382) := '2065646974206261722E0A202066756E6374696F6E2072656C61796F7574286729207B0A2020202069662028216729207B2072657475726E3B207D0A20202020766172207061697273203D207061727365496E7428672E646174617365742E6467506169';
wwv_flow_imp.g_varchar2_table(383) := '7273207C7C202232222C203130293B0A2020202076617220736C6F74203D20302C20656D6974746564203D20303B0A0A20202020672E717565727953656C6563746F72416C6C28222E64672D66696C6C657222292E666F72456163682866756E6374696F';
wwv_flow_imp.g_varchar2_table(384) := '6E20286629207B20662E72656D6F766528293B207D293B0A0A202020202F2F2068656164657220636F756E747320666F6C6C6F772077686174207468652075736572206861732063686F73656E20746F2073686F770A20202020672E717565727953656C';
wwv_flow_imp.g_varchar2_table(385) := '6563746F72416C6C28222E64672D73656322292E666F72456163682866756E6374696F6E202873656329207B0A202020202020766172206E203D20303B0A202020202020672E717565727953656C6563746F72416C6C28222E64672D6974656D5B646174';
wwv_flow_imp.g_varchar2_table(386) := '612D64672D7365635D22292E666F72456163682866756E6374696F6E2028697429207B0A20202020202020206966202869742E646174617365742E6467536563203D3D3D207365632E646174617365742E6467536563202626202169742E636C6173734C';
wwv_flow_imp.g_varchar2_table(387) := '6973742E636F6E7461696E73282264672D68696464656E222929207B206E2B2B3B207D0A2020202020207D293B0A2020202020207661722063203D207365632E717565727953656C6563746F7228222E64672D7365632D636F756E7422293B0A20202020';
wwv_flow_imp.g_varchar2_table(388) := '2020696620286329207B20632E74657874436F6E74656E74203D206E3B207D0A2020202020207365632E636C6173734C6973742E746F67676C65282264672D7365632D656D707479222C206E203D3D3D2030293B0A202020207D293B0A0A202020206675';
wwv_flow_imp.g_varchar2_table(389) := '6E6374696F6E2066696C6C546F287461726765742C206265666F726529207B0A2020202020207768696C652028746172676574203E20656D697474656429207B0A20202020202020207661722066203D20646F63756D656E742E637265617465456C656D';
wwv_flow_imp.g_varchar2_table(390) := '656E74282264697622293B0A2020202020202020662E636C6173734E616D65203D202264672D6974656D2064672D66696C6C657222202B0A20202020202020202020202020202020202020202020282828656D6974746564202B20312920252070616972';
wwv_flow_imp.g_varchar2_table(391) := '73203D3D3D203029203F20222064672D6564676522203A20222229202B0A2020202020202020202020202020202020202020202028284D6174682E666C6F6F7228656D6974746564202F207061697273292025203229203F20222064672D616C7422203A';
wwv_flow_imp.g_varchar2_table(392) := '202222293B0A2020202020202020662E7374796C652E67726964436F6C756D6E203D20537472696E672828656D6974746564202520706169727329202B2031293B0A2020202020202020672E696E736572744265666F726528662C206265666F7265293B';
wwv_flow_imp.g_varchar2_table(393) := '0A2020202020202020656D6974746564202B3D20313B0A2020202020207D0A202020207D0A0A20202020766172206E6F646573203D2041727261792E70726F746F747970652E66696C7465722E63616C6C28672E6368696C6472656E2C2066756E637469';
wwv_flow_imp.g_varchar2_table(394) := '6F6E20286E29207B0A202020202020696620286E2E636C6173734C6973742E636F6E7461696E73282264672D736563222929207B2072657475726E20216E2E636C6173734C6973742E636F6E7461696E73282264672D7365632D656D70747922293B207D';
wwv_flow_imp.g_varchar2_table(395) := '0A20202020202072657475726E206E2E6D61746368657328222E64672D6974656D5B646174612D64672D6E616D655D22292026260A20202020202020202020202020216E2E636C6173734C6973742E636F6E7461696E73282264672D68696464656E2229';
wwv_flow_imp.g_varchar2_table(396) := '20262620216E2E636C6173734C6973742E636F6E7461696E73282264672D7365632D68696464656E22293B0A202020207D293B0A0A202020206E6F6465732E666F72456163682866756E6374696F6E2028697429207B0A2020202020206966202869742E';
wwv_flow_imp.g_varchar2_table(397) := '636C6173734C6973742E636F6E7461696E73282264672D736563222929207B0A202020202020202069662028736C6F74202520706169727329207B20736C6F74202B3D207061697273202D2028736C6F742025207061697273293B207D0A202020202020';
wwv_flow_imp.g_varchar2_table(398) := '202066696C6C546F28736C6F742C206974293B0A202020202020202069742E7374796C652E67726964436F6C756D6E203D202231202F202D31223B0A2020202020202020736C6F74202B3D2070616972733B0A2020202020202020656D6974746564203D';
wwv_flow_imp.g_varchar2_table(399) := '20736C6F743B0A202020202020202072657475726E3B0A2020202020207D0A202020202020766172207370616E203D204D6174682E6D696E287061727365496E742869742E646174617365742E64675370616E207C7C202231222C203130292C20706169';
wwv_flow_imp.g_varchar2_table(400) := '7273293B0A20202020202076617220666F72636564203D207061727365496E742869742E646174617365742E6467436F6C207C7C202230222C203130293B0A20202020202069662028666F7263656420262620666F72636564203C3D2070616972732920';
wwv_flow_imp.g_varchar2_table(401) := '7B0A20202020202020206966202828736C6F74202520706169727329202B2031203E20666F7263656429207B20736C6F74202B3D207061697273202D2028736C6F742025207061697273293B207D0A2020202020202020736C6F74202B3D20666F726365';
wwv_flow_imp.g_varchar2_table(402) := '64202D2031202D2028736C6F742025207061697273293B0A2020202020207D0A2020202020206966202828736C6F74202520706169727329202B207370616E203E20706169727329207B20736C6F74202B3D207061697273202D2028736C6F7420252070';
wwv_flow_imp.g_varchar2_table(403) := '61697273293B207D0A20202020202066696C6C546F28736C6F742C206974293B20202020202020202020202020202020202020202020202F2F2066696C6C20616E7920686F6C65206120706C6163656D656E74206F70656E65640A20202020202069742E';
wwv_flow_imp.g_varchar2_table(404) := '7374796C652E67726964436F6C756D6E203D20537472696E672828736C6F74202520706169727329202B203129202B20287370616E203E2031203F2022202F207370616E2022202B207370616E203A202222293B0A20202020202069742E636C6173734C';
wwv_flow_imp.g_varchar2_table(405) := '6973742E746F67676C65282264672D616C74222C204D6174682E666C6F6F7228736C6F74202F2070616972732920252032203D3D3D2031293B0A202020202020736C6F74202B3D207370616E3B0A202020202020656D6974746564202B3D207370616E3B';
wwv_flow_imp.g_varchar2_table(406) := '0A20202020202069742E636C6173734C6973742E746F67676C65282264672D65646765222C2028736C6F74202520706169727329203D3D3D2030293B0A202020207D293B0A0A202020202F2F2073747261696768742065646765206F6E20746865206669';
wwv_flow_imp.g_varchar2_table(407) := '6E616C20726F7720286265666F7265207468652065646974206261722C20696620616E79290A2020202069662028656D6974746564202520706169727329207B0A20202020202066696C6C546F28656D6974746564202B207061697273202D2028656D69';
wwv_flow_imp.g_varchar2_table(408) := '747465642025207061697273292C20672E717565727953656C6563746F7228223A73636F7065203E202E64672D656469746261722229293B0A202020207D0A20207D0A0A202066756E6374696F6E2063757272656E745072656673286729207B0A202020';
wwv_flow_imp.g_varchar2_table(409) := '207661722068696464656E203D205B5D2C206F72646572203D205B5D3B0A20202020672E717565727953656C6563746F72416C6C28222E64672D6974656D5B646174612D64672D6E616D655D22292E666F72456163682866756E6374696F6E2028697429';
wwv_flow_imp.g_varchar2_table(410) := '207B0A2020202020206F726465722E707573682869742E646174617365742E64674E616D65293B0A2020202020206966202869742E636C6173734C6973742E636F6E7461696E73282264672D68696464656E222929207B2068696464656E2E7075736828';
wwv_flow_imp.g_varchar2_table(411) := '69742E646174617365742E64674E616D65293B207D0A202020207D293B0A2020202072657475726E207B2068696464656E3A2068696464656E2E6A6F696E28222C22292C206F726465723A206F726465722E6A6F696E28222C2229207D3B0A20207D0A0A';
wwv_flow_imp.g_varchar2_table(412) := '202066756E6374696F6E2063616C6C50726F632862746E2C20616374696F6E2C20657874726129207B0A2020202072657475726E20617065782E7365727665722E70726F636573732862746E2E646174617365742E646750726F632C204F626A6563742E';
wwv_flow_imp.g_varchar2_table(413) := '61737369676E287B0A2020202020207830313A20616374696F6E2C207830323A2062746E2E646174617365742E64674B65790A202020207D2C206578747261207C7C207B7D292C207B2064617461547970653A20226A736F6E22207D293B0A20207D0A0A';
wwv_flow_imp.g_varchar2_table(414) := '202066756E6374696F6E2070616E656C486F73742862746E29207B0A2020202072657475726E2062746E2E636C6F7365737428222E64672D636667686F73742229207C7C2062746E2E636C6F7365737428222E64672D746F6F6C6261722229207C7C2064';
wwv_flow_imp.g_varchar2_table(415) := '6F63756D656E742E626F64793B0A20207D0A0A202066756E6374696F6E206275696C6450616E656C2862746E29207B0A202020207661722067203D20677269644F662862746E293B0A202020207661722070616E656C203D20646F63756D656E742E6372';
wwv_flow_imp.g_varchar2_table(416) := '65617465456C656D656E74282264697622293B0A2020202070616E656C2E636C6173734E616D65203D202264672D63666770616E656C223B0A2020202070616E656C2E696E6E657248544D4C203D20223C64697620636C6173733D2764672D6366676865';
wwv_flow_imp.g_varchar2_table(417) := '6164273E436F6E666967757265206C61796F75743C2F6469763E22202B0A20202020202020202020202020202020202020202020223C756C20636C6173733D2764672D6366676C697374273E3C2F756C3E22202B0A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(418) := '20202020202020223C64697620636C6173733D2764672D636667666F6F74273E22202B0A20202020202020202020202020202020202020202020223C627574746F6E20747970653D27627574746F6E2720636C6173733D2764672D62746E2064672D6274';
wwv_flow_imp.g_varchar2_table(419) := '6E2D67686F73742064672D6366677265736574273E52657365743C2F627574746F6E3E22202B0A20202020202020202020202020202020202020202020223C627574746F6E20747970653D27627574746F6E2720636C6173733D2764672D62746E206467';
wwv_flow_imp.g_varchar2_table(420) := '2D62746E2D7072696D6172792064672D63666773617665273E536176653C2F627574746F6E3E22202B0A20202020202020202020202020202020202020202020223C2F6469763E223B0A20202020766172206C697374203D2070616E656C2E7175657279';
wwv_flow_imp.g_varchar2_table(421) := '53656C6563746F7228222E64672D6366676C69737422293B0A0A20202020672E717565727953656C6563746F72416C6C28222E64672D6974656D5B646174612D64672D6E616D655D22292E666F72456163682866756E6374696F6E2028697429207B0A20';
wwv_flow_imp.g_varchar2_table(422) := '2020202020766172206C69203D20646F63756D656E742E637265617465456C656D656E7428226C6922293B0A2020202020206C692E647261676761626C65203D20747275653B0A2020202020206C692E646174617365742E64674E616D65203D2069742E';
wwv_flow_imp.g_varchar2_table(423) := '646174617365742E64674E616D653B0A202020202020766172206F7074696F6E616C203D2069742E636C6173734C6973742E636F6E7461696E73282264672D6F7074696F6E616C22293B0A202020202020766172206C6162656C203D206573632869742E';
wwv_flow_imp.g_varchar2_table(424) := '646174617365742E64674C6162656C293B0A2020202020206C692E696E6E657248544D4C203D0A2020202020202020223C7370616E20636C6173733D2764672D647261672720617269612D68696464656E3D2774727565273E2623393737363B3C2F7370';
wwv_flow_imp.g_varchar2_table(425) := '616E3E22202B0A2020202020202020286F7074696F6E616C0A202020202020202020203F20223C6C6162656C3E3C696E70757420747970653D27636865636B626F782722202B0A2020202020202020202020202869742E636C6173734C6973742E636F6E';
wwv_flow_imp.g_varchar2_table(426) := '7461696E73282264672D68696464656E2229203F202222203A202220636865636B65642229202B0A202020202020202020202020223E2022202B206C6162656C202B20223C2F6C6162656C3E220A202020202020202020203A20223C6C6162656C20636C';
wwv_flow_imp.g_varchar2_table(427) := '6173733D2764672D6669786564273E22202B206C6162656C202B20223C2F6C6162656C3E2229202B0A20202020202020202869742E646174617365742E6467536563203F20223C7370616E20636C6173733D2764672D636667736563273E22202B206573';
wwv_flow_imp.g_varchar2_table(428) := '632869742E646174617365742E646753656329202B20223C2F7370616E3E22203A202222293B0A2020202020206C6973742E617070656E644368696C64286C69293B0A202020207D293B0A0A202020207661722064726167676564203D206E756C6C3B0A';
wwv_flow_imp.g_varchar2_table(429) := '202020206C6973742E6164644576656E744C697374656E65722822647261677374617274222C2066756E6374696F6E20286529207B0A20202020202064726167676564203D20652E7461726765742E636C6F7365737428226C6922293B20647261676765';
wwv_flow_imp.g_varchar2_table(430) := '642E636C6173734C6973742E616464282269732D6472616767696E6722293B0A202020207D293B0A202020206C6973742E6164644576656E744C697374656E6572282264726167656E64222C2066756E6374696F6E202829207B0A202020202020696620';
wwv_flow_imp.g_varchar2_table(431) := '286472616767656429207B20647261676765642E636C6173734C6973742E72656D6F7665282269732D6472616767696E6722293B2064726167676564203D206E756C6C3B207D0A202020207D293B0A202020206C6973742E6164644576656E744C697374';
wwv_flow_imp.g_varchar2_table(432) := '656E65722822647261676F766572222C2066756E6374696F6E20286529207B0A202020202020652E70726576656E7444656661756C7428293B0A202020202020766172206F766572203D20652E7461726765742E636C6F7365737428226C6922293B0A20';
wwv_flow_imp.g_varchar2_table(433) := '202020202069662028216F766572207C7C206F766572203D3D3D206472616767656429207B2072657475726E3B207D0A2020202020207661722072203D206F7665722E676574426F756E64696E67436C69656E745265637428293B0A2020202020206C69';
wwv_flow_imp.g_varchar2_table(434) := '73742E696E736572744265666F726528647261676765642C0A202020202020202028652E636C69656E7459202D20722E746F7029202F20722E686569676874203E20302E35203F206F7665722E6E6578745369626C696E67203A206F766572293B0A2020';
wwv_flow_imp.g_varchar2_table(435) := '20207D293B0A0A2020202070616E656C486F73742862746E292E617070656E644368696C642870616E656C293B0A20202020706F736974696F6E50616E656C2870616E656C2C2062746E2C20333030293B0A2020202072657475726E2070616E656C3B0A';
wwv_flow_imp.g_varchar2_table(436) := '20207D0A0A20202F2F20416E63686F7220746F2074686520627574746F6E20696E2076696577706F727420737061636520736F206E6F20616E636573746F72206F766572666C6F772063616E20636C69702069742E0A202066756E6374696F6E20706F73';
wwv_flow_imp.g_varchar2_table(437) := '6974696F6E50616E656C2870616E656C2C2062746E2C20776964746829207B0A202020207661722077203D207769647468207C7C203330303B0A202020207661722072203D2062746E2E676574426F756E64696E67436C69656E745265637428293B0A20';
wwv_flow_imp.g_varchar2_table(438) := '202020766172206D617267696E203D20383B0A2020202070616E656C2E7374796C652E706F736974696F6E203D20226669786564223B0A2020202070616E656C2E7374796C652E7269676874203D20226175746F223B0A2020202070616E656C2E737479';
wwv_flow_imp.g_varchar2_table(439) := '6C652E626F74746F6D203D20226175746F223B0A2020202070616E656C2E7374796C652E7769647468203D204D6174682E6D696E28772C2077696E646F772E696E6E65725769647468202D2032202A206D617267696E29202B20227078223B0A20202020';
wwv_flow_imp.g_varchar2_table(440) := '70616E656C2E7374796C652E6C656674203D204D6174682E6D6178286D617267696E2C0A20202020202020204D6174682E6D696E28722E7269676874202D20772C2077696E646F772E696E6E65725769647468202D2077202D206D617267696E2929202B';
wwv_flow_imp.g_varchar2_table(441) := '20227078223B0A0A202020207661722061626F7665203D20722E746F70202D206D617267696E3B0A202020207661722062656C6F77203D2077696E646F772E696E6E6572486569676874202D20722E626F74746F6D202D206D617267696E3B0A0A202020';
wwv_flow_imp.g_varchar2_table(442) := '206966202862656C6F77203E3D20323630207C7C2062656C6F77203E3D2061626F766529207B0A20202020202070616E656C2E7374796C652E746F70203D2028722E626F74746F6D202B203629202B20227078223B0A20202020202070616E656C2E7374';
wwv_flow_imp.g_varchar2_table(443) := '796C652E6D6178486569676874203D202862656C6F77202D20313229202B20227078223B0A202020207D20656C7365207B0A20202020202070616E656C2E7374796C652E6D6178486569676874203D202861626F7665202D20313229202B20227078223B';
wwv_flow_imp.g_varchar2_table(444) := '0A20202020202070616E656C2E7374796C652E626F74746F6D203D202877696E646F772E696E6E6572486569676874202D20722E746F70202B203629202B20227078223B0A20202020202070616E656C2E7374796C652E746F70203D20226175746F223B';
wwv_flow_imp.g_varchar2_table(445) := '0A202020207D0A20207D0A0A202066756E6374696F6E20636F6D6D697450616E656C2870616E656C2C2062746E29207B0A202020207661722067203D20677269644F662862746E293B0A2020202070616E656C2E717565727953656C6563746F72416C6C';
wwv_flow_imp.g_varchar2_table(446) := '28222E64672D6366676C697374206C6922292E666F72456163682866756E6374696F6E20286C6929207B0A202020202020766172206974203D20672E717565727953656C6563746F7228272E64672D6974656D5B646174612D64672D6E616D653D222720';
wwv_flow_imp.g_varchar2_table(447) := '2B2063737371286C692E646174617365742E64674E616D6529202B2027225D27293B0A2020202020206966202821697429207B2072657475726E3B207D0A202020202020766172206362203D206C692E717565727953656C6563746F722822696E707574';
wwv_flow_imp.g_varchar2_table(448) := '5B747970653D636865636B626F785D22293B0A20202020202069662028636229207B2069742E636C6173734C6973742E746F67676C65282264672D68696464656E222C202163622E636865636B6564293B207D0A202020202020672E617070656E644368';
wwv_flow_imp.g_varchar2_table(449) := '696C64286974293B0A20202020202069742E7374796C652E67726964436F6C756D6E203D2022223B0A202020207D293B0A20202020726567726F75702867293B0A2020202072656C61796F75742867293B0A202020207265616E63686F722867293B0A20';
wwv_flow_imp.g_varchar2_table(450) := '20202072657475726E2063757272656E7450726566732867293B0A20207D0A0A2020646F63756D656E742E6164644576656E744C697374656E65722822636C69636B222C2066756E6374696F6E20286529207B0A202020206966202821652E7461726765';
wwv_flow_imp.g_varchar2_table(451) := '742E636C6F7365737428222E64672D636F6D626F222929207B0A202020202020646F63756D656E742E717565727953656C6563746F72416C6C28222E64672D636F6D626F2D6C6973742E69732D6F70656E22292E666F72456163682866756E6374696F6E';
wwv_flow_imp.g_varchar2_table(452) := '20286C29207B0A2020202020202020636F6D626F436C6F7365286C2E636C6F7365737428222E64672D636F6D626F22292C2074727565293B0A2020202020207D293B0A202020207D0A202020206966202821652E7461726765742E636C6F736573742822';
wwv_flow_imp.g_varchar2_table(453) := '2E64672D706F7022292026262021652E7461726765742E636C6F7365737428222E64672D706F7062746E222929207B20636C6F7365506F706F7665727328293B207D0A0A2020202076617220636F6D626F42746E203D20652E7461726765742E636C6F73';
wwv_flow_imp.g_varchar2_table(454) := '65737428222E64672D636F6D626F2D62746E22293B0A2020202069662028636F6D626F42746E29207B0A202020202020652E70726576656E7444656661756C7428293B0A2020202020207661722063203D20636F6D626F42746E2E636C6F736573742822';
wwv_flow_imp.g_varchar2_table(455) := '2E64672D636F6D626F22293B0A20202020202069662028636F6D626F49734F70656E28632929207B20636F6D626F436C6F736528632C2074727565293B207D20656C7365207B20636F6D626F4F70656E28632C202222293B207D0A202020202020706172';
wwv_flow_imp.g_varchar2_table(456) := '74732863292E696E7075742E666F63757328293B0A20202020202072657475726E3B0A202020207D0A0A2020202076617220706F7042746E203D20652E7461726765742E636C6F7365737428222E64672D706F7062746E22293B0A202020206966202870';
wwv_flow_imp.g_varchar2_table(457) := '6F7042746E29207B20652E70726576656E7444656661756C7428293B206F70656E506F706F76657228706F7042746E293B2072657475726E3B207D0A0A2020202076617220756E646F203D20652E7461726765742E636C6F7365737428222E64672D756E';
wwv_flow_imp.g_varchar2_table(458) := '646F22293B0A2020202069662028756E646F29207B0A202020202020652E70726576656E7444656661756C7428293B0A20202020202076617220746F617374203D20756E646F2E636C6F7365737428222E64672D746F61737422293B0A20202020202077';
wwv_flow_imp.g_varchar2_table(459) := '696E646F772E636C65617254696D656F757428746F6173742E5F74696D6572293B0A202020202020766172206368616E676573203D20746F6173742E5F6368616E6765733B0A202020202020766172207230203D20746F6173742E636C6F736573742822';
wwv_flow_imp.g_varchar2_table(460) := '2E64672D726F6F7422293B0A202020202020746F6173742E72656D6F766528293B0A202020202020756E646F4368616E6765732872302C206368616E676573293B0A20202020202072657475726E3B0A202020207D0A20202020766172207478203D2065';
wwv_flow_imp.g_varchar2_table(461) := '2E7461726765742E636C6F7365737428222E64672D746F6173742D7822293B0A2020202069662028747829207B20652E70726576656E7444656661756C7428293B206469736D697373546F6173742874782E636C6F7365737428222E64672D746F617374';
wwv_flow_imp.g_varchar2_table(462) := '2229293B2072657475726E3B207D0A0A202020207661722065646974416C6C42746E203D20652E7461726765742E636C6F7365737428222E64672D65646974616C6C22293B0A202020206966202865646974416C6C42746E29207B0A202020202020652E';
wwv_flow_imp.g_varchar2_table(463) := '70726576656E7444656661756C7428293B0A202020202020766172206761203D20677269644F662865646974416C6C42746E293B0A2020202020206966202867612026262067612E636C6173734C6973742E636F6E7461696E73282269732D6564697461';
wwv_flow_imp.g_varchar2_table(464) := '6C6C222929207B2073617665416C6C286761293B207D20656C7365207B2065646974416C6C286761293B207D0A20202020202072657475726E3B0A202020207D0A2020202076617220616C6C53617665203D20652E7461726765742E636C6F7365737428';
wwv_flow_imp.g_varchar2_table(465) := '222E64672D616C6C7361766522293B0A2020202069662028616C6C5361766529207B20652E70726576656E7444656661756C7428293B2073617665416C6C28616C6C536176652E636C6F7365737428222E64672229293B2072657475726E3B207D0A2020';
wwv_flow_imp.g_varchar2_table(466) := '202076617220616C6C43616E63656C203D20652E7461726765742E636C6F7365737428222E64672D616C6C63616E63656C22293B0A2020202069662028616C6C43616E63656C29207B20652E70726576656E7444656661756C7428293B20657869744564';
wwv_flow_imp.g_varchar2_table(467) := '6974416C6C28616C6C43616E63656C2E636C6F7365737428222E646722292C2066616C7365293B2072657475726E3B207D0A0A202020207661722063666742746E203D20652E7461726765742E636C6F7365737428222E64672D63666762746E22293B0A';
wwv_flow_imp.g_varchar2_table(468) := '202020206966202863666742746E29207B0A202020202020652E70726576656E7444656661756C7428293B0A202020202020652E73746F7050726F7061676174696F6E28293B0A202020202020766172206F70656E203D2070616E656C486F7374286366';
wwv_flow_imp.g_varchar2_table(469) := '6742746E292E717565727953656C6563746F7228222E64672D63666770616E656C22293B0A202020202020696620286F70656E29207B206F70656E2E72656D6F766528293B207D20656C7365207B206275696C6450616E656C2863666742746E293B207D';
wwv_flow_imp.g_varchar2_table(470) := '0A20202020202072657475726E3B0A202020207D0A0A202020207661722073617665436667203D20652E7461726765742E636C6F7365737428222E64672D6366677361766522293B0A20202020696620287361766543666729207B0A202020202020652E';
wwv_flow_imp.g_varchar2_table(471) := '70726576656E7444656661756C7428293B0A2020202020207661722070616E656C203D20736176654366672E636C6F7365737428222E64672D63666770616E656C22293B0A2020202020207661722062203D2070616E656C2E706172656E744E6F64652E';
wwv_flow_imp.g_varchar2_table(472) := '717565727953656C6563746F7228222E64672D63666762746E22293B0A202020202020766172207072656673203D20636F6D6D697450616E656C2870616E656C2C2062293B0A20202020202063616C6C50726F6328622C202253415645222C207B207830';
wwv_flow_imp.g_varchar2_table(473) := '333A2070726566732E68696464656E2C207830343A2070726566732E6F72646572207D290A20202020202020202E7468656E2866756E6374696F6E202829207B2070616E656C2E72656D6F766528293B207D290A20202020202020202E63617463682866';
wwv_flow_imp.g_varchar2_table(474) := '756E6374696F6E202865727229207B206E6F7469667928224552524F52222C2022436F756C64206E6F742073617665206C61796F75743A2022202B20657272293B207D293B0A20202020202072657475726E3B0A202020207D0A0A202020207661722072';
wwv_flow_imp.g_varchar2_table(475) := '65736574436667203D20652E7461726765742E636C6F7365737428222E64672D636667726573657422293B0A2020202069662028726573657443666729207B0A202020202020652E70726576656E7444656661756C7428293B0A20202020202076617220';
wwv_flow_imp.g_varchar2_table(476) := '7032203D2072657365744366672E636C6F7365737428222E64672D63666770616E656C22293B0A202020202020766172206232203D2070322E706172656E744E6F64652E717565727953656C6563746F7228222E64672D63666762746E22293B0A202020';
wwv_flow_imp.g_varchar2_table(477) := '20202063616C6C50726F632862322C2022524553455422292E7468656E2866756E6374696F6E202829207B2077696E646F772E6C6F636174696F6E2E72656C6F616428293B207D293B0A20202020202072657475726E3B0A202020207D0A0A2020202069';
wwv_flow_imp.g_varchar2_table(478) := '66202821652E7461726765742E636C6F7365737428222E64672D63666770616E656C222929207B0A202020202020646F63756D656E742E717565727953656C6563746F72416C6C28222E64672D63666770616E656C22292E666F72456163682866756E63';
wwv_flow_imp.g_varchar2_table(479) := '74696F6E20287029207B20702E72656D6F766528293B207D293B0A202020207D0A0A2020202076617220736563203D20652E7461726765742E636C6F7365737428222E64672D73656322293B0A202020206966202873656329207B0A202020202020652E';
wwv_flow_imp.g_varchar2_table(480) := '70726576656E7444656661756C7428293B0A2020202020207661722067203D207365632E636C6F7365737428222E646722293B0A20202020202073657453656374696F6E28672C207365632C20217365632E636C6173734C6973742E636F6E7461696E73';
wwv_flow_imp.g_varchar2_table(481) := '282269732D636F6C6C617073656422292C2074727565293B0A20202020202072656C61796F75742867293B0A2020202020207265616E63686F722867293B0A20202020202072657475726E3B0A202020207D0A0A20202020766172206564697442746E20';
wwv_flow_imp.g_varchar2_table(482) := '3D20652E7461726765742E636C6F7365737428222E64672D6564697462746E22293B0A20202020696620286564697442746E29207B0A202020202020652E70726576656E7444656661756C7428293B0A202020202020766172206769203D206564697442';
wwv_flow_imp.g_varchar2_table(483) := '746E2E636C6F7365737428222E646722293B0A2020202020206966202867692026262067692E636C6173734C6973742E636F6E7461696E73282269732D65646974616C6C222929207B2072657475726E3B207D0A20202020202067692E71756572795365';
wwv_flow_imp.g_varchar2_table(484) := '6C6563746F72416C6C28222E64672D6974656D2E69732D65646974696E6722292E666F72456163682863616E63656C45646974293B2020202F2F206F6E6520617420612074696D650A2020202020206F70656E456469746F72286564697442746E2E636C';
wwv_flow_imp.g_varchar2_table(485) := '6F7365737428222E64672D6974656D2229293B0A20202020202072657475726E3B0A202020207D0A0A20202020766172207361766542746E203D20652E7461726765742E636C6F7365737428222E64672D7361766522293B0A2020202069662028736176';
wwv_flow_imp.g_varchar2_table(486) := '6542746E202626207361766542746E2E636C6F7365737428222E64672D6974656D222929207B0A202020202020652E70726576656E7444656661756C7428293B0A20202020202076617220734974656D203D207361766542746E2E636C6F736573742822';
wwv_flow_imp.g_varchar2_table(487) := '2E64672D6974656D22293B0A20202020202068616E646C654564697428734974656D2E717565727953656C6563746F7228222E64672D6564697422292C0A20202020202020202020202020202020207361766542746E2E636C6F7365737428222E64672D';
wwv_flow_imp.g_varchar2_table(488) := '656469747772617022292C20734974656D293B0A20202020202072657475726E3B0A202020207D0A0A202020207661722063616E63656C42746E203D20652E7461726765742E636C6F7365737428222E64672D63616E63656C22293B0A20202020696620';
wwv_flow_imp.g_varchar2_table(489) := '2863616E63656C42746E2026262063616E63656C42746E2E636C6F7365737428222E64672D6974656D222929207B0A202020202020652E70726576656E7444656661756C7428293B0A20202020202063616E63656C456469742863616E63656C42746E2E';
wwv_flow_imp.g_varchar2_table(490) := '636C6F7365737428222E64672D6974656D2229293B0A20202020202072657475726E3B0A202020207D0A0A2020202076617220636F707942746E203D20652E7461726765742E636C6F7365737428222E64672D636F707922293B0A202020206966202863';
wwv_flow_imp.g_varchar2_table(491) := '6F707942746E29207B0A202020202020652E70726576656E7444656661756C7428293B0A2020202020207661722074657874203D20636F707942746E2E6765744174747269627574652822646174612D64672D636F70792229207C7C2022223B0A202020';
wwv_flow_imp.g_varchar2_table(492) := '202020696620286E6176696761746F722E636C6970626F617264202626206E6176696761746F722E636C6970626F6172642E77726974655465787429207B0A20202020202020206E6176696761746F722E636C6970626F6172642E777269746554657874';
wwv_flow_imp.g_varchar2_table(493) := '2874657874292E7468656E2866756E6374696F6E202829207B0A202020202020202020206E6F74696679282253554343455353222C2022436F7069656422293B0A20202020202020207D293B0A2020202020207D20656C7365207B0A2020202020202020';
wwv_flow_imp.g_varchar2_table(494) := '766172207461203D20646F63756D656E742E637265617465456C656D656E742822746578746172656122293B0A202020202020202074612E76616C7565203D20746578743B0A202020202020202074612E7374796C652E706F736974696F6E203D202266';
wwv_flow_imp.g_varchar2_table(495) := '69786564223B0A202020202020202074612E7374796C652E6F706163697479203D202230223B0A2020202020202020646F63756D656E742E626F64792E617070656E644368696C64287461293B0A202020202020202074612E73656C65637428293B0A20';
wwv_flow_imp.g_varchar2_table(496) := '20202020202020747279207B20646F63756D656E742E65786563436F6D6D616E642822636F707922293B206E6F74696679282253554343455353222C2022436F7069656422293B207D20636174636820287829207B7D0A2020202020202020646F63756D';
wwv_flow_imp.g_varchar2_table(497) := '656E742E626F64792E72656D6F76654368696C64287461293B0A2020202020207D0A20202020202072657475726E3B0A202020207D0A0A202020207661722069636F6E203D20652E7461726765742E636C6F7365737428222E64672D69636F2E69732D63';
wwv_flow_imp.g_varchar2_table(498) := '6C69636B61626C6522293B0A202020206966202869636F6E29207B0A202020202020652E70726576656E7444656661756C7428293B0A202020202020766172206D7367203D2069636F6E2E6765744174747269627574652822646174612D64672D616C65';
wwv_flow_imp.g_varchar2_table(499) := '727422293B0A202020202020696620286D736729207B0A2020202020202020747279207B20617065782E6D6573736167652E616C657274286D7367293B207D20636174636820287829207B2077696E646F772E616C657274286D7367293B207D0A202020';
wwv_flow_imp.g_varchar2_table(500) := '2020207D0A20202020202072657475726E3B0A202020207D0A0A2020202076617220746970203D20652E7461726765742E636C6F7365737428222E64672D7469702E7469702D636C69636B22293B0A20202020646F63756D656E742E717565727953656C';
wwv_flow_imp.g_varchar2_table(501) := '6563746F72416C6C28222E64672D7469702E7469702D636C69636B2E69732D6F70656E22292E666F72456163682866756E6374696F6E20286F29207B0A202020202020696620286F20213D3D2074697029207B206F2E636C6173734C6973742E72656D6F';
wwv_flow_imp.g_varchar2_table(502) := '7665282269732D6F70656E22293B207D0A202020207D293B0A202020206966202874697029207B207469702E636C6173734C6973742E746F67676C65282269732D6F70656E22293B207D0A20207D293B0A0A20202F2F2053617665642070726566657265';
wwv_flow_imp.g_varchar2_table(503) := '6E63657320617265206170706C6965642073657276657220736964652C20736F206E6F7468696E672069732066657463686564206865726520616E640A20202F2F207468652063617264206E657665722072656F7264657273206166746572207061696E';
wwv_flow_imp.g_varchar2_table(504) := '742E0A202066756E6374696F6E20696E6974526F6F742873636F706529207B0A2020202073636F70652E717565727953656C6563746F72416C6C28222E646722292E666F72456163682866756E6374696F6E20286729207B20696E697453656374696F6E';
wwv_flow_imp.g_varchar2_table(505) := '732867293B2072656C61796F75742867293B207D293B0A20202020706C616365466C6F6174696E67427574746F6E732873636F7065293B0A2020202073636F70652E717565727953656C6563746F72416C6C28222E646722292E666F7245616368287265';
wwv_flow_imp.g_varchar2_table(506) := '616E63686F72293B0A20207D0A0A20202F2F202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D20726567696F6E2072656672657368202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0A20202F2F20546865207365727665722072652D72656E64657273207468652063';
wwv_flow_imp.g_varchar2_table(507) := '617264207468726F7567682074686520706C75672D696E277320416A61782063616C6C6261636B2C20736F20610A20202F2F20526566726573682064796E616D696320616374696F6E206F7220617065782E726567696F6E286964292E72656672657368';
wwv_flow_imp.g_varchar2_table(508) := '2829207570646174657320697420696E20706C6163652E0A202066756E6374696F6E2072656672657368526F6F7428726F6F742C206F70747329207B0A202020206F707473203D206F707473207C7C207B7D3B0A20202020726F6F742E71756572795365';
wwv_flow_imp.g_varchar2_table(509) := '6C6563746F72416C6C28222E64672D63666770616E656C22292E666F72456163682866756E6374696F6E20287029207B20702E72656D6F766528293B207D293B0A20202020636C6F7365506F706F7665727328293B0A2020202072657475726E20617065';
wwv_flow_imp.g_varchar2_table(510) := '782E7365727665722E706C7567696E28726F6F742E646174617365742E6467416A61782C0A2020202020207B20706167654974656D733A20726F6F742E646174617365742E64674974656D73207C7C20756E646566696E6564207D2C0A2020202020207B';
wwv_flow_imp.g_varchar2_table(511) := '2064617461547970653A202268746D6C222C0A2020202020202020726566726573684F626A6563743A20222322202B20726F6F742E646174617365742E6467526567696F6E2C0A20202020202020206C6F6164696E67496E64696361746F723A20726F6F';
wwv_flow_imp.g_varchar2_table(512) := '742C0A20202020202020206C6F6164696E67496E64696361746F72506F736974696F6E3A202263656E746572656422207D290A2020202020202E646F6E652866756E6374696F6E202868746D6C29207B0A2020202020202020726F6F742E696E6E657248';
wwv_flow_imp.g_varchar2_table(513) := '544D4C203D2068746D6C3B0A2020202020202020696E6974526F6F7428726F6F74293B0A2020202020202020696620286F7074732E6F70656E29207B206F70656E42794E616D6528726F6F742E717565727953656C6563746F7228222E646722292C206F';
wwv_flow_imp.g_varchar2_table(514) := '7074732E6F70656E293B207D0A2020202020202020696620286F7074732E616674657229207B206F7074732E616674657228726F6F74293B207D0A2020202020207D290A2020202020202E6661696C2866756E6374696F6E20287868722C207374617475';
wwv_flow_imp.g_varchar2_table(515) := '732C2065727229207B0A20202020202020206E6F7469667928224552524F52222C2022436F756C64206E6F7420726566726573683A2022202B2028657272207C7C2073746174757329293B0A2020202020207D293B0A20207D0A0A202066756E6374696F';
wwv_flow_imp.g_varchar2_table(516) := '6E207265676973746572526F6F7428726F6F7429207B0A20202020766172206964203D20726F6F742E646174617365742E6467526567696F6E3B0A2020202069662028216964207C7C2021726F6F742E646174617365742E6467416A6178207C7C202177';
wwv_flow_imp.g_varchar2_table(517) := '696E646F772E61706578207C7C2021617065782E726567696F6E29207B2072657475726E3B207D0A202020202F2F206120726567696F6E2074656D706C61746520776974686F757420616E206964207374696C6C20676574732061207265667265736861';
wwv_flow_imp.g_varchar2_table(518) := '626C6520656C656D656E740A202020206966202821646F63756D656E742E676574456C656D656E74427949642869642929207B20726F6F742E6964203D2069643B207D0A2020202069662028617065782E726567696F6E2E6973526567696F6E20262620';
wwv_flow_imp.g_varchar2_table(519) := '617065782E726567696F6E2E6973526567696F6E2869642929207B0A20202020202069662028617065782E726567696F6E286964292E74797065203D3D3D2022536D6172744F6E65526F77566965772229207B2072657475726E3B207D0A202020202020';
wwv_flow_imp.g_varchar2_table(520) := '617065782E726567696F6E2E64657374726F79286964293B2020202020202F2F207265706C61636520616E792067656E657269632064656661756C7420696E746572666163650A202020207D0A20202020617065782E726567696F6E2E63726561746528';
wwv_flow_imp.g_varchar2_table(521) := '69642C207B0A202020202020747970653A2022536D6172744F6E65526F7756696577222C0A202020202020726566726573683A2066756E6374696F6E202829207B2072657475726E2072656672657368526F6F7428726F6F74293B207D0A202020207D29';
wwv_flow_imp.g_varchar2_table(522) := '3B0A20207D0A0A202066756E6374696F6E20696E69742829207B0A2020202076617220726F6F7473203D20646F63756D656E742E717565727953656C6563746F72416C6C28222E64672D726F6F7422293B0A2020202069662028726F6F74732E6C656E67';
wwv_flow_imp.g_varchar2_table(523) := '746829207B0A202020202020726F6F74732E666F72456163682866756E6374696F6E20287229207B20696E6974526F6F742872293B207265676973746572526F6F742872293B207D293B0A202020207D20656C7365207B0A202020202020696E6974526F';
wwv_flow_imp.g_varchar2_table(524) := '6F7428646F63756D656E74293B0A202020207D0A20207D0A202069662028646F63756D656E742E7265616479537461746520213D3D20226C6F6164696E672229207B20696E697428293B207D0A2020656C7365207B20646F63756D656E742E6164644576';
wwv_flow_imp.g_varchar2_table(525) := '656E744C697374656E65722822444F4D436F6E74656E744C6F61646564222C20696E6974293B207D0A7D2928293B0A';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(9544818497851686)
,p_plugin_id=>wwv_flow_imp.id(9533928290851658)
,p_file_name=>'js/detail-grid.js'
,p_mime_type=>'application/javascript'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
