local builtin = require("telescope.builtin")

local map_command = vim.api.nvim_create_user_command
map_command("Grep", builtin.live_grep, { desc = "Telescope live grep" })
map_command("Files", builtin.find_files, { desc = "Telescope find files" })
map_command("Logs", builtin.git_commits, { desc = "Telescope git log --oneline" })
map_command("Diff", builtin.git_status, { desc = "Telescope git diff" }) -- experiment with this one
map_command("Diff", "VGit project_diff_preview", { desc = "Telescope git diff" })
map_command("Branches", builtin.git_branches, { desc = "Telescope git branch" })

local actions = require("telescope.actions")
return ({
  defaults = {
    mappings = {
      i = {
        ["<S-d>"] = actions.preview_scrolling_down,
        ["<S-e>"] = actions.preview_scrolling_up,
        ["<A-j>"] = actions.move_selection_next,
        ["<A-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<S-d>"] = actions.preview_scrolling_down,
        ["<S-e>"] = actions.preview_scrolling_up,
        ["<A-j>"] = actions.move_selection_next,
        ["<A-k>"] = actions.move_selection_previous,
      },
    },
    layout_strategy = "horizontal",
    layout_config = { prompt_position = "top" },
    sorting_strategy = "ascending",
    winblend = 0,
  },
})
