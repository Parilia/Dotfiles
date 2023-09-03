-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>uL", "<cmd>set rnu<cr>", { desc = "Relative line numbering On" })

vim.keymap.set("n", "<leader>uI", "<cmd>set rnu!<cr>", { desc = "Relative line numbering Off" })
