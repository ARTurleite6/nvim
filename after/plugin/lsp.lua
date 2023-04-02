local lsp = require("lsp-zero")
local wk = require("which-key")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'gopls',
    'clangd',
    'elixirls',
    'sqls',
    'pyright'
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<S-TAB>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<TAB>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
--
--whick-key register <leader>vca
wk.register({
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    ["<leader>vca"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
    ["<leader>vd"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostics" },
    ["<leader>vrn"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    ["<leader>vrr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
    ["<leader>vws"] = { "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "Workspace Symbol" },
}, { prefix = "<leader>" })
