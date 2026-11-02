-- HyprConfig Generated Colorscheme
-- Do not edit — this file is overwritten when you apply a theme.

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "hyprconfig"
vim.opt.background = "dark"

-- Terminal colors
vim.g.terminal_color_0  = "#101010"
vim.g.terminal_color_1  = "#ff5733"
vim.g.terminal_color_2  = "#86cd82"
vim.g.terminal_color_3  = "#d9ba73"
vim.g.terminal_color_4  = "#b3b3b3"
vim.g.terminal_color_5  = "#f2a4db"
vim.g.terminal_color_6  = "#5abfb5"
vim.g.terminal_color_7  = "#a5adce"
vim.g.terminal_color_8  = "#666666"
vim.g.terminal_color_9  = "#ff7676"
vim.g.terminal_color_10 = "#a3d6a3"
vim.g.terminal_color_11 = "#ffffff"
vim.g.terminal_color_12 = "#666666"
vim.g.terminal_color_13 = "#f4b8e4"
vim.g.terminal_color_14 = "#fafafa"
vim.g.terminal_color_15 = "#b5bfe2"

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Core UI ──────────────────────────────────────────────────────────
hl("Normal",       { fg = "#ffffff", bg = "#101010" })
hl("NormalFloat",  { fg = "#ffffff", bg = "#101010" })
hl("NormalNC",     { fg = "#ffffff", bg = "#101010" })
hl("Visual",       { bg = "#272727" })
hl("VisualNOS",    { bg = "#272727" })
hl("Cursor",       { fg = "#101010", bg = "#b0b0b0" })
hl("lCursor",      { link = "Cursor" })
hl("CursorIM",     { link = "Cursor" })
hl("CursorLine",   { bg = "#101010" })
hl("CursorColumn", { bg = "#101010" })
hl("ColorColumn",  { bg = "#101010" })
hl("LineNr",       { fg = "#666666" })
hl("CursorLineNr", { fg = "#d9ba73", bold = true })
hl("SignColumn",   { fg = "#666666", bg = "#101010" })
hl("VertSplit",    { fg = "#101010" })
hl("WinSeparator", { fg = "#101010" })
hl("StatusLine",   { fg = "#ffffff", bg = "#101010" })
hl("StatusLineNC", { fg = "#666666", bg = "#101010" })
hl("TabLine",      { fg = "#666666", bg = "#101010" })
hl("TabLineSel",   { fg = "#ffffff", bg = "#101010", bold = true })
hl("TabLineFill",  { bg = "#101010" })
hl("WinBar",       { fg = "#ffffff", bg = "#101010", bold = true })
hl("WinBarNC",     { fg = "#666666", bg = "#101010" })

-- ── Pmenu ────────────────────────────────────────────────────────────
hl("Pmenu",        { fg = "#ffffff", bg = "#101010" })
hl("PmenuSel",     { fg = "#101010", bg = "#d9ba73" })
hl("PmenuSbar",    { bg = "#101010" })
hl("PmenuThumb",   { bg = "#666666" })

-- ── Search & Match ───────────────────────────────────────────────────
hl("Search",       { fg = "#101010", bg = "#d9ba73" })
hl("IncSearch",    { fg = "#101010", bg = "#d9ba73" })
hl("CurSearch",    { fg = "#101010", bg = "#d9ba73", bold = true })
hl("MatchParen",   { fg = "#d9ba73", bold = true, underline = true })
hl("Substitute",   { fg = "#101010", bg = "#ff5733" })

-- ── Folding & Special ────────────────────────────────────────────────
hl("Folded",       { fg = "#666666", bg = "#101010" })
hl("FoldColumn",   { fg = "#666666", bg = "#101010" })
hl("NonText",      { fg = "#666666" })
hl("SpecialKey",   { fg = "#666666" })
hl("Conceal",      { fg = "#666666" })
hl("EndOfBuffer",  { fg = "#101010" })
hl("Whitespace",   { fg = "#666666" })

