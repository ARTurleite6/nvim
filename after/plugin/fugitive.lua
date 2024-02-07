require('which-key').register({
    ["<leader>"] = {
        ["g"] = {
            name = "Git",
            ["s"] = { vim.cmd.Git, "Git Status" },
            ["p"] = { function() vim.cmd.Git("push") end, "Git Push" }
        }
    },
})

vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
