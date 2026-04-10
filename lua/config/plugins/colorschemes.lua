return {
  { "rose-pine/neovim", name = "rose-pine" },
  { "catppuccin/nvim", name = "catppuccin", opts = { transparent_background = true } },
  { "folke/tokyonight.nvim", opts = { transparent = false } },
  "neanias/everforest-nvim",
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup {
        options = { transparent = false },
      }
    end,
  },
  {
    "loganswartz/sunburn.nvim",
    dependencies = { "loganswartz/polychrome.nvim" },
  },
  { "rebelot/kanagawa.nvim" },
  {
    "everviolet/nvim",
    name = "evergarden",
    opts = {
      theme = {
        variant = "fall", -- 'winter'|'fall'|'spring'|'summer'
        accent = "green",
      },
      editor = {
        transparent_background = false,
        sign = { color = "none" },
        float = {
          color = "mantle",
          solid_border = false,
        },
        completion = {
          color = "surface0",
        },
      },
    },
  },
  { "serhez/teide.nvim", opts = {} },
}
