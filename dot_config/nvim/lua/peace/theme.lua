local peace = require("peace.colors")

local theme = {}

theme.loadSyntax = function()
    -- LuaFormatter off
    -- Syntax highlight groups

	local syntax = {
		Type =						{ fg = peace.purple }, -- int, long, char, etc.
		StorageClass =				{ fg = peace.cyan }, -- static, register, volatile, etc.
		Structure =					{ fg = peace.puple }, -- struct, union, enum, etc.
		Constant =					{ fg = peace.yellow }, -- any constant
		String =					{ fg = peace.green, bg = peace.none, style= 'italic' }, -- Any string
		Character =					{ fg = peace.orange }, -- any character constant: 'c', '\n'
		Number =					{ fg = peace.yellow }, -- a number constant: 5
		Boolean =					{ fg = peace.orange }, -- a boolean constant: TRUE, false
		Float =						{ fg = peace.orange }, -- a floating point constant: 2.3e10
		Statement =					{ fg = peace.pink }, -- any statement
		Label =						{ fg = peace.purple }, -- case, default, etc.
		Operator =					{ fg = peace.cyan }, -- sizeof", "+", "*", etc.
		Exception =					{ fg = peace.cyan }, -- try, catch, throw
		PreProc =					{ fg = peace.purple }, -- generic Preprocessor
		Include =					{ fg = peace.blue }, -- preprocessor #include
		Define =					{ fg = peace.pink }, -- preprocessor #define
		Macro =						{ fg = peace.cyan }, -- same as Define
		Typedef =					{ fg = peace.red }, -- A typedef
		PreCondit =					{ fg = peace.cyan }, -- preprocessor #if, #else, #endif, etc.
		Special =					{ fg = peace.red }, -- any special symbol
		SpecialChar =				{ fg = peace.pink }, -- special character in a constant
		Tag =						{ fg = peace.red }, -- you can use CTRL-] on this
		Delimiter =					{ fg = peace.cyan }, -- character that needs attention like , or .
		SpecialComment =			{ fg = peace.gray }, -- special things inside a comment
		Debug =						{ fg = peace.red }, -- debugging statements
		Underlined =				{ fg = peace.link, bg = peace.none, style = 'underline' }, -- text that stands out, HTML links
		Ignore =					{ fg = peace.disabled }, -- left blank, hidden
		Error =						{ fg = peace.error, bg = peace.none, style = 'bold,underline' }, -- any erroneous construct
		Todo =						{ fg = peace.yellow, bg = peace.none, style = 'bold,italic' }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        htmlLink = { fg = peace.link, style = "underline" },
        htmlH1 = { fg = peace.cyan, style = "bold" },
        htmlH2 = { fg = peace.red, style = "bold" },
        htmlH3 = { fg = peace.green, style = "bold" },
        htmlH4 = { fg = peace.yellow, style = "bold" },
        htmlH5 = { fg = peace.purple, style = "bold" },
        markdownH1 = { fg = peace.cyan, style = "bold" },
        markdownH2 = { fg = peace.red, style = "bold" },
        markdownH3 = { fg = peace.green, style = "bold" },
        markdownH1Delimiter = { fg = peace.cyan },
        markdownH2Delimiter = { fg = peace.red },
        markdownH3Delimiter = { fg = peace.green },
	}

	-- Options:

	-- Italic comments
	if vim.g.peace_italic_comments == true then
		syntax.Comment =		{fg = peace.comments, bg = peace.none, style = 'italic'} -- italic comments
	else
		syntax.Comment =		{fg = peace.comments} -- normal comments
	end

	-- Italic Keywords
	if vim.g.peace_italic_keywords == true then
		syntax.Conditional =		{fg = peace.purple, bg = peace.none, style = 'italic'} -- italic if, then, else, endif, switch, etc.
		syntax.Keyword =			{fg = peace.purple, bg = peace.none, style = 'italic'} -- italic for, do, while, etc.
		syntax.Repeat =				{fg = peace.purple, bg = peace.none, style = 'italic'} -- italic any other keyword
	else
		syntax.Conditional =		{fg = peace.purple} -- normal if, then, else, endif, switch, etc.
		syntax.Keyword =			{fg = peace.purple} -- normal for, do, while, etc.
		syntax.Repeat =				{fg = peace.purple} -- normal any other keyword
	end

	-- Italic Function names
	if vim.g.peace_italic_functions == true then
		syntax.Function =		{fg = peace.blue, bg = peace.none, style = 'italic'} -- italic funtion names
	else
		syntax.Function =		{fg = peace.blue} -- normal function names
	end

	if vim.g.peace_italic_variables == true then
		syntax.Identifier =		{fg = peace.variable, bg = peace.none, style = 'italic'}; -- any variable name
	else
		syntax.Identifier =		{fg = peace.variable}; -- any variable name
	end

	return syntax

