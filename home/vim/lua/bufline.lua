local M = {}

require'mappings'.module_keymaps(M, 'bl', {'t', 'n', 'p'})

M.config = function()
    local mod = require'bufline'
    vim.opt.termguicolors = true
    require'bufferline'.setup{}
    mod:reg_key('t')
    mod:set_key('n', [[<cmd>lua require'bufferline'.cycle(1)<cr>]])
    mod:set_key('p', [[<cmd>lua require'bufferline'.cycle(-1)<cr>]])
end

return M
