local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofmt" },
    typescript = { "prettierd" },
    javascript = { "prettierd" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
