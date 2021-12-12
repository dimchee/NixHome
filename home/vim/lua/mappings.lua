local M = {}

function M.module_keymaps(module, leader, keys)
    module.leader = leader
    module.keys = vim.tbl_map(function(x) return {'n', leader .. x} end, keys)
    module.is_key_set = {}
    --vim.tbl_foreach(module.keys, function(_, k) module.is_key_set[k] = false end)
    module.find_key = function(mod, val)
        local filt = vim.tbl_filter(function(v)
            return vim.deep_equal(v, val)
        end, mod.keys)
        local cnt = vim.tbl_count(filt)
        -- (1 < cnt) and print('WARNING: multiple same keys registered')
        return (0 < cnt) and filt[1]
    end
    module.reg_key = function(mod, key, mode)
        local l_key = mod:find_key {mode or 'n', mod.leader..key}
        if not l_key then print('WARNING: no registred '.. vim.inspect(l_key)) end
        if not mod.is_key_set[l_key] then mod.is_key_set[l_key] = true
        else print('WARNING: already set '..vim.inspect(l_key)) end
    end
    module.set_key = function(mod, key, cmd, mode, opt)
        vim.api.nvim_set_keymap(mode or 'n', mod.leader..key, cmd, opt or { silent = true })
        mod:reg_key(key, mode)
    end
    module.check_keys = function(mod)
        if not mod then return end
        vim.tbl_foreach(mod.keys, function(_, x)
            local key = mod:find_key(x)
            if mod.is_key_set[key]
                then print('INFO   : there is keybinding   '.. vim.inspect(key))
                else print('WARNING: not set registred key '.. vim.inspect(key))
            end
        end)
    end
end

return M
