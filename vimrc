" Vundle {{{
  set nocompatible              " be iMproved, required
  set backspace=2
  filetype off                  " required
  
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'jistr/vim-nerdtree-tabs'

  Plugin 'Valloric/YouCompleteMe'
  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'
  Plugin 'davidhalter/jedi-vim'
  Plugin 'Raimondi/delimitMate'
  
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'dyng/ctrlsf.vim'
  Plugin 'majutsushi/tagbar'
  Plugin 'rking/ag.vim'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'vim-scripts/matchit.zip'

  Plugin 'tomtom/tcomment_vim'
  Plugin 'tpope/vim-surround'
  Plugin 'terryma/vim-multiple-cursors'

  Plugin 'scrooloose/syntastic'
  Plugin 'klen/python-mode'
  Plugin 'xolox/vim-lua-ftplugin'
  Plugin 'xolox/vim-misc'
  Plugin 'fatih/vim-go'
  Plugin 'posva/vim-vue'  

  Plugin 'tpope/vim-fugitive'
  Plugin 'gregsexton/gitv'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'bling/vim-airline'
  Plugin 'noahfrederick/vim-hemisu'
  Plugin 'raymond-w-ko/vim-lua-indent'
  Plugin 'tomasr/molokai'
  Plugin 'zaki/zazen'

  
  call vundle#end()            " required
  filetype plugin indent on    " required
" }}}
" theme setting {{{
  set guioptions=''
  set background=dark           " Background color
  set t_Co=256
  set guifont=Source\ Code\ Pro\ Light:h19
  colorscheme molokai
  " colorscheme solarized
  " colorscheme desert
" }}}
syntax on
:set number 



