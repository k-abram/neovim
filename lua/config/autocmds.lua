-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Save all modified buffers when Neovide/Neovim loses focus (e.g. switching to IntelliJ),
-- so the other editor sees the latest changes. Unnamed and read-only buffers are skipped.
vim.api.nvim_create_autocmd("FocusLost", {
  group = vim.api.nvim_create_augroup("user_autosave_focus_lost", { clear = true }),
  command = "silent! wall",
})