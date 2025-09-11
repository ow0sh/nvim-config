return {
  keymap = {
    preset = "none",
    ["<CR>"] = { "accept", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<Tab>"] = { "select_next", "fallback" },
  },
  cmdline = {
    keymap = {
      ["<A-;>"] = { "accept", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
    },
    completion = { menu = { auto_show = true } },
  },

  completion = {
    menu = {
      draw = {
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind", gap = 1 },
        },
      },
    },
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
}
