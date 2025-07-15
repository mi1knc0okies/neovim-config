-- Set leader key 
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load configuration modules
require('config.options')
require('config.keymaps')
require('config.lazy')
