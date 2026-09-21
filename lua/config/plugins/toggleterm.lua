return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      -- 不記住離開時的模式：每次進入 terminal（toggle 或切視窗進來）都直接進 insert mode
      persist_mode = false,
      start_in_insert = true,
    },
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
      {
        "<leader>tt",
        function()
          -- trim_spaces = false：整段一次送出，保留縮排（Python 區塊才跑得動）
          require("toggleterm").send_lines_to_terminal("visual_lines", false, { args = vim.v.count })
        end,
        mode = "v",
        desc = "Send lines to terminal",
      },
    },
  },
}
