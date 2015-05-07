set nocompatible
filetype off

" Vundle block
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'kien/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" Vundle end

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.exe 

colorscheme hybrid

let g:ctrlp_working_path_mode = ''

