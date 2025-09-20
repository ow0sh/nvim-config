local builtin = require "telescope.builtin"
vim.api.nvim_create_user_command("Grep", builtin.live_grep, { desc = "Telescope live grep" })
vim.api.nvim_create_user_command("Files", builtin.find_files, { desc = "Telescope find files" })
vim.api.nvim_create_user_command("Logs", builtin.git_commits, { desc = "Telescope git log --oneline" })
vim.api.nvim_create_user_command("Diff", builtin.git_status, { desc = "Telescope git diff" }) -- experiment with this one
-- vim.api.nvim_create_user_command("Diff", "VGit project_diff_preview", { desc = "Telescope git diff" })
vim.api.nvim_create_user_command("Branches", builtin.git_branches, { desc = "Telescope git branch" })

vim.api.nvim_create_user_command("JSON", ":%!jq '.'", { bang = true, desc = "Format json file" })

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
