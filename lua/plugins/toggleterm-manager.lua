return {
	"ryanmsnyder/toggleterm-manager.nvim",
	dependencies = {
		"akinsho/toggleterm.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- required dependency
	},
	config = function ()
    vim.keymap.set('n','<leader>tm', "<cmd>Telescope toggleterm_manager<cr>", {desc = "Toggleterm Manager"})
	end,
}
