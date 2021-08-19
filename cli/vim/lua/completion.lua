M = {}
M.config = function()
    vim.cmd[[command! -nargs=* CompeLoad]] -- empty command needed
    vim.o.completeopt = 'menuone,noselect'
    --vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', { silent=true, unique=true })
    --vim.api.nvim_set_keymap('i', '<CR>', 'compe#confirm("<cr>")', { silent=true, unique=true })
    require'compe'.setup {
        source = {
            path = true;
            nvim_lsp = true;
            nvim_lua = true;
            latex_symbols = true;
            buffer = false;
            calc = false;
            vsnip = false;
            spell = false;
            tags = false;
            snippets_nvim = false;
            treesitter = false
        };
    }
end
return M
