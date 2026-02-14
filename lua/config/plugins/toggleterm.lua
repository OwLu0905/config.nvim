return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      vim.keymap.set("v", "<leader>tt", function()
        require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
      end),

      vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" }),
    },
  },
}
