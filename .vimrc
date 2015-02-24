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
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab
set clipboard=unnamed
"XmlLint Formatting
map @@x :%!xmllint --format --recover - 2>/dev/null<CR>
"Xaml Syntax Highlighting
au BufNewFile,BufRead *.xaml setf xml
"Key Mappings
map <F3> :Explore<CR>
imap . .<tab>
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
	\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
	\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <tab> <c-r>=Smart_TabComplete()<CR>
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
"CtrlP Settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>cp :CtrlP<cr>
"SuperTab Settings
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1
"Syntastic Settings
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
"let g:syntastic_cs_quiet_messages = { 'level': 'warnings' }
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['flake8', 'python']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
nnoremap <leader>co :Errors<cr>
nnoremap <leader>cc :lclose<cr>
nnoremap <leader>ck :SyntasticCheck<cr>
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal completeopt-=preview
"OmniSharp Settings
set runtimepath^=~/vimfiles/bundle/ctrlp.vim
set noshowmatch
set completeopt=longest,menuone
set pumheight = 10
set splitbelow
let g:Omnisharp_stop_server = 1
highlight Pmenu ctermbg=238 gui=bold
augroup omnisharp_commands
  autocmd!
  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
  autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
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
