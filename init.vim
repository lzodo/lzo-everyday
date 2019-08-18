" -----------------------------------------------------------------------------
" Vundle 插件安装 
" -----------------------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"---------美化插件
Plugin 'yggdroot/indentline'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasr/molokai'
Plugin 'mhinz/vim-startify'
"---------查找插件
Plugin 'ctrlpvim/ctrlp.vim' "查找缓存区的历史文件:CtrlP <c-f><c-b>切换页面
"---------web前端相关插件
Plugin 'posva/vim-vue'  
Plugin 'pangloss/vim-javascript'
Plugin 'ap/vim-css-color'
Plugin 'mattn/emmet-vim'
Plugin 'shmargum/vim-sass-colors'
Plugin 'fleischie/vim-styled-components'
Plugin 'leshill/vim-json'
Plugin 'dense-analysis/ale' 
"---------功能插件
Plugin 'tpope/vim-surround' "快速对一段文本加上扩号，引号等等
"---------其他插件
Plugin 'easymotion/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'marijnh/tern_for_vim'
" Plugin 'honza/vim-snippets'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'Raimondi/delimitMate'
" 
" Plugin 'rking/ag.vim'
Plugin 'mileszs/ack.vim'
" Plugin 'dyng/ctrlsf.vim'
Plugin 'majutsushi/tagbar'
Plugin 'heavenshell/vim-jsdoc'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'vim-scripts/matchit.zip'

" Plugin 'tomtom/tcomment_vim'
" Plugin 'terryma/vim-multiple-cursors'

 Plugin 'scrooloose/syntastic'
" Plugin 'klen/python-mode'
" Plugin 'xolox/vim-lua-ftplugin'
" Plugin 'xolox/vim-misc'
" Plugin 'fatih/vim-go'
" Plugin 'gregsexton/gitv'
" Plugin 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'ryanoasis/vim-devicons' "图标字体设置有问题
" Plugin 'noahfrederick/vim-hemisu'
" Plugin 'raymond-w-ko/vim-lua-indent'
" Plugin 'zaki/zazen'

call vundle#end()            " required
filetype plugin indent on    " required

" -----------------------------------------------------------------------------
" 基本配置 
" -----------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

"设置前缀<leader> 默认 \
let mapleader = ","
"设置退个键步长
set backspace=2

"代码高亮 off 取消高亮
syntax on
"设置行号 nonu 取消行号
:set number 
"tab步长
set tabstop=2
"设置左右移动步长
set shiftwidth=2
"窗口上下保持距离
set scrolloff=5

set encoding=UTF-8
set laststatus=2 "总是显示状态栏
set ruler "显示光标位置
set cursorline "高亮显示当前行
set expandtab "扩展制表符号为空格
set tabstop=4 "制表符占空格数
set softtabstop=4 "将连续数量的空格视为一个制表符
set shiftwidth=4 "自动缩进所使用的空白数
set autoindent "打开自动缩进
set wildmenu "vim命令自动补全
set showcmd     "显示输入命令 
set showmode "左下角那一行的状态  
"set mouse=a   "可以在buffer的任何地方使用鼠标
set hlsearch              "显示高亮搜索 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif "将光标定位在文件关闭时的位置

" -----------------------------------------------------------------------------
" vim-surround 插件 
" cs"' //替换"为'  ds" //删除" ysiw" //光标所在单词添加"  yss" //整行添加"
" cst" //将两边html标签为""  V模式给选择元素添加父级  S<p class="Parent">
" -----------------------------------------------------------------------------
    vmap " S"
    vmap ' S'
    vmap ` S`
    vmap [ S[
    vmap ( S(
    vmap { S{
    vmap } S}
    vmap ] S]
    vmap ) S)
    vmap > S>
" -----------------------------------------------------------------------------
" NERDTree 插件
" -----------------------------------------------------------------------------
""当NERDTree为剩下的唯一窗口时自动关闭
"   autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""修改树的显示图标
let NERDTreeAutoCenter=1
" 显示行号
let NERDTreeShowLineNumbers=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=25
" 在终端启动vim时，共享NERDTree
"let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
"let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" nerdtree
let g:NERDTreeDirArrowExpandable = '➢' 
let g:NERDTreeDirArrowCollapsible = '↪'
"map <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>

" NERDTree {{{
let g:NERDTreeDirArrows = 0
" }}}

" nerdtree-git-plugin symbols {{{
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }
" }}}

" -----------------------------------------------------------------------------
" 主题颜色配置
" -----------------------------------------------------------------------------
set guioptions=''
set background=dark   " Background color
set t_Co=256
set guifont=Source\ Code\ Pro\ Light:h19
colorscheme molokai




" -----------------------------------------------------------------------------
" 分屏配置 
" -----------------------------------------------------------------------------

"分别设置向右左上下分屏
map fr :set splitright<CR>:vsplit<CR>
map fl :set nosplitright<CR>:vsplit<CR>
map ft :set nosplitbelow<CR>:split<CR>
map fb :set splitbelow<CR>:split<CR>

"分别进入右上左下分屏
map tr <C-w>l
map tt <C-w>k
map tl <C-w>h
map tb <C-w>j

"使用键盘的上下左右键调整窗口大小
map <C-up> :res +5<CR>
map <C-down> :res -5<CR>
map <C-left> :vertical resize-5<CR>
map <C-right> :vertical resize+5<CR>

"新建tab页面与移动
map nt :tabe<CR>
map lt :-tabnext<CR>
map rt :+tabnext<CR>

map bc :w<CR>
map tc :wq<CR>

" -----------------------------------------------------------------------------
" vim-airline 美化状态栏
" -----------------------------------------------------------------------------
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '░'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◄'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '┋'
let g:airline_symbols.branch = '⎇'

" 是否打开tabline
let g:airline#extensions#tabline#enabled = 1 " 打开后，tabline和tmuxline都可以得到增强


" -----------------------------------------------------------------------------
" vim-easymotion 快速定位
" -----------------------------------------------------------------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap s <Plug>(easymotion-ovgrwin-f)
nmap s <Plug>(easymotion-overwin-f2)

let g:EasyMotion_smartcase = 1

map <C-j> <Plug>(easymotion-j)
map <C-k> <Plug>(easymotion-k)

" -----------------------------------------------------------------------------
" vim-javascript
" -----------------------------------------------------------------------------
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END


" -----------------------------------------------------------------------------
" ale
" -----------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_verilog_checkers = ['verilator','iverilog']
":SyntasticInfo 查看是否iu佩在完成之後可以用:SyntasticInfo查看是否有配置完成
"设置pyflakes为默认的python语法检查工具
let g:syntastic_python_checkers = ['pyflakes']
" -----------------------------------------------------------------------------
" ale
" -----------------------------------------------------------------------------
let b:ale_fixers = ['prettier', 'eslint']
" Equivalent to the above.
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\   'javascript': ['prettier', 'eslint']
\}
" -----------------------------------------------------------------------------
" ack.vim 
" -----------------------------------------------------------------------------

map <F4> :Ack -i
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
" -----------------------------------------------------------------------------
" 其他
" -----------------------------------------------------------------------------
map <leader>l :
map <leader>sx :source ~/.vimrc<cr>
map <leader>nsx :source ~/.config/nvim/init.vim<cr>
map <leader>ee :e ~/.config/nvim/init.vim<cr>
map <leader>bs :e ~/docs<cr>
map <leader>pl :PluginInstall<cr>
map <leader>bs :e ~/docs<cr>
map <leader>bs :e ~/docs<cr>
map <C-HOME> :m-2<CR>
map <C-END> :m+1<CR>
