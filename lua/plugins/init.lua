return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "go", "gomod", "gosum" },
      })
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "marcussimonsen/let-it-snow.nvim",
    cmd = "LetItSnow", -- Wait with loading until command is run
    opts = {},
  },

  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts_extend = { "sources.default" },
  },

  { "laytan/cloak.nvim" },

  {
    "echasnovski/mini.nvim",
    version = false,
  },

  {
    "ray-x/go.nvim",
    ft = { "go", "gomod" },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "tanvirtin/vgit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    ft = { "lua", "go" },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}
