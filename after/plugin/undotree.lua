require('which-key').register({
    ["<leader>"] = {
        ["u"] = { vim.cmd.UndotreeToggle, "See Undo Tree" },
    },
});
