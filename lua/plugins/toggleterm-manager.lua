return {
	"ryanmsnyder/toggleterm-manager.nvim",
	dependencies = {
		"akinsho/toggleterm.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- required dependency
	},
	config = function ()
    local toggleterm_manager = require("toggleterm-manager")
    local actions = toggleterm_manager.actions

    toggleterm_manager.setup {
      mappings = { -- key mappings bound inside the telescope window
        i = {
          ["<CR>"] = { action = actions.toggle_term, exit_on_action = false }, -- toggles terminal open/closed
          ["<C-i>"] = { action = actions.create_term, exit_on_action = false }, -- creates a new terminal buffer
          ["<C-d>"] = { action = actions.delete_term, exit_on_action = false }, -- deletes a terminal buffer
          ["<C-r>"] = { action = actions.rename_term, exit_on_action = false }, -- provides a prompt to rename a terminal
        },
        n = {
          ["<CR>"] = { action = actions.toggle_term, exit_on_action = false }, -- toggles terminal open/closed
          ["<C-i>"] = { action = actions.create_term, exit_on_action = false }, -- creates a new terminal buffer
          ["<C-d>"] = { action = actions.delete_term, exit_on_action = false }, -- deletes a terminal buffer
          ["<C-r>"] = { action = actions.rename_term, exit_on_action = false }, -- provides a prompt to rename a terminal
        },
      },
    }
    vim.keymap.set('n','<leader>tm', "<cmd>Telescope toggleterm_manager<cr>", {desc = "Toggleterm Manager"})
	end,
}