end


theme.loadEditor = function ()
    -- Editor highlight groups

	local editor = {
		NormalFloat =			{ fg = peace.fg, bg = peace.float }, -- normal text and background color for floating windows
		ColorColumn =			{ fg = peace.none, bg = peace.active }, --  used for the columns set with 'colorcolumn'
		Conceal =				{ fg = peace.disabled }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor =				{ fg = peace.cursor, bg = peace.none, style = 'reverse' }, -- the character under the cursor
		CursorIM =				{ fg = peace.cursor, bg = peace.none, style = 'reverse' }, -- like Cursor, but used when in IME mode
		Directory =				{ fg = peace.blue, bg = peace.none }, -- directory names (and other special names in listings)
		DiffAdd =				{ fg = peace.green, bg = peace.none, style = 'reverse' }, -- diff mode: Added line
		DiffChange =			{ fg = peace.blue, bg = peace.none, style = 'reverse' }, --  diff mode: Changed line
		DiffDelete =			{ fg = peace.red, bg = peace.none, style = 'reverse' }, -- diff mode: Deleted line
		DiffText =				{ fg = peace.fg, bg = peace.none, style = 'reverse' }, -- diff mode: Changed text within a changed line
		ErrorMsg =				{ fg = peace.error }, -- error messages
		Folded =				{ fg = peace.disabled, bg = peace.none, style = 'italic' }, -- line used for closed folds
		FoldColumn =			{ fg = peace.blue }, -- 'foldcolumn'
		IncSearch =				{ fg = peace.highlight, bg = peace.white, style = 'reverse' }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		LineNr =				{ fg = peace.accent }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr =			{ fg = peace.blue }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen =			{ fg = peace.yellow, bg = peace.none, style = 'bold' }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg =				{ fg = peace.accent }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MoreMsg =				{ fg = peace.accent }, -- |more-prompt|
		NonText =				{ fg = peace.disabled }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Pmenu =					{ fg = peace.text, bg = peace.popupbg }, -- Popup menu: normal item.
		PmenuSel =				{ fg = peace.text, bg = peace.active }, -- Popup menu: selected item.
		PmenuSbar =				{ fg = peace.text, bg = peace.contrast }, -- Popup menu: scrollbar.
		PmenuThumb =			{ fg = peace.fg, bg = peace.border }, -- Popup menu: Thumb of the scrollbar.
		Question =				{ fg = peace.green }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine =			{ fg = peace.highlight, bg = peace.title, style = 'reverse' }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		qfLineNr =				{ fg = peace.highlight, bg = peace.title, style = 'reverse' }, -- Line numbers for quickfix lists
		Search =				{ fg = peace.highlight, bg = peace.white, style = 'reverse' }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		SpecialKey =			{ fg = peace.purple }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad =				{ fg = peace.red, bg = peace.none, style = 'italic,undercurl' }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap =				{ fg = peace.blue, bg = peace.none, style = 'italic,undercurl' }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal =			{ fg = peace.cyan, bg = peace.none, style = 'italic,undercurl' }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare =				{ fg = peace.purple, bg = peace.none, style = 'italic,undercurl' }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine =			{ fg = peace.accent, bg = peace.active }, -- status line of current window
		StatusLineNC =  		{ fg = peace.fg, bg = peace.bg }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		StatusLineTerm =		{ fg = peace.fg, bg = peace.active }, -- status line of current terminal window
		StatusLineTermNC =		{ fg = peace.text, bg = peace.bg }, -- status lines of not-current terminal windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLineFill =			{ fg = peace.fg }, -- tab pages line, where there are no labels
		TablineSel =			{ fg = peace.bg, bg = peace.accent }, -- tab pages line, active tab page label
		Tabline =				{ fg = peace.fg },
		Title =					{ fg = peace.title, bg = peace.none, style = 'bold' }, -- titles for output from ":set all", ":autocmd" etc.
		Visual =				{ fg = peace.none, bg = peace.selection }, -- Visual mode selection
		VisualNOS =				{ fg = peace.none, bg = peace.selection }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg =			{ fg = peace.yellow }, -- warning messages
		Whitespace =			{ fg = peace.fg }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu =				{ fg = peace.orange, bg = peace.none, style = 'bold' }, -- current match in 'wildmenu' completion
		CursorColumn =			{ fg = peace.none, bg = peace.active }, -- Screen-column at the cursor, when 'cursorcolumn' is set.

		CursorLine =			{ fg = peace.none, bg = peace.cursorLineBG }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		-- ToolbarLine =			{ fg = peace.fg, bg = peace.bg_alt },
		-- ToolbarButton =			{ fg = peace.fg, bg = peace.none, style = 'bold' },
		NormalMode =			{ fg = peace.accent, bg = peace.none, style = 'reverse' }, -- Normal mode message in the cmdline
		InsertMode =			{ fg = peace.green, bg = peace.none, style = 'reverse' }, -- Insert mode message in the cmdline
		ReplacelMode =			{ fg = peace.red, bg = peace.none, style = 'reverse' }, -- Replace mode message in the cmdline
		VisualMode =			{ fg = peace.purple, bg = peace.none, style = 'reverse' }, -- Visual mode message in the cmdline
		CommandMode =			{ fg = peace.gray, bg = peace.none, style = 'reverse' }, -- Command mode message in the cmdline
		Warnings =				{ fg = peace.yellow },

        healthError =           { fg = peace.error },
        healthSuccess =         { fg = peace.green },
        healthWarning =         { fg = peace.yellow },

        -- Dashboard
        DashboardShortCut =                     { fg = peace.red },
        DashboardHeader =                       { fg = peace.comments },
        DashboardCenter =                       { fg = peace.paleblue },
        DashboardFooter =                       { fg = peace.orange, style = "italic" },

	}

    -- Options:

    --Set transparent background
    if vim.g.peace_disable_background == true then
		editor.Normal =				{ fg = peace.fg, bg = peace.none } -- normal text and background color
		editor.SignColumn =			{ fg = peace.fg, bg = peace.none }
    else
		editor.Normal =				{ fg = peace.fg, bg = peace.bg } -- normal text and background color
		editor.SignColumn =			{ fg = peace.fg, bg = peace.bg }
    end

    -- Remove window split borders
    if vim.g.peace_borders == true then
		editor.VertSplit =				{ fg = peace.border } -- the column separating vertically split windows
    else
		editor.VertSplit =				{ fg = peace.bg } -- the column separating vertically split windows
    end

    --Set End of Buffer lines (~)
    if vim.g.peace_hide_eob == true then
		editor.EndOfBuffer =			{ fg = peace.bg } -- ~ lines at the end of a buffer
    else
		editor.EndOfBuffer =			{ fg = peace.disabled } -- ~ lines at the end of a buffer
    end

    return editor
