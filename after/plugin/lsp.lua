local lsp = require("lsp-zero")
local wk = require("which-key")
require('mason').setup({})
lsp.preset("recommended")

require('lspconfig').hls.setup {}

local cmp = require('cmp')
local cmp_action = lsp.cmp_action()

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

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert(cmp_mappings)
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
    opts["mode"] = "n"

    wk.register({
        ["<leader>"] = {
            ["l"] = {
                name = "LSP",
                ["a"] = { vim.lsp.buf.code_action, "Code Actions" },
                ["r"] = {
                    name = "References/Rename",
                    ["r"] = { vim.lsp.buf.references, "References" },
                    ["n"] = { vim.lsp.buf.rename, "Rename" },
                },
                ["d"] = { vim.diagnostic.open_float, "Open Definition Float" },
                ["w"] = { vim.lsp.buf.workspace_symbol, "Workspace Symbol" },
            },
        },
        ["]d"] = { vim.diagnostic.goto_next, "Go to next diagnostic" },
        ["[d"] = { vim.diagnostic.goto_prev, "Go to previous diagnostic" },
    }, opts)
    --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    opts["mode"] = "i"
    wk.register({
        ["<C-h>"] = { vim.lsp.buf.signature_help, "Signature help" },
    }, opts)
end)

require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'rust_analyzer',
        'gopls',
        'clangd',
        'pyright'
    },
    handlers = {
        lsp.default_setup,
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
