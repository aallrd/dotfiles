" load plugins
execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on     " required

" ----------------------------------------- "
" Settings                                  "
" ----------------------------------------- "

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

set noerrorbells                " No annoying sound on errors
set novisualbell                " No annoying sound on errors
set t_vb=                       " No annoying sound on errors
set tm=500                      " No annoying sound on errors
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful
set whichwrap+=<,>,h,l          " Configure backspace so it acts as it should act
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set nobackup                    " Turn backup off, since most stuff is in SVN, git et.c anyway...
set nowb                        " Turn backup off, since most stuff is in SVN, git et.c anyway...
set noswapfile                  " Turn backup off, since most stuff is in SVN, git et.c anyway...
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2                " Always show the status line
set hidden
set ruler                       " Show the cursor position all the time
au FocusLost * :wa              " Set vim to save the file on focus out.
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set ttyfast
" set ttyscroll=3               " noop on linux ?
set lazyredraw                  " Wait to redraw "
set t_Co=256                    " Enable syntax highlighting
syntax on                       " Enable syntax highlighting
set background=dark             " Enable syntax highlighting
colorscheme solarized           " Enable syntax highlighting
set guifont=Inconsolata:h15     " Enable syntax highlighting
set guioptions-=L
set nocursorcolumn              " speed up syntax highlighting
set nocursorline                " speed up syntax highlighting
syntax sync minlines=256
set synmaxcol=300
set re=1
set wildmenu
set wildmode=list:longest
set conceallevel=0              " do not hide markdown
set wrap                        " Make Vim to handle long lines nicely.
set textwidth=79
set formatoptions=qrn1
set complete=.,w,b,u,t          " Better Completion
set completeopt=longest,menuone
set showmatch                   " Show matching brackets when text indicator is over them
set autoindent
set expandtab                   " Use spaces instead of tabs
set shiftwidth=4                " 1 tab == 4 spaces
set tabstop=4                   " 1 tab == 4 spaces
set bs=2
set ts=4
set sw=4
set magic                       " For regular expressions turn magic on
set wildignore=*.o,*~,*.pyc     " Ignore compiled files
set nrformats-=octal
set shiftround
set notimeout                   " Time out on key codes but not mappings. Basically this makes terminal Vim work sanely.
set ttimeout                    " Time out on key codes but not mappings. Basically this makes terminal Vim work sanely.
set ttimeoutlen=10              " Time out on key codes but not mappings. Basically this makes terminal Vim work sanely.
set history=3000                " Sets how many lines of history VIM has to remember
set display+=lastline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l          " Format the status line
if !empty(&viminfo)
  set viminfo^=!
endif
set viminfo='20,<1000           " Remember info about open buffers on close
if has('mouse')
  set mouse=a                   " In many terminal emulators the mouse works just fine, thus enable it.
endif

let &t_SI .= "\<Esc>[?2004h"   " never do this again --> :set paste <ctrl-v> :set no paste
let &t_EI .= "\<Esc>[?2004l"   " never do this again --> :set paste <ctrl-v> :set no paste

" ----------------------------------------- "
" Shortcuts                                 "
" ----------------------------------------- "

map <space> /                                               " Map <Space> to / forward search
map <c-space> ?                                             " Map Ctrl-<Space> to ? backwards search
map <F7> mzgg=G`z`                                          " Reindent file
nnoremap <leader>n :set nonumber!<CR>
nnoremap <leader>rn :set norelativenumber!<CR>
nnoremap <leader>pa :set nopaste!<CR>
nnoremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm         " Remove the Windows ^M - when the encodings gets messed up
vnoremap <silent> * :call VisualSelection('f')<CR>          " Visual mode pressing * or # searches for the current selection
vnoremap <silent> # :call VisualSelection('b')<CR>          " Visual mode pressing * or # searches for the current selection
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
" Dont show me any output when I build something
" Because I am using quickfix for errors
nmap <leader>m :make<CR><enter>
" Some useful quickfix shortcuts
":cc      see the current error
":cn      next error
":cp      previous error
":clist   list all errors
map <C-n> :cn<CR>
map <C-m> :cp<CR>
nnoremap <leader>a :cclose<CR>                              " Close quickfix easily
nnoremap <leader><space> :nohlsearch<CR>                    " Remove search highlight
nnoremap <Tab> :bnext<CR>                                   " Buffer next
nnoremap <S-Tab> :bprevious<CR>                             " Buffer prev
map <C-j> <C-W>j                                            " Better split switching
map <C-k> <C-W>k                                            " Better split switching
map <C-h> <C-W>h                                            " Better split switching
map <C-l> <C-W>l                                            " Better split switching
nmap <leader>w :w!<cr>                                      " Fast saving
nnoremap <space> zz                                         " Center the screen
imap jk <ESC>l                                              " Just go out in insert mode
nnoremap <F6> :setlocal spell! spell?<CR>
nnoremap <leader>c :TComment<CR>                            " Select search pattern howewever do not jump to the next one
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>            " trim all whitespaces away
nnoremap Y y$                                               " Act like D and C
map q: :q                                                   " Do not show stupid q: window
map :Vs :vs
map :Sp :sp
cmap w!! w !sudo tee > /dev/null %                          " Allow saving of files as sudo when I forgot to start vim using sudo
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

