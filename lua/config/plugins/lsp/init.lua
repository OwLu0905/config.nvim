return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "rust_analyzer" },
      }

      vim.lsp.enable "lua_ls"
      vim.lsp.enable "ts_ls"
      vim.lsp.enable "svelte"
      vim.lsp.enable "tailwindcss"
      vim.lsp.enable "ruff"
      vim.lsp.enable "pyright"
      vim.lsp.enable "rust_analyzer"

      -- local lspconfig = require "lspconfig"
      --
      -- lspconfig.lua_ls.setup {}
      -- lspconfig.ts_ls.setup {}
      -- lspconfig.svelte.setup {}
      -- lspconfig.tailwindcss.setup {}
      -- lspconfig.ruff.setup {}
      -- lspconfig.pyright.setup {}
      -- lspconfig.rust_analyzer.setup {}

      vim.diagnostic.config {
        virtual_lines = false,
      }

      require "config.ruff"
    end,
  },
}