-- ── Messages & Prompts ───────────────────────────────────────────────
hl("Title",        { fg = "#d9ba73", bold = true })
hl("Directory",    { fg = "#b3b3b3" })
hl("ModeMsg",      { fg = "#ffffff", bold = true })
hl("MoreMsg",      { fg = "#86cd82" })
hl("Question",     { fg = "#86cd82" })
hl("WarningMsg",   { fg = "#d9ba73" })
hl("ErrorMsg",     { fg = "#ff5733", bold = true })
hl("MsgArea",      { fg = "#ffffff" })
hl("WildMenu",     { fg = "#101010", bg = "#d9ba73" })

-- ── Float & Border ───────────────────────────────────────────────────
hl("FloatBorder",  { fg = "#666666", bg = "#101010" })
hl("FloatTitle",   { fg = "#d9ba73", bg = "#101010", bold = true })

-- ── Diff ─────────────────────────────────────────────────────────────
hl("DiffAdd",      { bg = "#86cd82", fg = "#101010" })
hl("DiffChange",   { bg = "#d9ba73", fg = "#101010" })
hl("DiffDelete",   { bg = "#ff5733", fg = "#101010" })
hl("DiffText",     { bg = "#ffffff", fg = "#101010", bold = true })
hl("Added",        { fg = "#86cd82" })
hl("Changed",      { fg = "#d9ba73" })
hl("Removed",      { fg = "#ff5733" })

-- ── Diagnostics ──────────────────────────────────────────────────────
hl("DiagnosticError",          { fg = "#ff5733" })
hl("DiagnosticWarn",           { fg = "#d9ba73" })
hl("DiagnosticInfo",           { fg = "#b3b3b3" })
hl("DiagnosticHint",           { fg = "#5abfb5" })
hl("DiagnosticOk",             { fg = "#86cd82" })
hl("DiagnosticUnderlineError", { undercurl = true, sp = "#ff5733" })
hl("DiagnosticUnderlineWarn",  { undercurl = true, sp = "#d9ba73" })
hl("DiagnosticUnderlineInfo",  { undercurl = true, sp = "#b3b3b3" })
hl("DiagnosticUnderlineHint",  { undercurl = true, sp = "#5abfb5" })
hl("DiagnosticUnderlineOk",    { undercurl = true, sp = "#86cd82" })

-- ── Syntax ───────────────────────────────────────────────────────────
hl("Comment",      { fg = "#666666", italic = true })
hl("Constant",     { fg = "#ff7676" })
hl("String",       { fg = "#86cd82" })
hl("Character",    { fg = "#86cd82" })
hl("Number",       { fg = "#ff7676" })
hl("Boolean",      { fg = "#ff7676" })
hl("Float",        { fg = "#ff7676" })
hl("Identifier",   { fg = "#5abfb5" })
hl("Function",     { fg = "#b3b3b3" })
hl("Statement",    { fg = "#f2a4db" })
hl("Conditional",  { fg = "#f2a4db" })
hl("Repeat",       { fg = "#f2a4db" })
hl("Label",        { fg = "#f2a4db" })
hl("Operator",     { fg = "#5abfb5" })
hl("Keyword",      { fg = "#f2a4db", italic = true })
hl("Exception",    { fg = "#ff5733" })
hl("PreProc",      { fg = "#fafafa" })
hl("Include",      { fg = "#f2a4db" })
hl("Define",       { fg = "#f2a4db" })
hl("Macro",        { fg = "#fafafa" })
hl("PreCondit",    { fg = "#fafafa" })
hl("Type",         { fg = "#d9ba73" })
hl("StorageClass", { fg = "#d9ba73" })
hl("Structure",    { fg = "#d9ba73" })
hl("Typedef",      { fg = "#d9ba73" })
hl("Special",      { fg = "#fafafa" })
hl("SpecialChar",  { fg = "#fafafa" })
hl("Tag",          { fg = "#b3b3b3" })
hl("Delimiter",    { fg = "#ffffff" })
hl("Debug",        { fg = "#ff5733" })
hl("Error",        { fg = "#ff5733", bold = true })
hl("Todo",         { fg = "#d9ba73", bold = true, italic = true })
hl("Underlined",   { fg = "#b3b3b3", underline = true })
hl("Ignore",       { fg = "#666666" })

