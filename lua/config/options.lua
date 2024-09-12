local options = {
    autoindent = true, -- take indent for new line from previous line
    breakindent = true, -- wrapped line repeats indent
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    confirm = true, -- ask what to do about unsaved/read-only files
    cursorcolumn = true, -- highlight the screen column of the cursor
	cursorline = true, -- highlight the current line
	expandtab = true, -- convert tabs to spaces
	fileencoding = "utf-8", -- the encoding written to a file
	guifont = "FiraCode Nerd Font Mono:h17", -- the font used in graphical neovim applications
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	linebreak = true, -- companion to wrap, don't split words
	mouse = "a", -- allow the mouse to be used in neovim
    mousefocus = false, -- keyboard focus follows the mousekeyboard focus follows the mouse
    mousehide = true, -- hide mouse pointer while typing
	mousemoveevent = true, -- report mouse moves with <MouseMove> WARN: mousemove can cancle events when on
    mousetime = 500, -- max time (ms) between mouse double-click
	number = true, -- print the line number in front of each line
	numberwidth = 2, -- number of columns used for the line number
	pumheight = 10, -- pop up menu height
	relativenumber = true, -- set relative numbered lines
	scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	showmode = false, -- message on status line to show current mode
	showtabline = 2, -- tells when the tab pages line is displayed 0: never, 1: for >1 tabs, 2: always
	sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
	signcolumn = "yes", -- when and how to display the sign column
	smartcase = true, -- no ignore case when pattern has uppercase
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
    splitkeep = "topline", -- determines scroll behavior for split windows
	splitright = true, -- force all vertical splits to go right of current window
	swapfile = false, -- creates a swapfile
	tabstop = 4, -- number of spaces that <Tab> in file uses
	termguicolors = true, -- enable 24-bit RGB color in the TUI
	timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- after this many milliseconds update swap file
	whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line
	wrap = false, -- long lines wrap and continue on the next line
	writebackup = false, -- make a backup before overwriting a file
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append("c") -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append("-") -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use

