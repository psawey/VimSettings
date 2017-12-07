set runtimepath^=$HOME/.vim/autoload
set runtimepath^=$HOME/vimfiles/bundle/vim-csharp
colorscheme desert
set ai
set hlsearch
set nocp
runtime autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype indent plugin on
set nocompatible
set backspace=indent,eol,start
set hidden
set wildmenu
set ignorecase
set nostartofline
if has('cmdline_info')
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd
endif
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
set softtabstop=0
set tabstop=4
set expandtab
set autoindent
set preserveindent
set clipboard=unnamed
set autoread
set autowrite
set omnifunc=syntaxcomplete#Complete
set history=1000
set showmode
set directory=$HOME/vimfiles/swapfiles//
set wildmode=list:longest,full
set virtualedit=onemore
set linespace=0
set noeol
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
hi Search guibg=peru guifg=wheat cterm=NONE ctermfg=grey ctermbg=blue
"XmlLint Formatting
map @@x :set filetype=xml<CR> :%!C:\cygwin64\bin\xmllint.exe --format --recover - 2>/dev/null<CR>
map @@j :set filetype=json<CR> :%!python -m json.tool<CR>
"Xaml Syntax Highlighting
au BufNewFile,BufRead *.xaml setf xml
au BufNewFile,BufRead *.nunit setf xml
"Key Mappings
inoremap jj <ESC>
map <F3> :NERDTreeToggle<CR> :NERDTreeMirror<CR>
let g:NERDTreeWinSize = 70
let g:NERDTreeWinPos = "right"
let g:NERDTreeChDirMode = 2
autocmd vimenter * NERDTree
let g:AutoPairsMapBS=0
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
noremap <F2> :buffers<CR>:
nnoremap <F4> :tabs<CR>
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <A-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <A-k> ((pumvisible())?("\<C-p>"):("k"))
inoremap <expr> <A-n> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <A-p> ((pumvisible())?("\<C-p>"):("k"))
nmap <silent> <A-i> =i{
let mapleader = "\<Space>"
nmap <silent> <A-f> *
nmap <silent> <A-r> <C-r>
nnoremap <silent> <leader>/ :noh<cr>
nnoremap <silent> <leader>o o<ESC>
nnoremap <silent> <leader>i i <ESC>
"Split Navigation Alt - Movement
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
nmap <silent> <A-c> :hide<CR>
set wildchar=<Tab> wildmenu wildmode=full
"Maximize Split
nmap <silent> <A-m> :wincmd _<CR>
"All Splits Equal
nmap <silent> <A-e> :wincmd =<CR>
"Page Up Down
nmap <A-d> <C-d>
nmap <A-u> <C-u>
"Blockwise Visual Mode
nmap <A-v> <C-v>
"Increment/Decrement
nmap <A-a> <C-a>
nmap <A-x> <C-x>
nmap <leader>l :set list!<cr>
"Scroll Up Down
nmap <silent> <A-s> <C-e>
nmap <silent> <A-o> <C-y>
nnoremap <leader>gp <C-o>
"set scrolloff=25
"Tab Close
nnoremap <leader>ct :tabclose<cr>
nnoremap <leader>c :bd<cr>
noremap <leader>s :wa!<cr>
" Tab Navigation
nnoremap <silent> <A--> :tabp<cr>
nnoremap <silent> <A-=> :tabn<cr>
nmap <silent> <A-,> :bp<CR>
nmap <silent> <A-.> :bn<CR>
set switchbuf=usetab,newtab
let notabs = 0
nnoremap <silent> <F8> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files=0
let g:ctrlp_follow_symlinks=1
let g:ctrlp_switch_buffer='et'
let g:ctrlp_working_path_mode = 'ra'
nnoremap <leader>cp :CtrlP<cr>
nnoremap <leader>cb :CtrlPBuffer<cr>
"vim git Settings
nnoremap <leader>gs :Gstatus<cr>
"NoEOL
let b:PreserveNoEOL=1
autocmd BufNewFile,BufRead * SetNoEOL
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
let g:syntastic_cs_code_checker_quiet_messages = { 'regex' : 'missing.xml.comment.for.publicly.visible.type.or.member' }
let g:syntastic_cs_checkers = ['code_checker']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['pylint', 'python']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
if has('statusline')
    set statusline=%<%f\
    set statusline+=%w%h%m%r
    set statusline+=\ [%{&ff}/%Y]
    set statusline+=\ [%{getcwd()}]
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%
	set statusline+=%{ObsessionStatus()}
endif
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
nnoremap <leader>co :Errors<cr>
nnoremap <leader>bo :Copen<cr>
nnoremap <leader>cc :lclose<cr>
nnoremap <leader>ck :SyntasticCheck<cr>
nnoremap <silent> <leader>= :exe "resize " . (winheight(0) * 3/2)<cr>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<cr>
nnoremap <silent> <leader>v= :exe "vertical resize " . (winheight(0) * 3/2)<cr>
nnoremap <silent> <leader>v- :exe "vertical resize " . (winheight(0) * 2/3)<cr>
augroup python_commands
  autocmd FileType py set omnifunc=jedi#Complete
  autocmd FileType python set completeopt-=preview
  "autocmd BufEnter,TextChanged,InsertLeave *.py SyntasticCheck
augroup END
let g:jedi#goto_definitions_command = "<leader>gd"
"OmniSharp Settings
set noshowmatch
set completeopt=longest,menuone,preview
set pumheight=10
set splitbelow
let g:Omnisharp_stop_server = 1
let g:Omnisharp_start_server = 0
let g:OmniSharp_server_type = 'roslyn'
highlight Pmenu ctermbg=87 gui=bold
augroup omnisharp_commands
  autocmd!
  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
  autocmd FileType cs imap . .<tab>
  autocmd FileType cs nnoremap <F6> :wa!<cr>:OmniSharpBuildAsync<cr>
  autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
  autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
  autocmd BufWritePost *.cs call OmniSharp#AddToProject()
  autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
  autocmd FileType cs nnoremap <leader>gd :w<cr>:OmniSharpGotoDefinition<cr>
  autocmd FileType cs nnoremap <leader>gp :execute "normal!<c-O>"<cr>
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
nnoremap <F5> :OmniSharpRename<cr>
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
nnoremap <leader>rs :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
nnoremap <leader>tp :OmniSharpAddToProject<cr>
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>
nnoremap <leader>ht :OmniSharpHighlightTypes<cr>
nnoremap <leader>rt :OmniSharpRunTests<cr> :Dispatch<cr>
nnoremap <leader>rf :OmniSharpRunTestFixture<cr> :Dispatch<cr>
nnoremap <leader>ra :OmniSharpRunAllTests<cr> :Dispatch<cr>
nnoremap <leader>rl :OmniSharpRunLastTests<cr> :Dispatch<cr>
let c_space_errors = 1
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace '\s\+$'
nnoremap <leader>ws :%s/\s\+$//e<CR>
cnoreabbrev psake PSake
command! -nargs=1 PSake Dispatch C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe psake <q-args>
command! UnMinify call UnMinify()
function! UnMinify()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction