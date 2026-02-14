return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup {
        user_default_options = {
          tailwind = "both",
          mode = "background",
        },
      }
    end,
  },
}
