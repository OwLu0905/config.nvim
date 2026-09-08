return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
    keys = {
      {
        "<leader>ls",
        function()
          require("persistence").load()
        end,
        desc = "Restore Session",
      },
      {
        "<leader>lS",
        function()
          require("config.persistence").sessions()
        end,
        desc = "Select Session",
      },
      {
        "<leader>ld",
        function()
          require("persistence").stop()
        end,
        desc = "Don't Save Current Session",
      },
    },
  },
}
