"" Settings
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup VimPlugSetting
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

call plug#begin()

" [colorscheme]
Plug 'KKPMW/moonshine-vim'

" [filer]
Plug 'lambdalisue/fern.vim'
Plug 'antoinemadec/FixCursorHold.nvim'

" [general]
Plug 'cohama/lexima.vim'
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
Plug 'thinca/vim-quickrun'
Plug 'terryma/vim-expand-region'
Plug 'RRethy/vim-illuminate'
Plug 'chase/vim-ansible-yaml'
Plug 'ncm2/float-preview.nvim'

" [fzf]
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" [lsp]
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'mattn/vim-lsp-settings'

" [html/css]
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript'] }

" [go]
Plug 'fatih/vim-go', { 'for': 'go' }

" [terraform]
Plug 'hashivim/vim-terraform', { 'for': ['tf', 'terraform'] }

" [dockerfile]
Plug 'ekalinin/Dockerfile.vim', { 'for': ['tf', 'Dockerfile'] }

" [c/cpp]
Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }

call plug#end()