end

theme.loadTerminal = function ()

	vim.g.terminal_color_0 = peace.black
	vim.g.terminal_color_1 = peace.red
	vim.g.terminal_color_2 = peace.green
	vim.g.terminal_color_3 = peace.yellow
	vim.g.terminal_color_4 = peace.blue
	vim.g.terminal_color_5 = peace.purple
	vim.g.terminal_color_6 = peace.cyan
	vim.g.terminal_color_7 = peace.white
	vim.g.terminal_color_8 = peace.gray
	vim.g.terminal_color_9 = peace.red
	vim.g.terminal_color_10 = peace.green
	vim.g.terminal_color_11 = peace.yellow
	vim.g.terminal_color_12 = peace.blue
	vim.g.terminal_color_13 = peace.purple
	vim.g.terminal_color_14 = peace.cyan
	vim.g.terminal_color_15 = peace.white

end

theme.loadTreeSitter = function ()
    -- TreeSitter highlight groups

    local treesitter = {
        TSAnnotation =              { fg = peace.red }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        TSAttribute =               { fg = peace.yellow }, -- (unstable) TODO: docs
        TSBoolean=                  { fg = peace.orange }, -- For booleans.
        TSCharacter=                { fg = peace.orange }, -- For characters.
        TSConstructor =             { fg = peace.paleblue }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
        TSConstant =                { fg = peace.yellow }, -- For constants
        TSConstBuiltin =            { fg = peace.blue }, -- For constant that are built in the language: `nil` in Lua.
		TSConstMacro =              { fg = peace.blue }, -- For constants that are defined by macros: `NULL` in C.
        TSError =                   { fg = peace.error }, -- For syntax/parser errors.
        TSException =               { fg = peace.red }, -- For exception related keywords.
        TSField =                   { fg = peace.variable }, -- For fields.
        TSFloat =                   { fg = peace.red }, -- For floats.
        TSFuncMacro =               { fg = peace.blue }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        TSInclude =                 { fg = peace.cyan }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        TSLabel =                   { fg = peace.red }, -- For labels: `label:` in C and `:label:` in Lua.
        TSNamespace =               { fg = peace.paleblue }, -- For identifiers referring to modules and namespaces.
        TSNumber =                  { fg = peace.orange }, -- For all numbers
        TSOperator =                { fg = peace.yellow }, -- For any operator: `+`, but also `->` and `*` in C.
        TSParameter =               { fg = peace.paleblue }, -- For parameters of a function.
        TSParameterReference=       { fg = peace.paleblue }, -- For references to parameters of a function.
        TSProperty =                { fg = peace.paleblue }, -- Same as `TSField`,accesing for struct members in C.
        TSPunctDelimiter =          { fg = peace.cyan }, -- For delimiters ie: `.`
        TSPunctBracket =            { fg = peace.cyan }, -- For brackets and parens.
        TSPunctSpecial =            { fg = peace.cyan }, -- For special punctutation that does not fall in the catagories before.
        TSString =                  { fg = peace.green }, -- For strings.
        TSStringRegex =             { fg = peace.blue }, -- For regexes.
        TSStringEscape =            { fg = peace.disabled }, -- For escape characters within a string.
        TSSymbol =                  { fg = peace.yellow }, -- For identifiers referring to symbols or atoms.
        TSType =                    { fg = peace.yellow }, -- For types.
        TSTypeBuiltin =             { fg = peace.purple }, -- For builtin types.
        TSTag =                     { fg = peace.red }, -- Tags like html tag names.
        TSTagDelimiter =            { fg = peace.cyan }, -- Tag delimiter like `<` `>` `/`
        TSText =                    { fg = peace.text }, -- For strings considered text in a markup language.
        TSTextReference =           { fg = peace.yellow }, -- FIXME
        TSEmphasis =                { fg = peace.paleblue }, -- For text to be represented with emphasis.
        TSUnderline =               { fg = peace.fg, bg = peace.none, style = 'underline' }, -- For text to be represented with an underline.
        TSStrike =                  { }, -- For strikethrough text.
        TSTitle =                   { fg = peace.title, bg = peace.none, style = 'bold' }, -- Text that is part of a title.
        TSLiteral =                 { fg = peace.fg }, -- Literal text.
        TSURI =                     { fg = peace.link }, -- Any URI like a link or email.
        --TSNone =                    { }, -- TODO: docs
    }

    -- Options:

    -- Italic comments
    if vim.g.peace_italic_comments == true then
        treesitter.TSComment=                  { fg = peace.comments , bg = peace.none, style = 'italic' } -- For comment blocks.
    else
        treesitter.TSComment=                  { fg = peace.comments } -- For comment blocks.
    end

    if vim.g.peace_italic_keywords == true then
        treesitter.TSConditional =             { fg = peace.purple, style = 'italic' } -- For keywords related to conditionnals.
        treesitter.TSKeyword =                 { fg = peace.cyan  , style = 'italic' } -- For keywords that don't fall in previous categories.
        treesitter.TSRepeat =                  { fg = peace.purple, style = 'italic' } -- For keywords related to loops.
        treesitter.TSKeywordFunction =         { fg = peace.purple, style = 'italic' } -- For keywords used to define a fuction.
    else
        treesitter.TSConditional =             { fg = peace.purple } -- For keywords related to conditionnals.
        treesitter.TSKeyword =                 { fg = peace.cyan } -- For keywords that don't fall in previous categories.
        treesitter.TSRepeat =                  { fg = peace.purple } -- For keywords related to loops.
        treesitter.TSKeywordFunction =         { fg = peace.purple } -- For keywords used to define a fuction.
    end

    if vim.g.peace_italic_functions == true then
        treesitter.TSFunction =                { fg = peace.blue, style = 'italic' } -- For fuction (calls and definitions).
        treesitter.TSMethod =                  { fg = peace.blue, style = 'italic' } -- For method calls and definitions.
        treesitter.TSFuncBuiltin =             { fg = peace.cyan, style = 'italic' } -- For builtin functions: `table.insert` in Lua.
    else
        treesitter.TSFunction =                { fg = peace.blue } -- For fuction (calls and definitions).
        treesitter.TSMethod =                  { fg = peace.blue } -- For method calls and definitions.
        treesitter.TSFuncBuiltin =             { fg = peace.cyan } -- For builtin functions: `table.insert` in Lua.
    end

    if vim.g.peace_italic_variables == true then
        treesitter.TSVariable =                { fg = peace.variable, style = 'italic' } -- Any variable name that does not have another highlight.
        treesitter.TSVariableBuiltin =         { fg = peace.variable, style = 'italic' } -- Variable names that are defined by the languages, like `this` or `self`.
    else
        treesitter.TSVariable =                { fg = peace.variable } -- Any variable name that does not have another highlight.
        treesitter.TSVariableBuiltin =         { fg = peace.variable } -- Variable names that are defined by the languages, like `this` or `self`.
    end

    return treesitter

