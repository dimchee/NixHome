local keymap = vim.api.nvim_set_keymap
local k_opts = { silent=true, unique=true }

-- Remap space as leader key
--vim.api.nvim_set_keymap('', '<Space>', '<Nop>', k_opts)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

local function tele_do(s)
    return "<cmd>lua require'telescope.builtin'."..s..'<cr>'
end

--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader>b' , tele_do'buffers()', k_opts)
vim.api.nvim_set_keymap('n', '<leader>ff', tele_do'find_files()', k_opts)
vim.api.nvim_set_keymap('n', '<leader>fb', tele_do'file_browser()', k_opts)
vim.api.nvim_set_keymap('n', '<leader>/' , tele_do'current_buffer_fuzzy_find()', k_opts)
vim.api.nvim_set_keymap('n', '<leader>g' , tele_do'live_grep()', k_opts)
vim.api.nvim_set_keymap('n', '<leader>cf', tele_do'find_files{cwd="~/NixHome/home/vim"}', k_opts)
--vim.api.nvim_set_keymap('n', '<leader>ht', tele_do'help_tags()', k_opts)
--vim.api.nvim_set_keymap('n', '<leader>t' , tele_do'tags()', k_opts)
--vim.api.nvim_set_keymap('n', '<leader>sg', tele_do'grep_string()', k_opts)
--vim.api.nvim_set_keymap('n', '<leader>ct', tele_do'tags{ only_current_buffer = true }', k_opts)
--vim.api.nvim_set_keymap('n', '<leader>?' , tele_do'oldfiles()', k_opts)

--keymap("n", "<C-b>", ":Telescope buffers show_all_buffers=true<cr>", k_opts)
keymap("n", "<leader>R", ":luafile ~/NixHome/home/vim/init.lua<cr>", k_opts)

keymap("n", "<space><space>", "<cmd>nohls<cr>", k_opts)

function Make_buf_repl()
    local repls = {haskell='ghci', prolog='swipl', python='python'}--, julia='julia'}
    local ft = vim.api.nvim_buf_get_option(0, 'filetype')
    if repls[ft] then
        Cur_repl = Make_repl(repls[ft])
        vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", ":lua Cur_repl()<cr>", { silent=true })
    end
end
vim.cmd[[autocmd FileType * :lua Make_buf_repl()]]
--keymap("n", "gzn", ":lua New_note('~/Library/Neuron')<CR>", {silent=true})
--keymap("n", "<CR>", ":lua On_enter()<CR>", {silent=true})
