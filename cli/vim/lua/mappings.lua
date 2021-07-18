local keymap = vim.api.nvim_set_keymap
local k_opts = { silent=true, unique=true }
keymap("n", "<C-f>f", ":Telescope find_files<cr>", k_opts)
keymap("n", "<C-f>b", ":Telescope file_browser<cr>", k_opts)
keymap("n", "<C-g>", ":Telescope live_grep<cr>", k_opts)
keymap("n", "<C-b>", ":Telescope buffers show_all_buffers=true<cr>", k_opts)
keymap("n", ",r", ":luafile ~/NixHome/cli/vim/init.lua<cr>", k_opts)
keymap("n", "gzi", ":TeleLoad<cr>:NeuronLoad<cr>gzi", k_opts)


keymap("n", "<Space><Space>", ":nohls<cr>", k_opts)

function Make_buf_repl()
    local repls = {haskell='ghci', prolog='swipl', python='python', julia='julia'}
    local ft = vim.api.nvim_buf_get_option(0, 'filetype')
    if repls[ft] then
        Cur_repl = make_repl(repls[ft])
        vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", ":lua Cur_repl()<cr>", { silent=true })
    end
end
vim.cmd[[autocmd FileType * :lua Make_buf_repl()]]
--keymap("n", "gzn", ":lua New_note('~/Library/Neuron')<CR>", {silent=true})
--keymap("n", "<CR>", ":lua On_enter()<CR>", {silent=true})
