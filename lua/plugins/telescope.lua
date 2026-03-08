return {
  {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 
        'nvim-telescope/telescope-fzf-native.nvim', 
        build = 'make',
        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function() return vim.fn.executable 'make' == 1 end,
      },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "%.git\\",
            "%.git/",
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
      require("telescope.themes").get_dropdown {
            }
          }
        }
      }      
      require("telescope").load_extension("ui-select")
    end
  },
}
