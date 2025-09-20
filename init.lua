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
local cloak_config = require "configs.cloak_config"
local blink_config = require "configs.blink"
local conform_config = require "configs.conform_config"

require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  -- disable default NvChad plugins
  { "nvim-cmp", enabled = false },
  { "folke/which-key.nvim", enabled = false },
  { "nvim-tree/nvim-tree.lua", enabled = false },
  { "hrsh7th/nvim-cmp", enabled = false },
  -- disable default NvChad plugins
  { import = "plugins" },
}, lazy_config)

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<S-d>"] = require("telescope.actions").preview_scrolling_down,
        ["<S-e>"] = require("telescope.actions").preview_scrolling_up,
      },
      n = {
        ["<S-d>"] = require("telescope.actions").preview_scrolling_down,
        ["<S-e>"] = require("telescope.actions").preview_scrolling_up,
      },
    },
  },
}
require("mini.files").setup(mini_files_config)
require("cloak").setup(cloak_config)
require("go").setup()
require("blink.cmp").setup(blink_config)
require("conform").setup(conform_config)

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
  require "commands"
end)
