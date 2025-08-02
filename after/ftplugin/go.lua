vim.api.nvim_command(":set tabstop=4 shiftwidth=4")

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("conform").format({ async = true, lsp_fallback = true })
  end,
})