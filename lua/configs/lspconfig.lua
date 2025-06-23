-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.gopls.setup {
  on_init = nvlsp.on_init,
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
    },
  },
}

lspconfig.rust_analyzer.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "rust" },
  -- root_dir = require("lspconfig.util").root_pattern("Cargo.toml", "rust-project.json"),
  -- root_dir = lspconfig.root_pattern "Cargo.toml",
  settings = {
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}
