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

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

opt.laststatus = 3

-- session 內容（persistence.nvim）
opt.sessionoptions = { "buffers", "curdir", "folds", "globals", "help", "tabpages", "winsize", "winpos", "terminal", "localoptions" }

-- 換行時不自動延續註解（ftplugin 會覆寫 formatoptions，所以要在 FileType 之後移除）
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove { "r", "o" }
  end,
})
