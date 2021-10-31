local halloween = require("halloween.colors")

local theme = {}

theme.loadSyntax = function()
    -- LuaFormatter off
    -- Syntax highlight groups

	local syntax = {
		Type =						{ fg = halloween.purple }, -- int, long, char, etc.
		StorageClass =				{ fg = halloween.cyan }, -- static, register, volatile, etc.
		Structure =					{ fg = halloween.puple }, -- struct, union, enum, etc.
		Constant =					{ fg = halloween.yellow }, -- any constant
		String =					{ fg = halloween.green, bg = halloween.none, style= 'italic' }, -- Any string
		Character =					{ fg = halloween.orange }, -- any character constant: 'c', '\n'
		Number =					{ fg = halloween.yellow }, -- a number constant: 5
		Boolean =					{ fg = halloween.orange }, -- a boolean constant: TRUE, false
		Float =						{ fg = halloween.orange }, -- a floating point constant: 2.3e10
		Statement =					{ fg = halloween.pink }, -- any statement
		Label =						{ fg = halloween.purple }, -- case, default, etc.
		Operator =					{ fg = halloween.cyan }, -- sizeof", "+", "*", etc.
		Exception =					{ fg = halloween.cyan }, -- try, catch, throw
		PreProc =					{ fg = halloween.purple }, -- generic Preprocessor
		Include =					{ fg = halloween.blue }, -- preprocessor #include
		Define =					{ fg = halloween.pink }, -- preprocessor #define
		Macro =						{ fg = halloween.cyan }, -- same as Define
		Typedef =					{ fg = halloween.red }, -- A typedef
		PreCondit =					{ fg = halloween.cyan }, -- preprocessor #if, #else, #endif, etc.
		Special =					{ fg = halloween.red }, -- any special symbol
		SpecialChar =				{ fg = halloween.pink }, -- special character in a constant
		Tag =						{ fg = halloween.red }, -- you can use CTRL-] on this
		Delimiter =					{ fg = halloween.cyan }, -- character that needs attention like , or .
		SpecialComment =			{ fg = halloween.gray }, -- special things inside a comment
		Debug =						{ fg = halloween.red }, -- debugging statements
		Underlined =				{ fg = halloween.link, bg = halloween.none, style = 'underline' }, -- text that stands out, HTML links
		Ignore =					{ fg = halloween.disabled }, -- left blank, hidden
		Error =						{ fg = halloween.error, bg = halloween.none, style = 'bold,underline' }, -- any erroneous construct
		Todo =						{ fg = halloween.yellow, bg = halloween.none, style = 'bold,italic' }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        htmlLink = { fg = halloween.link, style = "underline" },
        htmlH1 = { fg = halloween.cyan, style = "bold" },
        htmlH2 = { fg = halloween.red, style = "bold" },
        htmlH3 = { fg = halloween.green, style = "bold" },
        htmlH4 = { fg = halloween.yellow, style = "bold" },
        htmlH5 = { fg = halloween.purple, style = "bold" },
        markdownH1 = { fg = halloween.cyan, style = "bold" },
        markdownH2 = { fg = halloween.red, style = "bold" },
        markdownH3 = { fg = halloween.green, style = "bold" },
        markdownH1Delimiter = { fg = halloween.cyan },
        markdownH2Delimiter = { fg = halloween.red },
        markdownH3Delimiter = { fg = halloween.green },
	}

	-- Options:

	-- Italic comments
	if vim.g.halloween_italic_comments == true then
		syntax.Comment =		{fg = halloween.comments, bg = halloween.none, style = 'italic'} -- italic comments
	else
		syntax.Comment =		{fg = halloween.comments} -- normal comments
	end

	-- Italic Keywords
	if vim.g.halloween_italic_keywords == true then
		syntax.Conditional =		{fg = halloween.purple, bg = halloween.none, style = 'italic'} -- italic if, then, else, endif, switch, etc.
		syntax.Keyword =			{fg = halloween.purple, bg = halloween.none, style = 'italic'} -- italic for, do, while, etc.
		syntax.Repeat =				{fg = halloween.purple, bg = halloween.none, style = 'italic'} -- italic any other keyword
	else
		syntax.Conditional =		{fg = halloween.purple} -- normal if, then, else, endif, switch, etc.
		syntax.Keyword =			{fg = halloween.purple} -- normal for, do, while, etc.
		syntax.Repeat =				{fg = halloween.purple} -- normal any other keyword
	end

	-- Italic Function names
	if vim.g.halloween_italic_functions == true then
		syntax.Function =		{fg = halloween.blue, bg = halloween.none, style = 'italic'} -- italic funtion names
	else
		syntax.Function =		{fg = halloween.blue} -- normal function names
	end

	if vim.g.halloween_italic_variables == true then
		syntax.Identifier =		{fg = halloween.variable, bg = halloween.none, style = 'italic'}; -- any variable name
	else
		syntax.Identifier =		{fg = halloween.variable}; -- any variable name
	end

	return syntax

