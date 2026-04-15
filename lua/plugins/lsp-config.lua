return {
	-- LSP Configuration & Plugins
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local servers = { "lua_ls", "pyright" }
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Setup servers
			for _, server in ipairs(servers) do
				local opts = {
					capabilities = capabilities,
				}

				vim.lsp.config(server, opts)
				vim.lsp.enable(server)
			end

			vim.lsp.inlay_hint.enable(true)

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local opts = { buffer = args.buf }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})

			vim.diagnostic.config({
				virtual_text = true, -- This is the magic setting that shows the message inline
				signs = true, -- Keeps the 'W' or 'E' in the left column
				underline = true, -- Underlines the code causing the warning
				update_in_insert = false, -- Waits until you leave insert mode to update
			})
		end,
	},
}
