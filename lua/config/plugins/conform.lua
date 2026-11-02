return {
  {
    "stevearc/conform.nvim",
    config = function()
      local prettier = { "prettier" }

      require("conform").setup {
        formatters_by_ft = {
          javascript = prettier,
          javascriptreact = prettier,
          typescript = prettier,
          typescriptreact = prettier,
          vue = prettier,
          css = prettier,
          scss = prettier,
          html = prettier,
          json = prettier,
          yaml = prettier,
          -- Ruby：交給 ruby_lsp（專案有 rubocop / standard 時會用它們）
          ruby = { lsp_format = "prefer" },
          lua = { "stylua" },
        },
        formatters = {
          -- 只在專案有 prettier 設定時才格式化，避免把公司既有檔案用預設值整份改掉
          prettier = { require_cwd = true },
        },
        -- lsp_format 預設 "never"：只有上面明確列出的 ft 才在存檔時格式化
        -- （不要在這裡寫 lsp_format，會蓋掉 ruby 那行的 per-ft 設定）
        format_on_save = { timeout_ms = 1000 },
      }
    end,
  },
}
