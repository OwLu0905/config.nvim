return {
  {
    "sindrets/diffview.nvim",
    opts = {},
    config = function()
      vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>")
      vim.keymap.set("n", "<leader>d%", ":DiffviewFileHistory %<CR>")
      vim.keymap.set("n", "<leader>dq", ":DiffviewClose<CR>")
    end,
  },
}
