return {
  {
    "nvim-cmp",
    enabled = false,
  },

  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },

    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts_extend = { "sources.default" },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "rust-analyzer",
        "vtsls",
        "jdtls",
      },
    },
  },

  {
    "laytan/cloak.nvim",
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
    "echasnovski/mini.nvim",
    version = false,
  },

  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
    init = function()
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

      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require "lspconfig"
      lspconfig.vtsls.setup {}
      local home = os.getenv "HOME"
      lspconfig.jdtls.setup {
        cmd = {
          "java",
          "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
          "-Xms1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.io=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "-jar",
          vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
          "-configuration",
          vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/config_mac"), -- use config_linux or config_win
          "-data",
          vim.fn.stdpath "data" .. "/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
        },
        root_dir = require("lspconfig.util").root_pattern("pom.xml", "build.gradle", ".git"),
        on_attach = function(client, bufnr)
          vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        end,
      }
      require "configs.lspconfig"
    end,
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  {
    "ray-x/go.nvim",
    ft = { "go", "gomod" },
  },

  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
    end,
  },
}
