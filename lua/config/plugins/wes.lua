return {
  {
    "OwLu0905/wes.nvim",
    config = function()
      -- 新電腦還沒選過主題：先套預設值，wes 第一次 setup 會把「目前的 colorscheme」寫進 state 檔
      if not vim.uv.fs_stat(vim.fn.stdpath "state" .. "/colorscheme.json") then
        pcall(vim.cmd.colorscheme, "tokyonight-moon")
      end
      require("wes").setup {
        telescope_bind = true,
      }
      vim.keymap.set("n", "<leader>cc", ":WesThemes<CR>", { desc = "Open Wes color theme picker" })
    end,
  },
}
