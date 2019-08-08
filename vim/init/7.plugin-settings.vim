" echo "7.plugin-settings.vim"

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

"" [general]
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'cohama/lexima.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/unite.vim'
Plug 'LeafCage/yankround.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'tpope/vim-dispatch'
Plug 'itchyny/lightline.vim'
Plug 'soramugi/auto-ctags.vim'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
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

" [lsp]
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" [html/css]
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript'] }

" [php]
Plug 'lvht/phpcd.vim', { 'for': ['php'] }

" [go]
Plug 'tpope/vim-pathogen', { 'for': 'go' } " for vim-godebug
Plug 'jodosha/vim-godebug', { 'for': 'go' }

" [terraform]
"
Plug 'hashivim/vim-terraform', { 'for': ['tf', 'terraform'] }

" [dockerfile]
Plug 'ekalinin/Dockerfile.vim', { 'for': ['tf', 'Dockerfile'] }

call plug#end()
