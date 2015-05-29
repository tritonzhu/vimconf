" 判断是终端还是 Gvim 
if has("gui_running")
	let g:isGUI = 1
else
	let g:isGUI = 0
endif

"不兼容vi
set nocompatible 

"no backup
set nobackup
set nowb
set noswapfile

"中文显示
set fileencodings=utf-8,chinese,latin-1 ",ucs-bom,gbk,big5
let LANG="zh_CN.UTF-8"
set termencoding=utf-8
set encoding=utf-8

"显示行号
set number
"显示标尺
set ruler

"背景与配色
if g:isGUI
	set background=light
else
	set background=dark
endif
set t_Co=256
colorscheme molokai

"语法高亮
filetype plugin on
syntax on

"高亮显示当前行
set cursorline
":hi CursorLine cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white
":hi CursorColumn cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

"tab切换为4个空格
set expandtab
set smarttab
set tabstop=4

"查找时忽略大小写
set ignorecase smartcase

"高亮显示结果
set hlsearch

"在输入要搜索的文字时，vim会实时匹配
set incsearch

"根据文件缩进
filetype plugin indent on
set ai
set si

"缩进宽度为4个空格
set shiftwidth=4

"键盘映射
map tn <ESC>:tabnew
map gv <ESC>:vsplit
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"cscope
set cscopetag

"tags
set tags=ctags
set autochdir

"插件配置

" ----- vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" 使用Vundle来管理Vundle
Plugin 'gmarik/Vundle.vim'

" vundle管理的插件
Plugin 'a.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()
filetype plugin on

"----- vundle 配置结束

"Tagbar
let g:tagbar_autofocus = 1
nmap tt <ESC>::TagbarToggle<CR>

"UltiSnips
let g:UltiSnipsUsePythonVersion=2
let g:UltiSnipsExpandTrigger="<tab>"                                    
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<C-e>"

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_key_invoke_completion = '<M-;>'
nmap <A-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR> 


"NERD_Tree
nmap nt <ESC>:NERDTree<CR>

"Undotree
nmap ut <ESC>:UndotreeToggle<CR>
