local wk = require('which-key')

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/my_config/packer.lua<CR>");
--mapping to close selected buffer
vim.keymap.set("n", "<leader>q", "<cmd>BufferLinePickClose<CR>");

vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>");
vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>");
vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>");
vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>");
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>nt", "<cmd>terminal<CR>");

--vim.keymap.set("n", "<leader>w", ":w<CR>");

wk.register({
    ["g"] = {
        name = "Navigation Buffers",
        ["t"] = {"<cmd>BufferLineCycleNext<CR>", "Next Buffer"},
        ["T"] = {"<cmd>BufferLineCyclePrev<CR>", "Prev Buffer"},
    },
    ["<leader>"] = {
        ["e"] = { ":NvimTreeToggle<CR>", "Open Tree" },
        ["b"] = {
            name = "Buffer",
            ["n"] = { "<cmd>enew<CR>", "Create New Buffer" },
            ["q"] = { "<cmd>bd<CR>", "Close Current Buffer" },
        },
        ["w"] = { ":w<CR>", "Save file" },
        ["f"] = { vim.lsp.buf.format, "Format Document" },
        ["n"] = {
            name = "New",
            ["h"] = {
                name = "horizontal",
                ["s"] = "split",
                ["t"] = "terminal",
            },
            ["v"] = {
                name = "vertical",
                ["s"] = "split",
                ["t"] = "terminal",
            },
        },
        ["p"] = {
            name = "Project",
            ["f"] = {
                name = "Find file",
            },
            ["v"] = {
                name = "View",
            },
            ["s"] = {
                name = "Grep",
            },
        },
    },
})
--keymap to open new split
vim.keymap.set("n", "<leader>nhs", "<cmd>split<CR>");
vim.keymap.set("n", "<leader>nvs", "<cmd>vsplit<CR>");
--keymap to open new split terminal
vim.keymap.set("n", "<leader>nht", "<cmd>split | wincmd j | terminal<CR>");
vim.keymap.set("n", "<leader>nvt", "<cmd>vsplit | wincmd l | terminal<CR>");

--keymap to select another split




vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', '<C-j>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