autocmd BufEnter * silent! lcd %:p:h
autocmd FileType make setlocal noexpandtab                  "This is for setting Makefiles with tabs not spaces
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L
" This trigger takes advantage of the fact that the quickfix window can be
" easily distinguished by its file-type, qf. The wincmd J command is
" equivalent to the Ctrl+W, Shift+J shortcut telling Vim to move a window to
" the very bottom (see :help :wincmd and :help ^WJ).
autocmd FileType qf wincmd J
command! Ball :call DeleteInactiveBufs()

" ----------------------------------------- "
" Functions                                 "
" ----------------------------------------- "

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! DeleteInactiveBufs()
  "From tabpagebuflist() help, get a list of all buffers in all tabs
  let tablist = []
  for i in range(tabpagenr('$'))
    call extend(tablist, tabpagebuflist(i + 1))
  endfor

  "Below originally inspired by Hara Krishna Dara and Keith Roberts
  "http://tech.groups.yahoo.com/group/vim/message/56425
  let nWipeouts = 0
  for i in range(1, bufnr('$'))
    if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
      "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
      silent exec 'bwipeout' i
      let nWipeouts = nWipeouts + 1
    endif
  endfor
  echomsg nWipeouts . ' buffer(s) wiped out'
endfunction

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" ----------------------------------------- "
" File Type settings                        "
" ----------------------------------------- "

au BufNewFile,BufRead *.vim setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.md setlocal spell noet ts=4 sw=4
au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.cpp setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.hpp setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.json setlocal expandtab ts=2 sw=2

augroup filetypedetect
  au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  au BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
augroup END

au FileType nginx setlocal noet ts=4 sw=4 sts=4

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" scala settings
autocmd BufNewFile,BufReadPost *.scala setl shiftwidth=2 expandtab

" Markdown Settings
autocmd BufNewFile,BufReadPost *.md setl ts=4 sw=4 sts=4 expandtab

" lua settings
autocmd BufNewFile,BufRead *.lua setlocal noet ts=4 sw=4 sts=4

" Dockerfile settings
autocmd FileType dockerfile set noexpandtab

" shell/config/systemd settings
autocmd FileType fstab,systemd set noexpandtab
autocmd FileType gitconfig,sh,toml set noexpandtab

" python indent
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab

" spell check for git commits
autocmd FileType gitcommit setlocal spell

" Wildmenu completion {{{
set wildmenu
" set wildmode=list:longest
set wildmode=list:full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files


" ----------------------------------------- "
" Plugin configs                            "
" ----------------------------------------- "

" ==================== CtrlP ====================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10     " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'    " jump to a file if it's open already
let g:ctrlp_mruf_max=450        " number of recently opened files
let g:ctrlp_max_files=0         " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" ==================== Fugitive ====================
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>

"==================== NerdTree ====================
" For toggling
nmap <C-n> :NERDTreeToggle<CR>
noremap <Leader>f :NERDTreeFind<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']
" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ==================== Completion =========================
" use deoplete for Neovim.
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#ignore_sources = {}
  let g:deoplete#ignore_sources._ = ['buffer', 'member', 'tag', 'file', 'neosnippet']

  " Use partial fuzzy matches like YouCompleteMe
  call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])
  call deoplete#custom#set('_', 'converters', ['converter_remove_paren'])
  call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])
endif

" ==================== vim-multiple-cursors ====================
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" =================== vim-airline ========================
let g:airline_theme='solarized'

" set to use powerline fonts when not in a ssh session
let g:remoteSession = ($STY == "")
if !g:remoteSession
  let g:airline_powerline_fonts=1
endif

" ==================== Undotree ====================
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
nnoremap <C-u> :UndotreeToggle<CR>

" ==================== Syntastic ====================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim:ts=2:sw=2:et
