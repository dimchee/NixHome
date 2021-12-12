local M = {}

require'mappings'.module_keymaps(M, "<leader>g", {'g'})

M.config = function()
    require'neogit'.setup()
    require'git':set_key('g', [[<cmd>lua require'neogit'.open()<cr>]])
end

return M
