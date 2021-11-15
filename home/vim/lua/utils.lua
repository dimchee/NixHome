M = {}

function M.map(tbl, f)
    local t = {}
    table.foreach(tbl, function(k, v) t[k] = f(v) end)
    return t
end

function M.contains(tbl, val)
    local found = false
    table.foreach(tbl, function(_, v) found = found or v == val end)
    return found
end
function M.find(tbl, val)
    local ind = nil
    if type(val) == 'table' then
        val = table.concat(val,'\0')
        local ind = nil
        table.foreach(tbl, function(k, v) ind = ind or (table.concat(v,'\0') == val and k)  end)
        return ind
    end
    table.foreach(tbl, function(k, v) ind = ind or (v == val and k)  end)
    return ind
end

function M.module_keymaps(module, leader, keys)
    local utils = require'utils'
    module.leader = leader
    module.keys = require'utils'.map(keys, function(x) return {"n", leader .. x} end)
    module.is_key_set = {}
    table.foreach(module.keys, function(_, v) module.is_key_set[v] = false end)
    module.set_key = function(mod, key, cmd, mode, opt)
        vim.api.nvim_set_keymap(mode or 'n', mod.leader..key, cmd, opt or { silent = true })
        local l_key = {mode or 'n', mod.leader..key}
        local ind = utils.find(mod.keys, l_key)
        if not ind then
            print('WARNING: no registred key '..vim.inspect(l_key))
        else
            if module.is_key_set[ind] then
                print('WARNING: already set '..vim.inspect(l_key))
            end
            module.is_key_set[ind] = true
        end
    end
    module.check_keys = function(mod)
        if not mod then return end
        table.foreach(mod.keys, function(_, x)
            local ind = utils.find(mod.keys, x)
            if not mod.is_key_set[ind] then
                print('WARNING: not set registred key '.. vim.inspect(x))
            else
                print('INFO   : there is keybind '.. vim.inspect(x))
            end
        end)
    end
end

function M.tele_do(what)
    if type(what) == 'string' then
        return "<cmd>lua require'telescope.builtin'."..what..'<cr>'
    else
        print('error, cant tele_do ' .. vim.inspect(what))
    end
end

return M
