" Vim syntax file
"
" Add this line to your init.vim:
"   au BufRead,BufNewFile *.km setfiletype km
"
" Or this statement to your init.lua:
"   vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
"     pattern = {"*.km"},
"     command = "setfiletype km",
"   })

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "km"

" Instructions
syn keyword kmInst mov add sub str ldr svc nop

" Registers
syn keyword kmReg r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 fp lr sp pc rz

" Comments
syn match kmComment "#.*$"

" Numbers
syn match kmNumber '\d\+'
syn match kmNumber '0o\d\+'
syn match kmNumber '0b\d\+'
syn match kmNumber '0x\x\+'
syn match kmNumber '-\d\+'
syn match kmNumber '-0o\d\+'
syn match kmNumber '-0x\d\+'

hi def link kmInst Statement
hi def link kmReg Identifier
hi def link kmComment Comment
hi def link kmNumber Constant
hi def link kmSemicolon Special
