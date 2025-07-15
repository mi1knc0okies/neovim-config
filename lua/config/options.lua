local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Cursor line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Swapfile and backup
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Other useful options
opt.iskeyword:append("-")
opt.mouse = "a"
opt.conceallevel = 0
opt.pumheight = 10
opt.showmode = false
opt.showtabline = 2
opt.smartcase = true
opt.timeoutlen = 1000
opt.updatetime = 300
opt.writebackup = false

-- Auto save when focus is lost or switching buffers
vim.api.nvim_create_autocmd({"FocusLost", "BufLeave"}, {
  pattern = "*",
  command = "silent! wa"
})

-- Auto save after 1 second of inactivity
vim.opt.updatetime = 1000
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  command = "silent! update"
})
