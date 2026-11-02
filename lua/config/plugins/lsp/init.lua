return {
  {
    "neovim/nvim-lspconfig",
    tag = "v2.4.0",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      -- 由 mason 安裝並啟用的 server
      local servers = {
        "lua_ls",
        -- TypeScript / React / Vue
        "vtsls", -- 取代 ts_ls：Vue 3 (vue_ls v3) 需要 vtsls 搭配 @vue/typescript-plugin
        "vue_ls",
        "eslint",
        "tailwindcss",
        "html",
        "cssls",
        "jsonls",
        -- Rails
        "ruby_lsp",
        "herb_ls", -- ERB
        -- Liquid (Shopify theme)
        "shopify_theme_ls",
      }

      -- 不需要靠 LSP 的 formatter，也交給 mason 安裝
      local tools = { "prettier", "stylua" }

      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = servers,
        automatic_enable = false, -- 下面自己 vim.lsp.enable
      }

      local registry = require "mason-registry"
      registry.refresh(function()
        for _, name in ipairs(tools) do
          local ok, pkg = pcall(registry.get_package, name)
          if ok and not pkg:is_installed() then
            pkg:install()
          end
        end
      end)

      -- vtsls 掛上 Vue 的 TypeScript plugin，.vue 裡的 <script> 才有型別
      local vue_plugin_path = vim.fn.stdpath "data"
        .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
      vim.lsp.config("vtsls", {
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = vue_plugin_path,
                  languages = { "vue" },
                  configNamespace = "typescript",
                },
              },
            },
          },
        },
      })

      -- 一般 Liquid 專案未必有 Shopify 的 root marker，補上 .git 當 fallback
      vim.lsp.config("shopify_theme_ls", {
        root_markers = { ".shopifyignore", ".theme-check.yml", ".theme-check.yaml", "shopify.theme.toml", ".git" },
      })

      vim.lsp.enable(servers)

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_attach_utils", { clear = true }),
        callback = function()
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
        end,
      })

      vim.diagnostic.config {
        virtual_lines = false,
      }
    end,
  },
}