end

theme.loadLSP = function ()
    -- Lsp highlight groups

    local lsp = {
        LspDiagnosticsDefaultError =            { fg = peace.error }, -- used for "Error" diagnostic virtual text
        LspDiagnosticsSignError =               { fg = peace.error }, -- used for "Error" diagnostic signs in sign column
        LspDiagnosticsFloatingError =           { fg = peace.error }, -- used for "Error" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextError =        { fg = peace.error }, -- Virtual text "Error"
        LspDiagnosticsUnderlineError =          { style = 'undercurl', sp = peace.error }, -- used to underline "Error" diagnostics.
        LspDiagnosticsDefaultWarning =          { fg = peace.yellow}, -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsSignWarning =             { fg = peace.yellow}, -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsFloatingWarning =         { fg = peace.yellow}, -- used for "Warning" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextWarning =      { fg = peace.yellow}, -- Virtual text "Warning"
        LspDiagnosticsUnderlineWarning =        { style = 'undercurl', sp = peace.yellow }, -- used to underline "Warning" diagnostics.
        LspDiagnosticsDefaultInformation =      { fg = peace.paleblue }, -- used for "Information" diagnostic virtual text
        LspDiagnosticsSignInformation =         { fg = peace.paleblue },  -- used for "Information" diagnostic signs in sign column
        LspDiagnosticsFloatingInformation =     { fg = peace.paleblue }, -- used for "Information" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextInformation =  { fg = peace.paleblue }, -- Virtual text "Information"
        LspDiagnosticsUnderlineInformation =    { style = 'undercurl', sp = peace.paleblue }, -- used to underline "Information" diagnostics.
        LspDiagnosticsDefaultHint =             { fg = peace.purple  },  -- used for "Hint" diagnostic virtual text
        LspDiagnosticsSignHint =                { fg = peace.purple  }, -- used for "Hint" diagnostic signs in sign column
        LspDiagnosticsFloatingHint =            { fg = peace.purple  }, -- used for "Hint" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextHint =         { fg = peace.purple  }, -- Virtual text "Hint"
        LspDiagnosticsUnderlineHint =           { style = 'undercurl', sp = peace.paleblue }, -- used to underline "Hint" diagnostics.

        -- NOTE: FIXED FOR VIM-ILLUMINATE --
        LspReferenceText =                      { style = 'underline' }, -- used for highlighting "text" references
        LspReferenceRead =                      { style = 'underline' }, -- used for highlighting "read" references
        LspReferenceWrite =                     { style = 'underline' }, -- used for highlighting "write" references
    }

    return lsp