end


theme.loadEditor = function ()
    -- Editor highlight groups

	local editor = {
		NormalFloat =			{ fg = halloween.fg, bg = halloween.float }, -- normal text and background color for floating windows
		ColorColumn =			{ fg = halloween.none, bg = halloween.active }, --  used for the columns set with 'colorcolumn'
		Conceal =				{ fg = halloween.disabled }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor =				{ fg = halloween.cursor, bg = halloween.none, style = 'reverse' }, -- the character under the cursor
		CursorIM =				{ fg = halloween.cursor, bg = halloween.none, style = 'reverse' }, -- like Cursor, but used when in IME mode
		Directory =				{ fg = halloween.blue, bg = halloween.none }, -- directory names (and other special names in listings)
		DiffAdd =				{ fg = halloween.green, bg = halloween.none, style = 'reverse' }, -- diff mode: Added line
		DiffChange =			{ fg = halloween.blue, bg = halloween.none, style = 'reverse' }, --  diff mode: Changed line
		DiffDelete =			{ fg = halloween.red, bg = halloween.none, style = 'reverse' }, -- diff mode: Deleted line
		DiffText =				{ fg = halloween.fg, bg = halloween.none, style = 'reverse' }, -- diff mode: Changed text within a changed line
		ErrorMsg =				{ fg = halloween.error }, -- error messages
		Folded =				{ fg = halloween.disabled, bg = halloween.none, style = 'italic' }, -- line used for closed folds
		FoldColumn =			{ fg = halloween.blue }, -- 'foldcolumn'
		IncSearch =				{ fg = halloween.highlight, bg = halloween.white, style = 'reverse' }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		LineNr =				{ fg = halloween.accent }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr =			{ fg = halloween.blue }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen =			{ fg = halloween.yellow, bg = halloween.none, style = 'bold' }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg =				{ fg = halloween.accent }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MoreMsg =				{ fg = halloween.accent }, -- |more-prompt|
		NonText =				{ fg = halloween.disabled }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Pmenu =					{ fg = halloween.text, bg = halloween.popupbg }, -- Popup menu: normal item.
		PmenuSel =				{ fg = halloween.text, bg = halloween.active }, -- Popup menu: selected item.
		PmenuSbar =				{ fg = halloween.text, bg = halloween.contrast }, -- Popup menu: scrollbar.
		PmenuThumb =			{ fg = halloween.fg, bg = halloween.border }, -- Popup menu: Thumb of the scrollbar.
		Question =				{ fg = halloween.green }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine =			{ fg = halloween.highlight, bg = halloween.title, style = 'reverse' }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		qfLineNr =				{ fg = halloween.highlight, bg = halloween.title, style = 'reverse' }, -- Line numbers for quickfix lists
		Search =				{ fg = halloween.highlight, bg = halloween.white, style = 'reverse' }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		SpecialKey =			{ fg = halloween.purple }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad =				{ fg = halloween.red, bg = halloween.none, style = 'italic,undercurl' }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap =				{ fg = halloween.blue, bg = halloween.none, style = 'italic,undercurl' }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal =			{ fg = halloween.cyan, bg = halloween.none, style = 'italic,undercurl' }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare =				{ fg = halloween.purple, bg = halloween.none, style = 'italic,undercurl' }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine =			{ fg = halloween.accent, bg = halloween.active }, -- status line of current window
		StatusLineNC =  		{ fg = halloween.fg, bg = halloween.bg }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		StatusLineTerm =		{ fg = halloween.fg, bg = halloween.active }, -- status line of current terminal window
		StatusLineTermNC =		{ fg = halloween.text, bg = halloween.bg }, -- status lines of not-current terminal windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLineFill =			{ fg = halloween.fg }, -- tab pages line, where there are no labels
		TablineSel =			{ fg = halloween.bg, bg = halloween.accent }, -- tab pages line, active tab page label
		Tabline =				{ fg = halloween.fg },
		Title =					{ fg = halloween.title, bg = halloween.none, style = 'bold' }, -- titles for output from ":set all", ":autocmd" etc.
		Visual =				{ fg = halloween.none, bg = halloween.selection }, -- Visual mode selection
		VisualNOS =				{ fg = halloween.none, bg = halloween.selection }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg =			{ fg = halloween.yellow }, -- warning messages
		Whitespace =			{ fg = halloween.fg }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu =				{ fg = halloween.orange, bg = halloween.none, style = 'bold' }, -- current match in 'wildmenu' completion
		CursorColumn =			{ fg = halloween.none, bg = halloween.active }, -- Screen-column at the cursor, when 'cursorcolumn' is set.

		CursorLine =			{ fg = halloween.none, bg = halloween.cursorLineBG }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		-- ToolbarLine =			{ fg = halloween.fg, bg = halloween.bg_alt },
		-- ToolbarButton =			{ fg = halloween.fg, bg = halloween.none, style = 'bold' },
		NormalMode =			{ fg = halloween.accent, bg = halloween.none, style = 'reverse' }, -- Normal mode message in the cmdline
		InsertMode =			{ fg = halloween.green, bg = halloween.none, style = 'reverse' }, -- Insert mode message in the cmdline
		ReplacelMode =			{ fg = halloween.red, bg = halloween.none, style = 'reverse' }, -- Replace mode message in the cmdline
		VisualMode =			{ fg = halloween.purple, bg = halloween.none, style = 'reverse' }, -- Visual mode message in the cmdline
		CommandMode =			{ fg = halloween.gray, bg = halloween.none, style = 'reverse' }, -- Command mode message in the cmdline
		Warnings =				{ fg = halloween.yellow },

        healthError =           { fg = halloween.error },
        healthSuccess =         { fg = halloween.green },
        healthWarning =         { fg = halloween.yellow },

        -- Dashboard
        DashboardShortCut =                     { fg = halloween.red },
        DashboardHeader =                       { fg = halloween.comments },
        DashboardCenter =                       { fg = halloween.paleblue },
        DashboardFooter =                       { fg = halloween.orange, style = "italic" },

	}

    -- Options:

    --Set transparent background
    if vim.g.halloween_disable_background == true then
		editor.Normal =				{ fg = halloween.fg, bg = halloween.none } -- normal text and background color
		editor.SignColumn =			{ fg = halloween.fg, bg = halloween.none }
    else
		editor.Normal =				{ fg = halloween.fg, bg = halloween.bg } -- normal text and background color
		editor.SignColumn =			{ fg = halloween.fg, bg = halloween.bg }
    end

    -- Remove window split borders
    if vim.g.halloween_borders == true then
		editor.VertSplit =				{ fg = halloween.border } -- the column separating vertically split windows
    else
		editor.VertSplit =				{ fg = halloween.bg } -- the column separating vertically split windows
    end

    --Set End of Buffer lines (~)
    if vim.g.halloween_hide_eob == true then
		editor.EndOfBuffer =			{ fg = halloween.bg } -- ~ lines at the end of a buffer
    else
		editor.EndOfBuffer =			{ fg = halloween.disabled } -- ~ lines at the end of a buffer
    end

    return editor
