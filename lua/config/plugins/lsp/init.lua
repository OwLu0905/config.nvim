return {
  {
    "neovim/nvim-lspconfig",
    tag = "v2.4.0",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      -- 由 mason 安裝並啟用的 server
      local servers = { "lua_ls", "ts_ls", "svelte", "tailwindcss", "ruff", "pyright", "rust_analyzer" }

      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = servers,
      }

      vim.lsp.enable(servers)
      -- sourcekit 隨 Xcode 安裝，不經 mason
      vim.lsp.enable "sourcekit"

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_attach_utils", { clear = true }),
        callback = function()
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
        end,
      })

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
