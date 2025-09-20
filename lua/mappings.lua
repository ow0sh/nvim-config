require "nvchad.mappings"

local map = vim.keymap.set

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
map("n", "<S-l>", "w")
map("n", "<S-h>", "b")

map("n", "1", function()
  require("mini.files").open()
end)

local miniPick = require "mini.pick"
vim.api.nvim_create_user_command("Grep", miniPick.builtin.grep_live, { bang = true, desc = "Preview VGit logs" })
vim.api.nvim_create_user_command("Files", miniPick.builtin.files, { bang = true, desc = "Preview VGit diff" })

map("n", "<C-r>", ":GoFillStruct<CR>", {})
map("n", "<C-R>", ":GoFillStruct<CR>", {})
map("i", "<C-r>", ":GoFillStruct<CR>", {})
map("i", "<C-R>", ":GoFillStruct<CR>", {})

map("n", "<C-Right>", function()
  require("nvchad.tabufline").next()
end, { desc = "tab next" })

map("n", "<C-Left>", function()
  require("nvchad.tabufline").prev()
end, { desc = "tab prev" })

map("n", "<C-w>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "close tab" })

map("n", "<C-W>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "close tab" })

map("n", "<C-e>", "<C-u>")

-- For typos
map("n", "I", "i")
map("n", "O", "i")
map("n", "o", "i")
map("n", ".", "")
map("n", ",", "")

map("n", "E", "<C-u>")
map("n", "D", "<C-d>")
map("n", "<A-t>", "<cmd>lua vim.lsp.buf.code_action()<cr>")

-- VGit mappings
vim.api.nvim_create_user_command("Logs", "VGit project_logs_preview", { bang = true, desc = "Preview VGit logs" })
vim.api.nvim_create_user_command("Diff", "VGit project_diff_preview", { bang = true, desc = "Preview VGit diff" })
vim.api.nvim_create_user_command("JSON", ":%!jq '.'", { bang = true, desc = "Format json file" })
