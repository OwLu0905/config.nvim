local set = vim.keymap.set

set("n", "<leader><leader>x", "<cmd>source %<CR>")
set("n", "<leader>x", ":.lua<CR>")
set("v", "<leader>x", ":lua<CR>")

set("i", "jk", "<ESC>")
set("i", "kj", "<ESC>")

set("v", "K", ":m '<-2<CR>gv=gv")
set("v", "J", ":m '>+1<CR>gv=gv")

set("x", "<leader>p", '"_dP')

set("n", "<Esc>", "<cmd>noh<CR>", { noremap = false, desc = "[N][O][H]ighlight" })

set("n", "]d", function()
  vim.diagnostic.jump { count = 1, float = true }
end)
set("n", "[d", function()
  vim.diagnostic.jump { count = -1, float = true }
end)
set("n", "U", function()
  vim.diagnostic.open_float {
    scope = "cursor",
    format = function(diagnostic)
      print(diagnostic.source)
      return diagnostic and diagnostic.message or "No errors found"
    end,
  }
end)

set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-n>", "<c-w>5+")
set("n", "<M-m>", "<c-w>5-")

set("n", "<leader>sl", vim.cmd["split"], { desc = "Horizontal split" })
set("n", "<leader>vl", vim.cmd["vsplit"], { desc = "Vertical split" })

vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ef9bfd" })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
