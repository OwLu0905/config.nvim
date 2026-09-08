local M = {}

-- 掃出所有 session，並還原成「目錄 + branch」的形式
---@return { session: string, dir: string, branch?: string }[]
local function list_sessions()
  local dir = require("persistence.config").options.dir
  local items = {}
  local seen = {}

  for _, session in ipairs(require("persistence").list()) do
    -- 檔名格式：<路徑用 % 取代 />%%<branch>.vim
    local file = session:sub(#dir + 1, -5)
    local path, branch = unpack(vim.split(file, "%%", { plain = true }))
    path = path:gsub("%%", "/")

    if not seen[path] then
      seen[path] = true
      items[#items + 1] = { session = session, dir = path, branch = branch }
    end
  end

  return items
end

local function make_finder()
  local finders = require "telescope.finders"
  local entry_display = require "telescope.pickers.entry_display"

  local displayer = entry_display.create {
    separator = "  ",
    items = { { width = 50 }, { remaining = true } },
  }

  return finders.new_table {
    results = list_sessions(),
    entry_maker = function(item)
      local name = vim.fn.fnamemodify(item.dir, ":p:~")
      -- 目錄已經不存在的 session 標成灰色，方便一眼看出該清哪些
      local exists = vim.fn.isdirectory(item.dir) == 1
      return {
        value = item,
        ordinal = name,
        display = function()
          return displayer {
            { name, exists and "TelescopeResultsNormal" or "Comment" },
            { item.branch and (" " .. item.branch) or "", "TelescopeResultsComment" },
          }
        end,
      }
    end,
  }
end

function M.sessions()
  local pickers = require "telescope.pickers"
  local conf = require("telescope.config").values
  local actions = require "telescope.actions"
  local action_state = require "telescope.actions.state"

  -- 刪掉游標所在（或多選）的 session 檔，然後原地刷新清單
  local function delete_session(prompt_bufnr)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local selections = picker:get_multi_selection()
    if vim.tbl_isempty(selections) then
      selections = { action_state.get_selected_entry() }
    end

    for _, entry in ipairs(selections) do
      if entry then
        vim.fn.delete(entry.value.session)
      end
    end

    picker:refresh(make_finder(), { reset_prompt = false })
  end

  pickers
    .new(require("telescope.themes").get_dropdown {}, {
      prompt_title = "Sessions  (S: delete)",
      initial_mode = "normal",
      finder = make_finder(),
      sorter = conf.generic_sorter {},
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          local entry = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          if entry then
            vim.fn.chdir(entry.value.dir)
            require("persistence").load()
          end
        end)

        -- normal 模式下 telescope 預設只有 j/k，補上 <C-n>/<C-p>
        map("n", "<C-n>", actions.move_selection_next)
        map("n", "<C-p>", actions.move_selection_previous)

        map("n", "S", delete_session)
        map("n", "dd", delete_session)
        map("i", "<C-d>", delete_session)

        return true
      end,
    })
    :find()
end

return M
