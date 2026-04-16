return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = 80,
			open_mapping = [[<c-\>]],
			shade_filetypes = {},
			hide_numbers = true, -- hide the number column in toggleterm buffers
			direction = "vertical",
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)

			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "term://*",
				callback = function()
					local keymapOpts = { buffer = 0 } -- Now 'buffer = 0' correctly refers to the new terminal
					vim.keymap.set("t", "<Esc>", function()
						if vim.bo.filetype == "lazygit" then
							-- Send the raw escape key to Lazygit so it can close its own prompts
							return "<Esc>"
						end
						-- Otherwise, exit Neovim terminal mode normally
						return "<C-\\><C-n>"
					end, { expr = true, desc = "Smart escape for terminal" })
					-- vim.keymap.set("t", "jk", [[<C-\><C-n>]], keymapOpts)
					vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], keymapOpts)
					vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], keymapOpts)
					vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], keymapOpts)
					vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], keymapOpts)
					vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], keymapOpts)
				end,
			})
		end,
	},
}
