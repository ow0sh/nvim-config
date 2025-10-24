-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "1", ":Neotree toggle<CR>", {})
local map = vim.keymap.set

map("n", "<Tab>", "<Cmd>bnext<CR>", { desc = "Next Buffer" })
map("n", "<S-Tab>", "<Cmd>bprevious<CR>", { desc = "Previous Buffer" })

map("n", "<A-w>", "<Cmd>bdelete<CR>", { desc = "Close Buffer" })
map("n", "<A-W>", "<Cmd>bdelete<CR>", { desc = "Close Buffer one more" })
map("n", "<A-l>", "<Cmd>bnext<CR>", { desc = "Next Buffer" })
map("n", "<A-h>", "<Cmd>bprevious<CR>", { desc = "Previous Buffer" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "v" }, "<Bslash>", "i")

map({ "n", "v" }, "<S-Up>", "5k")
map({ "n", "v" }, "<S-Down>", "5j")
map("i", "<S-Down>", "<esc>5ji")
map("i", "<S-Up>", "<esc>5ki")

-- fast navigation
map({ "n", "v" }, "<S-j>", "5j")
map({ "n", "v" }, "<S-k>", "5k")
map({ "n", "v" }, "<S-l>", "w")
map({ "n", "v" }, "<S-h>", "b")

map("n", "<C-r>", ":GoFillStruct<CR>", {})
map("n", "<C-R>", ":GoFillStruct<CR>", {})
map("i", "<C-r>", ":GoFillStruct<CR>", {})
map("i", "<C-R>", ":GoFillStruct<CR>", {})

map("n", "E", "<C-u>")
map("n", "D", "<C-d>")
map("n", "<A-t>", "<cmd>lua vim.lsp.buf.code_action()<cr>")

map("n", "I", "i")
map("n", "O", "i")
map("n", "o", "i")
map("n", ".", "")
map("n", ",", "")

vim.api.nvim_create_user_command("Qa", "qa", { bang = true, desc = "Typo for :qa" })
vim.api.nvim_create_user_command("QA", "qa", { bang = true, desc = "Typo for :qa" })

vim.api.nvim_create_user_command("Wqa", "wqa", { bang = true, desc = "Typo for :wqa" })
vim.api.nvim_create_user_command("WQa", "wqa", { bang = true, desc = "Typo for :wqa" })
vim.api.nvim_create_user_command("WQA", "wqa", { bang = true, desc = "Typo for :wqa" })

vim.api.nvim_create_user_command("Wq", "wq", { bang = true, desc = "Typo for :wq" })
vim.api.nvim_create_user_command("WQ", "wq", { bang = true, desc = "Typo for :wq" })

vim.api.nvim_create_user_command("W", "w", { bang = true, desc = "Typo for :w" })
vim.api.nvim_create_user_command("Q", "q", { bang = true, desc = "Typo for :q" })
