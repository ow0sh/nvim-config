return {
  {
    "folke/which-key.nvim",
    enabled = false,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  {
    "nvim-mini/mini.nvim",
    version = false,
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
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  {
    "neovim/nvim-lspconfig",

    opts = function(_, opts)
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = { "K", false, mode = "n" }
      keys[#keys + 1] = { "<S-k>", false, mode = { "n", "i" } } -- Check both modes

      opts.inlay_hints = {
        enabled = false,
      }
      return opts
    end,
  },
}
