require('which-key').register({
    ["<leader>"] = {
        ["g"] = {
            name = "Git",
            ["s"] = { vim.cmd.Git, "Git Status" },
        }
    },
})
