-- Basic customization
vim.diagnostic.config {
  float = {
    border = "rounded", -- border style
    header = "Diagnostics:", -- custom header
    prefix = "• ", -- prefix for each diagnostic
    format = function(diagnostic)
      return string.format("[%s] %s", diagnostic.source, diagnostic.message)
    end,
    max_width = 100,
    max_height = 20,
    focusable = false,
  },
}

-- More advanced with highlights
vim.diagnostic.config {
  float = {
    border = "rounded",
    source = true,
    severity_sort = true,
    style = "minimal",
    format = function(diagnostic)
      local severity = vim.diagnostic.severity[diagnostic.severity]
      return string.format("%s: %s", severity, diagnostic.message)
    end,
  },
}
