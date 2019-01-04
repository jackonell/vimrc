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

"------------------------代码编写工具------------------------------------------
Plug 'SirVer/ultisnips'                "代码块自动补全
Plug 'honza/vim-snippets'              "代码块集合
Plug 'tpope/vim-surround'              "括号，引号，XML标签等
Plug 'tpope/vim-fugitive'              "Git
Plug 'tpope/vim-gitgutter'             "使用GIT展示哪一行被修改过
Plug 'bronson/vim-trailing-whitespace' "处理空白
Plug 'junegunn/vim-easy-align'         "简单对齐

"-----------------------代码查找工具-------------------------------------------

"-----------------------代码运行调试工具---------------------------------------
"-----------------------语言---------------------------------------------------
"-----------------------其他---------------------------------------------------
Plug 'wakatime/vim-wakatime'           "记录编程时间

call plug#end()

set nocompatible
" ###################
" ### Plugin conf ###
" ###################

" ----------------
"       GIT
" ----------------

" -- vim-gitgutter
highlight clear SignColumn
highlight SignColumn ctermbg=0
nmap gn <Plug>GitGutterNextHunk
nmap gN <Plug>GitGutterPrevHunk

" -----------------
"       THEME
" -----------------

" -- solarized theme
"set background=dark
"try
"    colorscheme solarized
"catch
"endtry

" ----------------------------
"       File Management
" ----------------------------
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default " #use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :vsplit<cr> :<C-u>Unite -start-insert file_rec/async<cr>
nnoremap <space>f :vsplit<cr> :<C-u>Unite file<cr>
nnoremap <space>g :vsplit<cr> :<C-u>Unite -start-insert file_rec/git<cr>
nnoremap <space>b :vsplit<cr> :<C-u>Unite buffer<cr>
" see the yank history
nnoremap <space>y :vsplit<cr>:<C-u>Unite history/yank<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)

" #####################
" ### Personal conf ###
" #####################

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set bs=2		        " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
			            " than 50 lines of registers
set history=10000	    " keep 100000 lines of command line history
set ruler		        " show the cursor position all the time

syntax enable " syntax highlighting
set hlsearch " highlight searches


set visualbell " no beep

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

" Easy align interactive
vnoremap <silent> <Enter> :EasyAlign<cr>

" .ymd file type
autocmd BufEnter *.ymd set filetype=markdown
autocmd BufEnter *.cljs,*.cljs.hl set filetype=clojure
" -- Reload browser on cljs save
"  don't forget to put <script src="http://localhost:9001/ws"></script>
"  in your HTML
" au BufWritePost *.cljs :BCReloadPage

" ========
" Personal
" ========

" Easier anti-quote
imap éé `

" -- show the column 81
" if (exists('+colorcolumn'))
"     set colorcolumn=80
"     highlight ColorColumn ctermbg=1
" endif

" --- type # to search the word in all files in the current dir
nmap # :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag

" -- js beautifer
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call JsBeautify()<cr>

" set noswapfile

" -- vim-pandoc folding
let g:pandoc#modules#disabled = ["folding"]

set ai
set cursorline
set nu

nnoremap ; :
"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap < <><ESC>i
"inoremap { {}<ESC>i
"inoremap { {<CR>}<ESC>0

map <c-j> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3.6 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc
