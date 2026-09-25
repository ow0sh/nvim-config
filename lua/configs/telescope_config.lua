local builtin = require "telescope.builtin"

local map_command = vim.api.nvim_create_user_command
local map = vim.keymap.set

local frontend_ignore_patterns = {}

local function ignore_dir(pattern)
  table.insert(frontend_ignore_patterns, "^" .. pattern .. "/")
  table.insert(frontend_ignore_patterns, "/" .. pattern .. "/")
end

for _, dir in ipairs {
  "node_modules",
  "%.git",
  "%.next",
  "%.nuxt",
  "%.vite",
  "%.turbo",
  "%.parcel%-cache",
  "%.cache",
  "%.vercel",
  "dist",
  "build",
  "out",
  "coverage",
  "storybook%-static",
  "playwright%-report",
  "test%-results",
  "cypress/screenshots",
  "cypress/videos",
  "__snapshots__",
  "__tests__",
  "test",
  "tests",
} do
  ignore_dir(dir)
end

for _, pattern in ipairs {
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
  ".*%.stories%.ts$",
  ".*%.stories%.js$",
  ".*%.stories%.tsx$",
  ".*%.stories%.jsx$",
  ".*%.stories%.mdx$",
  ".*%.story%.ts$",
  ".*%.story%.js$",
  ".*%.story%.tsx$",
  ".*%.story%.jsx$",
  ".*%.story%.mdx$",
  ".*%.snap$",
  ".*%.map$",
  ".*%.min%.js$",
  ".*%.min%.css$",
  ".*%.d%.ts$",
  ".*%.tsbuildinfo$",
  "%.eslintcache$",
  "package%-lock%.json$",
  "yarn%.lock$",
  "pnpm%-lock%.yaml$",
  "bun%.lock$",
  "bun%.lockb$",
  ".*%.png$",
  ".*%.jpg$",
  ".*%.jpeg$",
  ".*%.gif$",
  ".*%.webp$",
  ".*%.avif$",
  ".*%.ico$",
  ".*%.svg$",
  ".*%.woff$",
  ".*%.woff2$",
  ".*%.ttf$",
  ".*%.otf$",
} do
  table.insert(frontend_ignore_patterns, pattern)
end

local frontend_rg_excludes = {
  "!**/node_modules/**",
  "!**/.git/**",
  "!**/.next/**",
  "!**/.nuxt/**",
  "!**/.vite/**",
  "!**/.turbo/**",
  "!**/.parcel-cache/**",
  "!**/.cache/**",
  "!**/.vercel/**",
  "!**/dist/**",
  "!**/build/**",
  "!**/out/**",
  "!**/coverage/**",
  "!**/storybook-static/**",
  "!**/playwright-report/**",
  "!**/test-results/**",
  "!**/cypress/screenshots/**",
  "!**/cypress/videos/**",
  "!**/__snapshots__/**",
  "!**/__tests__/**",
  "!**/test/**",
  "!**/tests/**",
  "!**/*_test.go",
  "!**/*_test.ts",
  "!**/*_test.js",
  "!**/*.test.{ts,tsx,js,jsx}",
  "!**/*.spec.{ts,tsx,js,jsx}",
  "!**/*.stories.{ts,tsx,js,jsx,mdx}",
  "!**/*.story.{ts,tsx,js,jsx,mdx}",
  "!**/*.snap",
  "!**/*.map",
  "!**/*.min.{js,css}",
  "!**/*.d.ts",
  "!**/*.tsbuildinfo",
  "!**/.eslintcache",
  "!**/package-lock.json",
  "!**/yarn.lock",
  "!**/pnpm-lock.yaml",
  "!**/bun.lock",
  "!**/bun.lockb",
  "!**/*.{png,jpg,jpeg,gif,webp,avif,ico,svg,woff,woff2,ttf,otf}",
}

local function with_frontend_excludes(args)
  local result = vim.deepcopy(args)
  for _, glob in ipairs(frontend_rg_excludes) do
    table.insert(result, "--glob")
    table.insert(result, glob)
  end
  return result
end

local vimgrep_arguments = with_frontend_excludes {
  "rg",
  "--color=never",
  "--no-heading",
  "--with-filename",
  "--line-number",
  "--column",
  "--smart-case",
}

local find_command = with_frontend_excludes { "rg", "--files" }

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
    vimgrep_arguments = vimgrep_arguments,
    file_ignore_patterns = frontend_ignore_patterns,
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
    find_files = {
      find_command = find_command,
    },
  },
}
