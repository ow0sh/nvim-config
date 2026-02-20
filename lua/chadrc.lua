---@type ChadrcConfig
---@class config
local M = {
  base46 = {
    theme = "ayu_dark",
  },
  ui = {
    tabufline = {
      enabled = true,
      lazyload = false,
    },
  },
}

M.plugins = "plugins"
M.user_lspconfig = "configs.lspconfig"

return M
