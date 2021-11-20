M = {}

require'mappings'.module_keymaps(M, ',', {'ff', 'fb', '/', 'g', 'cf'})

function M.setup()
    local tele_do = require'utils'.tele_do
    local mod = require'tele'
    --Add leader shortcuts
    --keymap('n', '<leader>b' , tele_do'buffers()', k_opts)

    mod:set_key('ff', tele_do'find_files()')
    mod:set_key('fb', tele_do'file_browser()')
    mod:set_key('/' , tele_do'current_buffer_fuzzy_find()')
    mod:set_key('g' , tele_do'live_grep()')
    mod:set_key('cf', tele_do'find_files{cwd="~/NixHome/home/vim"}')
    --keymap('n', '<leader>ht', tele_do'help_tags()', k_opts)
    --keymap('n', '<leader>t' , tele_do'tags()', k_opts)
    --keymap('n', '<leader>sg', tele_do'grep_string()', k_opts)
    --keymap('n', '<leader>ct', tele_do'tags{ only_current_buffer = true }', k_opts)
    --keymap('n', '<leader>?' , tele_do'oldfiles()', k_opts)
end

return M
