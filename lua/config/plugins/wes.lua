return {
  {
    "OwLu0905/wes.nvim",
    config = function()
      require("wes").setup {
        telescope_bind = true,
      }
			vim.keymap.set("n", "<leader>cc", ":WesThemes<CR>", { desc = "Open Wes color theme picker" })
    end,
  },
}
