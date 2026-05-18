-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true

vim.opt.winbar = "%=%m %f"
vim.opt.scrolloff = 10
--
-- LazyVim auto format
vim.g.autoformat = false
vim.opt.wrap = true

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir/")
vim.opt.autoread = true
vim.opt.autowrite = false
