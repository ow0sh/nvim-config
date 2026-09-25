local M = {}

local themes = {
  dark = "vscode_dark",
  light = "ayu_light",
}

local function appearance()
  local result = vim.system({ "defaults", "read", "-g", "AppleInterfaceStyle" }, { text = true }):wait()
  return result.code == 0 and "dark" or "light"
end

function M.current()
  return themes[appearance()]
end

function M.setup()
  local config = require("nvconfig").base46

  config.theme = M.current()
  require("base46").load_all_highlights()

  local timer = vim.uv.new_timer()
  timer:start(
    2000,
    2000,
    vim.schedule_wrap(function()
      local theme = M.current()
      if config.theme ~= theme then
        config.theme = theme
        require("base46").load_all_highlights()
      end
    end)
  )

  vim.api.nvim_create_autocmd("VimLeavePre", {
    once = true,
    callback = function()
      timer:stop()
      timer:close()
    end,
  })
end

return M
