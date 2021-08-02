-- Colorscheme

-- Set the background to dark
vim.o.background="dark"

-- Reset syntax
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

-- Name the colorscheme
vim.g.colors_name="toast"

-- Colors
vim.cmd([[
hi Normal               guifg=#e9e0cd   guibg=#0a0c0b   gui=NONE
hi Comment              guifg=#958C73   guibg=NONE      gui=NONE
hi Constant             guifg=#8CA1CF   guibg=NONE      gui=NONE
hi String               guifg=#728576   guibg=NONE      gui=NONE
hi Special              guifg=#E7AC67   guibg=NONE      gui=NONE
hi Identifier           guifg=#9BEACA   guibg=NONE      gui=NONE
hi Statement            guifg=#E7AC67   guibg=NONE      gui=bold
hi PreProc              guifg=#B4ADEA   guibg=NONE      gui=NONE
hi Type                 guifg=#C6BCA1   guibg=NONE      gui=bold
hi Underlined           guifg=#e9e0cd   guibg=NONE      gui=NONE
hi Ignore               guifg=#0a0c0b   guibg=NONE      gui=NONE
hi Error                guifg=#0a0c0b   guibg=#F0386B   gui=NONE
hi Todo                 guifg=#8CA1CF   guibg=NONE      gui=NONE
hi Pmenu                guifg=#e9e0cd   guibg=#686B69   gui=NONE
hi PmenuSel             guifg=#0a0c0b   guibg=#e9e0cd   gui=NONE
hi NormalFloat          guifg=#e9e0cd   guibg=#686B69   gui=italic
hi LineNr               guifg=#728576   guibg=NONE      gui=NONE
hi CursorLineNR         guifg=#E7AC67   guibg=NONE      gui=NONE
hi Cursorline           guifg=NONE      guibg=#2A2B2E   gui=NONE
hi Cursor               guifg=#e9e0cd   guibg=#e9e0cd
hi iCursor              guifg=#e9e0cd   guibg=#e9e0cd
hi EndOfBuffer          guifg=#958C73   guibg=NONE      gui=NONE
hi IndentBlankLineChar  guifg=#2A2B2E   guibg=NONE      gui=nocombine
hi Search               guifg=NONE      guibg=#DBBB76   gui=NONE

hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Function        Identifier
hi link Conditional     Statement
hi link Repeat          Statement
hi link Label           Statement
hi link Operator        Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
]])
