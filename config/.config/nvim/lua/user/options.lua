local o = vim.opt

o.scrolloff = 10

-- Persistance
o.backup = false
o.swapfile = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.cursorline = true

-- Line numbers
o.number = true
o.relativenumber = true

o.wrap = false

-- Indenting
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.autoindent = true
o.smartindent = true

-- Search
o.incsearch = true
o.hlsearch = false
o.showmatch = true

-- Colors
o.termguicolors = true
o.syntax = 'on'
o.signcolumn = 'yes'

o.filetype = 'on'

o.updatetime = 50

