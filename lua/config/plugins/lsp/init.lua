return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function ()
		require("mason").setup()
		require("mason-lspconfig").setup {
				ensure_installed = { "lua_ls", "rust_analyzer" },
			}


			local lspconfig = require('lspconfig')

			lspconfig.lua_ls.setup{}

			-- local clients = vim.lsp.get_clients()
			--
			-- for _, client in ipairs(clients) do
			--
			-- 	local id = client.id
			--
			-- 	vim.lsp.completion.enable(true, id, 1, { autotrigger = true })
			--
			-- 	return
			--
			-- end
		end
	}
}

