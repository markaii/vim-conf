" >^.^<
" 关闭vi兼容,必须放在第一行
set nocompatible

" 语法高亮
if has("syntax")
    syntax on
endif

" 处理未保存文件时弹出确认
set confirm

" 黑色背景
set background=dark

" 配色方案
colorscheme molokai

" 自动对齐
set autoindent

" 智能对齐
set smartindent

" 显示行号
set number

" 打开状态栏标尺
set ruler

" 显示状态行
set laststatus=2

" 高亮显示对应的括号
set showmatch

" 在状态行显示目前所执行的命令，未完成的指令片段亦会显示出来
set showcmd

" 与电脑共享剪贴板
set clipboard+=unnamed

" 将md文件的类型转成markdown
" autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" 将ejs文件的类型转成html
autocmd BufNewFile,BufReadPost *.ejs set filetype=html

""""""""""""缩进"""""""""""""""
" 打开文件类型\插件\缩进检测
filetype plugin indent on

" 默认设置4个字符缩进
" 设置tab键宽度
set tabstop=4

set softtabstop=4
set shiftwidth=4

" 用空格代替tab
set expandtab

" 设置javascript, coffeescript, html, css, less, sass, coffeescript, json, xml缩进2个字符
autocmd FileType javascript,coffee,html,htm,css,less,sass,coffee,json,xml set tabstop=2
autocmd FileType javascript,coffee,html,htm,css,less,sass,coffee,json,xml set shiftwidth=2
autocmd FileType javascript,coffee,html,htm,css,less,sass,coffee,json,xml set softtabstop=2

""""""""""""插件安装"""""""""""""
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" 添加插件的地方
" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" 配色方案
Plugin 'altercation/vim-colors-solarized'

" 窗口管理
Plugin 'winmanager'
" 目录管理
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

" 查找
Plugin 'grep.vim'

" 标签列表
Plugin 'tagbar'

" 自动补全插件YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" javascript自动补全
Plugin 'marijnh/tern_for_vim'

" 代码检查插件 syntastic
Plugin 'scrooloose/syntastic'

" 代码片段补全UltiSnips
" Track the engine.
 Plugin 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
 Plugin 'honza/vim-snippets'

" 引号配对补全
Plugin 'Raimondi/delimitMate'

" html/xml标签配对补全
Plugin 'docunext/closetag.vim'

call vundle#end()
filetype plugin indent on

""""""""""""插件配置"""""""""""""
" 启动WinManager
let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>

""""NerdTree配置""""
" 设置F9快捷键
map <F9> :NERDTreeToggle<CR>

""""NerdCommenter""""
"修改<leader>的映射为','
let mapleader="," 

""""Grep F3-工程内查找""""
nnoremap <silent> <F3> :Grep<CR>

""""F8打开标签列表""""
nmap <F8> :TagbarToggle<CR>

""""YouCompleteMe配置""""
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 自动补全配置
set completeopt=longest,menu
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" :
"\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" :
"\<PageUp>"

let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1   " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2   "从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0    " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1  " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>  "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>   "open locationlist
"nnoremap <leader>lc :lclose<CR>  "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0


""""syntastic配置""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""ultisnips配置""""
"Trigger configuration
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""""closetag配置""""
let g:closetag_html_style=1

""""delimitMate配置""""
" for python docstring ", 特别有用
au FileType python let b:delimitMate_nesting_quotes = ['"']
" 关闭某些类型文件的自动补全
"au FileType mail let b:delimitMate_autoclose = 0
