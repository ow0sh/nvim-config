local myHighlights = vim.api.nvim_create_augroup("MyHighlights", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  group = myHighlights,
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Govno", { link = "Todo" })
    vim.api.nvim_set_hl(0, "Grepme", { link = "Todo" })

    vim.fn.matchadd("Govno", "GOVNO")
    vim.fn.matchadd("Govno", "govno")

    vim.fn.matchadd("Grepme", "grepme")
    vim.fn.matchadd("Grepme", "GREPME")
  end,
})

vim.api.nvim_create_user_command("JSON", function()
  vim.cmd "%!jq '.'"
  vim.cmd "set foldmethod=indent"
end, { bang = true, desc = "Format json file" })

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

vim.api.nvim_create_user_command("Qa", "qa", { bang = true, desc = "Typo for :qa" })
vim.api.nvim_create_user_command("QA", "qa", { bang = true, desc = "Typo for :qa" })

vim.api.nvim_create_user_command("Wqa", "wqa", { bang = true, desc = "Typo for :wqa" })
vim.api.nvim_create_user_command("WQa", "wqa", { bang = true, desc = "Typo for :wqa" })
vim.api.nvim_create_user_command("WQA", "wqa", { bang = true, desc = "Typo for :wqa" })

vim.api.nvim_create_user_command("Wq", "wq", { bang = true, desc = "Typo for :wq" })
vim.api.nvim_create_user_command("WQ", "wq", { bang = true, desc = "Typo for :wq" })

vim.api.nvim_create_user_command("W", "w", { bang = true, desc = "Typo for :w" })
vim.api.nvim_create_user_command("Q", "q", { bang = true, desc = "Typo for :q" })
