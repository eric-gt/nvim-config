-- Set <space> as the leader key. Always happens first
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.guifont = "Inconsolata"
vim.g.have_nerd_font = true

-- Require my various configurations and keymaps
require("egt.opts")
require("egt.keymaps")
-- see https://github.com/folke/lazy.nvim
require("egt.lazy")
require("egt.globals")