end

theme.loadTerminal = function ()

	vim.g.terminal_color_0 = halloween.black
	vim.g.terminal_color_1 = halloween.red
	vim.g.terminal_color_2 = halloween.green
	vim.g.terminal_color_3 = halloween.yellow
	vim.g.terminal_color_4 = halloween.blue
	vim.g.terminal_color_5 = halloween.purple
	vim.g.terminal_color_6 = halloween.cyan
	vim.g.terminal_color_7 = halloween.white
	vim.g.terminal_color_8 = halloween.gray
	vim.g.terminal_color_9 = halloween.red
	vim.g.terminal_color_10 = halloween.green
	vim.g.terminal_color_11 = halloween.yellow
	vim.g.terminal_color_12 = halloween.blue
	vim.g.terminal_color_13 = halloween.purple
	vim.g.terminal_color_14 = halloween.cyan
	vim.g.terminal_color_15 = halloween.white

end

theme.loadTreeSitter = function ()
    -- TreeSitter highlight groups

    local treesitter = {
        TSAnnotation =              { fg = halloween.red }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        TSAttribute =               { fg = halloween.yellow }, -- (unstable) TODO: docs
        TSBoolean=                  { fg = halloween.orange }, -- For booleans.
        TSCharacter=                { fg = halloween.orange }, -- For characters.
        TSConstructor =             { fg = halloween.paleblue }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
        TSConstant =                { fg = halloween.yellow }, -- For constants
        TSConstBuiltin =            { fg = halloween.blue }, -- For constant that are built in the language: `nil` in Lua.
		TSConstMacro =              { fg = halloween.blue }, -- For constants that are defined by macros: `NULL` in C.
        TSError =                   { fg = halloween.error }, -- For syntax/parser errors.
        TSException =               { fg = halloween.red }, -- For exception related keywords.
        TSField =                   { fg = halloween.variable }, -- For fields.
        TSFloat =                   { fg = halloween.red }, -- For floats.
        TSFuncMacro =               { fg = halloween.blue }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        TSInclude =                 { fg = halloween.cyan }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        TSLabel =                   { fg = halloween.red }, -- For labels: `label:` in C and `:label:` in Lua.
        TSNamespace =               { fg = halloween.paleblue }, -- For identifiers referring to modules and namespaces.
        TSNumber =                  { fg = halloween.orange }, -- For all numbers
        TSOperator =                { fg = halloween.yellow }, -- For any operator: `+`, but also `->` and `*` in C.
        TSParameter =               { fg = halloween.paleblue }, -- For parameters of a function.
        TSParameterReference=       { fg = halloween.paleblue }, -- For references to parameters of a function.
        TSProperty =                { fg = halloween.paleblue }, -- Same as `TSField`,accesing for struct members in C.
        TSPunctDelimiter =          { fg = halloween.cyan }, -- For delimiters ie: `.`
        TSPunctBracket =            { fg = halloween.cyan }, -- For brackets and parens.
        TSPunctSpecial =            { fg = halloween.cyan }, -- For special punctutation that does not fall in the catagories before.
        TSString =                  { fg = halloween.green }, -- For strings.
        TSStringRegex =             { fg = halloween.blue }, -- For regexes.
        TSStringEscape =            { fg = halloween.disabled }, -- For escape characters within a string.
        TSSymbol =                  { fg = halloween.yellow }, -- For identifiers referring to symbols or atoms.
        TSType =                    { fg = halloween.yellow }, -- For types.
        TSTypeBuiltin =             { fg = halloween.purple }, -- For builtin types.
        TSTag =                     { fg = halloween.red }, -- Tags like html tag names.
        TSTagDelimiter =            { fg = halloween.cyan }, -- Tag delimiter like `<` `>` `/`
        TSText =                    { fg = halloween.text }, -- For strings considered text in a markup language.
        TSTextReference =           { fg = halloween.yellow }, -- FIXME
        TSEmphasis =                { fg = halloween.paleblue }, -- For text to be represented with emphasis.
        TSUnderline =               { fg = halloween.fg, bg = halloween.none, style = 'underline' }, -- For text to be represented with an underline.
        TSStrike =                  { }, -- For strikethrough text.
        TSTitle =                   { fg = halloween.title, bg = halloween.none, style = 'bold' }, -- Text that is part of a title.
        TSLiteral =                 { fg = halloween.fg }, -- Literal text.
        TSURI =                     { fg = halloween.link }, -- Any URI like a link or email.
        --TSNone =                    { }, -- TODO: docs
    }

    -- Options:

    -- Italic comments
    if vim.g.halloween_italic_comments == true then
        treesitter.TSComment=                  { fg = halloween.comments , bg = halloween.none, style = 'italic' } -- For comment blocks.
    else
        treesitter.TSComment=                  { fg = halloween.comments } -- For comment blocks.
    end

    if vim.g.halloween_italic_keywords == true then
        treesitter.TSConditional =             { fg = halloween.purple, style = 'italic' } -- For keywords related to conditionnals.
        treesitter.TSKeyword =                 { fg = halloween.cyan  , style = 'italic' } -- For keywords that don't fall in previous categories.
        treesitter.TSRepeat =                  { fg = halloween.purple, style = 'italic' } -- For keywords related to loops.
        treesitter.TSKeywordFunction =         { fg = halloween.purple, style = 'italic' } -- For keywords used to define a fuction.
    else
        treesitter.TSConditional =             { fg = halloween.purple } -- For keywords related to conditionnals.
        treesitter.TSKeyword =                 { fg = halloween.cyan } -- For keywords that don't fall in previous categories.
        treesitter.TSRepeat =                  { fg = halloween.purple } -- For keywords related to loops.
        treesitter.TSKeywordFunction =         { fg = halloween.purple } -- For keywords used to define a fuction.
    end

    if vim.g.halloween_italic_functions == true then
        treesitter.TSFunction =                { fg = halloween.blue, style = 'italic' } -- For fuction (calls and definitions).
        treesitter.TSMethod =                  { fg = halloween.blue, style = 'italic' } -- For method calls and definitions.
        treesitter.TSFuncBuiltin =             { fg = halloween.cyan, style = 'italic' } -- For builtin functions: `table.insert` in Lua.
    else
        treesitter.TSFunction =                { fg = halloween.blue } -- For fuction (calls and definitions).
        treesitter.TSMethod =                  { fg = halloween.blue } -- For method calls and definitions.
        treesitter.TSFuncBuiltin =             { fg = halloween.cyan } -- For builtin functions: `table.insert` in Lua.
    end

    if vim.g.halloween_italic_variables == true then
        treesitter.TSVariable =                { fg = halloween.variable, style = 'italic' } -- Any variable name that does not have another highlight.
        treesitter.TSVariableBuiltin =         { fg = halloween.variable, style = 'italic' } -- Variable names that are defined by the languages, like `this` or `self`.
    else
        treesitter.TSVariable =                { fg = halloween.variable } -- Any variable name that does not have another highlight.
        treesitter.TSVariableBuiltin =         { fg = halloween.variable } -- Variable names that are defined by the languages, like `this` or `self`.
    end

    return treesitter

