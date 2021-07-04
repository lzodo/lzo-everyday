:" Vundle {{{
  set nocompatible              " be iMproved, required
  filetype off                  " required
  
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'tpope/vim-surround' "快速对一段文本加上扩号，引号等等
  Plugin 'easymotion/vim-easymotion'
 " Plugin 'Valloric/YouCompleteMe'
 " Plugin 'SirVer/ultisnips'
 " Plugin 'honza/vim-snippets'
 " Plugin 'davidhalter/jedi-vim'
 " Plugin 'Raimondi/delimitMate'
 " 
  Plugin 'ctrlpvim/ctrlp.vim' "查找缓存区的历史文件:CtrlP <c-f><c-b>切换页面
 " Plugin 'dyng/ctrlsf.vim'
  Plugin 'majutsushi/tagbar'
 " Plugin 'rking/ag.vim'
 " Plugin 'Lokaltog/vim-easymotion'
 " Plugin 'vim-scripts/matchit.zip'

 " Plugin 'tomtom/tcomment_vim'
 " Plugin 'terryma/vim-multiple-cursors'

 " Plugin 'scrooloose/syntastic'
 " Plugin 'klen/python-mode'
 " Plugin 'xolox/vim-lua-ftplugin'
 " Plugin 'xolox/vim-misc'
 " Plugin 'fatih/vim-go'
  Plugin 'posva/vim-vue'  
  Plugin 'pangloss/vim-javascript'
  Plugin 'ap/vim-css-color'
  Plugin 'mattn/emmet-vim'
  Plugin 'shmargum/vim-sass-colors'
  Plugin 'fleischie/vim-styled-components'
 " Plugin 'tpope/vim-fugitive'
 " Plugin 'gregsexton/gitv'
 " Plugin 'airblade/vim-gitgutter'
 Plugin 'vim-airline/vim-airline-themes'
 Plugin 'bling/vim-airline'
 " Plugin 'ryanoasis/vim-devicons' "图标字体设置有问题
 " Plugin 'noahfrederick/vim-hemisu'
 " Plugin 'raymond-w-ko/vim-lua-indent'
  Plugin 'tomasr/molokai'
  Plugin 'yggdroot/indentline'
 " Plugin 'zaki/zazen'
  
  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required
  " To ignore plugin indent changes, instead use:
  "filetype plugin on
  "
  " Brief help
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
  "
  " see :h vundle for more details or wiki for FAQ
  " Put your non-Plugin stuff after this line
" }}}

" vim-surround
"    vmap " S"
"    vmap ' S'
"    vmap ` S`
"    vmap [ S[
"    vmap ( S(
"    vmap { S{
"    vmap } S}
"    vmap ] S]
"    vmap ) S)
"    vmap > S>

" nerdtree
	map <C-n> :NERDTreeToggle<CR>

" theme setting {{{
  set guioptions=''
  set background=dark   " Background color
  set t_Co=256
  set guifont=Source\ Code\ Pro\ Light:h19
  colorscheme molokai
" }}}


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
"set mouse=a   "可以在buffer的任何地方使用鼠标
set hlsearch              "显示高亮搜索 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif "将光标定位在文件关闭时的位置
   
"将f1设置为进入命令封号摸索
map <F1> :

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

"===========================vim-airline 插件 设置
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


"========================vim-easymotion 插件 定位到指定位置
let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap s <Plug>(easymotion-ovgrwin-f)
nmap s <Plug>(easymotion-overwin-f2)

let g:EasyMotion_smartcase = 1

map <C-j> <Plug>(easymotion-j)
map <C-k> <Plug>(easymotion-k)

"============vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
