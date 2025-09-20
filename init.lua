vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.keymap.set("n", "d", '"*d')
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.api.nvim_create_user_command("W", "w", { desc = "Save the current file" })
vim.opt.termguicolors = true

vim.opt.rtp:prepend(lazypath)
vim.opt.wrap = false

local lazy_config = require "configs.lazy"
local mini_files_config = require "configs.mini_files"
local mini_pick_config = require "configs.mini_pick"
local cloak_config = require "configs.cloak"
local blink_config = require "configs.blink"

require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)
require("mini.files").setup(mini_files_config)
require("mini.pick").setup(mini_pick_config)
require("cloak").setup(cloak_config)
require("go").setup()
require("blink.cmp").setup(blink_config)

vim.api.nvim_create_user_command("TermHl", function()
  local b = vim.api.nvim_create_buf(false, true)
  local chan = vim.api.nvim_open_term(b, {})
  vim.api.nvim_chan_send(chan, table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n"))
  vim.api.nvim_win_set_buf(0, b)
end, { desc = "Highlights ANSI termcodes in curbuf" })

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
