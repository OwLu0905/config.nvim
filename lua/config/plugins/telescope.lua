return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("telescope").setup {
        defaults = {
          file_ignore_patterns = { "node_modules" },
        },
        pickers = {
          find_files = {
            theme = "ivy",
          },
          colorscheme = {
            theme = "ivy",
          },
        },
        extensions = { fzf = {} },
      }

      require("telescope").load_extension "fzf"

      require "config.telescope"
    end,
  },
}
