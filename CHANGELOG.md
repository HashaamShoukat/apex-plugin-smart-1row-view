# Changelog

## 1.3.3 (2026-10-28)

First public release on GitHub, internal name `COM.HASHAAM.SMART_1ROW_VIEW`.

- One record as a label-and-value card: 1 to 3 pairs per row, spans, merged labels, forced columns, collapsible sections with summaries, stacking on phones.
- Value displays: badges (soft, solid, outline, dot, bar), chips, avatar and name, Yes / No check, large number, percent bar, relative time, monospace, HTML expression; colour rules; format masks with `COMPACT`, `PERCENT`, `CURRENCY` and `SINCE`.
- Side badges, icons, tooltips, copy buttons and blink, driven by `#COLUMN#` tokens.
- Inline editing (text, text area, number, date, date and time, select list, searchable list, toggle) through your own Edit Handler Call; validation in the browser and on the server; whole-card edit; conflict check with a version column; Undo; dependent lists.
- Record keys never reach the browser: edits carry a session-bound token resolved by `smart1rowview_pkg.resolve_key`.
- Link Builder links (modal pages included), a details popover loaded on demand, region refresh.
- Per-user layouts: drag to reorder, hide optional fields, saved per user, page and region (`SMART_1ROW_PREFS`), applied on the server.
- Errors in the region query are shown inside the region instead of failing the page.
