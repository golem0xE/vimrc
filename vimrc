set nocompatible
filetype off                  " required!
set exrc

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" My bundles here:
"
Plugin 'rhysd/vim-clang-format'
Plugin 'kana/vim-operator-user'
Plugin 'Rip-Rip/clang_complete'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'SirVer/ultisnips'
Plugin 'vim-scripts/grep.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'cohama/lexima.vim'
let g:lexima_accept_pum_with_enter = 1
Plugin 'sjbach/lusty'
Plugin 'dbakker/vim-projectroot'
Plugin 'honza/vim-snippets'
Plugin 'lyuts/vim-rtags'
Plugin 'gioele/vim-autoswap'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/SpellCheck'
Plugin 'vim-scripts/ingo-library'

" vim-scripts repos
"Plugin 'AutoClose'

call vundle#end()

filetype plugin indent on
filetype on
syntax on

set background=dark
set t_Co=256
"colorscheme dante_modified
let g:airline_powerline_fonts = 1
"Display statusline all the time
set laststatus=2
let g:airline_theme='dante_modified'

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
au BufNewFile,BufRead *.supp set ft=supp
set matchpairs+=<:>

" Fix home/end key in all modes
map <esc>OH <home>
cmap <esc>OH <home>
imap <esc>OH <home>
map <esc>OF <end>
cmap <esc>OF <end>
imap <esc>OF <end>

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
nmap <silent> <F7> :SpellCheck<CR>
nmap <silent> <F8> :set nospell<CR>
nmap <silent> <F10> :ClangFormat<CR>

"surround
xnoremap <leader>s) xi()<Esc>P
xnoremap <leader>s} xi{}<Esc>P

"Highlight errors
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=red

let Grep_Skip_Dirs = '.svn'
let Grep_Skip_Dirs = '.git'
let g:C_SourceCodeExtensions  = 'h hpp cc cp cxx cpp CPP c++ C i ii'

let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*
let g:Imap_UsePlaceHolders = 0
let g:Tex_SmartKeyDoti = 0

"let g:syntastic_cpp_checkers = ['clang_check', 'clang_tidy']
"let g:syntastic_c_checkers = ['clang_check', 'clang_tidy']
let g:syntastic_cpp_checkers = ['check']
let g:syntastic_c_checkers = ['check']
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_cpp_check_header=1
let g:syntastic_c_check_header=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }
let g:syntastic_auto_jump = 1
"let g:syntastic_debug=2

let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✘▶'
let g:syntastic_warning_symbol = '☢▶'
let g:syntastic_style_error_symbol = 'ᐅᐅ'
let g:syntastic_style_warning_symbol = 'ᐅᐅ'

hi SyntasticErrorSign ctermfg=9
hi SyntasticWarningSign ctermfg=yellow
hi SyntasticStyleErrorSign ctermfg=cyan
hi SyntasticStyleWarningSign ctermfg=69

nmap <leader>sc :SyntasticCheck<CR>
nmap <leader>sr :SyntasticReset<CR>

map <leader>ns :lnext<CR>
map <leader>ps :lprevious<CR>

let g:clang_user_options = '-std=c++11'
let g:clang_use_library = 1
let g:clang_memory_percent = 50
let g:clang_auto_select = 1
let g:clang_auto_user_options = "compile_commands.json"

set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
"let g:clang_conceal_snippets=1
"let g:clang_snippets_engine='clang_complete'
let g:clang_snippets_engine='ultisnips'
"let g:clang_library_path='/usr/lib/x86_64-linux-gnu'
set completeopt-=preview
let g:clang_debug=0
let g:clang_diagsopt = ''

let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsSnippetsDir='~/.vim/bundle/ultisnips/UltiSnips'

let g:clang_format#command='clang-format'
let g:clang_format#detect_style_file = 1

" if you install vim-operator-user
autocmd FileType c,cpp,h,hpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

let delimitMate_expand_cr = 1

"additional vim c++ syntax highlighting
let g:cpp_class_scope_highlight = 1

"let g:miniBufExplorerMoreThanOne = 0
