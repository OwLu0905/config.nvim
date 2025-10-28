return {
	{
    "samir-roy/code-bridge.nvim",
    config = function()
      require("code-bridge").setup()

      vim.keymap.set("v", "<leader>ct", ":CodeBridgeTmux<CR>", { desc = "Send selection to claude via tmux" })
    end,
  },
}
