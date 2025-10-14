-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local builtin = require("telescope.builtin")
vim.api.nvim_create_user_command("Grep", builtin.live_grep, { desc = "Telescope live grep" })
vim.api.nvim_create_user_command("Files", builtin.find_files, { desc = "Telescope find files" })
vim.api.nvim_create_user_command("Logs", builtin.git_commits, { desc = "Telescope git log --oneline" })
vim.api.nvim_create_user_command("Diff", builtin.git_status, { desc = "Telescope git diff" }) -- experiment with this one
vim.api.nvim_create_user_command("Diff", "VGit project_diff_preview", { desc = "Telescope git diff" })
vim.api.nvim_create_user_command("Branches", builtin.git_branches, { desc = "Telescope git branch" })

vim.api.nvim_create_user_command("JSON", function()
  vim.cmd("%!jq '.'")
  vim.cmd("set foldmethod=indent")
end, { bang = true, desc = "Format json file" })
-- zc - Close the fold under the cursor. This will hide the object's fields.
-- zo - Open a closed fold under the cursor.
-- za - Toggle the fold under the cursor (opens it if closed, closes it if open).
-- zR - Open All folds in the file.
-- zM - Close All folds in the file.

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

vim.api.nvim_create_user_command("DiagnosticDisable", function()
  vim.diagnostic.enable(false)
end, {
  desc = "Disable diagnistic",
})
vim.api.nvim_create_user_command("DiagnosticEnable", function()
  vim.diagnostic.enable(true)
end, {
  desc = "Enable diagnostic",
})
