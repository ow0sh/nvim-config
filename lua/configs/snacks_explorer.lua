vim.keymap.set("n", "1", function()
  Snacks.explorer()
end, { desc = "Toggle Explorer" })

return {
  explorer = { enabled = true },
  picker = {
    sources = {
      explorer = {
        layout = {
          layout = {
            width = 30,
          },
        },
      },
    },
  },
}
