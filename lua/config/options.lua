-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- Carried over from the previous hand-built config (/tmp/neovim-backups/config-nvim).
-- LazyVim already sets: Space as leader, line numbers + relative numbers,
-- the macOS clipboard, ignorecase/smartcase, persistent undo, signcolumn.

vim.opt.mouse = ""       -- mouse disabled (as before)
vim.opt.expandtab = true -- spaces instead of tabs (Go files still use tabs)
vim.opt.shiftwidth = 4   -- LazyVim's default is 2
vim.opt.tabstop = 4
vim.opt.scrolloff = 8    -- keep context above/below the cursor (LazyVim: 4)
vim.o.background = "dark" -- so Neovide doesn't switch to light with macOS