-- ── Treesitter ───────────────────────────────────────────────────────
hl("@variable",           { fg = "#ffffff" })
hl("@variable.builtin",   { fg = "#ff5733" })
hl("@variable.parameter", { fg = "#ff7676", italic = true })
hl("@variable.member",    { fg = "#fafafa" })
hl("@constant",           { link = "Constant" })
hl("@constant.builtin",   { fg = "#ff7676" })
hl("@module",             { fg = "#5abfb5" })
hl("@string",             { link = "String" })
hl("@string.escape",      { fg = "#fafafa" })
hl("@string.regex",       { fg = "#fafafa" })
hl("@character",          { link = "Character" })
hl("@number",             { link = "Number" })
hl("@boolean",            { link = "Boolean" })
hl("@float",              { link = "Float" })
hl("@function",           { link = "Function" })
hl("@function.builtin",   { fg = "#b3b3b3", italic = true })
hl("@function.call",      { fg = "#b3b3b3" })
hl("@function.method",    { fg = "#b3b3b3" })
hl("@constructor",        { fg = "#d9ba73" })
hl("@keyword",            { link = "Keyword" })
hl("@keyword.function",   { fg = "#f2a4db", italic = true })
hl("@keyword.operator",   { fg = "#f2a4db" })
hl("@keyword.return",     { fg = "#f2a4db" })
hl("@operator",           { link = "Operator" })
hl("@punctuation",        { fg = "#ffffff" })
hl("@punctuation.bracket", { fg = "#ffffff" })
hl("@punctuation.delimiter", { fg = "#ffffff" })
hl("@type",               { link = "Type" })
hl("@type.builtin",       { fg = "#d9ba73", italic = true })
hl("@tag",                { fg = "#ff5733" })
hl("@tag.attribute",      { fg = "#d9ba73" })
hl("@tag.delimiter",      { fg = "#ffffff" })
hl("@comment",            { link = "Comment" })

-- ── Git Signs ────────────────────────────────────────────────────────
hl("GitSignsAdd",    { fg = "#86cd82" })
hl("GitSignsChange", { fg = "#d9ba73" })
hl("GitSignsDelete", { fg = "#ff5733" })

-- ── Telescope ────────────────────────────────────────────────────────
hl("TelescopeNormal",       { fg = "#ffffff", bg = "#101010" })
hl("TelescopeBorder",       { fg = "#666666", bg = "#101010" })
hl("TelescopePromptNormal", { fg = "#ffffff", bg = "#101010" })
hl("TelescopePromptBorder", { fg = "#d9ba73", bg = "#101010" })
hl("TelescopePromptTitle",  { fg = "#101010", bg = "#d9ba73" })
hl("TelescopePreviewTitle", { fg = "#101010", bg = "#86cd82" })
hl("TelescopeResultsTitle", { fg = "#101010", bg = "#b3b3b3" })
hl("TelescopeSelection",    { bg = "#272727" })
hl("TelescopeMatching",     { fg = "#d9ba73", bold = true })

-- ── Indent Blankline ─────────────────────────────────────────────────
hl("IblIndent", { fg = "#101010" })
hl("IblScope",  { fg = "#666666" })

-- ── WhichKey ─────────────────────────────────────────────────────────
hl("WhichKey",          { fg = "#d9ba73" })
hl("WhichKeyGroup",     { fg = "#b3b3b3" })
hl("WhichKeySeparator", { fg = "#666666" })
hl("WhichKeyDesc",      { fg = "#ffffff" })
hl("WhichKeyFloat",     { bg = "#101010" })

-- ── Lazy / Mason ─────────────────────────────────────────────────────
hl("LazyH1",           { fg = "#101010", bg = "#d9ba73", bold = true })
hl("LazyButton",       { fg = "#ffffff", bg = "#101010" })
hl("LazyButtonActive", { fg = "#101010", bg = "#d9ba73" })
hl("LazySpecial",      { fg = "#b3b3b3" })
