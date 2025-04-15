return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "rust_analyzer" },
      }

      local lspconfig = require "lspconfig"

      lspconfig.lua_ls.setup {}
      lspconfig.ts_ls.setup {}
      lspconfig.svelte.setup {}
      lspconfig.tailwindcss.setup {}

      vim.diagnostic.config {
        virtual_lines = true,
      }
    end,
  },
}
