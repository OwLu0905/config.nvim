return {
  { "rose-pine/neovim", name = "rose-pine" },
  { "catppuccin/nvim", name = "catppuccin" },
  "folke/tokyonight.nvim",
  "neanias/everforest-nvim",
  "EdenEast/nightfox.nvim",
  {
    "loganswartz/sunburn.nvim",
    dependencies = { "loganswartz/polychrome.nvim" },
  },
  {
    "cdmill/neomodern.nvim",
    config = function()
      require("neomodern").setup {}
      -- require("neomodern").load()
    end,
  },
}
