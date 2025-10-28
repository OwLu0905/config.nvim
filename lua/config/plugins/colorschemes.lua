return {
  { "rose-pine/neovim", name = "rose-pine" },
  { "catppuccin/nvim", name = "catppuccin", opts = { transparent_background = true } },
  { "folke/tokyonight.nvim", opts = { transparent = true } },
  "neanias/everforest-nvim",
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup {
        options = { transparent = true },
      }
    end,
  },
  {
    "loganswartz/sunburn.nvim",
    dependencies = { "loganswartz/polychrome.nvim" },
  },
}
