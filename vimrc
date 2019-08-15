
" Vundle {{{
  set nocompatible              " be iMproved, required
  filetype off                  " required
  
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'jistr/vim-nerdtree-tabs'

 " Plugin 'Valloric/YouCompleteMe'
 " Plugin 'SirVer/ultisnips'
 " Plugin 'honza/vim-snippets'
 " Plugin 'davidhalter/jedi-vim'
 " Plugin 'Raimondi/delimitMate'
 " 
 " Plugin 'ctrlpvim/ctrlp.vim'
 " Plugin 'dyng/ctrlsf.vim'
 " Plugin 'majutsushi/tagbar'
 " Plugin 'rking/ag.vim'
 " Plugin 'Lokaltog/vim-easymotion'
 " Plugin 'vim-scripts/matchit.zip'

 " Plugin 'tomtom/tcomment_vim'
 " Plugin 'tpope/vim-surround'
 " Plugin 'terryma/vim-multiple-cursors'

 " Plugin 'scrooloose/syntastic'
 " Plugin 'klen/python-mode'
 " Plugin 'xolox/vim-lua-ftplugin'
 " Plugin 'xolox/vim-misc'
 " Plugin 'fatih/vim-go'
 " Plugin 'posva/vim-vue'  

 " Plugin 'tpope/vim-fugitive'
 " Plugin 'gregsexton/gitv'
 " Plugin 'airblade/vim-gitgutter'
  Plugin 'bling/vim-airline'
 " Plugin 'noahfrederick/vim-hemisu'
 " Plugin 'raymond-w-ko/vim-lua-indent'
  Plugin 'tomasr/molokai'
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
set shiftwidth=4
"窗口上下保持距离
set scrolloff=5

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

