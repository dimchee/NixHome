local M = {
    'oberblastmeister/neuron.nvim',
    requires = {'nvim-telescope/telescope.nvim'},
    branch='unstable',
    keys = { "gzi", "gzz", "gzZ", "gzn", "gzb", "gzB", "gzt", "gz[", "gz]", "gzg" },
}


function M.config()
    require'neuron'.setup {
        virtual_titles = true,
        mappings = true,
        run = nil, -- function to run when in neuron dir
        neuron_dir = '~/Library/Neuron',
        leader = 'gz', -- leader key, remember 'go zettel'
    }
    local notes = require'notes'
    --notes:set_key('g', require'utils'.tele_do'live_grep{cwd="~/Library/Neuron"}')
end

return M
