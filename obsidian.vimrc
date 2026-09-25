" Obsidian Vimrc Support config ported from this Neovim config.
" Copy/link this file into your vault as `.obsidian.vimrc`.
" Plugin-only Neovim bindings are kept as comments near bottom.

let mapleader = " "

" Insert mode navigation from NvChad defaults.
imap <C-b> <Esc>^i
imap <C-e> <End>
imap <C-h> <Left>
imap <C-l> <Right>
imap <C-j> <Down>
imap <C-k> <Up>

" Escape insert mode.
imap jk <Esc>

" Command mode shortcut.
nmap ; :

" Enter insert mode with custom keys.
nmap <Bslash> i
vmap <Bslash> i
nmap I i
nmap O i
nmap o i

" Fast vertical movement.
nmap <S-Up> 5k
vmap <S-Up> 5k
nmap <S-Down> 5j
vmap <S-Down> 5j
imap <S-Up> <Esc>5ki
imap <S-Down> <Esc>5ji

" Shift-letter aliases. In Vim, <S-j> is J, etc.
nmap J 5j
vmap J 5j
nmap K 5k
vmap K 5k
nmap L w
vmap L w
nmap H b
vmap H b

" Page movement remaps.
nmap E <C-u>
nmap D <C-d>

" Disable normal-mode repeat/search keys from nvim config.
nmap . <Nop>
nmap , <Nop>

" NvChad comment shortcuts. Works only if Obsidian Vim supports gc/gcc in your setup.
nmap <leader>/ gcc
vmap <leader>/ gc

" -----------------------------------------------------------------------------
" Not portable as plain Vim mappings. Need Obsidian command IDs (`obcommand`) or
" have no direct Obsidian equivalent. Kept here so no nvim binding is forgotten.
" -----------------------------------------------------------------------------

" Deleted in nvim config:
" nunmap <leader>gt

" Go.nvim / LSP-only:
" nmap <C-r> :GoFillStruct<CR>
" nmap <C-R> :GoFillStruct<CR>
" imap <C-r> <Esc>:GoFillStruct<CR>i
" imap <C-R> <Esc>:GoFillStruct<CR>i
" nmap <A-t> :lua vim.lsp.buf.code_action()<CR>
" nmap <leader>ds :lua vim.diagnostic.setloclist()<CR>

" NvChad buffer/tab mappings. Possible Obsidian replacements if command IDs exist:
" exmap tabnext obcommand workspace:next-tab
" exmap tabprev obcommand workspace:previous-tab
" exmap tabclose obcommand workspace:close
" nmap <A-l> :tabnext<CR>
" nmap <A-h> :tabprev<CR>
" nmap <A-w> :tabclose<CR>
" nmap <A-W> :tabclose<CR>
" nmap <Tab> :tabnext<CR>
" nmap <S-Tab> :tabprev<CR>
" nmap <leader>x :tabclose<CR>
" nmap <leader>b :enew<CR>

" File explorer / Telescope / Git / theme / terminal / WhichKey mappings:
" nmap 1 :Snacks.explorer<CR>
" nmap <C-n> :NvimTreeToggle<CR>
" nmap <leader>e :NvimTreeFocus<CR>
" nmap <leader>gg :Telescope live_grep<CR>
" nmap <leader>gr :Telescope live_grep default_text=grepme<CR>
" nmap <leader>f :Telescope find_files<CR>
" nmap <leader>dd :Telescope git_status<CR>
" nmap <leader>fw :Telescope live_grep<CR>
" nmap <leader>fb :Telescope buffers<CR>
" nmap <leader>fh :Telescope help_tags<CR>
" nmap <leader>ma :Telescope marks<CR>
" nmap <leader>fo :Telescope oldfiles<CR>
" nmap <leader>fz :Telescope current_buffer_fuzzy_find<CR>
" nmap <leader>cm :Telescope git_commits<CR>
" nmap <leader>th :NvChadThemePicker<CR>
" nmap <leader>ff :Telescope find_files<CR>
" nmap <leader>fa :Telescope find_files follow=true no_ignore=true hidden=true<CR>
" nmap <leader>h :NvChadTermHorizontal<CR>
" nmap <leader>v :NvChadTermVertical<CR>
" nmap <A-v> :NvChadTermVerticalToggle<CR>
" nmap <A-i> :NvChadTermFloatToggle<CR>
" nmap <leader>wK :WhichKey<CR>
" nmap <leader>wk :WhichKeyPrompt<CR>

" Settings/UI-only nvim bindings with no plain Obsidian Vim equivalent:
" nmap <Esc> :noh<CR>
" nmap <C-s> :w<CR>
" nmap <C-c> :%y+<CR>
" nmap <leader>n :set nu!<CR>
" nmap <leader>rn :set rnu!<CR>
" nmap <leader>ch :NvCheatsheet<CR>
" nmap <leader>fm :ConformFormat<CR>
" vmap <leader>fm :ConformFormat<CR>

" Plugin-local picker/file-explorer mappings from nvim:
" Telescope insert/normal: <S-d> preview down, <S-e> preview up, <A-j>/<A-k> selection.
" mini.files: q close, l in, <Enter> in+, h out, <C-Left> out+, ' mark goto,
" m mark set, <BS> reset, @ reveal cwd, g? help, = sync, < trim left, > trim right.
" Snacks explorer: J jump down 5, K jump up 5.
" blink.cmp: <CR> accept, <S-Tab> prev completion, <Tab> next completion.
