return {
  "theprimeagen/harpoon",
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "add to harpoon"})
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

    vim.keymap.set("n", "<leader>ma", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<leader>ms", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<leader>md", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<leader>mf", function() ui.nav_file(4) end)

  end
}
