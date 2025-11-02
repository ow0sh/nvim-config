return {
  keymap = {
    preset = "default",
    ["<CR>"] = { "accept", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_forward", "fallback" },
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
  },
  cmdline = {
    enabled = false,
  },

  completion = {
    menu = {
      draw = {
        columns = {
          { "label",     "label_description", gap = 1 },
          { "kind_icon", "kind",              gap = 5 },
        },
      },
    },
    list = {
      selection = "manual",
    },
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
}
