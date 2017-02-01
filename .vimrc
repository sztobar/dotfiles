syntax on                     " turns syntax highlightning onset
filetype off                  " required

set noswapfile
set nocompatible                  " (cp) use Vim defaults (much better)
set ruler                       " (ru) show the cursor position at all times
set showcmd                     " (sc) display an incomplete command in the lower right
set history=50                  " (hi) keep 50 lines of command history
set number                      " (nu) show line numbers
set showmatch                   " (sm) briefly jump to matching bracket when inserting one
set autoindent                  " (ai) turn on auto-indenting (great for programers)
set copyindent                  " (ci) when auto-indenting, use the indenting format of the previous line
set tabstop=2                   " (ts) width (in spaces) that a <tab> is displayed as
set shiftwidth=2                " (sw) width (in spaces) used in each step of autoindent (aswell as << and >>)
set expandtab
set textwidth=80                " (tw) number of columns before an automatic line break is inserted (see formatoptions)
set formatoptions=croq          " (fo) influences how vim automatically formats text
set backspace=indent,eol,start  " (bs) allows backspacing beyond starting point of insert mode, indents and line breaks
set nrformats+=alpha            " (nf) adds alpha chars to list that gets incremented/decremented with ^A/^X
set listchars+=tab:>-           " (lcs) strings used in 'list' mode to show hidden characters (default=eol:$)
set listchars+=trail:-
set winminheight=0              " (wmh) the minimal height of the window when it's not the current window

"set nowrap                     " allows text to continue off the window (need horizontal scrolling)
set linebreak                   " (lbr) wrap long lines at a space instead of in the middle of a word
set sidescroll=5                " (ss) the minimal number of columns to scroll horizontally
set listchars+=precedes:<       " (lcs) when 'nowrap', character to indicate that line continues off the page
set listchars+=extends:>

set wrapscan                    " (ws) allows search to wrap to top of document when the bottom has been hit
set incsearch                   " (is) highlights what you are searching for as you type
set hlsearch                    " (hls) highlights all instances of the last searched string
set ignorecase                  " (ic) ignores case in search patterns
set smartcase                   " (scs) don't ignore case when the search pattern has uppercase
set infercase                   " (inf) during keyword completion, fix case of new word (when ignore case is on)

"set autochdir                   " working directory is always the same as the file you are editing

" set foldcolumn=6                " (fdc) width of fold column (to see where folds are)
" set foldmethod=indent           " (fdm) creates a fold for every level of indentation
" set foldlevel=99                " (fdl) when file is opened, don't close any folds
" set foldenable                  " (fen) enables or disables folding

"set backup                     " (bk) will create a backup before overwriting a file
"set backupext=.bkup            " (bex) defines the extension used in a backup file (default is '~')

let html_use_css = 1            " the ':%TOhtml' command generates html without <font> tags



" File Specific Settings
" ------------------------------------------------------------

au FileType xhtml,html,htm,php,xml setlocal tabstop=2
au FileType xhtml,html,htm,php,xml setlocal shiftwidth=2
"au FileType xhtml,html,htm,php,xml setlocal expandtab      " (et) expand tabs to spaces (use :retab to redo entire file)
au FileType xhtml,html,htm,php,xml setlocal softtabstop=2   " (sts) makes spaces feel like tabs (like deleting)

au FileType c,h,java,js setlocal mps+==:;                   " allow the match pairs operation (%) to work with '=' and ';'

au FileType c,h setlocal cindent                            " enable the intelligent cindent (cin) feature for the following files
au FileType java,js setlocal smartindent                    " enable the smartindenting (si) feature for the following files

au FileType txt setlocal fo+=tn

" before writing to any file, this function call will remove any extra white space at the end of a line
"au! BufWrite,FileWritePre * call RemoveWhiteSpace()




" Key Mappings
" ------------------------------------------------------------

" allows moving between split windows much faster and more intuitive
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" <F2> applies a rot13 dmca-grade encryption scheme to your file
map <F2> mzggg?G`z      "(seems to be faster than mzggVGg?`z)

" <F3> appends the current date and time after the cursor
map  <F3> a<C-R>=strftime("%c")<CR><Esc>
imap <F3>  <C-R>=strftime("%c")<CR>

" <F6> sorts a paragraph of numbers using the external 'sort' program
map <F6> {V}k:!sort<CR>

" <F7> toggles hidden characters
map  <F7> :set list!<CR>
imap <F7> <ESC>:set list!<CR>a

" <F9> toggles word wrap
map  <F9> :set wrap!<CR>
imap <F9> <ESC>:set wrap!<CR>a

" <F8> toggles whether the last searched string is highlighted
map  <F8> :set hls!<CR>
imap <F8> <ESC>:set hls!<CR>a





" Functions
" ------------------------------------------------------------

" Renames param1 tags to be param2 tags
function! RenameTag(param1, param2)
    :%s/<\(\/\?\)a:param1\(\_s*\)/<\1a:param2\2/gci
endfunction

" Strips the tag defined by the parameter (for html pages)
function! StripTag(TagName)
    :%s/a:TagName/hello/gci
    ":% s/<[^>]\+>//gci
endfunction

" Reverses all the lines in the file (top to bottom)
function! ReverseLines()
    :g/^/m0
endfunction

" Removes the ^M character from the end of every line
function! RemoveM()
    :%s/^M$//g
endfunction

" Replaces the ^M character with a carraige return native to the system
function! ReplaceM()
    :%s/^M/\r/g
endfunction

" Removes superfluous white space from the end of a line
function! RemoveWhiteSpace()
    :%s/\s*$//g
    :'^
    "`.
endfunction





" Command Reference
" ------------------------------------------------------------

" *                     - searches for word under cursor
" gd                    - finds definition of variable/function under cursor
" ga                    - prints the ascii value of character under cursor
" gf                    - opens file under the cursor (in split view)
" gi                    - goes to insert mode in the same spot as you last inserted
" ~                     - changes case of character
" :r !<cmd>             - reads the output of the shell <cmd> into the file
" :% s/hello/A/gc       - typical search and replace command

" :% !tidy              - runs the code through the 'tidy' program

" :runtime! syntax/2html.vim
" :10,40TOhtml

" command reference ->  " za : fold toggle  toggles between a fold being opened and closed (zA does it recursively)
"                       " zc : fold close   close 1 fold under the cursor (zC does it recursively)
                        " zo : fold open    open 1 fold under the cursor (zO does it recursively)
                        " zm : fold more    increases foldlevel by 1 (zM opens all folds)
                        " zr : fold reduce  decreses foldlevel by 1 (zR closes all folds)

" :retab                - when expandtab is set, replace all tabs in the file with the # of spaces defined in 'shiftwidth'
" :retab!               - when expandtab is not set, replace the number of spaces in 'shiftwidth' with a tab
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb

    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif


set mps+=<:>


let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

let g:airline_powerline_fonts = 1
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'tpope/vim-sensible'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vim-scripts/Wombat'
Plug 'kien/rainbow_parentheses.vim'
Plug 'jiangmiao/auto-pairs'

Plug 'digitaltoad/vim-pug'
Plug 'wavded/vim-stylus'
Plug 'pangloss/vim-javascript'

call plug#end()
