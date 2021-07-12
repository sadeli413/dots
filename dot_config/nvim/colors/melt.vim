" Sadeli's colorscheme

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "melt"
hi Normal           guifg=#8dd1e3   guibg=NONE      gui=NONE
hi Comment          guifg=#204E64   guibg=NONE      gui=NONE
hi Constant         guifg=#8BE8CB   guibg=NONE      gui=NONE
hi Special          guifg=#A16015   guibg=NONE      gui=NONE
hi Identifier       guifg=#3AE2FC   guibg=NONE      gui=NONE
hi Statement        guifg=#E49E22   guibg=NONE      gui=bold
hi PreProc          guifg=#A4B0F5   guibg=NONE      gui=NONE
hi Type             guifg=#477988   guibg=NONE      gui=bold
hi Underlined       guifg=#62929e   guibg=NONE      gui=NONE
hi Ignore           guifg=#0d0d0c   guibg=NONE      gui=NONE
hi Error            guifg=#ffffff   guibg=#DF2935   gui=NONE
hi Todo             guifg=#62929e   guibg=NONE      gui=NONE
hi Pmenu            guifg=#8dd1e3   guibg=#45534E   gui=NONE
hi PmenuSel         guifg=#45534E   guibg=#8dd1e3   gui=NONE
hi NormalFloat      guifg=#8dd1e3   guibg=#45534E   gui=NONE
hi CocUnderline     gui=underline

hi link String          Constant
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
hi link CocFloating     NormalFloat
hi link CocErrorFloat   NormalFloat
hi link CocErrorFloat   NormalFloat
hi link CocWarningFloat NormalFloat
hi link CocInfoFloat    NormalFloat
hi link CocHintFloat    NormalFloat
