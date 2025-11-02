require("config.lazy")

require("telescope").setup(require("config.telescope"))
require("blink.cmp").setup(require("config.blink_cmp"))

vim.diagnostic.enable(false, _)
vim.cmd("Neotree toggle")
