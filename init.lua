local function safe_require(module)
  local ok, result = pcall(require, module)
  if not ok then
    vim.notify("Failed to load config: " .. module, vim.log.levels.ERROR)
    return {}
  end
  return result
end

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    repo,
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
}, safe_require "configs.lazy")

local configs = {
  { plugin = "telescope", config = "configs.telescope_config" },
  { plugin = "mini.files", config = "configs.mini_files" },
  { plugin = "cloak", config = "configs.cloak_config" },
  { plugin = "blink.cmp", config = "configs.blink_cmp" },
  { plugin = "conform", config = "configs.conform_config" },
  { plugin = "snacks", config = "configs.snacks_explorer" },
  { plugin = "vgit" },
  { plugin = "go" },
}

for _, item in ipairs(configs) do
  local ok, plugin = pcall(require, item.plugin)
  if ok then
    local config = item.config and safe_require(item.config) or {}
    plugin.setup(config)
  end
end

pcall(dofile, vim.g.base46_cache .. "defaults")
pcall(dofile, vim.g.base46_cache .. "statusline")

safe_require "options"
safe_require "nvchad.autocmds"

vim.schedule(function()
  safe_require "mappings"
  safe_require "commands"
end)
