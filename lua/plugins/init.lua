return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
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
