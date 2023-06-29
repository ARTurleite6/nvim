local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require('which-key')

--vim.keymap.set("n", "<leader>a", mark.add_file)
--vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
--
--
--vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
--vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
--vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
--vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

wk.register({
    ["<leader>"] = {
        ["a"] = { mark.add_file, "Mark File at Harpoon" },
    },
    ["<C-e>"] = { function() ui.toggle_quick_menu() end, "Toggle Quick Menu" },
    ["<C-h>"] = { function() ui.nav_file(1) end, "Harpoon Go To 1 Markup" },
    ["<C-t>"] = { function() ui.nav_file(2) end, "Harpoon Go To 2 Markup" },
    ["<C-n>"] = { function() ui.nav_file(3) end, "Harpoon Go To 3 Markup" },
    ["<C-s>"] = { function() ui.nav_file(4) end, "Harpoon Go To 4 Markup" },
})
