set nocompatible
filetype off                  " required!
set exrc

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles here:
"
Bundle 'rhysd/vim-clang-format'
Bundle 'kana/vim-operator-user'
Bundle 'Rip-Rip/clang_complete'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'SirVer/ultisnips'
Bundle 'vim-scripts/grep.vim'
Bundle 'vim-scripts/Cpp11-Syntax-Support'
Bundle 'vim-scripts/a.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Raimondi/delimitMate'
Bundle 'sjbach/lusty'
Bundle 'dbakker/vim-projectroot'
Bundle 'honza/vim-snippets'
Bundle 'lyuts/vim-rtags'
Bundle 'gioele/vim-autoswap'

" vim-scripts repos
"Bundle 'AutoClose'

call vundle#end()

"compiler! gcc
filetype plugin indent on
syntax on
filetype on

set t_Co=256
let g:airline_powerline_fonts = 1
highlight Search ctermbg=cyan ctermfg=black

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent
set cindent

set showmatch
set cursorline
set hlsearch
set hidden

au BufNewFile,BufRead *.lcf set filetype=c
au BufNewFile,BufRead *.cpp set syntax=cpp11
au BufNewFile,BufRead *.hpp set syntax=cpp11
au BufNewFile,BufRead *.h set syntax=cpp11
au BufNewFile,BufRead *.supp set ft=supp
set matchpairs+=<:>

map <C-b> :MBEOpen<CR>
map <C-c> :MBEClose<CR>
noremap <silent> <C-f> :Rgrep<cword><CR>
noremap <silent> <S-f> :Rgrep<CR>
map < :bprev<CR>
map > :bnext<CR>
" folding
"nmap <silent> <F2> :setl foldmethod=syntax<CR>
set foldmethod=syntax   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
" close buffer
nmap <silent> <F4> :bd<CR>
nmap <silent> <F7> :set spell<CR>
nmap <silent> <C-F7> :set nospell<CR>
nmap <silent> <F10> :ClangFormat<CR>

let g:alternateSearchPath = 'reg:#\<Source\>$#Include#,reg:#\<Include\>$#Source#'

let Grep_Skip_Dirs = '.svn'
let Grep_Skip_Dirs = '.git'
let Grep_Skip_Dirs = 'Doc'
let g:C_SourceCodeExtensions  = 'h hpp cc cp cxx cpp CPP c++ C i ii'

let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*
let g:Imap_UsePlaceHolders = 0
let g:Tex_SmartKeyDoti = 0

"let g:syntastic_debug=1
let g:syntastic_cpp_checkers = ['clang_check']
"let g:syntastic_cpp_clang_check_post_args = ""
let g:syntastic_clang_check_config_file ='.syntastic_cfg'
let g:syntastic_cpp_check_header=1

let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '▶✘'
let g:syntastic_warning_symbol = '▶❓'
let g:syntastic_style_error_symbol = 'ᐅᐅ'
let g:syntastic_style_warning_symbol = 'ᐅᐅ'
hi clear SignColumn
hi SyntasticErrorSign ctermfg=9
hi SyntasticWarningSign ctermfg=yellow
hi SyntasticStyleErrorSign ctermfg=cyan
hi SyntasticStyleWarningSign ctermfg=69

set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" " The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'
"let g:clang_snippets_engine='ultisnips'
"let g:clang_library_path='/usr/lib/llvm-3.5/lib'
let g:clang_library_path='/usr/lib/x86_64-linux-gnu'
set completeopt-=preview
let g:clang_debug=0

let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsSnippetsDir='~/.vim/bundle/ultisnips/UltiSnips'

let g:clang_format#command='clang-format-3.5'
let g:clang_format#style_options = {
    \ "Language" : "Cpp",
    \ "AccessModifierOffset" : -4,
    \ "UseTab" : "Never",
    \ "BreakBeforeBraces" : "Allman",
    \ "AllowShortIfStatementsOnASingleLine" : "false",
    \ "AllowShortFunctionsOnASingleLine" : "true",
    \ "AllowShortLoopsOnASingleLine" : "false",
    \ "BreakConstructorInitializersBeforeComma" : "false",
    \ "AlignEscapedNewlinesLeft" : "true",
    \ "IndentCaseLabels" : "true",
    \ "ColumnLimit" : 90,
    \ "IndentWidth" : 4,
    \ "NamespaceIndentation" : "None",
    \ "MaxEmptyLinesToKeep" : 1,
    \ "PointerBindsToType" : "true",
    \ "SpaceBeforeParens" : "ControlStatements",
    \ "SpaceBeforeAssignmentOperators" : "true",
    \ "SpaceInEmptyParentheses" : "false",
    \ "SpacesInParentheses" : "false",
    \ "Standard" : "Auto"}
autocmd FileType c,cpp,h,hpp map <buffer><Leader>x <Plug>(operator-clang-format)

let delimitMate_expand_cr = 1

