" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set selection=exclusive
set selectmode=mouse,key

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle
"required

Bundle 'gmarik/vundle'

"My Bundle here:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"语法高亮
"""""""""""""""""""""""""""""

"above the Vim UI
"""""""""""""""""""""""""""""
Bundle 'winmanager'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'taglist.vim'

"AutoComplet
""""""""""""""""""""""""""""
Bundle 'Pydiction'
Bundle 'AutoComplPop'
Bundle 'closetag.vim'

"search
""""""""""""""""""""""""""""
Bundle 'cscope.vim'

"syntax and style checker
""""""""""""""""""""""""""""
Bundle 'vim-flake8'

"unittest
""""""""""""""""""""""""""""
Bundle 'vim-pyunit'

"Tools
""""""""""""""""""""""""""""
Bundle 'grep.vim'

"Color
""""""""""""""""""""""""""""
Bundle 'TagHighlight'
Bundle 'vim-color-solarized'

"auto-complete for quotes, etc
""""""""""""""""""""""""""""
Bundle 'delimitMate'
Bundle 'vim-surround'

"tab
""""""""""""""""""""""""""""
Bundle 'supertab'

"markdown
""""""""""""""""""""""""""""
"Bundle 'markdown'
"Bundle 'instant-markdown-d'

filetype indent plugin on "required
"
" Brief help
" :BundleList
" :BundleInstall(!)
" :BundleSearch(!)
" :BundleClean(!)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2

set ruler

"for copy convient, use <F2> to on/off number display
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
set number

set modeline

set tabstop=4
set shiftwidth=4
set expandtab

set softtabstop=4
set autoindent
set smartindent

set background=dark

"与windows共享剪贴板
set clipboard+=unnamed

"Tags的设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按照名称排序
let Tlist_Sort_Type = "name"

" 在右侧显示窗口
let Tlist_Use_Right_Window = 0
 
" 压缩方式
let Tlist_Compart_Format = 1
 
" 如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_Exist_OnlyWindow = 1
                  
" 不要关闭其他文件的tags
let Tlist_File_Fold_Auto_Close = 0
                       
" 不要显示折叠树
let Tlist_Enable_Fold_Column = 0

" 设置全局tags
set tags+=/usr/include/tags
set tags+=/home/markaii/Work/Python/qrcard-web/trunk/qrcard

" Taglist
"""""""""""""""""""""""""""""""""""""""
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 0"开启vim后焦点在taglist上
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 1 
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 1
let Tlist_Show_One_File = 0
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 30
"let Tlist_WinHeight = 20
nnoremap <silent> <F8> :TlistToggle<CR> 

"启动WinManager
let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>

"NerdTree
"""""""""""""""""""""""""""""""""""""""""""""
"设置F9快捷键
map <F9> :NERDTreeToggle<CR>

"NerdCommenter
"""""""""""""""""""""""""""""""""""""""""""""
let mapleader="," "修改<leader>的映射为','

"Grep F3-工程内查找
"""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F3> :Grep<CR>

"flake8 tip
"""""""""""""""""""""""""""
" autocmd BufWritePost *.py call Flake8()
let g:flake8_ignore="F403,E501"

"python sp
"""""""""""""""""""""""""""""""""""""""""""""
"pydiction 1.2 python auto complete
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
"defalut g:pydiction_menu_height == 15    
let g:pydiction_menu_height = 20 

"supertab
""""""""""""""""

"color-settings
set t_Co=256
set background=dark
"colorscheme solarized
colorscheme molokai

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
