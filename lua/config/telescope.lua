-- telescope settings

local set = vim.keymap.set
local builtin = require "telescope.builtin"

set("n", "<leader>fd", builtin.find_files)
set("n", "<leader>fg", builtin.live_grep)
set("n", "<leader>fc", builtin.git_status)
set("n", "<leader>gw", builtin.grep_string)
