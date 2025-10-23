require("config.lazy")

-- local mini_files_config = require("config.mini_files")
local blink_config = require("config.blink_cmp")

require("telescope").setup({
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
})
-- require("mini.files").setup(mini_files_config)
require("blink.cmp").setup(blink_config)

-- vim.diagnostic.disable(0)
vim.diagnostic.enable(false, _)
