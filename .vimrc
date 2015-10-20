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
set relativenumber
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noeol
set expandtab
set clipboard=unnamed
set autoread
hi Search guibg=peru guifg=wheat
hi Search cterm=NONE ctermfg=grey ctermbg=blue
"XmlLint Formatting
map @@x :%!xmllint --format --recover - 2>/dev/null<CR>
map @@j :%!python -m json.tool<CR>
"Xaml Syntax Highlighting
au BufNewFile,BufRead *.xaml setf xml
au BufNewFile,BufRead *.nunit setf xml
"Key Mappings
inoremap jj <ESC>
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 60
let g:NERDTreeWinPos = "right"
nnoremap <F3> :buffers<CR>:buffer<Space>
nnoremap <F4> :tabs<CR>:"<args>"gt<Space>
imap . .<tab>
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
	\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
	\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <tab> <c-r>=Smart_TabComplete()<CR>
inoremap <expr> <A-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <A-k> ((pumvisible())?("\<C-p>"):("k"))
inoremap <expr> <A-n> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <A-p> ((pumvisible())?("\<C-p>"):("k"))
let mapleader = "\<Space>"
"Split Navigation Alt - Movement
"Split Navigation Alt - Movement
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
nmap <silent> <A-c> :hide<CR>
"Maximize Split
nmap <silent> <A-m> :wincmd _<CR>
"All Splits Equal
nmap <silent> <A-e> :wincmd =<CR>
"Page Up Down
nmap <silent> <A-d> <C-d>
nmap <silent> <A-u> <C-u>
"Tab Close
nnoremap <leader>ct :tabclose<cr>
" Tab Navigation
nnoremap <silent> <A-,> :tabp<cr>
nnoremap <silent> <A-.> :tabn<cr>
"CtrlP Settings let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>cp :CtrlP<cr>
let g:ctrlp_max_files=0
let g:ctrlp_follow_symlinks=1
"vim git Settings
nnoremap <leader>gs :Gstatus<cr>
"NoEOL
let b:PreserveNoEOL = 1
"Auto reload .vimrc
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
"SuperTab Settings
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1
"Syntastic Settings
"let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
let g:syntastic_cs_checkers = ['code_checker']
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
nnoremap <leader>bo :Copen<cr>
nnoremap <leader>cc :lclose<cr>
nnoremap <leader>ck :SyntasticCheck<cr>
nnoremap <leader>rp :! python %<cr>
autocmd FileType py set omnifunc=pythoncomplete#Complete
autocmd FileType python set completeopt-=preview
"OmniSharp Settings
set runtimepath^=~/vimfiles/bundle/ctrlp.vim
set noshowmatch
set completeopt=longest,menuone
set pumheight=10
set splitbelow
let g:Omnisharp_stop_server = 0
highlight Pmenu ctermbg=87 gui=bold
augroup omnisharp_commands
  autocmd!
  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
  autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
  autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
  autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
  autocmd BufWritePost *.cs call OmniSharp#AddToProject()
  autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
  autocmd FileType cs nnoremap <leader>gd :OmniSharpGotoDefinition<cr>
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
nnoremap <F6> :OmniSharpRename<cr>
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
nnoremap <leader>tp :OmniSharpAddToProject<cr>
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>
nnoremap <leader>ht :OmniSharpHighlightTypes<cr>
nnoremap <leader>rt :OmniSharpRunTests<cr> :Dispatch!<cr>
nnoremap <leader>rf :OmniSharpRunTestFixture<cr> :Dispatch!<cr>
nnoremap <leader>ra :OmniSharpRunAllTests<cr> :Dispatch!<cr>
nnoremap <leader>rl :OmniSharpRunLastTests<cr> :Dispatch!<cr>
let c_space_errors = 1
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace '\s\+$'