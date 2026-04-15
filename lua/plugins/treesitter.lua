return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ts = require("nvim-treesitter")
    vim.env.CC = "gcc"

    local languages =  {
      "bash",
      "javascript",
      "json",
      "lua",
      "python",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    }

    ts.install(languages)
  end
}

