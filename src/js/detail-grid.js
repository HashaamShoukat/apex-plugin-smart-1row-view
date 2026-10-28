/* Detail Grid region plug-in - v12 (whole-card edit, validation, conflicts, undo,
   dependent lists, links, popovers, sections, popup-style searchable list) */
(function () {
  "use strict";

  function notify(status, message) {
    if (!message) { return; }          // only the handler decides what is shown
    var s = (status || "").toUpperCase();
    try {
      if (s === "ERROR" || s === "CONFLICT") {
        apex.message.clearErrors();
        apex.message.showErrors([{ type: "error", location: "page",
                                   message: message,
                                   unsafe: false }]);
      } else if (s === "WARNING") {
        apex.message.alert(message);
      } else {
        apex.message.showPageSuccess(message);
      }
    } catch (e) {
      window.alert(message);
    }
  }

  function esc(s) {
    return String(s == null ? "" : s)
      .replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;").replace(/'/g, "&#39;");
  }

  // per-viewer conveniences only; storage can be blocked, so never rely on it
  function store(key, val) {
    try {
      if (val === undefined) { return window.localStorage.getItem(key); }
      window.localStorage.setItem(key, val);
    } catch (e) { /* ignore */ }
    return null;
  }

  function cssq(s) { return String(s).replace(/["\\]/g, "\\$&"); }

  var callCache = {};

  // The call expression is developer-authored plug-in configuration, used
  // exactly as written (no substitutions). Values arrive via newValue / ctx.
  function compileCall(expr) {
    if (!expr) { return null; }
    if (!callCache[expr]) {
      try {
        callCache[expr] = new Function("newValue", "ctx", "return (" + expr + ");");
      } catch (e) {
        callCache[expr] = false;
      }
    }
    return callCache[expr] || null;
  }

  function markState(el, status) {
    el.classList.remove("is-busy", "is-ok", "is-err");
    var s = (status || "").toUpperCase();
    if (s === "SUCCESS") { el.classList.add("is-ok"); }
    else if (s === "ERROR" || s === "CONFLICT") { el.classList.add("is-err"); }
    window.setTimeout(function () {
      el.classList.remove("is-ok", "is-err");
    }, 2500);
  }

  // ---------------- searchable list (works like an inline Popup LOV) ----------------
  // Type to filter (matches highlighted), arrows / Page keys move, Enter picks,
  // Esc closes, more rows load as you scroll, the current value is ticked.
  // Text that is not a list entry goes back to the last valid value; an empty
  // box clears the value.
  var COMBO_PAGE = 50, comboSeq = 0;

  function parts(combo) {
    return { input: combo.querySelector(".dg-combo-input"),
             list:  combo.querySelector(".dg-combo-list"),
             src:   combo.querySelector(".dg-combo-src") };
  }

  function comboOptions(combo) {
    if (!combo._opts) {
      combo._opts = Array.prototype.map.call(parts(combo).src.options, function (o) {
        return { text: o.text.trim(), value: o.value };
      }).filter(function (o) { return o.text !== "" && o.value !== ""; });
    }
    return combo._opts;
  }

  function displayFor(combo, value) {
    var o = comboOptions(combo).filter(function (x) { return x.value === value; })[0];
    return o ? o.text : null;
  }

  function hilite(text, term) {
    var i = term ? text.toLowerCase().indexOf(term) : -1;
    if (i < 0) { return esc(text); }
    return esc(text.slice(0, i)) + "<mark>" + esc(text.slice(i, i + term.length)) +
           "</mark>" + esc(text.slice(i + term.length));
  }

  // fixed to the viewport so no card or region can clip it; flips up near the bottom
  function comboPosition(combo) {
    var p = parts(combo), r = p.input.getBoundingClientRect();
    var vw = window.innerWidth, vh = window.innerHeight, m = 8;
    var w = Math.min(Math.max(r.width, 260), vw - 2 * m);
    var left = Math.min(Math.max(m, r.left), vw - w - m);
    var below = vh - r.bottom - m, above = r.top - m;
    var up = below < 220 && above > below;
    var maxH = Math.max(120, Math.min(320, (up ? above : below) - 6));
    p.list.style.left = left + "px";
    p.list.style.width = w + "px";
    p.list.style.maxHeight = maxH + "px";
    if (up) { p.list.style.top = "auto"; p.list.style.bottom = (vh - r.top + 4) + "px"; }
    else    { p.list.style.bottom = "auto"; p.list.style.top = (r.bottom + 4) + "px"; }
    p.list.classList.toggle("is-up", up);
  }

  function comboPaint(combo) {
    var p = parts(combo), m = combo._matches || [], cur = p.input.dataset.dgValue;
    var n = Math.min(combo._shown, m.length), html = "";
    for (var i = 0; i < n; i++) {
      var isCur = m[i].value === cur;
      html += "<li role='option' id='" + p.list.id + "-" + i + "' data-i='" + i + "'" +
              " class='" + (i === combo._active ? "is-active" : "") + (isCur ? " is-current" : "") + "'" +
              " aria-selected='" + isCur + "'><span class='dg-combo-txt'>" + hilite(m[i].text, combo._term) +
              "</span>" + (isCur ? "<span class='fa fa-check dg-combo-tick' aria-hidden='true'></span>" : "") +
              "</li>";
    }
    if (!m.length) {
      html = "<li class='dg-combo-none' role='presentation'>No matches</li>";
    } else if (m.length > n) {
      html += "<li class='dg-combo-more' role='presentation'>Scroll for more &middot; " +
              (m.length - n) + " remaining</li>";
    }
    p.list.innerHTML = html;
    var act = p.list.querySelector(".is-active");
    if (act) { p.input.setAttribute("aria-activedescendant", act.id); }
    else { p.input.removeAttribute("aria-activedescendant"); }
  }

  function scrollActive(combo) {
    var a = parts(combo).list.querySelector(".is-active");
    if (a && a.scrollIntoView) { a.scrollIntoView({ block: "nearest" }); }
  }

  function comboIsOpen(combo) { return parts(combo).list.classList.contains("is-open"); }

  function comboOpen(combo, term) {
    var p = parts(combo);
    if (!p.list.id) {
      p.list.id = "dg-combo-" + (++comboSeq);
      p.input.setAttribute("aria-controls", p.list.id);
    }
    var t = (term || "").trim().toLowerCase(), all = comboOptions(combo);
    combo._term = t;
    combo._matches = t ? all.filter(function (o) { return o.text.toLowerCase().indexOf(t) > -1; }) : all;
    combo._active = 0;
    if (!t) {                                  // start on the current value
      for (var i = 0; i < combo._matches.length; i++) {
        if (combo._matches[i].value === p.input.dataset.dgValue) { combo._active = i; break; }
      }
    }
    combo._shown = Math.max(COMBO_PAGE, combo._active + 1);
    comboPaint(combo);
    p.list.classList.add("is-open");
    p.input.setAttribute("aria-expanded", "true");
    comboPosition(combo);
    scrollActive(combo);
  }

  function comboMove(combo, delta) {
    var m = combo._matches || [];
    if (!m.length) { return; }
    var i = Math.min(Math.max((combo._active || 0) + delta, 0), m.length - 1);
    if (i >= combo._shown) { combo._shown = Math.min(m.length, i + COMBO_PAGE); }
    combo._active = i;
    comboPaint(combo);
    scrollActive(combo);
  }

  // like Popup LOV: unmatched text reverts to the last valid value; empty clears
  function comboRevert(combo) {
    var p = parts(combo);
    if (p.input.dataset.dgValue !== undefined) { return; }
    if (p.input.value.trim() === "") { p.input.dataset.dgValue = ""; return; }
    var v = p.input.dataset.dgLast || "";
    p.input.dataset.dgValue = v;
    p.input.value = displayFor(combo, v) || v;
  }

  function comboClose(combo, revert) {
    var p = parts(combo);
    p.list.classList.remove("is-open");
    p.input.setAttribute("aria-expanded", "false");
    p.input.removeAttribute("aria-activedescendant");
    if (revert) { comboRevert(combo); }
  }

  function comboPick(combo, i) {
    var p = parts(combo), o = (combo._matches || [])[i];
    if (!o) { return; }
    p.input.value = o.text;
    p.input.dataset.dgValue = o.value;
    p.input.dataset.dgLast = o.value;
    comboClose(combo);
    p.input.focus();
    p.input.dispatchEvent(new Event("change", { bubbles: true }));
  }

  // returns true when the key was handled by the list
  function comboKey(e, input) {
    var combo = input.closest(".dg-combo"), open = comboIsOpen(combo);
    switch (e.key) {
      case "ArrowDown":
        e.preventDefault();
        if (!open) { comboOpen(combo, input.dataset.dgValue === undefined ? input.value : ""); }
        else { comboMove(combo, 1); }
        return true;
      case "ArrowUp":
        e.preventDefault();
        if (open) { comboMove(combo, -1); }
        return true;
      case "PageDown": if (open) { e.preventDefault(); comboMove(combo, 10); return true; } return false;
      case "PageUp":   if (open) { e.preventDefault(); comboMove(combo, -10); return true; } return false;
      case "Enter":
        if (!open || e.ctrlKey || e.metaKey) { return false; }   // closed: Enter saves
        e.preventDefault();
        if ((combo._matches || []).length) { comboPick(combo, combo._active || 0); }
        else { comboClose(combo, true); }
        return true;
      case "Escape":
        if (!open) { return false; }               // closed: Esc cancels the edit
        e.preventDefault();
        comboClose(combo, true);
        return true;
      case "Tab":
        if (open) { comboClose(combo, true); }
        return false;
    }
    return false;
  }

  document.addEventListener("input", function (e) {
    var t = e.target;
    if (t.closest && t.closest(".dg-edit")) { clearFieldError(t.closest(".dg-edit")); }
    var input = t.closest && t.closest(".dg-combo-input");
    if (!input) { return; }
    delete input.dataset.dgValue;          // typing invalidates the selection
    comboOpen(input.closest(".dg-combo"), input.value);
  });

  document.addEventListener("focusin", function (e) {
    var input = e.target.closest && e.target.closest(".dg-combo-input");
    if (input && !comboIsOpen(input.closest(".dg-combo"))) { comboOpen(input.closest(".dg-combo"), ""); }
  });

  document.addEventListener("focusout", function (e) {
    var combo = e.target.closest && e.target.closest(".dg-combo");
    if (!combo) { return; }
    window.setTimeout(function () {
      if (!combo.contains(document.activeElement)) { comboClose(combo, true); }
    }, 0);
  });

  // keep focus in the box while the list is used with the mouse
  document.addEventListener("mousedown", function (e) {
    var li = e.target.closest && e.target.closest(".dg-combo-list li[data-i]");
    if (li) {
      e.preventDefault();
      comboPick(li.closest(".dg-combo"), parseInt(li.dataset.i, 10));
      return;
    }
    if (e.target.closest && (e.target.closest(".dg-combo-list") || e.target.closest(".dg-combo-btn"))) {
      e.preventDefault();
    }
  });

  // load more as the list scrolls; keep open lists next to their box
  document.addEventListener("scroll", function (e) {
    var l = e.target && e.target.classList && e.target.classList.contains("dg-combo-list") ? e.target : null;
    if (l) {
      var combo = l.closest(".dg-combo");
      if (l.scrollTop + l.clientHeight >= l.scrollHeight - 24 &&
          combo._matches && combo._shown < combo._matches.length) {
        var st = l.scrollTop;
        combo._shown += COMBO_PAGE;
        comboPaint(combo);
        l.scrollTop = st;
      }
      return;
    }
    document.querySelectorAll(".dg-combo-list.is-open").forEach(function (x) {
      comboPosition(x.closest(".dg-combo"));
    });
  }, true);

  window.addEventListener("resize", function () {
    document.querySelectorAll(".dg-combo-list.is-open").forEach(function (x) {
      comboPosition(x.closest(".dg-combo"));
    });
  });

  // ---------------- field values ----------------
  function fieldValue(field) {
    if (field.classList.contains("dg-combo-input")) {
      return field.dataset.dgValue;
    }
    if (field.classList.contains("dg-switch-input")) {
      return field.checked ? field.dataset.dgOn : field.dataset.dgOff;
    }
    return field.value;
  }

  function setFieldValue(field, v) {
    v = v == null ? "" : String(v);
    if (field.classList.contains("dg-combo-input")) {
      field.dataset.dgValue = v;
      field.value = displayFor(field.closest(".dg-combo"), v) || v;
    } else if (field.classList.contains("dg-switch-input")) {
      field.checked = v === field.dataset.dgOn;
    } else {
      field.value = v;
    }
  }

  // ---------------- validation (same rules as smart1rowview_pkg.check_value) ----------------
  function parseRules(text) {
    var r = {}, s = text || "", i;
    i = s.toLowerCase().indexOf("message=");
    if (i > -1) { r.message = s.slice(i + 8).trim(); s = s.slice(0, i); }
    i = s.toLowerCase().indexOf("pattern=");
    if (i > -1) { r.pattern = s.slice(i + 8).trim().replace(/[;\s]+$/, ""); s = s.slice(0, i); }
    s.split(";").forEach(function (tok) {
      tok = tok.trim();
      if (!tok) { return; }
      var k = tok.split("=")[0].trim().toLowerCase(), a = tok.indexOf("=") > -1 ? tok.slice(tok.indexOf("=") + 1).trim() : true;
      r[k] = a;
    });
    return r;
  }

  function validateField(field) {
    var rules = field.dataset.dgRules;
    if (!rules) { return null; }
    var r = parseRules(rules), v = fieldValue(field), label = field.dataset.dgLabel || "Value";
    v = v == null ? "" : String(v);
    var empty = v.trim() === "", n = Number(v), err = null;
    if (r.required && empty) { err = label + " is required."; }
    else if (!empty) {
      if ((r.min !== undefined || r.max !== undefined) && isNaN(n)) { err = label + " must be a number."; }
      else if (r.min !== undefined && n < Number(r.min)) { err = label + " must be at least " + r.min + "."; }
      else if (r.max !== undefined && n > Number(r.max)) { err = label + " must be at most " + r.max + "."; }
      else if (r.minlength !== undefined && v.length < Number(r.minlength)) { err = label + " must be at least " + r.minlength + " characters."; }
      else if (r.maxlength !== undefined && v.length > Number(r.maxlength)) { err = label + " must be at most " + r.maxlength + " characters."; }
      else if (r.pattern) {
        try { if (!new RegExp(r.pattern).test(v)) { err = label + " is not in the expected format."; } }
        catch (x) { /* a pattern only Oracle understands: the server checks it */ }
      }
    }
    return err ? (r.message || err) : null;
  }

  function showFieldError(field, msg) {
    var item = field.closest(".dg-item"), val = item && item.querySelector(".dg-val");
    if (!val) { return; }
    clearFieldError(field);
    var d = document.createElement("div");
    d.className = "dg-fielderr";
    d.setAttribute("role", "alert");
    d.textContent = msg;
    val.appendChild(d);
    val.classList.add("has-err");
    field.classList.add("is-invalid");
    field.setAttribute("aria-invalid", "true");
  }

  function clearFieldError(field) {
    var item = field.closest(".dg-item"), val = item && item.querySelector(".dg-val");
    if (!val) { return; }
    val.querySelectorAll(".dg-fielderr").forEach(function (d) { d.remove(); });
    val.classList.remove("has-err");
    field.classList.remove("is-invalid");
    field.removeAttribute("aria-invalid");
  }

  // ---------------- saving ----------------
  // A readable message for whatever a failed handler call rejects with: an
  // Error, a jqXHR from apex.server (offline, timeout, HTTP error) or text.
  function errText(e) {
    if (!e) { return "Could not save."; }
    if (typeof e === "string") { return e; }
    if (e.message) { return e.message; }
    if (e.responseJSON && e.responseJSON.message) { return e.responseJSON.message; }
    if (e.status === 0 || e.readyState === 0) {
      return "Could not reach the server. Check your connection and try again.";
    }
    if (e.status) { return "Could not save (" + e.status + (e.statusText ? " " + e.statusText : "") + ")."; }
    return "Could not save.";
  }

  // One call of the developer's Edit Handler. ctx.version carries the record
  // version (region Version Column) for a conflict check; a response with
  // { version } updates it, { status: "CONFLICT" } means someone else saved first.
  function callSave(field) {
    var fn = compileCall(field.getAttribute("data-dg-call"));
    if (!fn) {
      return Promise.resolve({ status: "ERROR", message: "Edit handler call could not be compiled." });
    }
    var g = field.closest(".dg");
    var ctx = {
      column:   field.getAttribute("data-dg-col"),
      oldValue: field.getAttribute("data-dg-old"),
      token:    field.getAttribute("data-dg-token"),
      version:  g ? g.dataset.dgVersion : undefined
    };
    var res;
    try { res = fn(fieldValue(field), ctx); }
    catch (e) { return Promise.resolve({ status: "ERROR", message: errText(e) }); }
    return Promise.resolve(res).then(function (r) {
      r = r || {};
      if (r.version !== undefined && r.version !== null && g) { g.dataset.dgVersion = r.version; }
      return { status: (r.status || "SUCCESS").toUpperCase(), message: r.message };
    }, function (e) {
      return { status: "ERROR", message: errText(e) };
    });
  }

  function editableItems(g) {
    return Array.prototype.filter.call(g.querySelectorAll(".dg-item[data-dg-name]"), function (it) {
      return it.querySelector(".dg-editwrap") && !it.classList.contains("dg-hidden");
    });
  }

  function handleEdit(field, wrap, item, opts) {
    opts = opts || {};
    var root = item.closest(".dg-root"), g = item.closest(".dg");
    // one save at a time: a second Enter / click while this one is on its
    // way would send the old version and come back as a false conflict
    if (item._dgSaving) { return; }

    if (field.classList.contains("dg-combo-input")) {
      comboClose(field.closest(".dg-combo"), true);
      if (field.dataset.dgValue === undefined) {
        showFieldError(field, "Pick a value from the list.");
        return;
      }
    }
    var err = validateField(field);
    if (err) { showFieldError(field, err); field.focus(); return; }

    // nothing changed: just close (and move on), no round trip
    if (field._initial !== undefined && String(fieldValue(field)) === String(field._initial)) {
      closeEditor(item);
      if (opts.next) { openByName(g, opts.next); }
      return;
    }

    var saveBtn = wrap ? wrap.querySelector(".dg-save") : null;
    var cancelBtn = wrap ? wrap.querySelector(".dg-cancel") : null;
    var saveIcon = saveBtn ? saveBtn.querySelector("span") : null;
    var savedIconClass = saveIcon ? saveIcon.className : null;
    function busy(on) {
      item._dgSaving = on;
      field.classList.toggle("is-busy", on);
      if (saveBtn) { saveBtn.disabled = on; saveBtn.classList.toggle("is-spinning", on); }
      if (cancelBtn) { cancelBtn.disabled = on; }
      if (saveIcon) { saveIcon.className = on ? "fa fa-spinner fa-anim-spin" : savedIconClass; }
    }

    busy(true);
    callSave(field).then(function (r) {
      busy(false);
      markState(field, r.status);
      if (r.status === "CONFLICT") {
        notify("ERROR", r.message || "Someone else changed this record. The latest version is shown.");
        if (root && root.dataset.dgAjax) { refreshRoot(root); }
        return;
      }
      if (r.status === "ERROR") {
        showFieldError(field, r.message || "Could not save.");
        return;
      }
      if (r.status === "WARNING") { notify("WARNING", r.message); }
      var change = { col: field.dataset.dgCol, label: field.dataset.dgLabel, oldValue: field._initial };
      field.setAttribute("data-dg-old", fieldValue(field));
      closeEditor(item);
      if (root && root.dataset.dgAjax) {
        // re-render from the database so formatting, badges and dependent
        // fields show what was saved; then offer Undo
        refreshRoot(root, {
          open: opts.next,
          after: function () {
            showToast(root, r.message || ((change.label || "Field") + " saved."), [change]);
          }
        });
      } else {
        notify("SUCCESS", r.message);
      }
    });
  }

  // ---------------- per-field editor ----------------
  function openEditor(item, noFocus) {
    var wrap = item.querySelector(".dg-editwrap");
    if (!wrap) { return; }
    var g = item.closest(".dg");
    if (item.classList.contains("dg-sec-hidden") && g) {   // open its section first
      var sec = g.querySelector('.dg-sec[data-dg-sec="' + cssq(item.dataset.dgSec) + '"]');
      if (sec) { setSection(g, sec, false, false); relayout(g); reanchor(g); }
    }
    item.classList.add("is-editing");
    item.querySelectorAll(".dg-view, .dg-editbtn").forEach(function (n) {
      n.style.display = "none";
    });
    wrap.hidden = false;
    var field = wrap.querySelector(".dg-edit");
    if (!field) { return; }
    if (field.classList.contains("dg-combo-input")) {
      // show the display value of the current return value, like Popup LOV
      var combo = field.closest(".dg-combo"), v = field.dataset.dgValue || "";
      field.dataset.dgLast = v;
      field.value = displayFor(combo, v) || field.value;
    }
    field._restore = { value: field.value, checked: field.checked, dgValue: field.dataset.dgValue };
    field._initial = fieldValue(field);
    if (!noFocus) {
      field.focus();
      if (field.select && field.type !== "checkbox" && field.tagName !== "SELECT") { field.select(); }
    }
  }

  function openByName(g, name) {
    var it = g && g.querySelector('.dg-item[data-dg-name="' + cssq(name) + '"]');
    if (it && it.querySelector(".dg-editwrap")) { openEditor(it); }
  }

  function closeEditor(item) {
    var wrap = item.querySelector(".dg-editwrap");
    if (!wrap) { return; }
    item.querySelectorAll(".dg-combo").forEach(function (c) { comboClose(c); });
    var f = item.querySelector(".dg-edit");
    if (f) { clearFieldError(f); }
    item.classList.remove("is-editing");
    wrap.hidden = true;
    item.querySelectorAll(".dg-view, .dg-editbtn").forEach(function (n) {
      n.style.display = "";
    });
  }

  function cancelEdit(item) {
    var field = item.querySelector(".dg-edit");
    if (field && field._restore) {
      field.value = field._restore.value;
      field.checked = field._restore.checked;
      if (field._restore.dgValue === undefined) { delete field.dataset.dgValue; }
      else { field.dataset.dgValue = field._restore.dgValue; }
      if (field.classList.contains("dg-switch-input")) {
        var txt = item.querySelector(".dg-switch-text");
        txt.textContent = field.checked ? txt.dataset.on : txt.dataset.off;
      }
    }
    closeEditor(item);
  }

  // ---------------- whole-card edit ----------------
  // One Edit opens every editable field; a bar inside the card saves them
  // together (Ctrl+Enter) or cancels (Esc).
  function editAll(g) {
    if (!g || g.classList.contains("is-editall")) { return; }
    var items = editableItems(g);
    if (!items.length) { return; }
    items.forEach(function (it) { if (it.classList.contains("is-editing")) { cancelEdit(it); } });
    g.querySelectorAll(".dg-sec.is-collapsed").forEach(function (sec) {
      if (items.some(function (it) { return it.dataset.dgSec === sec.dataset.dgSec; })) {
        setSection(g, sec, false, false);
      }
    });
    g.classList.add("is-editall");
    items.forEach(function (it) { openEditor(it, true); });
    var bar = document.createElement("div");
    bar.className = "dg-editbar";
    bar.style.gridColumn = "1 / -1";
    bar.innerHTML =
      "<span class='dg-editbar-msg'><span class='fa fa-edit' aria-hidden='true'></span> Editing " +
      items.length + " field" + (items.length === 1 ? "" : "s") +
      " <span class='dg-editbar-hint'><kbd>Ctrl</kbd>+<kbd>Enter</kbd> saves &middot; <kbd>Esc</kbd> cancels</span></span>" +
      "<button type='button' class='dg-btn dg-btn-ghost dg-allcancel'>Cancel</button>" +
      "<button type='button' class='dg-btn dg-btn-primary dg-allsave'><span class='fa fa-check' aria-hidden='true'></span> Save</button>";
    g.appendChild(bar);
    relayout(g);
    reanchor(g);
    var first = items[0].querySelector(".dg-edit");
    if (first) { first.focus(); }
  }

  function exitEditAll(g, saved) {
    editableItems(g).forEach(function (it) {
      if (it.classList.contains("is-editing")) { if (saved) { closeEditor(it); } else { cancelEdit(it); } }
    });
    g.querySelectorAll(".dg-editbar").forEach(function (b) { b.remove(); });
    g.classList.remove("is-editall");
    relayout(g);
    reanchor(g);
  }

  function saveAll(g) {
    if (g._dgSaving) { return; }                  // Ctrl+Enter again while saving
    var root = g.closest(".dg-root"), bar = g.querySelector(".dg-editbar");
    var fields = editableItems(g).filter(function (it) { return it.classList.contains("is-editing"); })
                                  .map(function (it) { return it.querySelector(".dg-edit"); });
    var bad = null;
    fields.forEach(function (f) {
      if (f.classList.contains("dg-combo-input")) { comboClose(f.closest(".dg-combo"), true); }
      clearFieldError(f);
      var e = validateField(f);
      if (e) { showFieldError(f, e); bad = bad || f; }
    });
    if (bad) { bad.focus(); return; }

    var changed = fields.filter(function (f) { return String(fieldValue(f)) !== String(f._initial); });
    if (!changed.length) { exitEditAll(g, true); return; }

    var buttons = bar ? bar.querySelectorAll("button") : [];
    Array.prototype.forEach.call(buttons, function (b) { b.disabled = true; });
    g._dgSaving = true;
    var done = [], stop = null, conflict = false;
    var chain = Promise.resolve();
    changed.forEach(function (f) {
      chain = chain.then(function () {
        if (stop) { return; }
        f.classList.add("is-busy");
        return callSave(f).then(function (r) {
          f.classList.remove("is-busy");
          if (r.status === "CONFLICT") { conflict = true; stop = r; return; }
          if (r.status === "ERROR") { showFieldError(f, r.message || "Could not save."); stop = r; return; }
          done.push({ col: f.dataset.dgCol, label: f.dataset.dgLabel, oldValue: f._initial });
          f._initial = fieldValue(f);
          f.setAttribute("data-dg-old", f._initial);
        });
      });
    });
    chain.then(function () {
      g._dgSaving = false;
      Array.prototype.forEach.call(buttons, function (b) { b.disabled = false; });
      if (conflict) {
        notify("ERROR", stop.message || "Someone else changed this record. The latest version is shown.");
        refreshRoot(root);
        return;
      }
      if (stop) {
        var msg = bar && bar.querySelector(".dg-editbar-msg");
        if (msg && done.length) { msg.textContent = done.length + " saved; fix the highlighted field and save again."; }
        return;
      }
      exitEditAll(g, true);
      refreshRoot(root, {
        after: function () {
          showToast(root, done.length === 1 ? (done[0].label + " saved.") : (done.length + " fields saved."), done);
        }
      });
    });
  }

  // ---------------- undo ----------------
  function showToast(root, msg, changes) {
    root.querySelectorAll(".dg-toast").forEach(function (t) { t.remove(); });
    var t = document.createElement("div");
    t.className = "dg-toast";
    t.setAttribute("role", "status");
    t.innerHTML = "<span class='fa fa-check-circle' aria-hidden='true'></span>" +
                  "<span class='dg-toast-msg'>" + esc(msg) + "</span>" +
                  (changes && changes.length ? "<button type='button' class='dg-undo'>Undo</button>" : "") +
                  "<button type='button' class='dg-toast-x' aria-label='Dismiss'>&times;</button>";
    t._changes = changes;
    root.appendChild(t);
    t._timer = window.setTimeout(function () { dismissToast(t); }, 8000);
  }

  function dismissToast(t) {
    window.clearTimeout(t._timer);
    t.classList.add("is-leaving");
    window.setTimeout(function () { t.remove(); }, 250);
  }

  // re-saves the old values (newest first) through the same handler
  function undoChanges(root, changes) {
    var undone = 0, failed = null, chain = Promise.resolve();
    changes.slice().reverse().forEach(function (ch) {
      chain = chain.then(function () {
        if (failed) { return; }
        var field = root.querySelector('.dg-edit[data-dg-col="' + cssq(ch.col) + '"]');
        if (!field) { failed = (ch.label || ch.col) + " can no longer be changed."; return; }
        setFieldValue(field, ch.oldValue);
        return callSave(field).then(function (r) {
          if (r.status === "SUCCESS" || r.status === "WARNING") { undone++; }
          else { failed = r.message || "Undo failed."; }
        });
      });
    });
    chain.then(function () {
      if (failed) { notify("ERROR", failed); }
      refreshRoot(root, { after: function () { if (undone && !failed) { showToast(root, "Undone.", null); } } });
    });
  }

  // ---------------- dependent lists ----------------
  // A list whose query uses another editable field (#BU_ID#) reloads when
  // that field changes, with the new, unsaved value.
  function reloadChildren(field) {
    var g = field.closest(".dg"), root = field.closest(".dg-root"), col = field.dataset.dgCol;
    if (!g || !root || !root.dataset.dgAjax || !col) { return; }
    g.querySelectorAll(".dg-edit[data-dg-parents]").forEach(function (child) {
      if (("," + child.dataset.dgParents + ",").indexOf("," + col + ",") < 0) { return; }
      var names = child.dataset.dgParents.split(",");
      var vals = names.map(function (n) {
        var p = g.querySelector('.dg-edit[data-dg-col="' + cssq(n) + '"]');
        if (!p) { return ""; }
        var open = p.closest(".dg-item").classList.contains("is-editing");
        var v = open ? fieldValue(p) : p.getAttribute("data-dg-old");
        return v == null ? "" : String(v);
      });
      child.classList.add("is-busy");
      apex.server.plugin(root.dataset.dgAjax,
        { x01: "LOV", x02: child.dataset.dgCol, x03: fieldValue(child) || "",
          f01: names, f02: vals, pageItems: root.dataset.dgItems || undefined },
        { dataType: "html" })
        .done(function (html) { applyOptions(child, html); })
        .always(function () { child.classList.remove("is-busy"); });
    });
  }

  function applyOptions(child, html) {
    var v;
    if (child.tagName === "SELECT") {
      v = child.value;
      child.innerHTML = html;
      child.value = Array.prototype.some.call(child.options, function (o) { return o.value === v; }) ? v : "";
    } else if (child.classList.contains("dg-combo-input")) {
      var combo = child.closest(".dg-combo");
      parts(combo).src.innerHTML = html;
      combo._opts = null;
      v = child.dataset.dgValue || "";
      if (v && !displayFor(combo, v)) {      // no longer a valid choice
        child.value = "";
        child.dataset.dgValue = "";
        child.dataset.dgLast = "";
      }
    }
    child.dispatchEvent(new Event("change", { bubbles: true }));   // cascade further
  }

  document.addEventListener("change", function (e) {
    var sw = e.target.closest && e.target.closest(".dg-switch-input");
    if (sw) {
      var txt = sw.closest(".dg-switch").querySelector(".dg-switch-text");
      txt.textContent = sw.checked ? txt.dataset.on : txt.dataset.off;
    }
    var f = e.target.closest && e.target.closest(".dg-edit");
    if (f) { reloadChildren(f); }
  });

  // ---------------- keyboard ----------------
  // Enter saves (Ctrl+Enter in a text area), Esc cancels, Tab / Shift+Tab
  // save and move to the next / previous editable field.
  document.addEventListener("keydown", function (e) {
    if (e.key === "Escape" && closePopovers()) { return; }
    var field = e.target.closest && e.target.closest(".dg-edit");
    if (!field) { return; }
    if (field.classList.contains("dg-combo-input") && comboKey(e, field)) { return; }
    var item = field.closest(".dg-item"), g = field.closest(".dg");
    var all = g && g.classList.contains("is-editall");

    if (all) {
      if (e.key === "Enter" && (e.ctrlKey || e.metaKey)) { e.preventDefault(); saveAll(g); }
      else if (e.key === "Escape") { e.preventDefault(); exitEditAll(g, false); }
      return;                                      // Tab moves natively between open fields
    }
    if (e.key === "Enter" && (field.tagName !== "TEXTAREA" || e.ctrlKey || e.metaKey)) {
      e.preventDefault();
      handleEdit(field, field.closest(".dg-editwrap"), item);
    } else if (e.key === "Escape") {
      e.preventDefault();
      cancelEdit(item);
    } else if (e.key === "Tab") {
      var items = editableItems(g), i = items.indexOf(item);
      var next = items[i + (e.shiftKey ? -1 : 1)];
      e.preventDefault();
      handleEdit(field, field.closest(".dg-editwrap"), item, { next: next ? next.dataset.dgName : null });
    }
  });

  // ---------------- details popover ----------------
  function closePopovers() {
    var any = false;
    document.querySelectorAll(".dg-pop").forEach(function (p) {
      if (p._btn) { p._btn.setAttribute("aria-expanded", "false"); }
      p.remove();
      any = true;
    });
    return any;
  }

  function openPopover(btn) {
    var root = btn.closest(".dg-root");
    var wasOpen = btn.getAttribute("aria-expanded") === "true";
    closePopovers();
    if (wasOpen || !root || !root.dataset.dgAjax) { return; }
    var pop = document.createElement("div");
    pop.className = "dg-pop";
    pop.setAttribute("role", "dialog");
    pop.innerHTML = "<div class='dg-pop-loading'><span class='fa fa-spinner fa-anim-spin' aria-hidden='true'></span> Loading&hellip;</div>";
    pop._btn = btn;
    root.appendChild(pop);
    btn.setAttribute("aria-expanded", "true");
    positionPanel(pop, btn, 320);
    apex.server.plugin(root.dataset.dgAjax,
      { x01: "POPOVER", x02: btn.dataset.dgPop, pageItems: root.dataset.dgItems || undefined },
      { dataType: "html" })
      .done(function (html) { pop.innerHTML = html; positionPanel(pop, btn, 320); })
      .fail(function () { pop.innerHTML = "<div class='dg-pop-empty'>Details could not be loaded.</div>"; });
  }

  // ---------------- sections (expand / collapse) ----------------
  // A section header is a slim row inside the card; the whole row toggles.
  // Each viewer's choice is remembered in the browser.
  function secKey(g, name) {
    var root = g.closest(".dg-root");
    return "dg-sec:" + window.location.pathname + ":" +
           (root ? root.dataset.dgRegion : "") + ":" + name;
  }

  function setSection(g, sec, collapsed, persist) {
    var name = sec.dataset.dgSec;
    sec.classList.toggle("is-collapsed", collapsed);
    var b = sec.querySelector(".dg-sec-btn");
    if (b) { b.setAttribute("aria-expanded", String(!collapsed)); }
    g.querySelectorAll(".dg-item[data-dg-sec]").forEach(function (it) {
      if (it.dataset.dgSec === name) { it.classList.toggle("dg-sec-hidden", collapsed); }
    });
    if (persist) { store(secKey(g, name), collapsed ? "1" : "0"); }
  }

  function initSections(g) {
    g.querySelectorAll(".dg-sec").forEach(function (sec) {
      var s = store(secKey(g, sec.dataset.dgSec));
      if (s === "1" || s === "0") { setSection(g, sec, s === "1", false); }
    });
  }

  // fields without a section first, then each section with all its fields
  // under its header (same order as the server renders)
  function regroup(g) {
    var heads = {};
    g.querySelectorAll(".dg-sec").forEach(function (h) { heads[h.dataset.dgSec] = h; });
    var items = Array.prototype.slice.call(g.querySelectorAll(".dg-item[data-dg-name]"));
    var done = {}, out = items.filter(function (it) { return !it.dataset.dgSec; });
    items.forEach(function (it) {
      var s = it.dataset.dgSec;
      if (!s || done[s]) { return; }
      done[s] = true;
      if (heads[s]) { out.push(heads[s]); }
      items.forEach(function (x) { if (x.dataset.dgSec === s) { out.push(x); } });
    });
    out.forEach(function (n) { g.appendChild(n); });
    g.querySelectorAll(":scope > .dg-editbar").forEach(function (b) { g.appendChild(b); });
  }

  // ---------------- layout ----------------
  function gridOf(btn) {
    var host = btn.closest(".dg-cfghost");
    if (host) { return host.querySelector(".dg"); }
    var bar = btn.closest(".dg-toolbar");
    return bar ? bar.nextElementSibling : null;
  }

  // Wrap each card with its actions (Edit all, Configure) so they can live
  // inside it.
  function placeFloatingButtons(scope) {
    (scope || document).querySelectorAll(".dg-toolbar").forEach(function (bar) {
      var g = bar.nextElementSibling;
      if (!g || !g.classList.contains("dg") || bar.dataset.dgPlaced) { return; }
      var host = document.createElement("div");
      host.className = "dg-cfghost";
      g.parentNode.insertBefore(host, g);
      host.appendChild(g);
      bar.querySelectorAll(".dg-cardact").forEach(function (b) { host.appendChild(b); });
      bar.dataset.dgPlaced = "1";
      anchorActions(g);
    });
  }

  // The card actions live in the right-hand slot of the last visible row: the
  // last value cell, or a collapsed section's header when that is the last row.
  function anchorActions(g) {
    var host = g.closest(".dg-cfghost");
    if (!host) { return; }
    var acts = host.querySelectorAll(".dg-cardact");
    if (!acts.length) { return; }
    var rows = g.querySelectorAll(
      ".dg-item[data-dg-name]:not(.dg-hidden):not(.dg-sec-hidden) > .dg-val," +
      " .dg-sec:not(.dg-sec-empty)");
    var target = rows[rows.length - 1];
    if (!target) { return; }
    var end = null;
    for (var i = 0; i < target.children.length; i++) {
      if (target.children[i].classList.contains("dg-end")) { end = target.children[i]; }
    }
    if (!end) {
      end = document.createElement("span");
      end.className = "dg-end";
      target.appendChild(end);
    }
    Array.prototype.forEach.call(acts, function (b) { end.appendChild(b); });
  }

  function reanchor(g) { if (g) { anchorActions(g); } }

  // Mirrors the PL/SQL slot algorithm; also handles section headers (a full
  // row), collapsed sections, zebra rows and the edit bar.
  function relayout(g) {
    if (!g) { return; }
    var pairs = parseInt(g.dataset.dgPairs || "2", 10);
    var slot = 0, emitted = 0;

    g.querySelectorAll(".dg-filler").forEach(function (f) { f.remove(); });

    // header counts follow what the user has chosen to show
    g.querySelectorAll(".dg-sec").forEach(function (sec) {
      var n = 0;
      g.querySelectorAll(".dg-item[data-dg-sec]").forEach(function (it) {
        if (it.dataset.dgSec === sec.dataset.dgSec && !it.classList.contains("dg-hidden")) { n++; }
      });
      var c = sec.querySelector(".dg-sec-count");
      if (c) { c.textContent = n; }
      sec.classList.toggle("dg-sec-empty", n === 0);
    });

    function fillTo(target, before) {
      while (target > emitted) {
        var f = document.createElement("div");
        f.className = "dg-item dg-filler" +
                      (((emitted + 1) % pairs === 0) ? " dg-edge" : "") +
                      ((Math.floor(emitted / pairs) % 2) ? " dg-alt" : "");
        f.style.gridColumn = String((emitted % pairs) + 1);
        g.insertBefore(f, before);
        emitted += 1;
      }
    }

    var nodes = Array.prototype.filter.call(g.children, function (n) {
      if (n.classList.contains("dg-sec")) { return !n.classList.contains("dg-sec-empty"); }
      return n.matches(".dg-item[data-dg-name]") &&
             !n.classList.contains("dg-hidden") && !n.classList.contains("dg-sec-hidden");
    });

    nodes.forEach(function (it) {
      if (it.classList.contains("dg-sec")) {
        if (slot % pairs) { slot += pairs - (slot % pairs); }
        fillTo(slot, it);
        it.style.gridColumn = "1 / -1";
        slot += pairs;
        emitted = slot;
        return;
      }
      var span = Math.min(parseInt(it.dataset.dgSpan || "1", 10), pairs);
      var forced = parseInt(it.dataset.dgCol || "0", 10);
      if (forced && forced <= pairs) {
        if ((slot % pairs) + 1 > forced) { slot += pairs - (slot % pairs); }
        slot += forced - 1 - (slot % pairs);
      }
      if ((slot % pairs) + span > pairs) { slot += pairs - (slot % pairs); }
      fillTo(slot, it);                       // fill any hole a placement opened
      it.style.gridColumn = String((slot % pairs) + 1) + (span > 1 ? " / span " + span : "");
      it.classList.toggle("dg-alt", Math.floor(slot / pairs) % 2 === 1);
      slot += span;
      emitted += span;
      it.classList.toggle("dg-edge", (slot % pairs) === 0);
    });

    // straight edge on the final row (before the edit bar, if any)
    if (emitted % pairs) {
      fillTo(emitted + pairs - (emitted % pairs), g.querySelector(":scope > .dg-editbar"));
    }
  }

  function currentPrefs(g) {
    var hidden = [], order = [];
    g.querySelectorAll(".dg-item[data-dg-name]").forEach(function (it) {
      order.push(it.dataset.dgName);
      if (it.classList.contains("dg-hidden")) { hidden.push(it.dataset.dgName); }
    });
    return { hidden: hidden.join(","), order: order.join(",") };
  }

  function callProc(btn, action, extra) {
    return apex.server.process(btn.dataset.dgProc, Object.assign({
      x01: action, x02: btn.dataset.dgKey
    }, extra || {}), { dataType: "json" });
  }

  function panelHost(btn) {
    return btn.closest(".dg-cfghost") || btn.closest(".dg-toolbar") || document.body;
  }

  function buildPanel(btn) {
    var g = gridOf(btn);
    var panel = document.createElement("div");
    panel.className = "dg-cfgpanel";
    panel.innerHTML = "<div class='dg-cfghead'>Configure layout</div>" +
                      "<ul class='dg-cfglist'></ul>" +
                      "<div class='dg-cfgfoot'>" +
                      "<button type='button' class='dg-btn dg-btn-ghost dg-cfgreset'>Reset</button>" +
                      "<button type='button' class='dg-btn dg-btn-primary dg-cfgsave'>Save</button>" +
                      "</div>";
    var list = panel.querySelector(".dg-cfglist");

    g.querySelectorAll(".dg-item[data-dg-name]").forEach(function (it) {
      var li = document.createElement("li");
      li.draggable = true;
      li.dataset.dgName = it.dataset.dgName;
      var optional = it.classList.contains("dg-optional");
      var label = esc(it.dataset.dgLabel);
      li.innerHTML =
        "<span class='dg-drag' aria-hidden='true'>&#9776;</span>" +
        (optional
          ? "<label><input type='checkbox'" +
            (it.classList.contains("dg-hidden") ? "" : " checked") +
            "> " + label + "</label>"
          : "<label class='dg-fixed'>" + label + "</label>") +
        (it.dataset.dgSec ? "<span class='dg-cfgsec'>" + esc(it.dataset.dgSec) + "</span>" : "");
      list.appendChild(li);
    });

    var dragged = null;
    list.addEventListener("dragstart", function (e) {
      dragged = e.target.closest("li"); dragged.classList.add("is-dragging");
    });
    list.addEventListener("dragend", function () {
      if (dragged) { dragged.classList.remove("is-dragging"); dragged = null; }
    });
    list.addEventListener("dragover", function (e) {
      e.preventDefault();
      var over = e.target.closest("li");
      if (!over || over === dragged) { return; }
      var r = over.getBoundingClientRect();
      list.insertBefore(dragged,
        (e.clientY - r.top) / r.height > 0.5 ? over.nextSibling : over);
    });

    panelHost(btn).appendChild(panel);
    positionPanel(panel, btn, 300);
    return panel;
  }

  // Anchor to the button in viewport space so no ancestor overflow can clip it.
  function positionPanel(panel, btn, width) {
    var w = width || 300;
    var r = btn.getBoundingClientRect();
    var margin = 8;
    panel.style.position = "fixed";
    panel.style.right = "auto";
    panel.style.bottom = "auto";
    panel.style.width = Math.min(w, window.innerWidth - 2 * margin) + "px";
    panel.style.left = Math.max(margin,
        Math.min(r.right - w, window.innerWidth - w - margin)) + "px";

    var above = r.top - margin;
    var below = window.innerHeight - r.bottom - margin;

    if (below >= 260 || below >= above) {
      panel.style.top = (r.bottom + 6) + "px";
      panel.style.maxHeight = (below - 12) + "px";
    } else {
      panel.style.maxHeight = (above - 12) + "px";
      panel.style.bottom = (window.innerHeight - r.top + 6) + "px";
      panel.style.top = "auto";
    }
  }

  function commitPanel(panel, btn) {
    var g = gridOf(btn);
    panel.querySelectorAll(".dg-cfglist li").forEach(function (li) {
      var it = g.querySelector('.dg-item[data-dg-name="' + cssq(li.dataset.dgName) + '"]');
      if (!it) { return; }
      var cb = li.querySelector("input[type=checkbox]");
      if (cb) { it.classList.toggle("dg-hidden", !cb.checked); }
      g.appendChild(it);
      it.style.gridColumn = "";
    });
    regroup(g);
    relayout(g);
    reanchor(g);
    return currentPrefs(g);
  }

  document.addEventListener("click", function (e) {
    if (!e.target.closest(".dg-combo")) {
      document.querySelectorAll(".dg-combo-list.is-open").forEach(function (l) {
        comboClose(l.closest(".dg-combo"), true);
      });
    }
    if (!e.target.closest(".dg-pop") && !e.target.closest(".dg-popbtn")) { closePopovers(); }

    var comboBtn = e.target.closest(".dg-combo-btn");
    if (comboBtn) {
      e.preventDefault();
      var c = comboBtn.closest(".dg-combo");
      if (comboIsOpen(c)) { comboClose(c, true); } else { comboOpen(c, ""); }
      parts(c).input.focus();
      return;
    }

    var popBtn = e.target.closest(".dg-popbtn");
    if (popBtn) { e.preventDefault(); openPopover(popBtn); return; }

    var undo = e.target.closest(".dg-undo");
    if (undo) {
      e.preventDefault();
      var toast = undo.closest(".dg-toast");
      window.clearTimeout(toast._timer);
      var changes = toast._changes;
      var r0 = toast.closest(".dg-root");
      toast.remove();
      undoChanges(r0, changes);
      return;
    }
    var tx = e.target.closest(".dg-toast-x");
    if (tx) { e.preventDefault(); dismissToast(tx.closest(".dg-toast")); return; }

    var editAllBtn = e.target.closest(".dg-editall");
    if (editAllBtn) {
      e.preventDefault();
      var ga = gridOf(editAllBtn);
      if (ga && ga.classList.contains("is-editall")) { saveAll(ga); } else { editAll(ga); }
      return;
    }
    var allSave = e.target.closest(".dg-allsave");
    if (allSave) { e.preventDefault(); saveAll(allSave.closest(".dg")); return; }
    var allCancel = e.target.closest(".dg-allcancel");
    if (allCancel) { e.preventDefault(); exitEditAll(allCancel.closest(".dg"), false); return; }

    var cfgBtn = e.target.closest(".dg-cfgbtn");
    if (cfgBtn) {
      e.preventDefault();
      e.stopPropagation();
      var open = panelHost(cfgBtn).querySelector(".dg-cfgpanel");
      if (open) { open.remove(); } else { buildPanel(cfgBtn); }
      return;
    }

    var saveCfg = e.target.closest(".dg-cfgsave");
    if (saveCfg) {
      e.preventDefault();
      var panel = saveCfg.closest(".dg-cfgpanel");
      var b = panel.parentNode.querySelector(".dg-cfgbtn");
      var prefs = commitPanel(panel, b);
      callProc(b, "SAVE", { x03: prefs.hidden, x04: prefs.order })
        .then(function () { panel.remove(); })
        .catch(function (err) { notify("ERROR", "Could not save layout: " + err); });
      return;
    }

    var resetCfg = e.target.closest(".dg-cfgreset");
    if (resetCfg) {
      e.preventDefault();
      var p2 = resetCfg.closest(".dg-cfgpanel");
      var b2 = p2.parentNode.querySelector(".dg-cfgbtn");
      callProc(b2, "RESET").then(function () { window.location.reload(); });
      return;
    }

    if (!e.target.closest(".dg-cfgpanel")) {
      document.querySelectorAll(".dg-cfgpanel").forEach(function (p) { p.remove(); });
    }

    var sec = e.target.closest(".dg-sec");
    if (sec) {
      e.preventDefault();
      var g = sec.closest(".dg");
      setSection(g, sec, !sec.classList.contains("is-collapsed"), true);
      relayout(g);
      reanchor(g);
      return;
    }

    var editBtn = e.target.closest(".dg-editbtn");
    if (editBtn) {
      e.preventDefault();
      var gi = editBtn.closest(".dg");
      if (gi && gi.classList.contains("is-editall")) { return; }
      gi.querySelectorAll(".dg-item.is-editing").forEach(cancelEdit);   // one at a time
      openEditor(editBtn.closest(".dg-item"));
      return;
    }

    var saveBtn = e.target.closest(".dg-save");
    if (saveBtn && saveBtn.closest(".dg-item")) {
      e.preventDefault();
      var sItem = saveBtn.closest(".dg-item");
      handleEdit(sItem.querySelector(".dg-edit"),
                 saveBtn.closest(".dg-editwrap"), sItem);
      return;
    }

    var cancelBtn = e.target.closest(".dg-cancel");
    if (cancelBtn && cancelBtn.closest(".dg-item")) {
      e.preventDefault();
      cancelEdit(cancelBtn.closest(".dg-item"));
      return;
    }

    var copyBtn = e.target.closest(".dg-copy");
    if (copyBtn) {
      e.preventDefault();
      var text = copyBtn.getAttribute("data-dg-copy") || "";
      if (navigator.clipboard && navigator.clipboard.writeText) {
        navigator.clipboard.writeText(text).then(function () {
          notify("SUCCESS", "Copied");
        });
      } else {
        var ta = document.createElement("textarea");
        ta.value = text;
        ta.style.position = "fixed";
        ta.style.opacity = "0";
        document.body.appendChild(ta);
        ta.select();
        try { document.execCommand("copy"); notify("SUCCESS", "Copied"); } catch (x) {}
        document.body.removeChild(ta);
      }
      return;
    }

    var icon = e.target.closest(".dg-ico.is-clickable");
    if (icon) {
      e.preventDefault();
      var msg = icon.getAttribute("data-dg-alert");
      if (msg) {
        try { apex.message.alert(msg); } catch (x) { window.alert(msg); }
      }
      return;
    }

    var tip = e.target.closest(".dg-tip.tip-click");
    document.querySelectorAll(".dg-tip.tip-click.is-open").forEach(function (o) {
      if (o !== tip) { o.classList.remove("is-open"); }
    });
    if (tip) { tip.classList.toggle("is-open"); }
  });

  // Saved preferences are applied server side, so nothing is fetched here and
  // the card never reorders after paint.
  function initRoot(scope) {
    scope.querySelectorAll(".dg").forEach(function (g) { initSections(g); relayout(g); });
    placeFloatingButtons(scope);
    scope.querySelectorAll(".dg").forEach(reanchor);
  }

  // ---------------- region refresh ----------------
  // The server re-renders the card through the plug-in's Ajax callback, so a
  // Refresh dynamic action or apex.region(id).refresh() updates it in place.
  function refreshRoot(root, opts) {
    opts = opts || {};
    root.querySelectorAll(".dg-cfgpanel").forEach(function (p) { p.remove(); });
    closePopovers();
    return apex.server.plugin(root.dataset.dgAjax,
      { pageItems: root.dataset.dgItems || undefined },
      { dataType: "html",
        refreshObject: "#" + root.dataset.dgRegion,
        loadingIndicator: root,
        loadingIndicatorPosition: "centered" })
      .done(function (html) {
        root.innerHTML = html;
        initRoot(root);
        if (opts.open) { openByName(root.querySelector(".dg"), opts.open); }
        if (opts.after) { opts.after(root); }
      })
      .fail(function (xhr, status, err) {
        notify("ERROR", "Could not refresh: " + (err || status));
      });
  }

  function registerRoot(root) {
    var id = root.dataset.dgRegion;
    if (!id || !root.dataset.dgAjax || !window.apex || !apex.region) { return; }
    // a region template without an id still gets a refreshable element
    if (!document.getElementById(id)) { root.id = id; }
    if (apex.region.isRegion && apex.region.isRegion(id)) {
      if (apex.region(id).type === "SmartOneRowView") { return; }
      apex.region.destroy(id);      // replace any generic default interface
    }
    apex.region.create(id, {
      type: "SmartOneRowView",
      refresh: function () { return refreshRoot(root); }
    });
  }

  function init() {
    var roots = document.querySelectorAll(".dg-root");
    if (roots.length) {
      roots.forEach(function (r) { initRoot(r); registerRoot(r); });
    } else {
      initRoot(document);
    }
  }
  if (document.readyState !== "loading") { init(); }
  else { document.addEventListener("DOMContentLoaded", init); }
})();
