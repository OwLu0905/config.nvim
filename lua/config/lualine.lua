local function get_venv()
  local venv = vim.env.VIRTUAL_ENV
  if venv then
    local name = string.match(venv, "[^/]+$")
    return string.format("(%s)", name)
  else
    return ""
  end
end

require("lualine").setup {
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(str)
          return str:sub(1, 1)
        end,
      },
    },
    lualine_x = { { get_venv }, "filetype" },
  },
}
