" Use vim settings, rather then vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible

" Support for ~/.vim/bundle
filetype off					" force reloading *after* Vundle loaded

" Change leader to comma
let mapleader=","
let maplocalleader=",,"

" Vundle configuration
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 24 bit colors
if (has("termguicolors"))
	set termguicolors
endif


""" Plugins {{{
Plugin 'VundleVim/Vundle.vim'

" vim-one color theme
Plugin 'rakr/vim-one'

" Suport for http://editorconfig.org/
Plugin 'editorconfig/editorconfig-vim'

" Better grep for source code
Plugin 'rking/ag.vim'
	nnoremap <leader>a :Ag -i<space>

" Render current document as a web page
Plugin 'wikimatze/hammer.vim'
	nmap <leader>p :Hammer<cr>

" Align text
Plugin 'junegunn/vim-easy-align'
	" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
	vmap <Enter> <Plug>(EasyAlign)
	" Start interactive EasyAlign for a motion/text object (e.g. gaip)
	nmap ga <Plug>(EasyAlign)

" Automatically adds endings to commands or tags
Plugin 'tpope/vim-endwise'

" Better repeat for last command
Plugin 'tpope/vim-repeat'

" Handles Ctrl-A/Ctrl-Z incrementing/decrementing also for dates 
Plugin 'tpope/vim-speeddating'

" Change surroundings
" cs'"   -- change surrounding ' to "
" cs"<a> -- change surrounding " to <a>...</a>
" cst'   -- change surrounding tags to '
" ds'    -- delete surrounding '
" yss]   -- add surrounding [ and ] for the entire line
" ysw]   -- add surrounding [ and ] from current position to the end of current word
" ysiw]  -- add surrounding [ and ] for the current word
Plugin 'tpope/vim-surround'

" [a -- go to previous file, ]a -- next file, [A - first file
" [b -- go to previous buffer,
" [l -- go to previous location, [<C-L> -- in file
" [q -- go to previous quick fix
" [t -- go to previous matching tag
" [f -- open next file in directory, alphabetically
"
" [<Space> -- newline before the cursor line
" [e -- exchange line with one above
"
" [x{motion} -- encode XML, [xx -- entire line, {visual}[x 
" [u -- encode URL
" [y -- encode as C string
Plugin 'tpope/vim-unimpaired'

" After p use <c-p> to switch to previous yank, <c-P> - next
Plugin 'maxbrunsfeld/vim-yankstack'
	let g:yankstack_map_keys = 0

" :Remove: Delete a buffer and the file on disk simultaneously.
" :Unlink: Like :Remove, but keeps the now empty buffer.
" :Move: Rename a buffer and the file on disk simultaneously.
" :Rename: Like :Move, but relative to the current file's containing directory.
" :Chmod: Change the permissions of the current file.
" :Mkdir: Create a directory, defaulting to the parent of the current file.
" :Find: Run find and load the results into the quickfix list.
" :Locate: Run locate and load the results into the quickfix list.
" :SudoWrite: Write a privileged file with sudo.
" :SudoEdit: Edit a privileged file with sudo.
" Also:
" New files created with a shebang line are automatically made executable.
" New init scripts are automatically prepopulated with /etc/init.d/skeleton.
Plugin 'tpope/vim-eunuch'

Plugin 'scrooloose/nerdtree'
	" Disable the scrollbars (NERDTree)
	set guioptions-=r
	set guioptions-=L
	" Keep NERDTree window fixed between multiple toggles
	set winfixwidth

	nnoremap <silent> <F9> :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Git status in NERDTree
" Nie działa na razie coś
"Plugin 'Xuyuanp/nerdtree-git-plugin'

" Custom text objects
"Plugin 'kana/vim-textobj-user'
"
" Plugin 'vim-scripts/YankRing.vim'
"     let g:yankring_replace_n_pkey = '<leader>['
"     let g:yankring_replace_n_nkey = '<leader>]'
"     let g:yankring_history_dir = s:dotvim.'/tmp/'
"   ?  let g:yankring_history_dir = "$HOME/.vim/tmp"

"     nmap <leader>y :YRShow<cr>

" <count>ai         (A)n (I)ndentation level and line above. 
" <count>ii         (I)nner (I)ndentation level (no line above). 
" <count>aI         (A)n (I)ndentation level and lines above/below. 
" <count>iI         (I)nner (I)ndentation level (no lines above/below).
Plugin 'michaeljsmith/vim-indent-object'
let g:indentobject_meaningful_indentation = ["haml", "sass", "python", "yaml", "markdown"]


" %   -- go to matching element
" [%  -- previous matching group
Plugin 'vim-scripts/matchit.zip'

Plugin 'kien/ctrlp.vim'
	let g:ctrlp_working_path_mode = 'ra'
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlP'

" Temporary not saved buffer
" :Scratch
" :SScratch
"Plugin 'vim-scripts/scratch.vim'

" Easily switch between buffers
Plugin 'troydm/easybuffer.vim'
	nmap <leader>be :EasyBufferToggle<cr>

" Multiple cursor mode. Ctrl-N multiple times to create new cursor on the same
" word below.
Plugin 'terryma/vim-multiple-cursors'

" Fancy status bar
Plugin 'bling/vim-airline'
	" Font installation for airline:
	" https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation
	" But we use Nerd font which contain powerline symbols
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1

" :ConqueTerm 
Plugin 'vim-scripts/Conque-Shell'
	nnoremap <silent><leader>T :ConqueTermSplit bash<CR>
	let g:ConqueTerm_SendVisKey = '<leader>r'
	let g:ConqueTerm_ExecFileKey = '<leader>R'

" Tagbar
Plugin 'majutsushi/tagbar'
	nnoremap <silent><leader>o :TagbarOpenAutoClose<CR>

" Gitk for vim
"Plugin 'gregsexton/gitv'

Plugin 'tpope/vim-fugitive'
	nmap <leader>g :Ggrep
	nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>

" Execute :Errors to see errors
Plugin 'scrooloose/syntastic.git'
	let g:syntastic_error_symbol = '✗'
	let g:syntastic_warning_symbol = '⚠'
	let g:syntastic_style_error_symbol = '✼'

	let g:syntastic_check_on_open = 1
	let g:syntastic_auto_jump = 1
	let g:syntastic_mode_map = { 'mode': 'active',
				\ 'active_filetypes': [],
				\ 'passive_filetypes': ['java'] }

" Shows Git diffs in a bar on the left
Plugin 'airblade/vim-gitgutter.git'
	" ]c - Jump to next hunk
	" [c - Jump to previous hunk
	" <Leader>hs - Stage hunk
	" <Leader>hu - Undo stage hunk
	" <Leader>hp - Preview hunk stages
	" ic - text object consisting of all lines in hunk
	" ac - the same as above plus any trailing empty lines

	let g:gitgutter_sign_added = '▌'
	let g:gitgutter_sign_modified = '▌'
	let g:gitgutter_sign_modified_removed = '▌_'
	let g:gitgutter_sign_removed_first_line = '¯'
	let g:gitgutter_sign_column_always = 1

" VIM Table Mode
" ,tm - Toggle Table Mode
" i| & a| - inner and around cell
" ,tfa - add formula
" ,tfe - evaluate formulas
Plugin 'dhruvasagar/vim-table-mode'

" Write HTML quickly
" div.align-left#header   ==>   <div id="header" class="align-left"></div>
Plugin 'rstacruz/sparkup'

" gcc  -- comment line
Plugin 'tpope/vim-commentary'

" *.otl file support
Plugin 'vimoutliner/vimoutliner'

" Draw with mouse
Plugin 'vim-scripts/sketch.vim'
	nnoremap <silent> <F2> :call ToggleSketch()<CR>

" Utl - open link on Ctrl-Enter
Plugin 'vim-scripts/utl.vim'
	" Ctrl-g - go to link, cannot use ctrl-enter, because it does not work in gnome-terminal
	inoremap <c-g> :Utl<CR>
	nnoremap <c-g> :Utl<CR>
	" Examples:
	" 1. Go to reference
	" 	<url:#r=test>
	" 	id=test
	" 2. Search text
	"   <url:#tn=as81ad>
	"   as81ad
	" 3. Search text backward
	" 	<url:#tp=as81ad>
	" 4. Go to file
	" 	<url:.bashrc>
	" 4. Go to line, absolute or relative
	"	<url:#line=+1>
	" 5. Vim help
	" 	<url:vimhelp::ls>
	" 6. Vim script
	" 	<url:vimscript:call input('Hit %3creturn%3e to continue')>
	" 	<url:vimscript:!cat %>
	" 7. Custom scheme
	" 	<url:wiki:Quark>
	fu! Utl_AddressScheme_wiki(url, fragment, dispMode)		" url= wiki:Quark
		let article = UtlUri_unescape( UtlUri_opaque(a:url) )	" btId = Quark
		let url = 'https://en.wikipedia.org/wiki/'.article
		return  Utl_AddressScheme_http(url, a:fragment, a:dispMode)
	endfu

" YouCompleteMe
"Plugin 'Valloric/YouCompleteMe'
"	let g:ycm_key_list_select_completion = [ '<Down>', '<c-j>' ]
"	let g:ycm_key_list_previous_completion = [ '<Up>', '<c-k>' ]


""" Snippets
Plugin 'SirVer/ultisnips' " Engine
Plugin 'honza/vim-snippets' " Snippets
	" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger="<c-k>"
	" If you want :UltiSnipsEdit to split your window.
	let g:UltiSnipsEditSplit="vertical"

