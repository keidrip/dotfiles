"" Settings
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup VimPlugSetting
    autocmd!
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  augroup END
endif

call plug#begin()

" [colorscheme]
Plug 'KKPMW/moonshine-vim'

"" [general]
Plug 'cohama/lexima.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/unite.vim'
Plug 'LeafCage/yankround.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'tpope/vim-dispatch'
Plug 'itchyny/lightline.vim'
Plug 'liuchengxu/vista.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'lambdalisue/vim-unified-diff'
Plug 'Lokaltog/vim-easymotion'
Plug 'tmhedberg/matchit'
Plug 'vimtaku/hl_matchit.vim'
Plug 'w0rp/ale'
Plug 'tomtom/tcomment_vim'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'
Plug 'osyo-manga/vim-operator-stay-cursor'
Plug 'thinca/vim-qfreplace'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug '/usr/local/opt/fzf' " installed fzf via brew
Plug 'junegunn/fzf.vim'
Plug 'thinca/vim-quickrun'
Plug 'terryma/vim-expand-region'
" Plug 'rhysd/git-messenger.vim' " wait for nvim 0.4.0
Plug 'RRethy/vim-illuminate'
Plug 'ncm2/float-preview.nvim'

" [lsp]
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'

" [html/css]
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript'] }

" [go]
Plug 'fatih/vim-go', { 'for': 'go' }

" [terraform]
Plug 'hashivim/vim-terraform', { 'for': ['tf', 'terraform'] }

" [dockerfile]
Plug 'ekalinin/Dockerfile.vim', { 'for': ['tf', 'Dockerfile'] }

call plug#end()







