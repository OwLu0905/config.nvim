local harpoon = require "harpoon"
harpoon:setup {}

local function show_toast(_, opts)
  opts = opts or {}
  local timeout = opts.timeout or 1600
  local width = opts.width or 30
  local height = opts.height or 1

  -- Calculate position (bottom right by default)
  local col = vim.o.columns - width - 1
  local row = vim.o.lines - height - 2

  -- Create buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- -- Set content
  local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { filename })

  -- Create window
  local win = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = "Harpoon Add",
  })

  -- Close after timeout
  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, timeout)
end

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
  show_toast()
end)

vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
