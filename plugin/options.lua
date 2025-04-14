local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.termguicolors = true

opt.clipboard = "unnamedplus"
opt.mouse = "a"

opt.cursorline = true

opt.inccommand = "split"

opt.splitbelow = true
opt.splitright = true

opt.smartcase = true
opt.ignorecase = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

--
-- NOTE: https://github.com/LazyVim/LazyVim/discussions/3018
-- NOTE: formatoptions is buffer-local by default
-- opt.formatoptions:remove "o"
-- vim.api.nvim_create_autocmd

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "*",
  callback = function()
    -- vim.opt.formatoptions:remove({"c","r","o"})
    vim.opt.formatoptions:remove { "r", "o" }
  end,
})
