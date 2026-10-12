-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Carried over from the previous config.
-- Space t: terminal in the current file's folder (bottom split)
vim.keymap.set("n", "<leader>t", "<cmd>split | lcd %:p:h | terminal<CR>i", { desc = "Terminal in file's dir" })
-- Esc Esc: leave terminal mode
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