" Zeal support
" <leader>z
Plugin 'KabbAmine/zeavim.vim'

" Expand Region
" + - expand
" _ - shrink
Plugin 'terryma/vim-expand-region'

" Syntax support
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'
Plugin 'wting/rust.vim'
Plugin 'adimit/prolog.vim.git'
Plugin 'chochos/ceylon-vim'
Plugin 'chrisbra/csv.vim'
Plugin 'vim-scripts/fish.vim'
Plugin 'tfnico/vim-gradle'
Plugin 'dag/vim-fish'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'hashivim/vim-terraform'
	" Support for vim-commentary for terraform files
	autocmd FileType terraform setlocal commentstring=#%s

call vundle#end()

let g:one_allow_italics = 1 " italic for comments
" set background=light " for the light version
let g:airline_theme='one'
colorscheme one
set background=dark " for the dark version
highlight Normal guibg=black

" Eclim installed out of Vundle

let g:EclimCompletionMethod = 'omnifunc'
let g:EclimHighlightError = 'SyntasticErrorSign'

""" }}} Plugins

" Enable detection, plugins and indenting in one step
filetype plugin indent on

" Enable syntax highlighting
syntax on

" Highlight settings must be after 'syntax on'
highlight SyntasticErrorSign ctermfg=red ctermbg=0
highlight SyntasticWarningSign ctermfg=yellow ctermbg=0
highlight SyntasticStyleErrorSign ctermfg=blue ctermbg=0
" Make sign column transparent
highlight SignColumn ctermbg=0


""" Settings {{{

" When switching buffers jump to the existing window, if the buffer is already
" opened there
set switchbuf=usetab


" Umożliwia 'zawijanie' wokół końca linii klawisza <BS> przy końcu linii,
" automatycznych wcięciach i początku obecnej sesji trybu Insert
set backspace=indent,eol,start

" Show completion menu with description
set completeopt=menuone,preview

" Do not cut long lines
set display+=lastline

" When wrapping paragraphs, don't end lines with 1-letter words (looks stupid)
set formatoptions+=1

" Adds g to :substitute automatically, for example, instead of :%s/foo/bar/g you just type :%s/foo/bar/
set gdefault

" Always show menu
set guioptions=mt

" Hide the buffer instead of closing it. When using :e,
" it won't ask to write changes in current buffer.
set hidden

" History lines to remember
set history=1000

" Show search result during typing
set incsearch

" ignore case when searching
set ignorecase

" Always show status line
set laststatus=2

" Show ruler
set ruler

" Keep at lest 2 lines of context when scrolling
set scrolloff=2

"ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase

" Show the mode in status line
set showmode

" Show partially entered commands in status line
set showcmd

" Use 4 space tab, do not change tabs into spaces
set tabstop=4 shiftwidth=4

" Fixes the problem with timeout after pressing ESC key
" First configure the terminal to send two 'ESC ESC' sequence instead of
"  single 'ESC' after Escape key is pressed
set timeoutlen=500 ttimeoutlen=0

" CursorHold event trigger after 1 second instead of default 4
set updatetime=500

" Move to the next and previous line when using cursor keys 
set whichwrap=b,s,<,>,[,]

" <tab> shows all possible commands
set wildmode=longest,list
set wildmenu

" Maximum number of lines saved on exit for each register set to 10000
set viminfo='100,<10000,s10,h


""" }}} Settings


""" Directories {{{

" Make backups in ~/.vim/tmp
set backup
set backupdir=~/.vim/tmp

" Make swap files in ~/.vim/tmp
set dir=~/.vim/tmp
"
" Allow undo to work even after exit from vim
" You must create the directory ~/.vim/undodir manually!
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer

""" }}} Directories


" map ; to :
nnoremap ; :

" Use css when exporting as HTML
let g:html_use_css = "1"

" Script to show man pages from inside VIM
" ,K - show man page for keyword under the cursor
runtime ftplugin/man.vim


" Cursor shape

" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes

" For KDE konsole
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" The same for Gnome Terminal
"let &t_SI = "\<Esc>[6 q"
"let &t_SR = "\<Esc>[4 q"
"let &t_EI = "\<Esc>[2 q"

" combined
let &t_SI = "\<Esc>[6 q\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>[2 q\<Esc>]50;CursorShape=0\x7"

""""

" set dark gray cursorline
set cursorline
hi CursorLine term=none cterm=none ctermbg=233

" Highlight current line, command: ,l
:nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

" Highlight current column, command: ,c
:nnoremap <silent> <Leader>c :execute 'match Search /\%'.virtcol('.').'v/'<CR>

" Show trailing whitespace and spaces before a tab
" But when opening terminal inside VIM don't touch spaces after '➤'
let c_space_errors = 1
let java_space_errors = 1
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\(➤\)\@<!\s\+$\| \+\ze\t/
syn match ExtraWhitespace /\(➤\)\@<!\s\+$\| \+\ze\t/

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Toggle show/hide invisible chars
nnoremap <silent><leader>i :set list!<cr>
set listchars=tab:▸\ ,trail:-,eol:¬

" Paste mode switching
set pastetoggle=<F6>


" Enable mouse support
set mouse=a
set mousemodel=popup_setpos

" Spell checking
setlocal spell spelllang=en_us,pl
hi clear SpellBad
hi SpellBad cterm=italic
" Ignore words containing upper case letters when spell checking
fun! IgnoreCamelCaseSpell()
	syn match CamelCase /\<\l\{-}\(\u\|\d\).\{-}\>/ contains=@NoSpell transparent
	syn cluster Spell add=CamelCase
endfun
autocmd BufRead,BufNewFile * :call IgnoreCamelCaseSpell()

" Toggle line numbers
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
		set number
	else
		set number!
	endif
endfunc
nnoremap <silent><leader>N :call NumberToggle()<cr>

function! RelativeNumberToggle()
	if(&relativenumber == 1)
		setlocal norelativenumber
		setlocal nonumber
		highlight LineNr ctermfg=yellow
	else
		setlocal relativenumber
		setlocal number
		highlight LineNr ctermfg=green
	endif
endfunc
nnoremap <silent><leader>n :call RelativeNumberToggle()<cr>

" Map Ctrl<movement> in insert mode
"inoremap <silent> <C-j> <C-o>j
"inoremap <silent> <C-h> <C-o>h
"inoremap <silent> <C-l> <C-o>l
"inoremap <silent> <C-k> <C-o>k


" Bubbling lines
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Map Ctrl<movement> into :cprev and :cnext
noremap <silent> <C-h> :cprev<CR>
noremap <silent> <C-l> :cnext<CR>

" :W - writes through sudo
command! W w !sudo tee % > /dev/null

" Add \v when searching, see also: http://www.vim.org/scripts/script.php?script_id=4849
nnoremap / /\v
vnoremap / /\v

" Ctrl-O goes back

" Go to the previous file position on open
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" Check API docs for current word in Zeal: http://zealdocs.org/
nnoremap <leader>d :!zeal --query "<cword>"&<CR><CR>

" Send visual selection to gist.github.com as a private, filetyped Gist
" Requires the gist command line too, apt install gist
vnoremap <leader>G :w !gist-paste -p -t %:e \| xclip -selection c<cr>

" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za

" Jumps
" :jumps to see history of locations
" <number> Alt-Left - jump to previous
" <number> Alt-Right - jump forward
nnoremap <A-left> <c-o>
nnoremap <A-right> <c-i>

" Jenkinsfile support
au BufReadPost Jenkinsfile* set syntax=groovy

try
	source ~/.vimrc.local
catch
	" No such file? No problem; just ignore it.
endtry

