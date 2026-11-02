return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- main branch 的 setup 不吃 ensure_installed，要用 install()（已安裝的會略過、非同步）
      -- 需要：tree-sitter CLI（brew install tree-sitter-cli）+ C compiler
      require("nvim-treesitter").install {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "bash",
        "markdown",
        "markdown_inline",
        "json",
        "yaml",
        -- web
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "jsdoc",
        "vue",
        -- Rails / Liquid
        "ruby",
        "embedded_template", -- ERB
        "liquid",
      }

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          if not pcall(vim.treesitter.start) then
            return
          end

          vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo[0][0].foldmethod = "expr"
          vim.wo[0][0].foldlevel = 99
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
