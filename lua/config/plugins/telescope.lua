return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
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
        extensions = {
          fzf = {},
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
        },
      }

      require("telescope").load_extension "fzf"
      require("telescope").load_extension "ui-select"

      require "config.telescope"
    end,
  },
}
