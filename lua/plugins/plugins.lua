return {
  { "tahayvr/matteblack.nvim", lazy = false, priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "matteblack",
    },
  },

  {
    "folke/which-key.nvim",
    enabled = false,
  },

  {
    "ray-x/go.nvim",
    ft = { "go", "gomod" },
  },

  {
    "tanvirtin/vgit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    config = function()
      vim.schedule(function()
        require("vgit").setup()
      end)
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "K", false, mode = "n" },
            { "<S-k>", false, mode = { "n", "i" } },
          },
        },
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      scroll = {
        enabled = false, -- Disable scrolling animations
      },
    },
  },

  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts_extend = { "sources.default" },
  },
}