end

theme.loadPlugins = function()
    -- Plugins highlight groups

    local plugins = {

        -- LspTrouble
        LspTroubleText =                        { fg = peace.text },
        LspTroubleCount =                       { fg = peace.purple, bg = peace.active },
        LspTroubleNormal =                      { fg = peace.fg, bg = peace.sidebar },

		-- Nvim-Compe
		CompeDocumentation =					{ fg = peace.text, bg = peace.contrast },

        -- Diff
        diffAdded =                             { fg = peace.green },
        diffRemoved =                           { fg = peace.red },
        diffChanged =                           { fg = peace.blue },
        diffOldFile =                           { fg = peace.text },
        diffNewFile =                           { fg = peace.title },
        diffFile =                              { fg = peace.gray },
        diffLine =                              { fg = peace.cyan },
        diffIndexLine =                         { fg = peace.purple },

        -- Neogit
        NeogitBranch =                          { fg = peace.paleblue },
        NeogitRemote =                          { fg = peace.purple },
        NeogitHunkHeader =                      { fg = peace.fg, bg = peace.highlight },
        NeogitHunkHeaderHighlight =             { fg = peace.blue, bg = peace.contrast },
        NeogitDiffContextHighlight =            { fg = peace.text, bg = peace.contrast },
        NeogitDiffDeleteHighlight =             { fg = peace.red },
        NeogitDiffAddHighlight =                { fg = peace.green },

        -- GitGutter
        GitGutterAdd =                          { fg = peace.green }, -- diff mode: Added line |diff.txt|
        GitGutterChange =                       { fg = peace.blue }, -- diff mode: Changed line |diff.txt|
        GitGutterDelete =                       { fg = peace.red }, -- diff mode: Deleted line |diff.txt|

        -- GitSigns
        GitSignsAdd =                           { fg = peace.green }, -- diff mode: Added line |diff.txt|
        GitSignsAddNr =                         { fg = peace.green }, -- diff mode: Added line |diff.txt|
        GitSignsAddLn =                         { fg = peace.green }, -- diff mode: Added line |diff.txt|
        GitSignsChange =                        { fg = peace.blue }, -- diff mode: Changed line |diff.txt|
        GitSignsChangeNr =                      { fg = peace.blue }, -- diff mode: Changed line |diff.txt|
        GitSignsChangeLn =                      { fg = peace.blue }, -- diff mode: Changed line |diff.txt|
        GitSignsDelete =                        { fg = peace.red }, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteNr =                      { fg = peace.red }, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteLn =                      { fg = peace.red }, -- diff mode: Deleted line |diff.txt|

        -- Telescope
        TelescopeNormal =                       { fg = peace.fg, bg = peace.bg },
        TelescopePromptBorder =                 { fg = peace.cyan },
        TelescopeResultsBorder =                { fg = peace.purple },
        TelescopePreviewBorder =                { fg = peace.green },
        TelescopeSelectionCaret =               { fg = peace.purple },
        TelescopeSelection =                    { fg = peace.purple, bg = peace.active },
        TelescopeMatching =                     { fg = peace.cyan },

        -- NvimTree
        NvimTreeRootFolder =                    { fg = peace.nvimTreeTxt },
        NvimTreeFolderName=                     { fg = peace.text },
        NvimTreeFolderIcon=                     { fg = peace.accent },
        NvimTreeEmptyFolderName=                { fg = peace.disabled },
        NvimTreeOpenedFolderName=               { fg = peace.accent },
        NvimTreeIndentMarker =                  { fg = peace.border },
        NvimTreeGitDirty =                      { fg = peace.blue },
        NvimTreeGitNew =                        { fg = peace.green },
        NvimTreeGitStaged =                     { fg = peace.comments },
        NvimTreeGitDeleted =                    { fg = peace.red },
        NvimTreeOpenedFile =                    { fg = peace.accent },
        NvimTreeImageFile =                     { fg = peace.yellow },
        NvimTreeMarkdownFile =                  { fg = peace.pink },
        NvimTreeExecFile =                      { fg = peace.green },
        NvimTreeSpecialFile =                   { fg = peace.purple , style = "underline" },
        LspDiagnosticsError =                   { fg = peace.error },
        LspDiagnosticsWarning =                 { fg = peace.yellow },
        LspDiagnosticsInformation =             { fg = peace.paleblue },
        LspDiagnosticsHint =                    { fg = peace.purple },

        -- WhichKey
        WhichKey =                              { fg = peace.blue , style = 'bold'},
        WhichKeyGroup =                         { fg = peace.text },
        WhichKeyDesc =                          { fg = peace.cyan, style = 'italic' },
        WhichKeySeperator =                     { fg = peace.accent },
        WhichKeyFloating =                      { bg = peace.float },
        WhichKeyFloat =                         { bg = peace.float },

        -- LspSaga
        LspFloatWinNormal =                     { fg = peace.text, bg = peace.bg },
        LspFloatWinBorder =                     { fg = peace.purple },
        DiagnosticError =                       { fg = peace.error },
        DiagnosticWarning =                     { fg = peace.yellow },
        DiagnosticInformation =                 { fg = peace.paleblue },
        DiagnosticHint =                        { fg = peace.purple },
		LspSagaDiagnosticBorder =				{ fg = peace.gray },
		LspSagaDiagnosticHeader =				{ fg = peace.blue },
		LspSagaDiagnosticTruncateLine =			{ fg = peace.border },
		LspLinesDiagBorder =					{ fg = peace.contrast },
		ProviderTruncateLine =					{ fg = peace.border },
		LspSagaShTruncateLine =					{ fg = peace.border },
		LspSagaDocTruncateLine =				{ fg = peace.border },
		LineDiagTruncateLine =					{ fg = peace.border },
        LspSagaBorderTitle =                    { fg = peace.cyan },
        LspSagaHoverBorder =                    { fg = peace.paleblue },
        LspSagaRenameBorder =                   { fg = peace.green },
        LspSagaDefPreviewBorder =               { fg = peace.green },
        LspSagaCodeActionTitle =                { fg = peace.paleblue },
        LspSagaCodeActionContent =              { fg = peace.purple },
        LspSagaCodeActionBorder =               { fg = peace.blue },
		LspSagaCodeActionTruncateLine =			{ fg = peace.border },
        LspSagaSignatureHelpBorder =            { fg = peace.pink },
        LspSagaFinderSelection =                { fg = peace.green },
		-- LspSagaAutoPreview =					{ fg = peace.red },
        ReferencesCount =                       { fg = peace.purple },
        DefinitionCount =                       { fg = peace.purple },
		DefinitionPreviewTitle =				{ fg = peace.green },
        DefinitionIcon =                        { fg = peace.blue },
        ReferencesIcon =                        { fg = peace.blue },
        TargetWord =                            { fg = peace.cyan },

        -- BufferLine
        BufferLineIndicatorSelected =           { fg = peace.accent },
        BufferLineFill =                        { bg = peace.bg_alt },

        -- Sneak
        Sneak =                                 { fg = peace.bg, bg = peace.accent },
        SneakScope =                            { bg = peace.selection },

        -- Indent Blankline
        IndentBlanklineChar =                   { fg = peace.indentHlDefault },
        IndentBlanklineContextChar =            { fg = peace.indentHlContext },

        -- Nvim dap
        DapBreakpoint =                         { fg = peace.red },
        DapStopped =                            { fg = peace.green },

		-- Illuminate
		illuminatedWord =						{ bg = peace.highight },
		illuminatedCurWord =					{ bg = peace.highight },

		-- Hop
		HopNextKey = 							{ fg = peace.orange, style = "bold" },
		HopNextKey1 = 							{ fg = peace.blue, style = "bold" },
		HopNextKey2 = 							{ fg = peace.blue },
		HopUnmatched = 							{ fg = peace.comments },
    }
    -- Options:

    -- Disable nvim-tree background
        if vim.g.peace_disable_background == true then
            plugins.NvimTreeNormal =                        { fg = peace.comments, bg = peace.none }
        else
            plugins.NvimTreeNormal =                        { fg = peace.comments, bg = peace.sidebar }
        end

    return plugins

end

-- LuaFormatter on
return theme
