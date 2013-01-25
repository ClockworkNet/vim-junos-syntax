" Vim syntax file
" Language:     Junos Configuration
" Maintainer:   Tim Zehta <tim@clockwork.net>
" Last Change:  2013-01-25
" Version:      1
" URL:          https://github.com/ClockworkNet/vim-junos-syntax
" Credits:      ...
"
" Quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

setlocal iskeyword+=-

" Comments
syn region junosComment start=#\V/*# end=#\V*/# oneline contains=junosURL
syn match junosComment /^\s*##\s.*$/ contains=junosURL

" Constants
syn match junosConstant /\vany(;)@=/
syn match junosConstant /\vcritical(;)@=/
syn keyword junosConstant emergency
syn keyword junosConstant error
syn keyword junosConstant inet
syn keyword junosConstant info
syn match junosConstant /\vinteractive-commands( \{)@=/
syn match junosConstant /\vjunos-[a-z-]+/
syn keyword junosConstant messages
syn keyword junosConstant super-user
syn keyword junosConstant syn-cookie
syn keyword junosConstant xterm

" Debug
syn match junosHeader /^version 12.1R1.9;/

" Errors
syn match junosError /## SECRET-DATA.*/

" Functions
syn match junosFunction /\v^\s*[a-z-]{3,}(;)@=/
syn match junosFunction /\v^\s*[a-z-]{3,} (.+;)@=/
syn keyword junosFunction files
syn keyword junosFunction high
syn keyword junosFunction low
syn keyword junosFunction next-hop
syn keyword junosFunction priority
syn keyword junosFunction size
syn match junosFunction /to zone/
syn keyword junosFunction type
syn keyword junosFunction zone

" IPs
syn match junosCIDRsep #/# contained
syn match junosIP /\v(\d{1,3}\.){3}\d{1,3}(\/\d{1,2})?/ contains=junosCIDRsep

" Statements
syn match junosStatement /\v^\s*[a-z-]+( \{$)@=/
syn match junosStatement /\v^\s*[a-z-]+ (.+\{$)@=/
syn keyword junosStatement to-zone

" Strings
syn region junosString start=#"# end=#"# skip=#\\\\\|\\"# oneline contains=junosVariable
syn region junosString start=#'# end=#'# skip=#\\\\\|\\'# oneline contains=junosVariable

" Symbols
syn match junosSymbol /[{}]/
syn match junosSymbol /\v\[|\]|;$/

" URLs
syn match junosURL #\vhttps?://[[:graph:]]+# contains=junosSymbol

" Variables
syn match junosVariable /\V<*>/
syn match junosVariable /[$]{[^}]\+}/
syn match junosVariable /\V*/


" Highlight
hi link junosComment Comment
hi link junosConstant Constant
hi link junosError Error
hi link junosFunction Function
hi link junosHeader Debug
hi link junosIP Label
hi link junosStatement Statement
hi link junosString String
hi link junosSymbol Delimiter
hi link junosURL Underlined
hi link junosVariable Identifier


let b:current_syntax = "junos"