end

theme.loadLSP = function ()
    -- Lsp highlight groups

    local lsp = {
        LspDiagnosticsDefaultError =            { fg = halloween.error }, -- used for "Error" diagnostic virtual text
        LspDiagnosticsSignError =               { fg = halloween.error }, -- used for "Error" diagnostic signs in sign column
        LspDiagnosticsFloatingError =           { fg = halloween.error }, -- used for "Error" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextError =        { fg = halloween.error }, -- Virtual text "Error"
        LspDiagnosticsUnderlineError =          { style = 'undercurl', sp = halloween.error }, -- used to underline "Error" diagnostics.
        LspDiagnosticsDefaultWarning =          { fg = halloween.yellow}, -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsSignWarning =             { fg = halloween.yellow}, -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsFloatingWarning =         { fg = halloween.yellow}, -- used for "Warning" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextWarning =      { fg = halloween.yellow}, -- Virtual text "Warning"
        LspDiagnosticsUnderlineWarning =        { style = 'undercurl', sp = halloween.yellow }, -- used to underline "Warning" diagnostics.
        LspDiagnosticsDefaultInformation =      { fg = halloween.paleblue }, -- used for "Information" diagnostic virtual text
        LspDiagnosticsSignInformation =         { fg = halloween.paleblue },  -- used for "Information" diagnostic signs in sign column
        LspDiagnosticsFloatingInformation =     { fg = halloween.paleblue }, -- used for "Information" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextInformation =  { fg = halloween.paleblue }, -- Virtual text "Information"
        LspDiagnosticsUnderlineInformation =    { style = 'undercurl', sp = halloween.paleblue }, -- used to underline "Information" diagnostics.
        LspDiagnosticsDefaultHint =             { fg = halloween.purple  },  -- used for "Hint" diagnostic virtual text
        LspDiagnosticsSignHint =                { fg = halloween.purple  }, -- used for "Hint" diagnostic signs in sign column
        LspDiagnosticsFloatingHint =            { fg = halloween.purple  }, -- used for "Hint" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextHint =         { fg = halloween.purple  }, -- Virtual text "Hint"
        LspDiagnosticsUnderlineHint =           { style = 'undercurl', sp = halloween.paleblue }, -- used to underline "Hint" diagnostics.
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
        LspTroubleText =                        { fg = halloween.text },
        LspTroubleCount =                       { fg = halloween.purple, bg = halloween.active },
        LspTroubleNormal =                      { fg = halloween.fg, bg = halloween.sidebar },

		-- Nvim-Compe
		CompeDocumentation =					{ fg = halloween.text, bg = halloween.contrast },

        -- Diff
        diffAdded =                             { fg = halloween.green },
        diffRemoved =                           { fg = halloween.red },
        diffChanged =                           { fg = halloween.blue },
        diffOldFile =                           { fg = halloween.text },
        diffNewFile =                           { fg = halloween.title },
        diffFile =                              { fg = halloween.gray },
        diffLine =                              { fg = halloween.cyan },
        diffIndexLine =                         { fg = halloween.purple },

        -- Neogit
        NeogitBranch =                          { fg = halloween.paleblue },
        NeogitRemote =                          { fg = halloween.purple },
        NeogitHunkHeader =                      { fg = halloween.fg, bg = halloween.highlight },
        NeogitHunkHeaderHighlight =             { fg = halloween.blue, bg = halloween.contrast },
        NeogitDiffContextHighlight =            { fg = halloween.text, bg = halloween.contrast },
        NeogitDiffDeleteHighlight =             { fg = halloween.red },
        NeogitDiffAddHighlight =                { fg = halloween.green },

        -- GitGutter
        GitGutterAdd =                          { fg = halloween.green }, -- diff mode: Added line |diff.txt|
        GitGutterChange =                       { fg = halloween.blue }, -- diff mode: Changed line |diff.txt|
        GitGutterDelete =                       { fg = halloween.red }, -- diff mode: Deleted line |diff.txt|

        -- GitSigns
        GitSignsAdd =                           { fg = halloween.green }, -- diff mode: Added line |diff.txt|
        GitSignsAddNr =                         { fg = halloween.green }, -- diff mode: Added line |diff.txt|
        GitSignsAddLn =                         { fg = halloween.green }, -- diff mode: Added line |diff.txt|
        GitSignsChange =                        { fg = halloween.blue }, -- diff mode: Changed line |diff.txt|
        GitSignsChangeNr =                      { fg = halloween.blue }, -- diff mode: Changed line |diff.txt|
        GitSignsChangeLn =                      { fg = halloween.blue }, -- diff mode: Changed line |diff.txt|
        GitSignsDelete =                        { fg = halloween.red }, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteNr =                      { fg = halloween.red }, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteLn =                      { fg = halloween.red }, -- diff mode: Deleted line |diff.txt|

        -- Telescope
        TelescopeNormal =                       { fg = halloween.fg, bg = halloween.bg },
        TelescopePromptBorder =                 { fg = halloween.cyan },
        TelescopeResultsBorder =                { fg = halloween.purple },
        TelescopePreviewBorder =                { fg = halloween.green },
        TelescopeSelectionCaret =               { fg = halloween.purple },
        TelescopeSelection =                    { fg = halloween.purple, bg = halloween.active },
        TelescopeMatching =                     { fg = halloween.cyan },

        -- NvimTree
        NvimTreeRootFolder =                    { fg = halloween.nvimTreeTxt },
        NvimTreeFolderName=                     { fg = halloween.text },
        NvimTreeFolderIcon=                     { fg = halloween.accent },
        NvimTreeEmptyFolderName=                { fg = halloween.disabled },
        NvimTreeOpenedFolderName=               { fg = halloween.accent },
        NvimTreeIndentMarker =                  { fg = halloween.border },
        NvimTreeGitDirty =                      { fg = halloween.blue },
        NvimTreeGitNew =                        { fg = halloween.green },
        NvimTreeGitStaged =                     { fg = halloween.comments },
        NvimTreeGitDeleted =                    { fg = halloween.red },
        NvimTreeOpenedFile =                    { fg = halloween.accent },
        NvimTreeImageFile =                     { fg = halloween.yellow },
        NvimTreeMarkdownFile =                  { fg = halloween.pink },
        NvimTreeExecFile =                      { fg = halloween.green },
        NvimTreeSpecialFile =                   { fg = halloween.purple , style = "underline" },
        LspDiagnosticsError =                   { fg = halloween.error },
        LspDiagnosticsWarning =                 { fg = halloween.yellow },
        LspDiagnosticsInformation =             { fg = halloween.paleblue },
        LspDiagnosticsHint =                    { fg = halloween.purple },

        -- WhichKey
        WhichKey =                              { fg = halloween.blue , style = 'bold'},
        WhichKeyGroup =                         { fg = halloween.text },
        WhichKeyDesc =                          { fg = halloween.cyan, style = 'italic' },
        WhichKeySeperator =                     { fg = halloween.accent },
        WhichKeyFloating =                      { bg = halloween.float },
        WhichKeyFloat =                         { bg = halloween.float },

        -- LspSaga
        LspFloatWinNormal =                     { fg = halloween.text, bg = halloween.bg },
        LspFloatWinBorder =                     { fg = halloween.purple },
        DiagnosticError =                       { fg = halloween.error },
        DiagnosticWarning =                     { fg = halloween.yellow },
        DiagnosticInformation =                 { fg = halloween.paleblue },
        DiagnosticHint =                        { fg = halloween.purple },
		LspSagaDiagnosticBorder =				{ fg = halloween.gray },
		LspSagaDiagnosticHeader =				{ fg = halloween.blue },
		LspSagaDiagnosticTruncateLine =			{ fg = halloween.border },
		LspLinesDiagBorder =					{ fg = halloween.contrast },
		ProviderTruncateLine =					{ fg = halloween.border },
		LspSagaShTruncateLine =					{ fg = halloween.border },
		LspSagaDocTruncateLine =				{ fg = halloween.border },
		LineDiagTruncateLine =					{ fg = halloween.border },
        LspSagaBorderTitle =                    { fg = halloween.cyan },
        LspSagaHoverBorder =                    { fg = halloween.paleblue },
        LspSagaRenameBorder =                   { fg = halloween.green },
        LspSagaDefPreviewBorder =               { fg = halloween.green },
        LspSagaCodeActionTitle =                { fg = halloween.paleblue },
        LspSagaCodeActionContent =              { fg = halloween.purple },
        LspSagaCodeActionBorder =               { fg = halloween.blue },
		LspSagaCodeActionTruncateLine =			{ fg = halloween.border },
        LspSagaSignatureHelpBorder =            { fg = halloween.pink },
        LspSagaFinderSelection =                { fg = halloween.green },
		-- LspSagaAutoPreview =					{ fg = halloween.red },
        ReferencesCount =                       { fg = halloween.purple },
        DefinitionCount =                       { fg = halloween.purple },
		DefinitionPreviewTitle =				{ fg = halloween.green },
        DefinitionIcon =                        { fg = halloween.blue },
        ReferencesIcon =                        { fg = halloween.blue },
        TargetWord =                            { fg = halloween.cyan },

        -- BufferLine
        BufferLineIndicatorSelected =           { fg = halloween.accent },
        BufferLineFill =                        { bg = halloween.bg_alt },

        -- Sneak
        Sneak =                                 { fg = halloween.bg, bg = halloween.accent },
        SneakScope =                            { bg = halloween.selection },

        -- Indent Blankline
        IndentBlanklineChar =                   { fg = halloween.indentHlDefault },
        IndentBlanklineContextChar =            { fg = halloween.indentHlContext },

        -- Nvim dap
        DapBreakpoint =                         { fg = halloween.red },
        DapStopped =                            { fg = halloween.green },

		-- Illuminate
		illuminatedWord =						{ bg = halloween.highight },
		illuminatedCurWord =					{ bg = halloween.highight },

		-- Hop
		HopNextKey = 							{ fg = halloween.orange, style = "bold" },
		HopNextKey1 = 							{ fg = halloween.blue, style = "bold" },
		HopNextKey2 = 							{ fg = halloween.blue },
		HopUnmatched = 							{ fg = halloween.comments },
    }
    -- Options:

    -- Disable nvim-tree background
        if vim.g.halloween_disable_background == true then
            plugins.NvimTreeNormal =                        { fg = halloween.comments, bg = halloween.none }
        else
            plugins.NvimTreeNormal =                        { fg = halloween.comments, bg = halloween.sidebar }
        end

    return plugins

end

-- LuaFormatter on
return theme
