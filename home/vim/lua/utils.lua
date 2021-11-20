M = {}

function M.tele_do(what)
    if type(what) == 'string' then
        return "<cmd>lua require'telescope.builtin'."..what..'<cr>'
    else
        print('error, cant tele_do ' .. vim.inspect(what))
    end
end

return M
-- https://github.com/luafun/luafun
-- https://github.com/lua-stdlib/functional
