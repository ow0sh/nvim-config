vim.keymap.set("n", "1", function()
  Snacks.explorer()
end, { desc = "Toggle Explorer" })

return {
  explorer = { enabled = true },
  picker = {
    actions = {
      jump_down_5 = function(picker)
        for _ = 1, 5 do
          Snacks.picker.actions.list_down(picker)
        end
      end,
      jump_up_5 = function(picker)
        for _ = 1, 5 do
          Snacks.picker.actions.list_up(picker)
        end
      end,
    },
    sources = {
      explorer = {
        hidden = true,
        layout = {
          layout = {
            width = 40,
          },
        },
        win = {
          list = {
            keys = {
              ["J"] = "jump_down_5",
              ["K"] = "jump_up_5",
            },
          },
        },
      },
    },
  },
}
