local builtin = require('telescope.builtin')
require('which-key').register({
    ["<leader>"] = {
        ["p"] = {
            name = "Project",
            ["f"] = {
                { builtin.find_files, "Find File" }
            },
            ["s"] = {
                function()
                    builtin.grep_string({ search = vim.fn.input("Grep > ") });
                end,
                "Grep"
            },
        },
    }
})
