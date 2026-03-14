local builtin = require "telescope.builtin"

local map_command = vim.api.nvim_create_user_command
local map = vim.keymap.set
map_command("Grep", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>gg", builtin.live_grep)

map("n", "<leader>gr", function()
  builtin.live_grep { default_text = "grepme" }
end, { desc = "Telescope live grep for grepme" })

map_command("Files", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>f", builtin.find_files)

map_command("Logs", builtin.git_commits, { desc = "Telescope git log --oneline" })

map_command("Diff", "VGit project_diff_preview", { desc = "Telescope git diff" })
map("n", "<leader>dd", builtin.git_status)

map_command("Branches", builtin.git_branches, { desc = "Telescope git branch" })

local actions = require "telescope.actions"
return {
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
  pickers = {
    live_grep = {
      file_ignore_patterns = {
        ".*_test%.go$",
        ".*_test%.ts$",
        ".*_test%.js$",
        ".*%.test%.ts$",
        ".*%.test%.js$",
        ".*%.test%.tsx$",
        ".*%.test%.jsx$",
        ".*%.spec%.ts$",
        ".*%.spec%.js$",
        ".*%.spec%.tsx$",
        ".*%.spec%.jsx$",
        "__tests__/",
        "test/",
        "tests/",
      },
    },
  },
}
