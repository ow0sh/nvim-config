require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "v" }, "<Bslash>", "i")

map({ "n", "v" }, "<S-Up>", "5k")
map({ "n", "v" }, "<S-Down>", "5j")
map("i", "<S-Down>", "<esc>5ji")
map("i", "<S-Up>", "<esc>5ki")

-- Used to hop from treesitter to code
-- map("n", "<C-Left>", "<C-W>h", { desc = "Switch window left" })
-- map("n", "<C-Right>", "<C-W>l", { desc = "Switch window right" })

map("n", "1", function()
  require("mini.files").open()
end)

local miniPick = require "mini.pick"
map("n", "<C-g>", miniPick.builtin.grep_live, {})
map("n", "<C-G>", miniPick.builtin.grep_live, {})
map("n", "<C-f>", miniPick.builtin.files, {})
map("n", "<C-F>", miniPick.builtin.files, {})

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

map("n", "<C-t>", "<cmd>lua vim.lsp.buf.code_action()<cr>")

-- VGit mappings
vim.api.nvim_create_user_command("Logs", "VGit project_logs_preview", { bang = true, desc = "Preview VGit logs" })
vim.api.nvim_create_user_command("Diff", "VGit project_diff_preview", { bang = true, desc = "Preview VGit diff" })
