return {
  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      require("conform").setup {
        formatters_by_ft = {
          c = { "clang_format", lsp_format = "fallback" },
          cpp = { "clang_format", lsp_format = "fallback" },
          rust = { "rustfmt", lsp_format = "fallback" },
          svelte = { "prettier", "prettiered" },
          typescript = { "prettier", "prettiered" },
          typescriptreact = { "prettier", "prettiered" },
          lua = { "stylua" },
          toml = { "taplo" },
          go = { "gofumpt" },
          python = function(bufnr)
            if require("conform").get_formatter_info("ruff_format", bufnr).available then
              return { "ruff_format" }
            else
              return { "isort", "black" }
            end
          end,
        },
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format { bufnr = args.buf }
        end,
      })
    end,
  },
}
