local keymap = vim.api.nvim_set_keymap
local k_opts = { silent=true, unique=true }

-- Remap space as leader key
--vim.api.nvim_set_keymap('', '<Space>', '<Nop>', k_opts)
vim.g.mapleader = ','
vim.g.maplocalleader = ','


--keymap("n", "<C-b>", ":Telescope buffers show_all_buffers=true<cr>", k_opts)
keymap("n", "<leader>R", ":luafile ~/NixHome/home/vim/init.lua<cr>", k_opts)

keymap("n", "<space><space>", "<cmd>nohls<cr>", k_opts)

function Make_buf_repl()
    local repls = {haskell='ghci', prolog='swipl', python='python'}--, julia='julia'}
    local ft = vim.api.nvim_buf_get_option(0, 'filetype')
    if repls[ft] then
        Cur_repl = Make_repl(repls[ft])
        keymap(0, "n", "<leader>r", ":lua Cur_repl()<cr>", { silent=true })
    end
end
vim.cmd[[autocmd FileType * :lua Make_buf_repl()]]
--keymap("n", "gzn", ":lua New_note('~/Library/Neuron')<CR>", {silent=true})
--keymap("n", "<CR>", ":lua On_enter()<CR>", {silent=true})
