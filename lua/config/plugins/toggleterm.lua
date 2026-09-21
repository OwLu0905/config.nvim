return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
      {
        "<leader>tt",
        function()
          require("toggleterm").send_lines_to_terminal("single_line", false, { args = vim.v.count })
        end,
        mode = "v",
        desc = "Send lines to terminal",
      },
    },
  },
}
