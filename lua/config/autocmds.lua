local map_command = vim.api.nvim_create_user_command

-- zc - Close the fold under the cursor. This will hide the object's fields.
-- zo - Open a closed fold under the cursor.
-- za - Toggle the fold under the cursor (opens it if closed, closes it if open).
-- zR - Open All folds in the file.
-- zM - Close All folds in the file.
map_command("JSON", function()
  vim.cmd("%!jq '.'")
  vim.cmd("set foldmethod=indent")
end, { bang = true, desc = "Format json file" })

map_command("FormatDisable", function(args)
  if args.bang then
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
map_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

map_command("DiagnosticDisable", function()
  vim.diagnostic.enable(false)
end, {
  desc = "Disable diagnistic",
})
map_command("DiagnosticEnable", function()
  vim.diagnostic.enable(true)
end, {
  desc = "Enable diagnostic",
})

map_command("Qa", "qa", { bang = true, desc = "Typo for :qa" })
map_command("QA", "qa", { bang = true, desc = "Typo for :qa" })

map_command("Wqa", "wqa", { bang = true, desc = "Typo for :wqa" })
map_command("WQa", "wqa", { bang = true, desc = "Typo for :wqa" })
map_command("WQA", "wqa", { bang = true, desc = "Typo for :wqa" })

map_command("Wq", "wq", { bang = true, desc = "Typo for :wq" })
map_command("WQ", "wq", { bang = true, desc = "Typo for :wq" })

map_command("W", "w", { bang = true, desc = "Typo for :w" })
map_command("Q", "q", { bang = true, desc = "Typo for :q" })
