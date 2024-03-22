local wk = require('which-key')
local telescope = require('telescope.builtin')

vim.g.copilot_assume_mapped = true

vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept()', { expr = true, silent = true, noremap = true })

vim.g.mapleader = " "

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/my_config/lazy.lua<CR>");

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>nt", "<cmd>terminal<CR>");

--vim.keymap.set("n", "<leader>w", ":w<CR>");

wk.register({
    ["<C-p>"] = { telescope.git_files, "Git Files" },
    ["K"] = { vim.lsp.buf.hover, "Hover" },
    ["g"] = {
        name = "Go To",
        ["d"] = { vim.lsp.buf.definition, "Go To Definition" },
    },
    ["<leader>"] = {
        ["x"] = { "<cmd>!chmod +x %<CR>", "Give Executable permissions to File" },
        ["r"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Rename Word on file" },
        ["Y"] = { [["+Y]], "Copy rest of the line to clipboard" },
        ["Q"] = { "<cmd>bd<CR>", "Close Current Buffer" },
        ["e"] = { "<cmd>NvimTreeToggle<CR>", "Open Tree" },
        ["b"] = {
            name = "Buffer",
            ["n"] = { "<cmd>enew<CR>", "Create New Buffer" },
            ["q"] = { "<cmd>bd<CR>", "Close Current Buffer" },
        },
        ["w"] = { "<cmd>w<CR>", "Save file" },
        ["f"] = { vim.lsp.buf.format, "Format Document" },
        ["n"] = {
            name = "New",
            ["h"] = {
                name = "horizontal",
                ["b"] = "buffer",
                ["t"] = "terminal",
            },
            ["v"] = {
                name = "vertical",
                ["b"] = "buffer",
                ["t"] = "terminal",
            },
        },
    },
})

wk.register({
    ["<leader>"] = {
        ["y"] = { [["+y]], "Copy to clipboard" },
    },
}, { mode = { "n", "v" } })

--keymap to open new split
vim.keymap.set("n", "<leader>nhb", "<cmd>split<CR>");
vim.keymap.set("n", "<leader>nvb", "<cmd>vsplit<CR>");
--keymap to open new split terminal
vim.keymap.set("n", "<leader>nht", "<cmd>split | wincmd j | terminal<CR>");
vim.keymap.set("n", "<leader>nvt", "<cmd>vsplit | wincmd l | terminal<CR>");

--keymap to select another split
