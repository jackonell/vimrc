"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

"==============================================================================
"Plugins
"==============================================================================
call plug#begin('~/.vim/plugged')

"------------------------代码导航----------------------------------------------
Plug 'scrooloose/nerdtree'             "项目文件列表
Plug 'rking/ag.vim'                    "全局搜索
Plug 'majutsushi/tagbar'               "tag列表

"------------------------外观--------------------------------------------------
Plug 'bling/vim-airline'               "美化导航栏字体，需要额外安装字体
Plug 'vim-airline/vim-airline-themes'

"------------------------代码编写工具------------------------------------------
Plug 'SirVer/ultisnips'                "代码块自动补全
Plug 'honza/vim-snippets'              "代码块集合
Plug 'tpope/vim-surround'              "括号，引号，XML标签等
Plug 'tpope/vim-fugitive'              "Git
Plug 'airblade/vim-gitgutter'          "使用GIT展示哪一行被修改过
Plug 'bronson/vim-trailing-whitespace' "处理空白
Plug 'junegunn/vim-easy-align'         "简单对齐
Plug 'scrooloose/nerdcommenter'        "注释
Plug 'Valloric/YouCompleteMe'          "代码补全
Plug 'Lokaltog/vim-easymotion'         "快速移动
Plug 'jiangmiao/auto-pairs'            "括号、引号等自动补全

"-----------------------代码查找工具-------------------------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "安装fzf
Plug 'junegunn/fzf.vim' "fzf配置

"-----------------------代码运行调试工具---------------------------------------
"-----------------------语言---------------------------------------------------
"-----------------------其他---------------------------------------------------

call plug#end()

filetype on
filetype plugin on
filetype plugin indent on

" ###################
" ### Plugin conf ###
" ###################

" ----------------
"       GIT
" ----------------
highlight clear SignColumn
highlight SignColumn ctermbg=0
nmap gn <Plug>(GitGutterNextHunk)
nmap gN <Plug>(GitGutterPrevHunk)

" ----------------
"    easymotion
" ----------------
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
nmap ss <Plug>(easymotion-s2)
nmap sh <Plug>(easymotion-linebackward)
nmap sj <Plug>(easymotion-j)
nmap sk <Plug>(easymotion-k)
nmap sl <Plug>(easymotion-lineforward)
nmap sw <Plug>(easymotion-w)
nmap se <Plug>(easymotion-e)
nmap s. <Plug>(easymotion-repeat)

"-------------------
" NERDTree settings
" ------------------
"autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
nmap <space>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"------------------
" tagbar settings
"------------------
nmap <space>v :TagbarToggle<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py call tagbar#autoopen()

"------------------
" AirLine settings
"------------------
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled=1
nmap <space>] :bn<CR>
nmap <space>[ :bp<CR>
set t_Co=256[]

"------------------
" UltiSnips settings
"------------------
"let g:UltiSnipsExpandTrigger="<c-g>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"------------------
"" fzf settings
"------------------
nnoremap <space><space> :Files<CR>
nnoremap <space>b :Buffers<CR>

nmap # :Ag --ignore=tags <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag --ignore=tags

vnoremap <silent> <Enter> :EasyAlign<cr>

"------------------
" YCM settings
"------------------
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_server_python_interpreter='/home/brooks/anaconda3/bin/python3.6'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1"
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::','re!\w{2}'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

" #####################
" ### Personal conf ###
" #####################

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set bs=2		        " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
			            " than 50 lines of registers
set history=1000	    " keep 100000 lines of command line history
set ruler		        " show the cursor position all the time

syntax enable " syntax highlighting
set hlsearch " highlight searches
set visualbell " no beep
set t_Co=256
set term=xterm-256color

nnoremap ; :
" move between splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" -- sudo save
cmap w!! w !sudo tee >/dev/null %

" Tabulation management
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cindent
set cinoptions=(0,u0,U0
set cursorline
set nu

" Spellchecking
if has("spell") " if vim support spell checking
    " Download dictionaries automatically
    if !filewritable($HOME."/.vim/spell")
        call mkdir($HOME."/.vim/spell","p")
    endif
    set spellsuggest=10 " z= will show suggestions (10 at most)
    " spell checking for text, HTML, LaTeX, markdown and literate Haskell
    autocmd BufEnter *.txt,*.tex,*.html,*.md,*.ymd,*.lhs setlocal spell
    autocmd BufEnter *.txt,*.tex,*.html,*.md,*.ymd,*.lhs setlocal spelllang=fr,en
    " better error highlighting with solarized
    highlight clear SpellBad
    highlight SpellBad term=standout ctermfg=2 term=underline cterm=underline
    highlight clear SpellCap
    highlight SpellCap term=underline cterm=underline
    highlight clear SpellRare
    highlight SpellRare term=underline cterm=underline
    highlight clear SpellLocal
    highlight SpellLocal term=underline cterm=underline
endif

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cuda'
        exec "!nvcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -std=c++11 -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cuda'
        exec "!nvcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        exec ":!time bash %"
    elseif &filetype == 'python'
        exec "!time python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'markdown'
        exec "!typora % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    endif
endfunc

map <F6> :call OpenFolder()<CR>
func! OpenFolder()
    exec "w"
    exec "!nautilus % &"
endfunc

