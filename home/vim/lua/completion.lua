M = {}
M.config = function()
    vim.cmd[[command! -nargs=* CmpLoad]] -- empty command needed
    local cmp = require'cmp'
    cmp.setup({
        snippet = {
            expand = function(args)
                require'luasnip'.lsp_expand(args.body)
            end
        },
        mapping = {
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'nvim_lua' },
            { name = 'path' },
            { name = 'buffer' },
            { name = 'emoji' },
            { name = 'latex_symbols' },
        }),
        experimental = {
            native_menu = true,
            ghost_text = false,
        },
    })
    local capabilities = require'cmp_nvim_lsp'.update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    )
    for _, s in ipairs(require'lsp'.servers) do
        require'lspconfig'[s].setup {
            capabilities = capabilities
        }
    end
end
return M
