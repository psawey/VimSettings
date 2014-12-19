set ai
syntax on
colorscheme slate
set hlsearch
filetype indent plugin on
execute pathogen#infect()
set nocompatible
set hidden
set wildmenu
set showcmd
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set mouse=a
set cmdheight=2
set number
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set shiftwidth=2
set softtabstop=2
set expandtab
set clipboard=unnamed
"XmlLint Formatter
map @@x :%!xmllint --format --recover - 2>/dev/null
"OmniSharp Settings
set runtimepath^=~/vimfiles/bundle/ctrlp.vim
set noshowmatch
set completeopt=longest,menuone,preview
set splitbelow
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
augroup omnisharp_commands
  autocmd!
  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
  autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
  autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
  autocmd BufWritePost *.cs call OmniSharp#AddToProject()
  autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
  autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
  autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
  autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
  autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
  autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
  autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
  autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
  autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
  autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
  autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
  autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
  autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
augroup END
set updatetime=500
set cmdheight=2
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
nnoremap <leader>tp :OmniSharpAddToProject<cr>
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
set hidden
